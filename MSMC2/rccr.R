setwd("/home/taliadoros/Desktop/phd_projects/Ptt/2022/msmc2/all_chr/RCCR_8_all_1_2_2023/All_rccr/")
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

library(shiny)
library(plotly)

ui <- fluidPage(
  plotlyOutput("step")
)

server <- function(input, output) {
  output$step <- renderPlotly({
    ggplotly(ggplot(Az_Mor_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
               scale_x_log10()+ ylab("RCCR") + xlab("Time") + ggtitle("Azerbaijan Morocco") + theme_minimal())
  })
}

shinyApp(ui, server)

p.cross <- ggplot(Az_Mor_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
                    scale_x_log10()+ ylab("RCCR") + xlab("Time") + ggtitle("Azerbaijan Morocco") + theme_minimal()
                    
p.cross


#Az_ND
R1 <- read_iter("Az-ND_1.allrates.txt", "RUN_1")
R2 <- read_iter("Az-ND_2.allrates.txt", "RUN_2")
R3 <- read_iter("Az-ND_3.allrates.txt", "RUN_3")
R4 <- read_iter("Az-ND_4.allrates.txt", "RUN_4")
R5 <- read_iter("Az-ND_5.allrates.txt", "RUN_5")

Az_ND_full <- rbind(R1,R2,R3,R4,R5)
f1 <- approxfun(R1$rccr, R1$Time)
f1(v0)

ui <- fluidPage(
  plotlyOutput("step")
)

server <- function(input, output) {
  output$step <- renderPlotly({
    ggplotly(ggplot(Az_ND_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
               scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Azerbaijan USA") + theme_minimal())
  })
}

shinyApp(ui, server)

p.cross <- ggplot(Az_ND_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Azerbaijan USA") + theme_minimal()

p.cross


#Az Fr

R1 <- read_iter("Az-Fr_1.allrates.txt", "RUN_1")
R2 <- read_iter("Az-Fr_2.allrates.txt", "RUN_2")
R3 <- read_iter("Az-Fr_3.allrates.txt", "RUN_3")
R4 <- read_iter("Az-Fr_4.allrates.txt", "RUN_4")
R5 <- read_iter("Az-Fr_5.allrates.txt", "RUN_5")

Az_Fr_full <- rbind(R1,R2,R3,R4,R5)

v0 <- 0.5


f1 <- approxfun(R1$rccr, R1$Time)
f1(v0)
#we use numeric optimization here, but an analytical solution is of course possible (though a bit more work)
#this finds only one intersection, more work is required if there are more than one
optimize(function(t0) abs(f1(t0) - v0), interval = range(R1$Time))


p.cross <- ggplot(Az_Fr_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Azerbaijan Fr") + theme_minimal()

p.cross

#AZ IR

R1 <- read_iter("Az-Ir_1.allrates.txt", "RUN_1")
R2 <- read_iter("Az-Ir_2.allrates.txt", "RUN_2")
R3 <- read_iter("Az-Ir_3.allrates.txt", "RUN_3")
R4 <- read_iter("Az-Ir_4.allrates.txt", "RUN_4")
R5 <- read_iter("Az-Ir_5.allrates.txt", "RUN_5")

Az_Ir_full <- rbind(R1,R2,R3,R4,R5)

f1 <- approxfun(R1$rccr, R1$Time)
f1(v0)
p.cross <- ggplot(Az_Ir_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Azerbaijan Ir") + theme_minimal()

p.cross


#Mor Fr

R1 <- read_iter("Mo-Fr_1.allrates.txt", "RUN_1")
R2 <- read_iter("Mo-Fr_1.allrates.txt", "RUN_2")
R3 <- read_iter("Mo-Fr_1.allrates.txt", "RUN_3")
R4 <- read_iter("Mo-Fr_1.allrates.txt", "RUN_4")
R5 <- read_iter("Mo-Fr_1.allrates.txt", "RUN_5")

Mor_Fr_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Mor_Fr_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Morocco France") + theme_minimal()

p.cross


#Mor Ir

R1 <- read_iter("Mo-Ir_1.allrates.txt", "RUN_1")
R2 <- read_iter("Mo-Ir_1.allrates.txt", "RUN_2")
R3 <- read_iter("Mo-Ir_1.allrates.txt", "RUN_3")
R4 <- read_iter("Mo-Ir_1.allrates.txt", "RUN_4")
R5 <- read_iter("Mo-Ir_1.allrates.txt", "RUN_5")

Mor_Ir_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Mor_Ir_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Morocco Iran") + theme_minimal()

p.cross


#Mor ND 

R1 <- read_iter("Mo-ND_1.allrates.txt", "RUN_1")
R2 <- read_iter("Mo-ND_1.allrates.txt", "RUN_2")
R3 <- read_iter("Mo-ND_1.allrates.txt", "RUN_3")
R4 <- read_iter("Mo-ND_1.allrates.txt", "RUN_4")
R5 <- read_iter("Mo-ND_1.allrates.txt", "RUN_5")

Mor_ND_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Mor_ND_full, aes(x = Time, y=2*rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("Morocco USA") + theme_minimal()

p.cross


#Fr Ir

R1 <- read_iter("Fr-Ir_1.allrates.txt", "RUN_1")
R2 <- read_iter("Fr-Ir_2.allrates.txt", "RUN_2")
R3 <- read_iter("Fr-Ir_3.allrates.txt", "RUN_3")
R4 <- read_iter("Fr-Ir_4.allrates.txt", "RUN_4")
R5 <- read_iter("Fr-Ir_5.allrates.txt", "RUN_5")

Fr_Ir_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Fr_Ir_full, aes(x = Time, y=rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("France Iran") + theme_minimal()

p.cross


#Fr ND

R1 <- read_iter("Fr-ND_1.allrates.txt", "RUN_1")
R2 <- read_iter("Fr-ND_2.allrates.txt", "RUN_2")
R3 <- read_iter("Fr-ND_3.allrates.txt", "RUN_3")
R4 <- read_iter("Fr-ND_4.allrates.txt", "RUN_4")
R5 <- read_iter("Fr-ND_5.allrates.txt", "RUN_5")

Fr_ND_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Fr_ND_full, aes(x = Time, y=2*rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR")+ ggtitle("France USA") + theme_minimal()

p.cross


R1 <- read_iter("Ir-ND_1.allrates.txt", "RUN_1")
R2 <- read_iter("Ir-ND_2.allrates.txt", "RUN_2")
R3 <- read_iter("Ir-ND_3.allrates.txt", "RUN_3")
R4 <- read_iter("Ir-ND_4.allrates.txt", "RUN_4")
R5 <- read_iter("Ir-ND_5.allrates.txt", "RUN_5")

Ir_ND_full <- rbind(R1,R2,R3,R4,R5)


p.cross <- ggplot(Ir_ND_full, aes(x = Time, y=2*rccr, color = Run)) + geom_step() +
  scale_x_log10() + xlab("Time") + ylab("RCCR") + ggtitle("Iran USA") + theme_minimal()

p.cross
