#パッケージ読み込み
library(tidyverse)

#データフレーム整形
data <- 
  iris %>% #対象となるデータ
    gather(key = Phenotype, value = value, Sepal.Length:Petal.Width, factor_key = T) %>% #縦長のデータにする
    group_by(Species, Phenotype) %>% #group_byでSpecies,Phenotypeごとにする
    summarise(mean = mean(value), sd = sd(value)) #SpeciesごとのSepal.Lengthの平均と標準偏差を求める

#グラフ描画
ggplot(data,
       aes(x = Phenotype, y = mean, fill = Species) #グラフのx,yの指定，fillは色の塗り分け．今回はSpeciesで塗り分けたい
  )+
  geom_bar(stat = "identity", #geom_barで棒グラフとなる
           position = position_dodge(width = 0.9) #widthで系列間の距離を制御
  )+
  scale_fill_manual(values = c("#999999", "darkorange", "gold") #色をRGBで設定できる
  )+
  geom_errorbar(aes(ymax = mean + sd, ymin = mean - sd), # geom_errorbarでエラーバー追加
                position = position_dodge(0.9), #geom_barと同じ値にする
                width = 0.2, # 横棒の長さ
                size = 0.75 # 線の太さ
  )