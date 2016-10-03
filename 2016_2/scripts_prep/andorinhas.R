#Gerar dados para teórica
library(ggplot2)

theme_Publication = function(base_size=14, base_family="Georgia") {
    library(grid)
    library(ggthemes)
    (theme_foundation(base_size=base_size, base_family=base_family)
    + theme(plot.title = element_text(face = "bold",
                                      size = rel(1.2), hjust = 0.5),
            text = element_text(),
            panel.background = element_rect(colour = NA),
            plot.background = element_rect(colour = NA),
            panel.border = element_rect(colour = NA),
            axis.title = element_text(face = "bold",size = rel(1.5)),
            axis.title.y = element_text(angle=90,vjust =2),
            axis.title.x = element_text(vjust = -0.2),
            axis.text = element_text(size = rel(1.2)), 
            axis.line.x = element_line(color="black", size = 1),
            axis.line.y = element_line(color="black", size = 1),
            axis.ticks = element_line(),
            panel.grid.major = element_line(colour="#f0f0f0"),
            panel.grid.minor = element_blank(),
            legend.key = element_rect(colour = NA),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.key.size= unit(0.2, "cm"),
            legend.margin = unit(0, "cm"),
            legend.title = element_text(face="italic"),
            plot.margin=unit(c(10,5,5,5),"mm"),
            strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
            strip.text = element_text(face="bold")
    ))
    
}
set.seed(5)

obj = data.frame(x=rnorm(100, mean = 15, sd = 1.82))

p=ggplot(obj, aes(x=x)) + geom_histogram(aes(y =(..count..)/sum(..count..)), binwidth=1)+ labs(x = "Peso (g)", y = "Frequência relativa") + theme_Publication()+ scale_x_continuous(breaks = round(seq(min(obj$x), max(obj$x), by = 1),2))

#Gerar dados andorinhas
setwd("~/Desktop/bioestat/2016_2/")
set.seed(1)
andorinhas_m = rnorm(50, mean = 17, sd = 1)
andorinhas_f = rnorm(50, mean = 13, sd = 1)
andorinhas = data.frame(c(andorinhas_m, andorinhas_f), c(rep("M",50), rep("F",50)))
names(andorinhas) = c("peso", "sexo")
mean(andorinhas$peso)
sd(andorinhas$peso)

write.csv(andorinhas, "andorinhas.csv", row.names=F)
