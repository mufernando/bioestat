library(ggplot2)
ggplot(data.frame(x = c(-5, 5)), aes(x)) + stat_function(fun = dt, args = list(df=5)) + labs(x = "Média da amostra", y = "Densidade") + theme_Publication()

# Return dnorm(x) for 0 < x < 2, and NA for all other x
limitRange <- function(fun, df, min, max) {
    function(x) {
        y <- fun(x, df)
        y[x < min  |  x > max] <- NA
        return(y)
    }
}


# ggplot() with dummy data
p <- ggplot(data.frame(x=c(-3, 3)), aes(x=x))

p + stat_function(fun=dt, args = list(df=5)) +stat_function(fun = limitRange(dt, 5, -1.22, 5), geom="area", fill="blue", alpha=0.2) + labs(x = "Média da amostra", y = "Densidade") + theme_Publication()+ geom_vline(xintercept = -1.21, colour="red", linetype = "longdash")

