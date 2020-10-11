rawdata <- iris

#パッケージ読み込み
library(ggplot2)
library(dplyr)

#データフレーム整形
data <- 
  rawdata %>% #対象となるデータ
  group_by(Species) %>% #group_byでSpeciesごとにする
  summarise(mean = mean(Sepal.Length), sd = sd(Sepal.Length))#Speciesごとに平均と標準偏差を求める


#グラフ描画
ggplot(data, #使用するデータ
       aes(y=mean,x=Species,fill=Species) #グラフのx,yの指定，fillは色の塗り分け．今回はSpeciesで塗り分けたい
)+
  geom_bar(stat = "identity", #geom_barで棒グラフとなる
           width = 0.6  
  )+
  scale_fill_manual(values = c("#999999", "darkorange", "gold") #色をRGBで設定できる
  )+
  geom_errorbar(aes(ymax = mean + sd, ymin = mean - sd), # geom_errorbarでエラーバー追加
                width = 0.2,  # 横棒の長さ
                size = 1.5 # 線の太さ
  ) 


