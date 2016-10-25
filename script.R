
# Chapter 1 ---------------------------------------------------------------

# CrossTable() for categorical variables
CrossTable(loan_data$loan_status)
CrossTable(loan_data$home_ownership)
CrossTable(loan_data$home_ownership,
           loan_data$loan_status, 
           prop.r = T,
           prop.c = F,
           prop.t = F,
           prop.chisq = F)

CrossTable(loan_data$grade,
           loan_data$loan_status, 
           prop.r = T,
           prop.c = F,
           prop.t = F,
           prop.chisq = F)


# bivariate plot
plot(loan_data$emp_length, loan_data$annual_inc)
plot(loan_data_RemovedOL$emp_length, loan_data_RemovedOL$annual_inc)

hist(loan_data$loan_amnt, breaks = 200)

plot(loan_data$age, ylab="Age")
index_highage <- which(loan_data$age>100)
plot(loan_data[-index_highage, ]$age)
plot(loan_data$age, loan_data$annual_inc)

# Look at summary of loan_data
summary(loan_data$int_rate)

# Get indices of missing interest rates: na_index
na_index <- which(is.na(loan_data$int_rate))

# Remove observations with missing interest rates: loan_data_delrow_na
loan_data_delrow_na <- loan_data[-na_index, ]

# Make copy of loan_data
loan_data_delcol_na <- loan_data

# Delete interest rate column from loan_data_delcol_na
loan_data_delcol_na$int_rate <- NULL

# Compute the median of int_rate
median_ir <- median(loan_data$int_rate, na.rm = T)

# Make copy of loan_data
loan_data_replace <- loan_data

# Replace missing interest rates with median
loan_data_replace$int_rate[is.na(loan_data_replace$int_rate)] <- median_ir

# Check if the NAs are gone
summary(loan_data_replace$int_rate)


loan_data$emp_cat <- rep(NA, length(loan_data$emp_length))

loan_data$emp_cat[which(loan_data$emp_length <= 15)] <- "0-15"
loan_data$emp_cat[which(loan_data$emp_length > 15 & loan_data$emp_length <= 30)] <- "15-30"
loan_data$emp_cat[which(loan_data$emp_length > 30 & loan_data$emp_length <= 45)] <- "30-45"
loan_data$emp_cat[which(loan_data$emp_length > 45)] <- "45+"
loan_data$emp_cat[which(is.na(loan_data$emp_length))] <- "Missing"

loan_data$emp_cat <- as.factor(loan_data$emp_cat)


loan_data$ir_cat <- rep(NA, length(loan_data$int_rate))

loan_data$ir_cat[which(loan_data$int_rate <= 8)] <- "0-8"
loan_data$ir_cat[which(loan_data$int_rate > 8 & loan_data$int_rate <= 11)] <- "8-11"
loan_data$ir_cat[which(loan_data$int_rate > 11 & loan_data$int_rate <= 13.5)] <- "11-13.5"
loan_data$ir_cat[which(loan_data$int_rate > 13.5)] <- "13.5+"
loan_data$ir_cat[which(is.na(loan_data$int_rate))] <- "Missing"

loan_data$ir_cat <- as.factor(loan_data$ir_cat)

plot(loan_data$ir_cat)

# Create confusion matrix
conf_matrix <- table(test_set$loan_status, model_pred)

# Compute classification accuracy
(conf_matrix[1,1]+conf_matrix[2,2])/sum(conf_matrix)

# Compute sensitivity
conf_matrix[2,2]/(conf_matrix[2,1]+conf_matrix[2,2])


# Chapter 2 ---------------------------------------------------------------



