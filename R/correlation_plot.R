library(corrplot)

args <- commandArgs(TRUE)
csvdata <- read.csv(file = args[1], head = TRUE, sep = ",")
# defining columns that cannot be correlated
csvdata$id <- NULL
csvdata$block_size <- NULL
csvdata$channel_type <- NULL
csvdata$dst_site_name <- NULL
csvdata$src_site_name <- NULL

# plotting correlation

M <- cor(csvdata)
for (i in 1:nrow(M)) {
	for (j in 1:ncol(M)) {	
		if (abs(M[i, j]) < 0.6) 
			M[i, j] <- 0
		}
	}
pdf("correlation_plot.pdf")
corrplot(M, method = "circle", tl.cex = 0.5)
dev.off()

