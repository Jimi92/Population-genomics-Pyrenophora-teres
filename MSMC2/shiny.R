setwd("/home/taliadoros/Desktop/phd_projects/Ptt/2022/msmc2/all_chr/RCCR_8_all_1_2_2023/All_rccr/")
library(ggplot2)
library(shiny)
library(plotly)
mu <- 1.25e-8
g <- 1
v0 <- 0.5
read_iter <- function(f,p) {
  df <- read.table(f, header = T)
  df$Run <- p
  df$Time <- with(df, g * ((right_time_boundary + left_time_boundary) / 2) /mu)
  df$rccr <-  (2 * df$lambda_01)/(df$lambda_00 + df$lambda_11)
  return(df)
}

#Az_Mor
R1 <- read_iter("Az-Mo_1.allrates.txt", "RUN_1")
R2 <- read_iter("Az-Mo_2.allrates.txt", "RUN_2")
R3 <- read_iter("Az-Mo_3.allrates.txt", "RUN_3")
R4 <- read_iter("Az-Mo_4.allrates.txt", "RUN_4")
R5 <- read_iter("Az-Mo_5.allrates.txt", "RUN_5")

Az_Mor_full <- rbind(R1,R2,R3,R4,R5)




f1 <- approxfun(R1$rccr, R1$Time)
f1(v0)



#p.cross <- ggplot(Az_Mor_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
#                    scale_x_log10()+ ylab("RCCR") + xlab("Time") + ggtitle("Azerbaijan Morocco") + theme_minimal()

#p.cross


#Az_ND
R1 <- read_iter("Az-ND_1.allrates.txt", "RUN_1")
R2 <- read_iter("Az-ND_2.allrates.txt", "RUN_2")
R3 <- read_iter("Az-ND_3.allrates.txt", "RUN_3")
R4 <- read_iter("Az-ND_4.allrates.txt", "RUN_4")
R5 <- read_iter("Az-ND_5.allrates.txt", "RUN_5")

Az_ND_full <- rbind(R1,R2,R3,R4,R5)
library(shiny)
library(plotly)

ui <- fluidPage(
  plotlyOutput("step1"),
  plotlyOutput("step2")
)

server <- function(input, output) {
  output$step1 <- renderPlotly({
    ggplotly(ggplot(Az_Mor_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
               scale_x_log10()+ ylab("RCCR") + xlab("Time") + ggtitle("Azerbaijan Morocco") + theme_minimal())
  })
  
  output$step2 <- renderPlotly({
    ggplotly(ggplot(Az_ND_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
               scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Azerbaijan USA") + theme_minimal())
  })
  
}

shinyApp(ui, server)
f1 <- approxfun(R1$rccr, R1$Time)
f1(v0)

