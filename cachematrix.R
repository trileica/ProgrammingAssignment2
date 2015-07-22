## This script tries to save time doing the same calculation.
## In the first function, we input a (invertible) matrix, and create a cache.
## In the seconde function, it finds the inverse of that matrix.
## But if the matrix has already been calculated before,
## it will not do the same calculation again, which saves your time. 

## In this function, it create a list of 4 different functions.
## to 1.set 2.get 3.set the inverse of 4.get the inverse of  a input matrix.
## By using <<- operator, the calucalation will be stored,
## which will save your time by coupling with the next function.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function calculates/retrive the result of an inverse matrix.
## If the inverse matrix has been calculated, it retrives from the cache,
## which is in the last function and return a massage says so.
## If not, this function will calculate and return the inverse matrix.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
