setwd("~/Desktop/phd_projects/Ptt/2022/for_julie/gen_dif_by_distance")
library("vcfR")
vcf <- read.vcfR("dom_only_no_miss_biall.recode.vcf.gz")

x <- vcfR2genlight(vcf)
gt <- extract.gt(vcf, element = "GT")
x.dist <- dist(x)

df <- data.frame(x.dist)
library('genepop')




library('ape')
mat1 <- read.table("dom_dist",header = T)
mat2 <- read.table("geo.txt",header = T)

phy <- read.nexus.data("dom_only_no_miss_biall.recode.min4.nexus")


m1 <- mat1[,2:105]
m2 <- mat2[,2:105]

mantel.test(m1, m2, nperm = 9999, graph = T,
            alternative = "two.sided")


df1 <- data.frame(a=unlist(m1, use.names = FALSE))
df2 <- data.frame(b=unlist(m2, use.names = FALSE))
df1['b'] <- df2$b

library("ggplot2")
library(tidyr)
library(tibble)
library(hrbrthemes)
library(dplyr)
library("ggpubr")

ggplot(df1, aes(x=b, y=a)) + 
  geom_point(shape=3, color="#5B84B1FF")+
  geom_smooth(method=lm,  linetype="dashed",
              color="#FC766AFF", fill="#567572FF") + ylim(0,0.7) + ylab("Genetic distance (Mismatch)") + xlab("Geographic distance (km)")+ theme_classic()
#FC766AFF
#567572FF
sp <- ggscatter(df1, x = "b", y = "a",
                add = "reg.line",  # Add regressin line
                add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
                conf.int = TRUE # Add confidence interval
)
# Add correlation coefficient
sp + stat_cor(method = "spearman", label.x = 3, label.y = 0.8)
#> `geom_smooth()` using formula = 'y ~ x'



#library(adespatial)

dbmem(
  xyORdist,
  thresh = NULL,
  MEM.autocor = c("positive", "non-null", "all", "negative"),
  store.listw = TRUE,
  silent = TRUE
)


library(vegan)
install.packages("geosphere")
library(geosphere)

mantel(m1, m2, method = "pearson", permutations = 9999, na.rm = TRUE)
mantel(m1, m2, method = "spearman", permutations = 9999, na.rm = TRUE)
