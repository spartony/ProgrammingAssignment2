## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The makeCacheMatrix function creates a special object which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix
## it creates a list that contains 4 member functions: set, get, setinverse e getinverse. 
## it uses <<- assignment operator so that these internal variables are not exposed to the
## outside environment.

## In this function a list of functions is created. These are used to  cache the inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
    ## this is where the result of inversion is stored
    a <- NULL
    set <- function(y) {
        x <<- y
        a <<- NULL   ## initialises the result to null
    }
    get <- function() x ## return the input matrix
    setinverse <- function(inverse) a <<- inverse  ## set the inversed matrix
    getinverse <- function() a ## return the inversed matrix
    
    ## return a list that contains these functions, so we can use makeCacheMatrix object in the following way:
    ## x <- makeCacheMatrix(matrix)
    ## x$set(newmatrix) # to change matrix
    ## x$get # to get the setted matrix
    ## x$setinverse # to set the inversed matrix
    ## x$getinverse # to get the inversed matrix
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}

## The cacheSolve function calculates the inverse of the special "matrix"
## the special "matrix" which created with the makeCacheMatrix function.
## However, it first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse
## in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    ## get the inverse matrix from object x. 
    ## It will be null if uncalculated, because of "x <- NULL" in the previous function
    a <- x$getinverse()
    ## if already calculated, it get the already calculated result
    if(!is.null(a)) {
        message("getting cached data")
        return(i) ## return the calculated inversion
    }
    data <- x$get()  ## if not, with x$get we get the matrix object
    a <- solve(data, ...) ## then we solved it
    x$setinverse(a) ## then we set it to the object
    a ## return the solved result
}
