/*httr is a R library that allows you to build and send HTTP requests, 
as well as process HTTP requests easily. We can import the package as
 follows (may take less than minute to import):*/
library(httr)

/*You can make a GET request via the method get to www.ibm.com:*/
url<-'https://www.ibm.com/'
response<-GET(url)
response

/*We have the response object response , this has information about the 
response, like the status of the request. We can view the status code using 
the attribute status*/
response$status

/*You can also check the headers of the response*/
response_headers <- headers(response)
response_headers

/*Obtain the date the request was sent using the key Date*/
response_headers['date']

/*Content-Type indicates the type of data:*/
response_headers['content-type']

/*To obtain the original request, you can view it via response object:*/
response$request$headers

/*Coding Exercise: in the code cell below, find the content-length attribute in the response header*/
response_headers['content-length']

/*Now, let's get the content of HTTP response*/
content(response)

/*You can load other types of data for non-text requests like images, 
consider the URL of the following image:*/
image_url<-'https://gitlab.com/ibm/skills-network/courses/placeholder101/-/raw/master/labs/module%201/images/IDSNlogo.png'

/*We can make a get request:*/
image_response<-GET(image_url)

/*we can look at the reponse header*/
image_headers <- headers(image_response)

/*we can see the 'content-type' which is an image*/
image_headers['content-type']

/*image <- content(image_responce, "raw")
writeBin(image, "logo.png")

/*Suppose we have a simple GET API with base URL for http://httpbin.org/*/
url_get <- 'http://httpbin.org/get'

/*and we want to add some URL parameters to above GET API. To do so, we simply create a named list 
with parameter names and values:*/
query_params <- list(name = "Yan", ID = "123")

/* Passing the list query_params to the query arg of the GET() func.
tells the GET API I only need to get resources with name equals Yan and id = 123*/
response <- GET(url_get, query=query_params)

/* Print out the updated URL and see the attached the URL parameters*/
response$request$url

/* Like a GET request a POST is used to send data to a server in a request body. 
In order to send the Post Request in Python in the URL we change the route to POST:*/
url_post <- 'http://httpbin.org/post'

/*To make a POST request we use the POST() function, the list body is passed to the parameter  
body :*/
body <- list(course_name='Introduction to R', instructor='Yan')
response <- POST('http://httpbin.org/post', body= body)
response

/*We can see POST request has a body stored in fields attribute*/
response$request$fields