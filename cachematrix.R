## This R script allows for creation of a matrix. The  
## matrix can then be used to compute and cache its inverse

## Create a matrix obect that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
 set <- function(y){
   x <<- y
   m <<- NULL
 }
 get <- function() x
 
 setinverse <- function(inverse) m <<- inverse
 getinverse <- function() m
 
 list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Compute the inverse of the matrix returned by makeCacheMatrix.
## If the original matrix inverse exists, the cached inverse is returned.
## Note: changing the original matrix will return a new cached inverse.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached matrix")
    return(m)
  }
  my_matrix <- x$get()
  m<-solve(my_matrix)
  x$setinverse(m)
  m
}
