#Import data for PCA analysis
accepted_loans_norm_pca<- read.table('C:/Users/drobey/Documents/Coding/Grad School/Data Platforms/Project/accepted_loans_test_norm.csv',sep =",",header = TRUE)

#remove X and Loan_status columns
accepted_loans_norm_pca <- subset(accepted_loans_norm_pca, select = -c(X,loan_status))

#Perform PCA analysis
c_names_pca <- colnames(accepted_loans_norm_pca)
loan.pca <- princomp(accepted_loans_norm[,c_names])

#Plot and analyze the components
loan.pca$loadings
plot(loan.pca)



#import the data for modeling
accepted_loans_norm_model<- read.table('C:/Users/drobey/Documents/Coding/Grad School/Data Platforms/Project/accepted_loans_test_norm.csv',sep =",",header = TRUE)

#Perform logistic regression
loan.model<-glm(loan_status ~., family=binomial(link=logit),data=accepted_loans_norm)

#Analyze the model
summary(loan.model)
