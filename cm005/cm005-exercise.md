---
title: 'cm005: `dplyr` Exercise'
output:
  html_document:
    keep_md: true  
---

**Optional, but recommended startup**:

Change the file output to both html and md _documents_ (not notebook).

# Intro to `dplyr` syntax

1. Load the `gapminder` and `tidyverse` packages. Hint: `suppressPackageStartupMessages()`!
    - This loads `dplyr`, too.

```r
library(gapminder)
library(tidyverse)
```

```
## -- Attaching packages ------------------------------------------------------- tidyverse 1.2.1 --
```

```
## v ggplot2 3.0.0     v purrr   0.2.5
## v tibble  1.4.2     v dplyr   0.7.6
## v tidyr   0.8.1     v stringr 1.3.1
## v readr   1.1.1     v forcats 0.3.0
```

```
## -- Conflicts ---------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

2. `knit` the document. 

## `select()`

1. Make a data frame containing the columns `year`, `lifeExp`, `country` from the gapminder data, in that order

```r
select(gapminder, year, lifeExp, country)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country    
##    <int>   <dbl> <fct>      
##  1  1952    28.8 Afghanistan
##  2  1957    30.3 Afghanistan
##  3  1962    32.0 Afghanistan
##  4  1967    34.0 Afghanistan
##  5  1972    36.1 Afghanistan
##  6  1977    38.4 Afghanistan
##  7  1982    39.9 Afghanistan
##  8  1987    40.8 Afghanistan
##  9  1992    41.7 Afghanistan
## 10  1997    41.8 Afghanistan
## # ... with 1,694 more rows
```

2. Select all variables, from `country` to `lifeExp`. 

```r
select(gapminder, country:lifeExp)
```

```
## # A tibble: 1,704 x 4
##    country     continent  year lifeExp
##    <fct>       <fct>     <int>   <dbl>
##  1 Afghanistan Asia       1952    28.8
##  2 Afghanistan Asia       1957    30.3
##  3 Afghanistan Asia       1962    32.0
##  4 Afghanistan Asia       1967    34.0
##  5 Afghanistan Asia       1972    36.1
##  6 Afghanistan Asia       1977    38.4
##  7 Afghanistan Asia       1982    39.9
##  8 Afghanistan Asia       1987    40.8
##  9 Afghanistan Asia       1992    41.7
## 10 Afghanistan Asia       1997    41.8
## # ... with 1,694 more rows
```

3. Select all variables, except `lifeExp`.

```r
select(gapminder, -lifeExp)
```

```
## # A tibble: 1,704 x 5
##    country     continent  year      pop gdpPercap
##    <fct>       <fct>     <int>    <int>     <dbl>
##  1 Afghanistan Asia       1952  8425333      779.
##  2 Afghanistan Asia       1957  9240934      821.
##  3 Afghanistan Asia       1962 10267083      853.
##  4 Afghanistan Asia       1967 11537966      836.
##  5 Afghanistan Asia       1972 13079460      740.
##  6 Afghanistan Asia       1977 14880372      786.
##  7 Afghanistan Asia       1982 12881816      978.
##  8 Afghanistan Asia       1987 13867957      852.
##  9 Afghanistan Asia       1992 16317921      649.
## 10 Afghanistan Asia       1997 22227415      635.
## # ... with 1,694 more rows
```

4. Put `continent` first. Hint: use the `everything()` function.

```r
select(gapminder, continent, everything())
```

```
## # A tibble: 1,704 x 6
##    continent country      year lifeExp      pop gdpPercap
##    <fct>     <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Asia      Afghanistan  1952    28.8  8425333      779.
##  2 Asia      Afghanistan  1957    30.3  9240934      821.
##  3 Asia      Afghanistan  1962    32.0 10267083      853.
##  4 Asia      Afghanistan  1967    34.0 11537966      836.
##  5 Asia      Afghanistan  1972    36.1 13079460      740.
##  6 Asia      Afghanistan  1977    38.4 14880372      786.
##  7 Asia      Afghanistan  1982    39.9 12881816      978.
##  8 Asia      Afghanistan  1987    40.8 13867957      852.
##  9 Asia      Afghanistan  1992    41.7 16317921      649.
## 10 Asia      Afghanistan  1997    41.8 22227415      635.
## # ... with 1,694 more rows
```

5. Rename `continent` to `cont`.

```r
rename(gapminder, cont=continent)
```

```
## # A tibble: 1,704 x 6
##    country     cont   year lifeExp      pop gdpPercap
##    <fct>       <fct> <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia   1952    28.8  8425333      779.
##  2 Afghanistan Asia   1957    30.3  9240934      821.
##  3 Afghanistan Asia   1962    32.0 10267083      853.
##  4 Afghanistan Asia   1967    34.0 11537966      836.
##  5 Afghanistan Asia   1972    36.1 13079460      740.
##  6 Afghanistan Asia   1977    38.4 14880372      786.
##  7 Afghanistan Asia   1982    39.9 12881816      978.
##  8 Afghanistan Asia   1987    40.8 13867957      852.
##  9 Afghanistan Asia   1992    41.7 16317921      649.
## 10 Afghanistan Asia   1997    41.8 22227415      635.
## # ... with 1,694 more rows
```

## `arrange()`

1. Order by life expectancy.

```r
arrange(gapminder, lifeExp)
```

```
## # A tibble: 1,704 x 6
##    country      continent  year lifeExp     pop gdpPercap
##    <fct>        <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Rwanda       Africa     1992    23.6 7290203      737.
##  2 Afghanistan  Asia       1952    28.8 8425333      779.
##  3 Gambia       Africa     1952    30    284320      485.
##  4 Angola       Africa     1952    30.0 4232095     3521.
##  5 Sierra Leone Africa     1952    30.3 2143249      880.
##  6 Afghanistan  Asia       1957    30.3 9240934      821.
##  7 Cambodia     Asia       1977    31.2 6978607      525.
##  8 Mozambique   Africa     1952    31.3 6446316      469.
##  9 Sierra Leone Africa     1957    31.6 2295678     1004.
## 10 Burkina Faso Africa     1952    32.0 4469979      543.
## # ... with 1,694 more rows
```

2. Order by life expectancy, in descending order.

```r
arrange(gapminder, desc(lifeExp))
```

```
## # A tibble: 1,704 x 6
##    country          continent  year lifeExp       pop gdpPercap
##    <fct>            <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Japan            Asia       2007    82.6 127467972    31656.
##  2 Hong Kong, China Asia       2007    82.2   6980412    39725.
##  3 Japan            Asia       2002    82   127065841    28605.
##  4 Iceland          Europe     2007    81.8    301931    36181.
##  5 Switzerland      Europe     2007    81.7   7554661    37506.
##  6 Hong Kong, China Asia       2002    81.5   6762476    30209.
##  7 Australia        Oceania    2007    81.2  20434176    34435.
##  8 Spain            Europe     2007    80.9  40448191    28821.
##  9 Sweden           Europe     2007    80.9   9031088    33860.
## 10 Israel           Asia       2007    80.7   6426679    25523.
## # ... with 1,694 more rows
```

3. Order by year, then by life expectancy.

```r
arrange(gapminder, year, lifeExp)
```

```
## # A tibble: 1,704 x 6
##    country       continent  year lifeExp     pop gdpPercap
##    <fct>         <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Afghanistan   Asia       1952    28.8 8425333      779.
##  2 Gambia        Africa     1952    30    284320      485.
##  3 Angola        Africa     1952    30.0 4232095     3521.
##  4 Sierra Leone  Africa     1952    30.3 2143249      880.
##  5 Mozambique    Africa     1952    31.3 6446316      469.
##  6 Burkina Faso  Africa     1952    32.0 4469979      543.
##  7 Guinea-Bissau Africa     1952    32.5  580653      300.
##  8 Yemen, Rep.   Asia       1952    32.5 4963829      782.
##  9 Somalia       Africa     1952    33.0 2526994     1136.
## 10 Guinea        Africa     1952    33.6 2664249      510.
## # ... with 1,694 more rows
```

## Piping, `%>%`

Note: think of `%>%` as the word "then"!

1. Combine `select()` Task 1 with `arrange()` Task 3.

```r
gapminder %>%
  select(year, lifeExp, country) %>%
  arrange(year, lifeExp)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country      
##    <int>   <dbl> <fct>        
##  1  1952    28.8 Afghanistan  
##  2  1952    30   Gambia       
##  3  1952    30.0 Angola       
##  4  1952    30.3 Sierra Leone 
##  5  1952    31.3 Mozambique   
##  6  1952    32.0 Burkina Faso 
##  7  1952    32.5 Guinea-Bissau
##  8  1952    32.5 Yemen, Rep.  
##  9  1952    33.0 Somalia      
## 10  1952    33.6 Guinea       
## # ... with 1,694 more rows
```

## `filter()`

1. Only take data with population greater than 100 million.

```r
gapminder %>%
  filter(pop > 100000000)
```

```
## # A tibble: 77 x 6
##    country    continent  year lifeExp       pop gdpPercap
##    <fct>      <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Bangladesh Asia       1987    52.8 103764241      752.
##  2 Bangladesh Asia       1992    56.0 113704579      838.
##  3 Bangladesh Asia       1997    59.4 123315288      973.
##  4 Bangladesh Asia       2002    62.0 135656790     1136.
##  5 Bangladesh Asia       2007    64.1 150448339     1391.
##  6 Brazil     Americas   1972    59.5 100840058     4986.
##  7 Brazil     Americas   1977    61.5 114313951     6660.
##  8 Brazil     Americas   1982    63.3 128962939     7031.
##  9 Brazil     Americas   1987    65.2 142938076     7807.
## 10 Brazil     Americas   1992    67.1 155975974     6950.
## # ... with 67 more rows
```

2. Of those, only take data from Asia.

```r
gapminder %>%
  filter(pop > 100000000) %>%
  filter(continent == "Asia")
```

```
## # A tibble: 52 x 6
##    country    continent  year lifeExp       pop gdpPercap
##    <fct>      <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Bangladesh Asia       1987    52.8 103764241      752.
##  2 Bangladesh Asia       1992    56.0 113704579      838.
##  3 Bangladesh Asia       1997    59.4 123315288      973.
##  4 Bangladesh Asia       2002    62.0 135656790     1136.
##  5 Bangladesh Asia       2007    64.1 150448339     1391.
##  6 China      Asia       1952    44   556263527      400.
##  7 China      Asia       1957    50.5 637408000      576.
##  8 China      Asia       1962    44.5 665770000      488.
##  9 China      Asia       1967    58.4 754550000      613.
## 10 China      Asia       1972    63.1 862030000      677.
## # ... with 42 more rows
```

## git stuff (Optional)

Knit, commit, push!

# Break/Challenge: metaprogramming

Here's an activity for you to do during the break, in case you're all caught up. It should help you understand metaprogramming a bit more.

Suppose you're the instructor of an R programming course. You write an assignment question to evaluate whether students can write an `if` statement, for which an answer to the question looks something like this:


```r
my_commute <- 60
if (my_commute > 30) {
    print("That's a long commute!")
} else {
    print("That's a short commute.")
}
```

```
## [1] "That's a long commute!"
```

Your task is to use metaprogramming to check whether a response (like the one above) works and contains an `if` statement. You should roughly follow these steps, using [adv-r: expressions](https://adv-r.hadley.nz/expressions.html) as a resource (especially Section 18.1).

1. Wrap the above block of code in the `expr()` function from the `rlang` package.
2. Use the `eval()` function to execute the code, to see if the code runs.
3. Use the `as.character()` function to check whether this response contains an `if` statement.

# Relational/Comparison and Logical Operators in R

1. Find all entries of Canada and Algeria occuring in the '60s. 

```r
gapminder %>%
  filter((country == "Canada" | country == "Algeria") & year >= 1960 & year < 1970)
```

```
## # A tibble: 4 x 6
##   country continent  year lifeExp      pop gdpPercap
##   <fct>   <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Algeria Africa     1962    48.3 11000948     2551.
## 2 Algeria Africa     1967    51.4 12760499     3247.
## 3 Canada  Americas   1962    71.3 18985849    13462.
## 4 Canada  Americas   1967    72.1 20819767    16077.
```

```r
gapminder %>%
  filter(country %in% c("Canada", "Algeria"),
         year >=1960, year < 1970)
```

```
## # A tibble: 4 x 6
##   country continent  year lifeExp      pop gdpPercap
##   <fct>   <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Algeria Africa     1962    48.3 11000948     2551.
## 2 Algeria Africa     1967    51.4 12760499     3247.
## 3 Canada  Americas   1962    71.3 18985849    13462.
## 4 Canada  Americas   1967    72.1 20819767    16077.
```


2. Find all entries of Canada, and entries of Algeria occuring in the '60s. 
3. Find all entries _not_ including Canada and Algeria.

```r
gapminder %>%
  filter((country != "Canada" | country != "Algeria"))
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # ... with 1,694 more rows
```



# Bonus Exercises

If there's time remaining, we'll practice with these three exercises. I'll give you 1 minute for each, then we'll go over the answer.

1. Take all countries in Europe that have a GDP per capita greater than 10000, and select all variables except `gdpPercap`. (Hint: use `-`).

```r
gapminder %>%
  filter(continent == "Europe" & gdpPercap > 10000) %>%
  select(-gdpPercap)
```

```
## # A tibble: 214 x 5
##    country continent  year lifeExp     pop
##    <fct>   <fct>     <int>   <dbl>   <int>
##  1 Austria Europe     1962    69.5 7129864
##  2 Austria Europe     1967    70.1 7376998
##  3 Austria Europe     1972    70.6 7544201
##  4 Austria Europe     1977    72.2 7568430
##  5 Austria Europe     1982    73.2 7574613
##  6 Austria Europe     1987    74.9 7578903
##  7 Austria Europe     1992    76.0 7914969
##  8 Austria Europe     1997    77.5 8069876
##  9 Austria Europe     2002    79.0 8148312
## 10 Austria Europe     2007    79.8 8199783
## # ... with 204 more rows
```

2. Take the first three columns, and extract the names.


```r
colnames(gapminder)[1:3]
```

```
## [1] "country"   "continent" "year"
```

3. Of the `iris` data frame, take all columns that start with the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the following code: `?tidyselect::select_helpers`.
    - Exercise from [r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).

```r
data(iris)
select(iris, starts_with("Petal"))
```

```
##     Petal.Length Petal.Width
## 1            1.4         0.2
## 2            1.4         0.2
## 3            1.3         0.2
## 4            1.5         0.2
## 5            1.4         0.2
## 6            1.7         0.4
## 7            1.4         0.3
## 8            1.5         0.2
## 9            1.4         0.2
## 10           1.5         0.1
## 11           1.5         0.2
## 12           1.6         0.2
## 13           1.4         0.1
## 14           1.1         0.1
## 15           1.2         0.2
## 16           1.5         0.4
## 17           1.3         0.4
## 18           1.4         0.3
## 19           1.7         0.3
## 20           1.5         0.3
## 21           1.7         0.2
## 22           1.5         0.4
## 23           1.0         0.2
## 24           1.7         0.5
## 25           1.9         0.2
## 26           1.6         0.2
## 27           1.6         0.4
## 28           1.5         0.2
## 29           1.4         0.2
## 30           1.6         0.2
## 31           1.6         0.2
## 32           1.5         0.4
## 33           1.5         0.1
## 34           1.4         0.2
## 35           1.5         0.2
## 36           1.2         0.2
## 37           1.3         0.2
## 38           1.4         0.1
## 39           1.3         0.2
## 40           1.5         0.2
## 41           1.3         0.3
## 42           1.3         0.3
## 43           1.3         0.2
## 44           1.6         0.6
## 45           1.9         0.4
## 46           1.4         0.3
## 47           1.6         0.2
## 48           1.4         0.2
## 49           1.5         0.2
## 50           1.4         0.2
## 51           4.7         1.4
## 52           4.5         1.5
## 53           4.9         1.5
## 54           4.0         1.3
## 55           4.6         1.5
## 56           4.5         1.3
## 57           4.7         1.6
## 58           3.3         1.0
## 59           4.6         1.3
## 60           3.9         1.4
## 61           3.5         1.0
## 62           4.2         1.5
## 63           4.0         1.0
## 64           4.7         1.4
## 65           3.6         1.3
## 66           4.4         1.4
## 67           4.5         1.5
## 68           4.1         1.0
## 69           4.5         1.5
## 70           3.9         1.1
## 71           4.8         1.8
## 72           4.0         1.3
## 73           4.9         1.5
## 74           4.7         1.2
## 75           4.3         1.3
## 76           4.4         1.4
## 77           4.8         1.4
## 78           5.0         1.7
## 79           4.5         1.5
## 80           3.5         1.0
## 81           3.8         1.1
## 82           3.7         1.0
## 83           3.9         1.2
## 84           5.1         1.6
## 85           4.5         1.5
## 86           4.5         1.6
## 87           4.7         1.5
## 88           4.4         1.3
## 89           4.1         1.3
## 90           4.0         1.3
## 91           4.4         1.2
## 92           4.6         1.4
## 93           4.0         1.2
## 94           3.3         1.0
## 95           4.2         1.3
## 96           4.2         1.2
## 97           4.2         1.3
## 98           4.3         1.3
## 99           3.0         1.1
## 100          4.1         1.3
## 101          6.0         2.5
## 102          5.1         1.9
## 103          5.9         2.1
## 104          5.6         1.8
## 105          5.8         2.2
## 106          6.6         2.1
## 107          4.5         1.7
## 108          6.3         1.8
## 109          5.8         1.8
## 110          6.1         2.5
## 111          5.1         2.0
## 112          5.3         1.9
## 113          5.5         2.1
## 114          5.0         2.0
## 115          5.1         2.4
## 116          5.3         2.3
## 117          5.5         1.8
## 118          6.7         2.2
## 119          6.9         2.3
## 120          5.0         1.5
## 121          5.7         2.3
## 122          4.9         2.0
## 123          6.7         2.0
## 124          4.9         1.8
## 125          5.7         2.1
## 126          6.0         1.8
## 127          4.8         1.8
## 128          4.9         1.8
## 129          5.6         2.1
## 130          5.8         1.6
## 131          6.1         1.9
## 132          6.4         2.0
## 133          5.6         2.2
## 134          5.1         1.5
## 135          5.6         1.4
## 136          6.1         2.3
## 137          5.6         2.4
## 138          5.5         1.8
## 139          4.8         1.8
## 140          5.4         2.1
## 141          5.6         2.4
## 142          5.1         2.3
## 143          5.1         1.9
## 144          5.9         2.3
## 145          5.7         2.5
## 146          5.2         2.3
## 147          5.0         1.9
## 148          5.2         2.0
## 149          5.4         2.3
## 150          5.1         1.8
```

