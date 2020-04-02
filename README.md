# ipedals

ipedals is designed to simplify access to [IPEDS][], the Integrated
Postsecondary Education Data System from the U.S. Department of Education's
[National Center for Education Statistics][NCES].

[IPEDS]: https://nces.ed.gov/ipeds/
[NCES]: https://nces.ed.gov/

## Installation

You can install the released version of ipedals from GitHub with:

``` r
remotes::install_github("associatedpress/ipedals")
```

## Example

``` r
library(ipedals)
hd2016 <- ipedals::ipeds_table("HD2016")
hd2016$table
hd2016$variables
hd2016$codebook
```
