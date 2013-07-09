
<style type="text/css">
span.boxed {
  border:5px solid gray;
  border-radius:10px;
  padding: 5px;
}
span.invboxed {
  border:5px solid gray;
  padding: 5px;
  border-radius:10px;
  color: white;
}
table, td, th
{
border:0px;
}
</style>

Focusing on R Essentials
========================================================
author: Randy Pruim
date: 2013-May-18
depends: mosaic
autosize: true

## Less Volume, More Creativity

Less Volume, More Creativity
========================================================
left: 60%





A lot of times you end up putting in a lot more volume, because you are teaching fundamentals  and you are teaching concepts that you need to put in, but you may not necessarily use because they are building blocks for other concepts and variations that will come off of that ... In the offseason you have a chance to take a step back and tailor it more specifically towards your  team and towards your players." 
<br><br>
Mike McCarthy, Head Coach, Green Bay Packers 

*********************
<img src="images/MikeMcCarthy.jpg" align="top" width="100%">
                                          
SIBKIS
========================================================
left:70%

Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away. 
<br><br>
--- Antoine de Saint-Exupery
***************
<img src="images/SaintExupery.jpg" width="100%">


The Most Important R Template
========================================================
&nbsp;

<center>
<h2><strong><span class="invboxed">goal</span> ( <span class="invboxed">yyy</span> ~ <span class="invboxed">xxx</span> , data = <span class="invboxed">mydata</span> )</strong> 
</h2></center>

&nbsp;

The Most Important R Template
========================================================
&nbsp;

<center>
<h2><strong><span class="boxed">goal</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> )</strong> 
</h2></center>
 
The Most Important R Template
========================================================
&nbsp;

<center>
<h2><strong><span class="boxed">goal</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> , ...)</strong> 
</h2></center>
&nbsp;

### Simpler version:  
 * `goal( ~ x, data = mydata )`

&nbsp;
### Fancier version: 
 * `goal( y ~ x | z , data = mydata )`
 
&nbsp;
### Unified version: 
 * `goal( formula , data = mydata )`

The Two Questions
========================================================
&nbsp;
<center>
<h2><strong><span class="boxed">goal</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> )</strong> 
</h2></center>
 
&nbsp;


###  What do you want R to do?  (goal)
 * This determines the function to use 
 
&nbsp;

###  What must R know to do that?  
 * This determines the inputs to the function
 * Must identify the variables and data frame
 
Graphical Summaries: One Variable
========================================================

```r
freqpolygon( ~age, data=HELPrct) 
```

<img src="LearningTeachingR-figure/unnamed-chunk-3.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" height="400" />


What is a Frequency Polygon?
========================================================
<img src="LearningTeachingR-figure/unnamed-chunk-4.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" height="400" />


Graphical Summaries: One Variable
========================================================

```r
freqpolygon( ~age, data=HELPrct ) 
  histogram( ~age, data=HELPrct ) 
densityplot( ~age, data=HELPrct ) 
     bwplot( ~age, data=HELPrct ) 
     qqmath( ~age, data=HELPrct ) 
```

Graphical Summaries: Two Variables
========================================================

```r
xyplot( births ~ dayofyear, data=Births78) 
```

<img src="LearningTeachingR-figure/unnamed-chunk-6.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" height="400" />


Graphical Summaries
========================================================

```r
bwplot( age ~ substance, data=HELPrct) 
```

<img src="LearningTeachingR-figure/unnamed-chunk-7.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" height="400" />


Graphical Summaries
========================================================

```r
bwplot( substance ~ age, data=HELPrct) 
```

<img src="LearningTeachingR-figure/unnamed-chunk-8.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" height="400" />



The Graphics Template
========================================================

<center>
<h2><strong><span class="boxed">plotname</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> , ...)</strong> 
</h2></center>

&nbsp;

### One variable
 * `histogram()`,  `qqmath()`,  `densityplot()`, `freqpolygon()` 

### Two Variables
 * `xyplot()`, `bwplot()`

Your turn
========================================================
type: prompt
**Create a plot of your own choosing.**

**Hints:**

```r
names(HELPrct)
```

 *  **i1** average number of drinks (standard units) consumed per day, in the past 30 days (measured at baseline)

 * **i2** maximum number of drinks (standard units) consumed per day, in the past 30 days (measured at baseline)
 

```r
names(Utilities2)
```


<center>
<h2><strong><span class="boxed">plotname</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> , ...)</strong> 
</h2></center>
groups and panels
========================================================

 * Add `groups = ???` to overlay plots on top of each other.  
 * Use `y ~ x | z` to create multipanel plots.


```r
densityplot( ~ age | sex, data=HELPrct,  
               group=substance,  
               auto.key=TRUE)   
```

<img src="LearningTeachingR-figure/unnamed-chunk-11.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" height="400" />

 
Numerical Summaries: One Variable
========================================================

```r
mean( ~ age, data=HELPrct )
```

```
[1] 35.65
```

```r
favstats( ~ age, data=HELPrct )
```

```
 min Q1 median Q3 max  mean   sd   n missing
  19 30     35 40  60 35.65 7.71 453       0
```

```r
tally( ~ sex, data=HELPrct)
```

```

female   male  Total 
   107    346    453 
```


Numerical Summaries: Two Variables
========================================================

```r
sd( age ~ substance, data=HELPrct )
```

```
alcohol cocaine  heroin 
  7.652   6.693   7.986 
```


Numerical Summaries: Tables
========================================================

```r
tally( sex ~ substance, data=HELPrct )
```

```
        substance
sex      alcohol cocaine heroin
  female  0.2034  0.2697 0.2419
  male    0.7966  0.7303 0.7581
  Total   1.0000  1.0000 1.0000
```

```r
tally( ~ sex + substance, data=HELPrct )
```

```
        substance
sex      alcohol cocaine heroin Total
  female      36      41     30   107
  male       141     111     94   346
  Total      177     152    124   453
```

Your turn
========================================================
type: prompt
**Create a numerical summary of your own choosing.**

**Hints:**

```r
names(HELPrct)
```

 *  **i1** average number of drinks (standard units) consumed per day, in the past 30 days (measured at baseline)

 * **i2** maximum number of drinks (standard units) consumed per day, in the past 30 days (measured at baseline)
 

```r
names(Utilities2)
```


<center>
<h2><strong><span class="boxed">summary</span> ( <span class="boxed">&nbsp;y&nbsp;</span> ~ <span class="boxed">&nbsp;x&nbsp;</span> , data = <span class="boxed">mydata</span> , ...)</strong> 
</h2></center>

 * possible summaries:  `mean()`, `median()`, `min()`, `max()`, `sd()`, `var()`, `favstats()`, etc.

Mathematical Functions
======================

Let's define 
$$latex
f(x,y) = sin( \pi \; x) \cos(\pi \; y)
$$

```r
f <- makeFun( sin(x *pi) * cos(y * pi) ~ x + y )
f(x=1/2, y=1/4)
```

```
[1] 0.7071
```

```r
f(1/2, 1/4)
```

```
[1] 0.7071
```


Mathematical Functoins
=======================
What does $f$ look like to R?

```r
f
```

```
function (x, y) 
sin(x * pi) * cos(y * pi)
```

Could also have been defined as 

```r
f <- function (x, y) { # curly braces not required 
  sin(x * pi) * cos(y * pi)
}
```


Plotting functions
=========================


```r
plotFun( f(x,y) ~ x + y, x.lim=c(0,2), y.lim=c(0,2) )
```

![plot of chunk unnamed-chunk-20](LearningTeachingR-figure/unnamed-chunk-20.png) 


But wait, there's more
======================

* Differentiation and Anti-differentiation

```r
f <- makeFun( cos(x^2) ~ x )
g <- D(f(x) ~ x);  G <- antiD(f(x) ~ x)
plotFun(g(x) ~ x, col = 'blue', x.lim=c(-1,5))
plotFun(f(x) ~ x, col = 'black', add=TRUE)
plotFun(G(x) ~ x, col = 'red', add=TRUE)
```

![plot of chunk unnamed-chunk-21](LearningTeachingR-figure/unnamed-chunk-21.png) 



Linear Models
========================================================

* Fitting models

```r
      lm ( formula, data=mydata )
fitModel ( formula, data=mydata )
     nls ( formula, data=mydata )
```


