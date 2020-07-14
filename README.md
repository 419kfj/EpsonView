
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EpsonView

<!-- badges: start -->

<!-- badges: end -->

EPSON のSF810
がEpsonView/NeoRunにuploadしたデータのbackup形式を分析用のdataframeに変換するツールです。

  - res.EV$Lap ラップに要約されたデータ
  - res.EV$Graph グラフ描画用に計算されたデータ
  - res.EV%GPS GPSの生データ

## Installation

インストールは、Githubから行います。 [GitHub](https://github.com/) :

``` r
# install.packages("devtools")
devtools::install_github("419kfj/EpsonView")
```

## Example

  - EPSONView\_data: EPSON View
    からCSVをexportします。<https://view.epson.com/portal/ja/help/pc-export_gpx?type=help&device=pc&lang=ja>
  - NeoRunから、backup形式でダウンロードしたファイル（csv）を入力としても同様にRのデータフレームに変換します。

## Package load

``` r
library(EpsonView)
library(tidyverse)
#> ─ Attaching packages ───────────────────────────────────────────── tidyverse 1.3.0 ─
#> ✓ ggplot2 3.2.1     ✓ purrr   0.3.4
#> ✓ tibble  3.0.3     ✓ dplyr   1.0.0
#> ✓ tidyr   1.0.0     ✓ stringr 1.4.0
#> ✓ readr   1.3.1     ✓ forcats 0.4.0
#> Warning: package 'purrr' was built under R version 3.6.2
#> Warning: package 'dplyr' was built under R version 3.6.2
#> ─ Conflicts ─────────────────────────────────────────────── tidyverse_conflicts() ─
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```

## サンプルデータを入力にしてresult（res.EV）を得る

``` r
fname <- "inst/extdata/20191027100322.csv"
res.EV <-  EpsonView_data(fname)
#> Warning: 2 parsing failures.
#> row col  expected       actual                              file
#>   2  -- 2 columns 7269 columns 'inst/extdata/20191027100322.csv'
#>   2  -- 2 columns 7269 columns 'inst/extdata/20191027100322.csv'
```

## EVのresultの例　Lapデータ

``` r
res.EV$base # Data Description
#> [1] "[TrainingResult]"
names(res.EV$Lap) # 要約されたLapデータ
#>  [1] "LapNo"                "EndPoint"             "LapTime"             
#>  [4] "LapDistance"          "LapCalorie"           "LapPaceAve"          
#>  [7] "LapSpeedAve"          "LapPitchAve"          "LapStrideAve"        
#> [10] "LapKind"              "LapSteps"             "LapSplitTime"        
#> [13] "LapSplitDistance"     "LapAscentAltitude"    "LapDescentAltitude"  
#> [16] "LapMaxHeartRate"      "LapMinHeartRate"      "LapAverageHeartRate" 
#> [19] "LapHrzoneStayTime"    "LapHrzoneArrivalTime" "LapHrzoneUpperLimit" 
#> [22] "LapHrzoneLowerLimit"  "LapTimeCentisecond"   "Tag"
nrow(res.EV$Lap)
#> [1] 22
res.EV$Lap
#> # A tibble: 22 x 24
#>    LapNo EndPoint LapTime LapDistance LapCalorie LapPaceAve LapSpeedAve
#>    <int>    <int>   <int>       <int>      <int>      <int>       <int>
#>  1     1       27     353        1000         37        353       10198
#>  2     2       56     333        1000         41        333       10810
#>  3     3       79     333        1000         46        333       10810
#>  4     4      109     338        1000         46        338       10650
#>  5     5      151     330        1000         47        330       10909
#>  6     6      175     324        1000         48        324       11111
#>  7     7      205     331        1000         49        331       10876
#>  8     8      230     332        1000         47        332       10843
#>  9     9      274     343        1000         51        343       10495
#> 10    10      314     335        1000         47        335       10746
#> # … with 12 more rows, and 17 more variables: LapPitchAve <int>,
#> #   LapStrideAve <int>, LapKind <int>, LapSteps <int>, LapSplitTime <int>,
#> #   LapSplitDistance <int>, LapAscentAltitude <int>, LapDescentAltitude <int>,
#> #   LapMaxHeartRate <int>, LapMinHeartRate <int>, LapAverageHeartRate <int>,
#> #   LapHrzoneStayTime <int>, LapHrzoneArrivalTime <int>,
#> #   LapHrzoneUpperLimit <int>, LapHrzoneLowerLimit <int>,
#> #   LapTimeCentisecond <int>, Tag <chr>
```

## GPS data

``` r
names(res.EV$Graph) # GPS data
#> [1] "GraphAltitude" "GraphSpeed"    "GraphPitch"    "GraphStride"  
#> [5] "GraphDistance" "HeartRate"     "Slope"         "HeartRateFlag"
#> [9] "Tag"
nrow(res.EV$Graph)
#> [1] 7268
summary(res.EV$Graph)
#>  GraphAltitude      GraphSpeed      GraphPitch     GraphStride    
#>  Min.   :-5.000   Min.   : 3621   Min.   :109.0   Min.   : 49.00  
#>  1st Qu.: 4.000   1st Qu.:10282   1st Qu.:183.0   1st Qu.: 92.00  
#>  Median : 8.000   Median :10541   Median :185.0   Median : 95.00  
#>  Mean   : 7.594   Mean   :10487   Mean   :184.4   Mean   : 94.03  
#>  3rd Qu.:10.000   3rd Qu.:10788   3rd Qu.:186.0   3rd Qu.: 97.00  
#>  Max.   :35.000   Max.   :14650   Max.   :197.0   Max.   :125.00  
#>  GraphDistance     HeartRate         Slope          HeartRateFlag  
#>  Min.   :    0   Min.   : 75.0   Min.   :-8.00000   Min.   :0.000  
#>  1st Qu.: 5385   1st Qu.:138.0   1st Qu.:-1.00000   1st Qu.:0.000  
#>  Median :10785   Median :143.0   Median : 0.00000   Median :0.000  
#>  Mean   :10670   Mean   :146.1   Mean   : 0.04251   Mean   :1.788  
#>  3rd Qu.:15933   3rd Qu.:151.0   3rd Qu.: 1.00000   3rd Qu.:4.000  
#>  Max.   :21284   Max.   :203.0   Max.   :12.00000   Max.   :4.000  
#>        Tag      
#>  20191027:7268  
#>                 
#>                 
#>                 
#>                 
#> 
res.EV$GPS %>% head()
#>    GPSTime GPSlatitude GPSLongitude GPSAltitude GPSDirection GPSSpeed GPSStatus
#> 1 00:00:00    35869768    139990168          -2           61      185        16
#> 2 00:00:05    35869811    139990266          -2           72      182        48
#> 3 00:00:24    35869957    139990742           0           79      231        16
#> 4 00:00:37    35870025    139991108           5           90      262        48
#> 5 00:00:54    35870024    139991596           6           99      289        48
#> 6 00:01:14    35869957    139992154           5          106      293        16
#>        Tag
#> 1 20191027
#> 2 20191027
#> 3 20191027
#> 4 20191027
#> 5 20191027
#> 6 20191027
res.EV$GPS %>% tail()
#>      GPSTime GPSlatitude GPSLongitude GPSAltitude GPSDirection GPSSpeed
#> 706 02:00:30    35866204    139991278           8          308      371
#> 707 02:00:32    35866247    139991212           8          304      407
#> 708 02:00:45    35866443    139990700           8          294      379
#> 709 02:00:58    35866647    139990186          10          290      350
#> 710 02:01:01    35866694    139990064          11          301      409
#> 711 02:01:06    35866781    139989874          11          294      417
#>     GPSStatus      Tag
#> 706        16 20191027
#> 707        16 20191027
#> 708        48 20191027
#> 709        48 20191027
#> 710        16 20191027
#> 711        48 20191027
```
