

data = read.csv("Documents/2015_Fall/machine_learning/project1/data_str.csv",header=T)
attach(data)

summary(data)

# logistic model

attending_model = glm(attending ~ distance + visited + hs_gpa + act,family=binomial())
summary(attending_model)


library(ROCR)

pred1 <- prediction(attending_model$fitted.values, attending_model$y)
perf1 <- performance(pred1,"tpr","fpr")
auc1 <- performance(pred1,"auc")@y.values[[1]]
auc1
plot(perf1, lwd=2, col=2, main="ROC Curve of Logistic Model")
abline(0,1)
legend(0.5,0.2, c("AUC = 0.7625"),   lwd=2, col=2)



accepted_model = glm(accepted ~ visited + hs_gpa + act + class_percentile ,family=binomial())
summary(accepted_model)



library(ROCR)

pred1 <- prediction(accepted_model$fitted.values, accepted_model$y)
perf1 <- performance(pred1,"tpr","fpr")
auc1 <- performance(pred1,"auc")@y.values[[1]]
auc1
plot(perf1, lwd=2, col=2, main="ROC Curve of Logistic Model")
abline(0,1)
legend(0.5,0.2, c("AUC = 0.991"),   lwd=2, col=2)




################

#install.packages("party")
library("party")

tree <- ctree(attending ~ visited + act + hs_gpa, data=data)
print(tree)
plot(tree)


tree <- ctree(attending ~ distance, data=data)
print(tree)
plot(tree)




tree <- ctree(accepted ~ hs_gpa, data=data)
print(tree)
plot(tree)

tree <- ctree(accepted ~ hs_gpa + act , data=data)
print(tree)
plot(tree)


tree <- ctree(final ~ act , data=data)
print(tree)
plot(tree)




