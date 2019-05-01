#http://www.programmingr.com/examples/neat-tricks/sample-r-function/rexp/
#Triangulate with agoda study-->https://www.prnewswire.com/news-releases/agoda-study-reveals-hong-kong-australian-russian-travelers-plan-farthest-in-advance-300282207.html
#Triangulate with Quora Ans or YJ study or booking in advance
#For this example, lets assume we have six computers, each of which is expected to last an average of seven years. 
#Can we simulate the expected failure dates for this set of machines?
#This can be similar to following question. On x day, we have 6 visitors, each of which is expected to book 7 days in advance
#Probably assume certain nationality with different mean  

set.seed(1)  
rexp(6, 1/7)
#Following output represents how many days visitors will book in advance
#10.1491772 2.9553524 24.1631472 0.5969158 1.7017422 2.7811142

# a = rexp(1000, 1/7)
# mean(a)  #close to 7

a = mapply(rexp, rep(6, 1000), rep(1/7, 1000))
hist(a[1, ])

library(dplyr)
mini_iris <-
  iris %>%
  group_by(Species) %>%
  slice(1)
mini_iris %>% gather(key = flower_att, value = measurement, -Species)
