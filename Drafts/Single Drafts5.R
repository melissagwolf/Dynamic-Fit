library(psych)

test <- rep(c(.45,.55,.65,.75,.85),each=6)
test

nums <- seq(1:30)
nums

test1 <- paste(test,"*","Y",nums,"+",collapse="")
test1

model<- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30"

clean <- cleanmodel(model)

repid <- rep(1:500,500)

#######

model1 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6"

mdat1 <- sim_standardized(m=model1,n=500*500,latent=FALSE,errors=FALSE)

mdat1rep <- cbind(mdat1,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa1 <- lapply(mdat1rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit1 <- map_dfr(cfa1, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit1,quant = c(.05,.10,.90,.95))

#######

model2 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8"

mdat2 <- sim_standardized(m=model2,n=500*500,latent=FALSE,errors=FALSE)

mdat2rep <- cbind(mdat2,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa2 <- lapply(mdat2rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit2 <- map_dfr(cfa2, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit2,quant = c(.05,.10,.90,.95))

#######

model3 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10"

mdat3 <- sim_standardized(m=model3,n=500*500,latent=FALSE,errors=FALSE)

mdat3rep <- cbind(mdat3,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa3 <- lapply(mdat3rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit3 <- map_dfr(cfa3, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit3,quant = c(.05,.10,.90,.95))

######

model4 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12"

mdat4 <- sim_standardized(m=model4,n=500*500,latent=FALSE,errors=FALSE)

mdat4rep <- cbind(mdat4,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa4 <- lapply(mdat4rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit4 <- map_dfr(cfa4, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit4,quant = c(.05,.10,.90,.95))

#######

model5 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14"

mdat5 <- sim_standardized(m=model5,n=500*500,latent=FALSE,errors=FALSE)

mdat5rep <- cbind(mdat5,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa5 <- lapply(mdat5rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit5 <- map_dfr(cfa5, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit5,quant = c(.05,.10,.90,.95))

#######

model6 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16"

mdat6 <- sim_standardized(m=model6,n=500*500,latent=FALSE,errors=FALSE)

mdat6rep <- cbind(mdat6,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa6 <- lapply(mdat6rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit6 <- map_dfr(cfa6, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit6,quant = c(.05,.10,.90,.95))

#####

model7 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18"

mdat7 <- sim_standardized(m=model7,n=500*500,latent=FALSE,errors=FALSE)

mdat7rep <- cbind(mdat7,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa7 <- lapply(mdat7rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit7 <- map_dfr(cfa7, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit7,quant = c(.05,.10,.90,.95))

#######

model8 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20"

mdat8 <- sim_standardized(m=model8,n=500*500,latent=FALSE,errors=FALSE)

mdat8rep <- cbind(mdat8,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa8 <- lapply(mdat8rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit8 <- map_dfr(cfa8, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit8,quant = c(.05,.10,.90,.95))

#####

model9 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20
Y21 ~~ .56*Y22"

mdat9 <- sim_standardized(m=model9,n=500*500,latent=FALSE,errors=FALSE)

mdat9rep <- cbind(mdat9,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa9 <- lapply(mdat9rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit9 <- map_dfr(cfa9, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit9,quant = c(.05,.10,.90,.95))

####

model10 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20
Y21 ~~ .56*Y22
Y23 ~~ .56*Y24"

mdat10 <- sim_standardized(m=model10,n=500*500,latent=FALSE,errors=FALSE)

mdat10rep <- cbind(mdat10,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa10 <- lapply(mdat10rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit10 <- map_dfr(cfa10, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit10,quant = c(.05,.10,.90,.95))

####

model11 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20
Y21 ~~ .56*Y22
Y23 ~~ .56*Y24
Y25 ~~ .72*Y26"

mdat11 <- sim_standardized(m=model11,n=500*500,latent=FALSE,errors=FALSE)

mdat11rep <- cbind(mdat11,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa11 <- lapply(mdat11rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit11 <- map_dfr(cfa11, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit11,quant = c(.05,.10,.90,.95))

####

model12 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20
Y21 ~~ .56*Y22
Y23 ~~ .56*Y24
Y25 ~~ .72*Y26
Y27 ~~ .72*Y28"

mdat12 <- sim_standardized(m=model12,n=500*500,latent=FALSE,errors=FALSE)

mdat12rep <- cbind(mdat12,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa12 <- lapply(mdat12rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit12 <- map_dfr(cfa12, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit12,quant = c(.05,.10,.90,.95))

####

model13 <- "F1 =~ 0.45 * Y1 +0.45 * Y2 +0.45 * Y3 +0.45 * Y4 +0.45 * Y5 +0.45 * Y6 +
0.55 * Y7 +0.55 * Y8 +0.55 * Y9 +0.55 * Y10 +0.55 * Y11 +0.55 * Y12 +
0.65 * Y13 +0.65 * Y14 +0.65 * Y15 +0.65 * Y16 +0.65 * Y17 +0.65 * Y18 +
0.75 * Y19 +0.75 * Y20 +0.75 * Y21 +0.75 * Y22 +0.75 * Y23 +0.75 * Y24 +
0.85 * Y25 +0.85 * Y26 +0.85 * Y27 +0.85 * Y28 +0.85 * Y29 +0.85 * Y30
Y1 ~~ .2*Y2
Y3 ~~ .2*Y4
Y5 ~~ .2*Y6
Y7 ~~ .3*Y8
Y9 ~~ .3*Y10
Y11 ~~ .3*Y12
Y13 ~~ .42*Y14
Y15 ~~ .42*Y16
Y17 ~~ .42*Y18
Y19 ~~ .56*Y20
Y21 ~~ .56*Y22
Y23 ~~ .56*Y24
Y25 ~~ .72*Y26
Y27 ~~ .72*Y28
Y29 ~~ .72*Y30"

mdat13 <- sim_standardized(m=model13,n=500*500,latent=FALSE,errors=FALSE)

mdat13rep <- cbind(mdat13,repid) %>% 
  group_by(repid) %>% 
  nest() %>% 
  as.list()

cfa13 <- lapply(mdat13rep[[2]], function(x) cfa(model=clean,data=x,std.lv=TRUE))

fit13 <- map_dfr(cfa13, ~fitMeasures(.,c("srmr","rmsea","cfi","fmin","chisq","df","pvalue")))

describe(fit13,quant = c(.05,.10,.90,.95))

