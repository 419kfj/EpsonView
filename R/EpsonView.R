#' Epson View backup data conversion to dataframe.
#'
#' EpsonView_data() and NeoRun_data() returns dataframe of several data set as list,
#' including GPS data.
#
# NeoRun backup data conversion! だったものを、ソースを一本化
# push/pull がグレイアウト これは解決
#
## package NeoRun としてスタート
# 2017-08-14 kazuo fujimoto
# 2019/11/08 NeoRun_data2 をEPSON Viewように作成。いずれ、一つんI/Fで処理できるようにする。
# 2020/07/11 package EpsonView として統合　1.7
# kazuo.fujimoto2007@gmail.com
#
# Unit of data
# - GrapDistance m
# - GraphSpeed m/hour (to convert it to pace、1000*60 / x  min/Km)
# - GraphPitch step / min (spm)
# - GraphStride cm
# - HeartRate beat / min (bpm)

## for Epson View

# Read CSV data from EPSON View export
#fname <- "inst/extdata/20191027100322.csv"
#res <-  EpsonView(fname)

## for NeoRun
# sample data = "20170801-20170801.csv"
# fname <- "inst/extdata/20170801-20170801.csv"
# res <-  NeoRun_data(fname)
#
#res$Lap
#res$base
#res$Graph

# Epson View もこれで処理
NULL
