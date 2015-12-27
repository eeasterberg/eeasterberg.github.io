library(shiny)

a <- 0
b <- 0
k <- 0

fmttime <- function(v) {
    as <- floor(v)
    fr <- v %% 1
    bs <- floor(60 * fr)
    cs <- floor(60 * (60 * fr - bs))
    ifelse(as == 0, paste(bs, "m,", cs, "s"), paste(as, "h,", bs, "m,", cs, "s"))
}

shinyServer(function(input, output) {
   t1 = 0
   output$predPlot <- renderPlot({
       t1 <<- input$h1 + input$m1/60 + input$s1/3600
       t2 <- input$h2 + input$m2/60 + input$s2/3600
       t3 <- input$h3 + input$m3/60 + input$s3/3600
       distvals <- seq(0.5, 31.5, 0.5)
       if(input$d3 > 0) {
           x <- log(c(input$d1, input$d2, input$d3))
           y <- log(c(t1, t2, t3))
           k <<- lm(y ~ x)$coef[2]
       }
       else if(input$d2 > 0) {
           x <- log(c(input$d1, input$d2))
           y <- log(c(t1, t2))
           k <<- lm(y ~ x)$coef[2]
       }
       else {
           k <<- 1.06
       }
        outvals <- t1 * (distvals/input$d1) ^ k
        idealvals <- sqrt(t1 * t2) * (distvals/sqrt(input$d1 * input$d2)) ^ 1.06
        plot(distvals, outvals, type = "l", col = "blue", xlab = "Distance of race (in miles)", ylab = "Time (in hours)")
        points(distvals, idealvals, type = "l", col = "red")
        legend(25, 1.9, c("Actual", "Ideal"), lty = c(1, 1), lwd = c(2.5, 2.5), col = c("blue", "red"))
   })
   output$dynamic_value <- renderPrint({
       fmttime(t1 * (input$predval/input$d1) ^ k)
   })
})
