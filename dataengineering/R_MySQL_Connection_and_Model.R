#Install package
install.packages("RMySQL")
library(RMySQL)

#Set up connection
mydb = dbConnect(MySQL(), user='root', password='rootroot', dbname='loan_data_model', host='localhost')

#Perform query for pca
myQuery <- "SELECT * FROM loan_details_model;"
accepted_loans_norm_pca <- dbGetQuery(mydb, myQuery)

#remove X and Loan_status columns
accepted_loans_norm_pca <- subset(accepted_loans_norm_pca, select = -c(loan_status))

#Perform PCA analysis
c_names_pca <- colnames(accepted_loans_norm_pca)
loan.pca <- princomp(accepted_loans_norm_pca[,c_names_pca])

#Plot and analyze the components
loan.pca$loadings
plot(loan.pca)

#import the data for modeling
myQuery <- "SELECT * FROM loan_details_model;"
accepted_loans_norm_model <- dbGetQuery(mydb, myQuery)

#Perform logistic regression
loan.model<-glm(loan_status ~., family=binomial(link=logit),data=accepted_loans_norm_model)

#Analyze the model
summary(loan.model)
