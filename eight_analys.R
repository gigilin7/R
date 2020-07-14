#部分程式碼
#各年住宅用電與氣溫關係比較圖
#各年住宅用電與氣溫關係依縣市區分比較圖
fun <- function(data,i)
{
  #輸入年份
  cat("請輸入年份(2012至2019年)\n")
  while(num <- scan("", n = 1, quiet = TRUE)){
    if(num<2012|num>2019){
      cat("輸入錯誤，請重新輸入\n")
    }
    else
      break;
  }
  data <- data %>% filter(Year==num)
  mean <- adply(c(1:12),1,MMsum,data,1)
  max <- adply(c(1:12),1,MMsum,data,2)
  min <- adply(c(1:12),1,MMsum,data,3)
  data <- data.frame(data[,c(1,2,3,10)],MonthMean=rep(mean$MonthMean/22,each=22),MonthMax=rep(max$MonthMax/22,each=22),MonthMin=rep(min$MonthMin/22,each=22),Mean=data$MonthMean,Max=data$MonthMax,Min=data$MonthMin)
  name <- data.frame(n=c("月均溫","月高溫","月低溫"),y=c(mean$MonthMean[1]/22*1.5+4,max$MonthMax[1]/22*1.5+4,min$MonthMin[1]/22*1.5+4))
  #作圖
  show <- ggplot(data)+
    geom_col(aes(Month,HouseUse/100000000,fill = City),color="white")+labs(fill="縣市")
  #裝飾
  show <- show+theme(plot.title = element_text(lineheight = 0.8, face = "bold"))+
    scale_x_continuous(name = "月份",breaks=seq(1,12,1))+
    theme(text=element_text(family="Noto Sans T Chinese Regular", size=12))+
    scale_fill_hue(c = 80, l = 80)+theme_bw()
  #各年住宅用電與氣溫關係比較圖
  if(i==1)
  {
    show <- show +ggtitle(num,"住宅用電與氣溫關係")+
      geom_text(data=name,aes(x=1, label=n,y=y), colour="#666666", size=4,angle=30)+
      geom_line(aes(Month,MonthMean*1.5),size=1,colour="#666666")+
      geom_line(aes(Month,MonthMax*1.5),linetype="twodash",size=1,colour="#666666")+
      geom_line(aes(Month,MonthMin*1.5),linetype="twodash",size=1,colour="#666666")+
      scale_y_continuous(name = "住宅用電量(億度)",limits = c(0,60), sec.axis = sec_axis(~./1.5, name = "氣溫("~degree~"C)"))
  }
  #各年住宅用電與氣溫關係依縣市區分比較圖
  else
  {
    show <- show + ggtitle(num,"住宅用電")+scale_y_continuous(name = "住宅用電量(億度)",limits = c(0,60))
    show2 <- ggplot(data, aes(Month,Mean ,color=City)) + geom_point() + geom_line()+
      ggtitle(" ","氣溫")+labs(fill="縣市")+
      scale_y_continuous(name = "氣溫("~degree~"C)",limits = c(0,35))+
      scale_x_continuous(name = "月份",breaks=seq(1,12,1))+
      theme(text=element_text(family="Noto Sans T Chinese Regular", size=12))+
      scale_fill_hue(c = 80, l = 80)+theme_bw()
    #一起呈現
    show <- ggpubr::ggarrange(show, show2, nrow = 1, ncol = 2)
  }
  print(show)
}
