change.col = "tomato"

#* @get /hello
hw <- function(){
  return("Hello world!")
}

#* @post /operation
operation <- function(a, b){
  as.numeric(a) + as.numeric(b)
}

#* @get /iris/<sp>/<n:int>
function(n, sp){
  iris %>% dplyr::filter(Species == sp) %>% 
    .[as.integer(n), ]
}
#' @filter logger
function(req){
  print(paste0(date(), " - ",
               req$REMOTE_ADDR, " - ",
               req$REQUEST_METHOD, " ",
               req$PATH_INFO))
  forward()
}

#* @get /ggp2dens
#* @png
ggp2dens <- function(seed = rnorm(1), fill.colour = "tomato", alpha = 1.0){
  library(ggplot2)
  set.seed(seed)
  p <- data.frame(x = rnorm(100)) %>% 
    ggplot(aes(x)) + geom_density(fill = fill.colour, alpha = alpha)
  print(p)
}


#* @get /ggp2dens_color
#* @png
ggp2dens_col <- function(seed = rnorm(1)){
  library(ggplot2)
  set.seed(seed)
  p <- data.frame(x = rnorm(100)) %>% 
    ggplot(aes(x)) + geom_density(fill = change.col)
  print(p)
}

#* @get /chenge_color
change_color <- function(){
  change.col <<- "skyblue"
}
