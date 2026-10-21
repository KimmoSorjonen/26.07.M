
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 712 ## sample size

rm <- matrix(c( ## correlations reported by Fu and Wang (2026)
  
   1.000, -0.469,  0.550,  0.469,
  -0.469,  1.000, -0.540, -0.468,
   0.550, -0.540,  1.000,  0.577,
   0.469, -0.468,  0.577,  1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("PA","SA","SC","HPL") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ PA+1*SC+HPL+SA

## (Error) variances

PA ~~ PA
SC ~~ SC
HPL ~~ HPL
SA ~~ SA

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, meanstructure=F)

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################

