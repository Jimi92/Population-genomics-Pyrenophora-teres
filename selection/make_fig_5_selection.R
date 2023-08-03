setwd("/home/taliadoros/Desktop/phd_projects/Ptt/2022/selection/all_selection")
read_omega_pops <- function(f,pop) {
  df <- read.table(f, skip = 2, header = FALSE)
  colnames(df) <- c("Position", "Omega","Left_boundary", "Right_boundary","Validity")
  mm = median(df$Omega)
  df["standar_om"] = df["Omega"]/mm
  df["Population"] <- pop
  return(df)
}

c1 <- read_omega_pops("C1/OmegaPlus_Report.Chr6_selection", "Iran")
c2 <- read_omega_pops("C2/OmegaPlus_Report.Chr6_selection", "NDakota")
c3 <- read_omega_pops("C3/OmegaPlus_Report.Chr6_selection", "Morocco")
c4 <- read_omega_pops("C4/OmegaPlus_Report.Chr6_selection", "France")
c5 <- read_omega_pops("C5/OmegaPlus_Report.Chr11_selection", "Azerbaijan")

full_df <- rbind(c2,c3)
full_df <- rbind(full_df,c4)
full_df <- rbind(full_df,c5)
full_df <- rbind(full_df,c5)

library(ggplot2)

ggplot(c5,aes(Position,standar_om, color = standar_om < 5)) + 
  geom_point(alpha=0.5) + ggtitle("Chromosome 11,Azerbaijan") + 
  xlim(1907500,1932500) + 
  ylim(0,15)  + 
  geom_vline(xintercept = 2874993) + scale_colour_manual(name = 'Significant ', values = setNames(c('grey','aquamarine4'),c(T, F))) + 
  geom_vline(xintercept = 2879103)+ ylab("Omega") + theme_minimal() + theme(plot.title = element_text(hjust = 0.5))

ggplot(c3,aes(Position,standar_om, color = standar_om < 2.5)) + geom_point(alpha=0.3) + ggtitle("Chromosome 6, Morocco") + xlim(2860000,2900000) + ylim(0,20) +
  scale_colour_manual(name = 'Significant ', values = setNames(c('grey','aquamarine4'),c(T, F))) +
  geom_vline(xintercept = 2874993) + 
  geom_vline(xintercept = 2879103)+ ylab("Omega") + theme_minimal()+ theme(plot.title = element_text(hjust = 0.5))

ggplot(c4,aes(Position,standar_om, color = standar_om < 5.2)) + geom_point(alpha=0.3) + ggtitle("Chromosome 6, France") + xlim(2860000,2900000) + ylim(0,20) + geom_vline(xintercept = 2874993) + 
  scale_colour_manual(name = 'Significant ', values = setNames(c('grey','aquamarine4'),c(T, F))) +
  geom_vline(xintercept = 2879103)+ ylab("Omega") + theme_minimal()+ theme(plot.title = element_text(hjust = 0.5))

ggplot(c5,aes(Position,standar_om, color = standar_om < 2.5)) + geom_point(alpha=0.3) + 
  scale_colour_manual(name = 'Significant ', values = setNames(c('grey','aquamarine4'),c(T, F))) +
  ggtitle("Chromosome 6, Azerbaijan") + xlim(2860000,2900000) + ylim(0,20) + geom_vline(xintercept = 2874993) + geom_vline(xintercept = 2879103)+ ylab("Omega") + theme_minimal()+ theme(plot.title = element_text(hjust = 0.5))