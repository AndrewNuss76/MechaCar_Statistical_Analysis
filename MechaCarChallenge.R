library(tidyverse)
library(dplyr)

#Module 15 Challenge

##############Deliverable 1
#Read in MechaCar CSV
MechaCar = read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar)

#Perform Linear Regression passing in all 6 variables
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar)) #generate multiple linear regression model

##############Deliverable 2
#Read in Suspension Coil CSV
Suspension_Coil = read.csv(file = 'Suspension_Coil.csv', check.names = F,stringsAsFactors = F)
head(Suspension_Coil)

#Create summary table
total_Summary = Suspension_Coil %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep')
view(total_summary)

#Create Lot Summary Table
lot_summary = Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep')
view(lot_summary)

############## Deliverable 3
# t-test of PSI from against mean of 1500
t.test(x=Suspension_Coil$PSI, mu=1500)

# t-test of PSI from against mean of 1500 == Lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot == 'Lot1')[['PSI']], mu=1500)
# t-test of PSI from against mean of 1500 == Lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot == 'Lot2')[['PSI']], mu=1500)
# t-test of PSI from against mean of 1500 == Lot 3
t.test(subset(Suspension_Coil, Manufacturing_Lot == 'Lot3')[['PSI']], mu=1500)