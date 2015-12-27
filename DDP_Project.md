Running Time Predictor (and why this is the only one you'll ever need)
========================================================
author: Eric Easterberg
date: 12/27/2015

What It Is
========================================================

* If you have run a race, or two, or two hundred, and wondered how you might do at
other distances...

* then the Running Time Predictor is for you

This application takes one to three of your past results, and tells you what you
should expect from yourself for other races

It also gives you a graph so you can see how you stack up against a standard model

How It Works
========================================================

You enter distance and time for one to three of your races, and the application takes
those performances and plots a prediction curve from a half-mile to past 50 kilometers

It relies on one of the oldest models, that of [Pete Riegel](http://stathletics.tumblr.com/post/14931342638/riegels-equivalent-performance-formula): $T2/T1 = (D2/D1) ^1.06$

1. If only one race has been entered, the Riegel model is used as is 
2. If two races have been entered, the exponent is determined directly from the two points
3. If three races have been entered, the exponent is determined by fitting a linear-log model

The Model in Action
========================================================

Let's see an example of how this works in practice. The men's world record for 5000 meters is 12:37.35, the record for 10000 meters is 26:17.53. We see that the plot shows the expected performance line (in blue), and an "ideal" line (based on the model, in red).

<small>By the way, the marathon time projected by the application is 2:00:59, almost two minutes faster than the current world best!</small>

![plot of chunk unnamed-chunk-1](DDP_Project-figure/unnamed-chunk-1-1.png) 

Improvements for 2.0
=======================================================

While Running Time Predictor is already a fine application (other race calculators max out at two races for prediction), there are already a number of enhancements on the table. They include:

- Entry in kilometers as well as miles
- Enhanced graphics, including the ability to zoom in to a point of interest
- Allowing a user to enter even more races, allowing more fine tuning of the model
- Providing an output table with standard distances
- And more...

The [Running Time Predictor](https://eeasterberg.shinyapps.io/DDP_Project) is available right now, and additional funding is always welcomed!! 
