# http://www.programmingr.com/examples/neat-tricks/sample-r-function/rexp/
#For this example, lets assume we have six computers, each of which is expected to last an average of seven years. 
#Can we simulate the expected failure dates for this set of machines?
#This can be similar to following question. On x day, we have 6 visitors, each of which is expected to book 7 days in advance

set.seed(1)  
rexp(6, 1/7)
#Following output represents how many days visitors will book in advance
#10.1491772 2.9553524 24.1631472 0.5969158 1.7017422 2.7811142

# a = rexp(1000, 1/7)
# mean(a)  #close to 7