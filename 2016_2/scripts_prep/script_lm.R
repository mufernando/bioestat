setwd("~/Desktop/bioestat/2016_2/scripts_prep/")

library(ggplot2)

library(car)

library('MASS')

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


samples = 30

r = 0.8
pos_cor = data.frame(mvrnorm(n=samples, mu=c(1.7, 1.7), Sigma=matrix(c(1, r, r, 1), nrow=2), empirical=TRUE))

r = 0
not_cor = data.frame(mvrnorm(n=samples, mu=c(1.7, 1.7), Sigma=matrix(c(1, r, r, 1), nrow=2), empirical=TRUE))

r = -0.8
neg_cor = data.frame(mvrnorm(n=samples, mu=c(1.7, 1.7), Sigma=matrix(c(1, r, r, 1), nrow=2), empirical=TRUE))

#scatterplot
ggplot(pos_cor, aes(x = X1, y = X2)) + geom_point() + theme_Publication() + labs(x = "Média da altura dos pais", y = "Altura dos filhos")

#covariance pos_cor
ggplot(pos_cor, aes(x = X1, y = X2)) + geom_point() + theme_Publication() + labs(x = "Média da altura dos pais", y = "Altura dos filhos") + stat_ellipse()+ geom_vline(xintercept = mean(raw$predictor), linetype="dotted") + geom_hline(yintercept = mean(raw$response), linetype="dotted")

#covariance neg_cor
ggplot(neg_cor, aes(x = X1, y = X2)) + geom_point() + theme_Publication() + labs(x = "Média da altura dos pais", y = "Altura dos filhos") + stat_ellipse()+ geom_vline(xintercept = mean(raw$predictor), linetype="dotted") + geom_hline(yintercept = mean(raw$response), linetype="dotted")

#covariance not_cor
ggplot(not_cor, aes(x = X1, y = X2)) + geom_point() + theme_Publication() + labs(x = "Média da altura dos pais", y = "Altura dos filhos") + stat_ellipse()+ geom_vline(xintercept = mean(raw$predictor), linetype="dotted") + geom_hline(yintercept = mean(raw$response), linetype="dotted")

ggplot(pos_cor, aes(x = X1, y = X2)) + geom_point() + theme_Publication() + labs(x = "Média da altura dos pais", y = "Altura dos filhos")+ geom_smooth(method = "lm", formula = y ~ x, col = "red", se=FALSE) + geom_vline(xintercept = mean(pos_cor$X2), linetype="dotted") + geom_hline(yintercept = mean(pos_cor$X1), linetype="dotted")

m = lm(X2 ~ X1,data=pos_cor)
res = data.frame(resid(m))
anova(m)

ggplot(res, aes(x=resid.m.)) + geom_histogram(binwidth = 0.3) + theme_Publication() + labs(x = "Resíduos", y = "Frequência")

ggplot(m, aes(.fitted, .resid))+geom_point() + theme_Publication() + labs(x = "Y ajustado", y = "Resíduo")
