
## This function creates a list with 4 functions in it: set, get, 
## setinverse and getinverse. The result of the inverse is cached.


makeCacheMatrix <- function(x = matrix()) {  
{
        
        i <- NULL                             #sets the cache to NULL
        
        set <- function(y) {                  #modifys the matrix and sets the cache to NULL
                
                x <<- y
                i <<- NULL
        }
        
        get <- function() x                     #returns the created matrix
        setinverse<- function(solve) i <<-solve
        getinverse <- function() i              #if already calculated, function returns the inverse of the matrix
        
        list(set = set, get = get,              #creates a list containing the two function of the main-function
             getinverse = getinverse)

}


## This function is only working with the one above. It contains the functions 
## "getinverse", "get" and "setinverse" which are created within the
## "makeCacheMatrix"-function

cacheSolve <- function(x, ...) {
      
        i <- x$getinverse()     #stores the content of "getinverse" in variable i in the local enviroment
        
        if(!is.null(i)) {                   #if the contet of i is not NULL it will simply return the cached data
                message("getting cached data")
                return(m)
        }
        
        data <- x$get()               #stores the matrix in "data" 
        
        i <- solve(data, ...)         #solves the matrix and stores it in i
        
        x$setinverse(i)               #calls the setinverse function of makeCacheMatrix
        
        i                             #returns i
}
