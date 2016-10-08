
`moviemeter` : Tools to work with the MovieMeter API

Get an API key: <https://www.moviemeter.nl/site/registerclient/>

Read about their API <http://wiki.moviemeter.nl/index.php/API>

The following functions are implemented:

-   `mm_get_movie_info`: Retrieve film information
-   `mm_search`: Search for films
-   `moviemeter_api_key`: Get or set MOVIEMETER\_API\_KEY value

### Installation

``` r
devtools::install_git("https://github.com/hrbrmstr/moviemeter.git")
```

``` r
options(width=120)
```

### Usage

``` r
library(moviemeter)

# current verison
packageVersion("moviemeter")
```

    ## [1] '0.1.0'

``` r
mm_search("brave little toaster")
```

    ## # A tibble: 3 × 4
    ##      id                                  title           alternative_title  year
    ## * <int>                                  <chr>                       <chr> <int>
    ## 1  5208               The Brave Little Toaster Het Dappere Broodroostertje  1987
    ## 2  4486 The Brave Little Toaster to the Rescue                        <NA>  1997
    ## 3 17929  The Brave Little Toaster Goes to Mars                        <NA>  1998

``` r
mm_get_movie_info(5208)
```

    ## $id
    ## [1] 5208
    ## 
    ## $url
    ## [1] "https://www.moviemeter.nl/film/5208"
    ## 
    ## $year
    ## [1] 1987
    ## 
    ## $imdb
    ## [1] "tt0092695"
    ## 
    ## $title
    ## [1] "Brave Little Toaster, The"
    ## 
    ## $display_title
    ## [1] "The Brave Little Toaster"
    ## 
    ## $alternative_title
    ## [1] "Het Dappere Broodroostertje"
    ## 
    ## $plot
    ## [1] "Wanneer een jongen en zijn familie op vakantie zijn voelt het huishoud-apparatuur van de familie zich verlaten. Ze besluiten samen te spannen, en geleid door het dappere broodroostertje gaan ze op zoek naar de jongen, wat het begin is van een groot avontuur."
    ## 
    ## $duration
    ## [1] 90
    ## 
    ## $votes_count
    ## [1] 170
    ## 
    ## $average
    ## [1] 2.79
    ## 
    ## $posters
    ## $posters$thumb
    ## [1] "https://www.moviemeter.nl/images/cover/5000/5208.50.jpg"
    ## 
    ## $posters$small
    ## [1] "https://www.moviemeter.nl/images/cover/5000/5208.200.jpg"
    ## 
    ## $posters$regular
    ## [1] "https://www.moviemeter.nl/images/cover/5000/5208.300.jpg"
    ## 
    ## $posters$large
    ## [1] "https://www.moviemeter.nl/images/cover/5000/5208.jpg"
    ## 
    ## 
    ## $countries
    ## [1] "Verenigde Staten" "Taiwan"           "Japan"           
    ## 
    ## $genres
    ## [1] "Animatie" "Familie" 
    ## 
    ## $actors
    ##            name voice
    ## 1    Jon Lovitz  TRUE
    ## 2 Timothy Stack  TRUE
    ## 3  Phil Hartman  TRUE
    ## 
    ## $directors
    ## [1] "Jerry Rees"

Generate a data frame for 3 movies (w/o useless fields):

``` r
library(purrr)

imdb_ids <- c("tt1107846", "tt0282552", "tt0048199")

df <- map_df(imdb_ids, ~mm_get_movie_info(.)[1:11])

dplyr::glimpse(df)
```

    ## Observations: 3
    ## Variables: 11
    ## $ id                <int> 57161, 6465, 33351
    ## $ url               <chr> "https://www.moviemeter.nl/film/57161", "https://www.moviemeter.nl/film/6465", "https://w...
    ## $ year              <int> 2007, 2002, 1955
    ## $ imdb              <chr> "tt1107846", "tt0282552", "tt0048199"
    ## $ title             <chr> "Theft", "Riders", "Illegal"
    ## $ display_title     <chr> "Theft", "Riders", "Illegal"
    ## $ alternative_title <chr> NA, "Steal", NA
    ## $ plot              <chr> "Een naïeve dorpsjongen wordt verliefd op een crimineel. Guy was altijd een nette beschaa...
    ## $ duration          <int> 90, 83, 88
    ## $ votes_count       <int> 1, 293, 20
    ## $ average           <dbl> 2.00, 2.55, 3.42

### Test Results

``` r
library(moviemeter)
library(testthat)

date()
```

    ## [1] "Sat Oct  8 11:11:07 2016"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 0 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
