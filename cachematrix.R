## These two fucntions make it possible to cache the value of a time consuming
## computation on large data sets to save time. Instead of having to recalculate
## the value each time, the second function can search for a previously stored
## value and circumvent the computational process. If no cached value is found,
## the computation will be performed

## The makeCacheMatrix function creates a "matrix" that is really a list sets
## gets the value of a matrix, and sets and gets the value of its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
            x <<- y            ## these lines set variables in an environment
            m <<- NULL         ## different from the parent environment, in
                               ## which to store the matrix inverser value.
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, 
            setinverse = setinverse,
            getinverse = getinverse) 
}


## The cacheSolve function calls the get inverse portion of the previous function.
## If the contents of that variable contains data, that value will be printed.
## if the content is null, the function will continue on with the computation.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- $get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
