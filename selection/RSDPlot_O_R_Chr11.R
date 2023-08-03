 
 args = commandArgs(trailingOnly=TRUE) 
 RUNNAME <- args[1] 
 ID <- args[2] 
 output_file <- paste("RAiSD_Plot.", RUNNAME,".",ID,".pdf", sep="") 
 RDPATH <- paste("RAiSD_Report.",RUNNAME,".",ID, sep = "") 
 rsd_data <- read.table(RDPATH, header=F) 
 mup <- rsd_data[,1]/1000.0 
 mu1 <- rsd_data[,4] 
 mu2 <- rsd_data[,5] 
 mu3 <- rsd_data[,6] 
 mu  <- rsd_data[,7] 
 pdf(output_file, width=10, height=10) 
 par(mfrow=c(2,2)) 
 plot(mup, mu1, col="darkgray", pch=16, cex = .6, ylab=bquote(mu ~ "_var"), xlab="Chromosome position (kb)", main=bquote(mu ~ "_var curve for" ~ .(RUNNAME) ~ "." ~ .(ID))) 
 plot(mup, mu2, col="darkgray", pch=16, cex = .6, ylab=bquote(mu ~ "_sfs"), xlab="Chromosome position (kb)", main=bquote(mu ~ "_sfs curve for" ~ .(RUNNAME) ~ "." ~ .(ID))) 
 plot(mup, mu3, col="darkgray", pch=16, cex = .6, ylab=bquote(mu ~ "_ld"), xlab="Chromosome position (kb)", main=bquote(mu ~ "_ld curve for" ~ .(RUNNAME) ~ "." ~ .(ID))) 
 plot(mup, mu, col="black", pch=16, cex = .6, ylab=bquote(mu), xlab="Chromosome position (kb)", main=bquote(mu ~ "curve for" ~ .(RUNNAME) ~ "." ~ .(ID))) 
 dev.off() 
