#Instal ggfortify
library(ggfortify)
library(tidyverse)


mod1 <- lm(mpg ~wt, data = mtcars)
summary(mod1)

#1
# The regression model is lenear in parameters
#Eyeball it

mtcars %>%
  ggplot (., aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth()


#2 
#The mean of residuals is zero
# Check model summary and test manually
# mean (mod1$residuals)
summary(mod1)
# the mean needs to be close to 0, THE 1Q AND 3Q needs to be similar
mean(mod1$residuals)


# 3
#Homoskedasticity of residuals or equel variance
# left side plots 

autoplot(mod1, which = c(1, 3))

#4 no autocorrelation of residuals
acf(mod1$residuals) #visual inspecticon
lmtest::dwtest(mod1) #formal test : Durbin Watson test :: means that it's the packege

#6 Normality of residuals
autoplot(mod1, which = 2)

autoplot(mod1)

getwd
#args(write_csv)
#
write_csv(x = mtcars,"./data/my_data.csv")




