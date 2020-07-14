# 臺灣天氣與用電量的分析(8年)
+ 用電量：住宅用電量
+ 天氣：臺灣22個縣市的溫度、雨量、濕度

# package:

+ rvest (爬蟲，擷取網頁原始檔案資料)
  - `html_nodes`：選用需要的nodes做資料擷取
  - `html_text`：擷取其中的文字資訊
  
+ magrittr (資料流pipe處理)
	- `%>%`：將管線化運算子，以資料流之方式擷取資料
  
+ xml或xml2 (讀取xml檔案)
	- `read_html(.xml)`：讀取檔案
  
+ plyr(資料處理)
	- `aaply、adply、alply、ldply、llply`：資料處理
  
+ dplyr (資料篩選)
	- `filter`：自訂條件，過濾data frame之column中的資料
	- `group_by`：將資料分組
	- `summarise`：計算資料之統計值
  
+ ggplot2 (繪製圖表、呈現)
	- `geom_text(data,aes(x,label,y),colour,size,angle)`：座標軸的文字與外型設定
	- `scale_y_continuous(name,limits,sec.axis=sec_axis(~./12, name))`：針對y軸的設定
		- limits：左y軸的顯示參數在0～500之間
		- sec：右y軸
		- ～./12：limits數據0～500上除以12以設定成右y軸的顯示範圍。
    
	- `scale_x_continuous(name,breaks=seq(1,12,1))`：針對x軸的設定
		- breaks：設定x軸參數
		- seq(1,12,1)：列出1～12且公差為1。
    
	- `theme(text=element_text(family,size))`：主題外型設定
		- family：字型設定
		- size：字型大小。
    
	- `scale_fill_hue(c,l)`：畫面外型設定
		- c：飽和度
		- l：亮度。
    
	- `theme_bw()`：白色佈景主題

# 實作
+ 資料處理&資料分析
+ 提供部分程式碼&圖

以下圖以2019年為例

<img src="https://github.com/gigilin7/R/blob/master/picture/1.png" width=300><img src="https://github.com/gigilin7/R/blob/master/picture/2.png" width=300><img src="https://github.com/gigilin7/R/blob/master/picture/3.png" width=300>

