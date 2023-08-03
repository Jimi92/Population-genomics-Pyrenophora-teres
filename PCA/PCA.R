#PCA
BiocManager::install("gdsfmt")
BiocManager::install("SNPRelate")
library("ggplot2")
library(gdsfmt)
library(SNPRelate)


setwd('/home/taliadoros/Desktop/phd_projects/Cb/Cerco_2023/6_DCA/')
vcf.fn <- "CB_2023_No_outgroup_miss_indivs_chr1_10_IBS_Biallelic_SNPs.recode.vcf"
snpgdsVCF2GDS(vcf.fn, "ptt1.gds", method="biallelic.only")

snpgdsSummary("ptt1.gds")
genofile <- snpgdsOpen("ptt1.gds")
pca2 <- snpgdsPCA(genofile)
pc.percent <- pca2$varprop*100
head(round(pc.percent, 2))


tab2 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV2 = pca2$eigenvect[,2],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

org <- read.table('ind_list.txt')


tab2['Origin'] <- org$V1
tab2['Host'] <- org$V2
pdf('Cb_PCA.pdf')
ggplot(data=tab2,aes(x=EV1,y=EV2,color=Origin, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates clustering" )  + xlab("PC1 (9.9 %)") + ylab("PC2 (8.37 %)")
dev.off()

library(shiny)
library(plotly)

ui <- fluidPage(
  plotlyOutput("step")
)

server <- function(input, output) {
  output$step <- renderPlotly({
    ggplotly(ggplot(data=tab2,aes(x=EV1,y=EV2,color=Origin, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates clustering" )  + xlab("PC1 (7.43 %)") + ylab("PC2 (6.29 %)")
)
  })
}

shinyApp(ui, server)


#uk ONLY

vcf.fn <- "/home/taliadoros/Desktop/phd_projects/Cb/Cerco_2023/4_PCA/CB_UK.recode.vcf"
snpgdsVCF2GDS(vcf.fn, "ptt1.gds", method="biallelic.only")

snpgdsSummary("ptt1.gds")
genofile <- snpgdsOpen("ptt1.gds")
pca2 <- snpgdsPCA(genofile)
pc.percent <- pca2$varprop*100
head(round(pc.percent, 2))


tab2 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV2 = pca2$eigenvect[,2],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

tab2['Host'] <- "Seabeet"
tab2[22:37,4] <- "Sugarbeet"

library(shiny)
library(plotly)

ui <- fluidPage(
  plotlyOutput("step")
)

server <- function(input, output) {
  output$step <- renderPlotly({
    ggplotly(ggplot(data=tab2,aes(x=EV1,y=EV2,color=Host, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates clustering" )  + xlab("PC1 (7.43 %)") + ylab("PC2 (6.29 %)")
    )
  })
}

shinyApp(ui, server)

ggplot(data=tab2,aes(x=EV1,y=EV2,color=Host, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates clustering from UK" )  + xlab("PC1 (20.53 %)") + ylab("PC2 (11.34 %)")




vcf.fn <- "/home/taliadoros/Desktop/phd_projects/Cb/Cerco_2023/4_PCA/CB_Wild.recode.vcf"
snpgdsVCF2GDS(vcf.fn, "ptt6.gds", method="biallelic.only")

snpgdsSummary("ptt6.gds")
genofile <- snpgdsOpen("ptt6.gds")
pca2 <- snpgdsPCA(genofile)
pc.percent <- pca2$varprop*100
head(round(pc.percent, 2))


tab2 <- data.frame(sample.id = pca2$sample.id,
                   EV1 = pca2$eigenvect[,1],
                   # the first eigenvector
                   EV2 = pca2$eigenvect[,2],
                   # the second eigenvector
                   stringsAsFactors = FALSE)

org <- read.table('out/pop_info.txt')


tab2['Host'] <- "Croatia"
tab2[16:36,4] <- "UK"



ggplot(data=tab2,aes(x=EV1,y=EV2,color=Host, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates from sea beet clustering" )  + xlab("PC1 (13.81 %)") + ylab("PC2 (10.71 %)")

ui <- fluidPage(
  plotlyOutput("step")
)

server <- function(input, output) {
  output$step <- renderPlotly({
    ggplotly(ggplot(data=tab2,aes(x=EV1,y=EV2,color=Host, shape=Host)) + geom_point(size=2.3) + theme_bw() + labs(title = "C. beticola isolates from sea beet clustering" )  + xlab("PC1 (13.81 %)") + ylab("PC2 (10.71 %)")
    )
  })
}
shinyApp(ui, server)
                                                                                                                                                                                