# Fundementals of R


# 2.1 Introduction and Installation

a <- c(1, 2, 4)

mean(a)

# 2.2 Functons and arguments

args(log)

# compute the log of 5 to the base of e
log(x = 5, base = exp(1))

# same
log(5)

# compute the log of 5 to the base of 2

log(5, 2)
log(5, base = 2)
log(x = 5, base = 2)
log(base = 2, x = 5)

# 2.3 Vectors

# 2.3.1 Generating vetors
# remove all ls finds in your workspace
rm(list = ls(all.names = TRUE))

aa <- 5

is.vector(aa)

class(aa)

length(aa)

bb <- TRUE

class(bb)

cc <- "forklift"
is.vector(cc)

class(cc)

length(cc)

cc <- c("impetus", "klumpatsch", "facetiously")

is.vector(cc)

length(cc)

numbers1 <- c(1,2,3)

numbers2 <- c(4,5,6)
numbers1.and.numbers2 <- c(numbers1 ,numbers2)
numbers1.and.numbers2

numbers.num <- c(1,2,3)
numbers.char <- c("four","five","six")
nums.and.chars.become.chars <- c(numbers.char,numbers.num)
nums.and.chars.become.chars

rep(x = "something", times=3)
rep(x=c("anim","inanim"),times=3)
rep(x=c("anim","inanim"),each=3)
rep(x=c(1,2,3), length.out=10)
rep(x=c(4,5,6),times=c(3,2,1))

seq(2, 6, 0.4)
seq(from=6,to=2,by=-0.4)
seq(from=2, to=6, length.out=4)
seq(from=6, to=2, length.out=4)
seq(3)

1:4
6:4

numbers <- c(1,2,3); names(numbers) <- c("one","two","three")

numbers


# 2.3.2 Loading and saving vectors
setwd("/home/jackwill/personal/learn-R/Statistics_for_Linguistics_with_R")
x <- scan(file="_inputfiles/02_vector1.txt",sep="\n")
x

x <- scan(file="_inputfiles/02_vector2.txt", what=character(),sep="\n")
x

# 2.3.3 Working with vectors
rm(list=ls(all.names=TRUE))
aa <- seq(from=3.4,to=3.6,by=0.05)
round(x=aa,digits=1)

floor(x=c(-1.8,1.8))
ceiling(x=c(-1.8,1.8))
trunc(x=c(-1.8,1.8))

cc <- c("a", "b","c","d","e")
cc[c(FALSE,FALSE,TRUE,FALSE,FALSE)]
cc[3]

y <- 3; cc[y]

cc[c(TRUE,FALSE,TRUE,FALSE,FALSE)]
cc[c(3,1)]
cc[c(1:3)]
cc[-2]
cc=="d"

bb <- 10:1
bb==4
bb < 4
bb < 7
bb != 8
bb > 8 | bb < 3
any(bb>4) # is there any 4 in bb at all?
any(bb==0)

bb
which(bb == 4)
which(bb!= 8)
which(bb > 3| bb < 5)
bb[which(bb > 3 & bb < 5)]
bb[which(bb > 3 | bb < 5)]

bb<=7
bb[bb<=7]
sum(bb==4)
sum(bb>8 | bb < 3)
c(1,6,11) %in% bb

match(x=c(1,6,11), table=bb)

aa <- c(1,seq(from=30,to=70,by=4))
aa
aa.winsd <- aa
aa.winsd[aa.winsd < 30] <- 30
aa.winsd

aa <- c(10:1); bb <- c(2,5,9,12)
aa

setdiff(x=aa,y=bb)
setdiff(x=bb,y=aa)

intersect(x=aa,y=bb)
intersect(x=bb,y=aa)

union(x=aa,y=bb)
union(x=bb,y=aa)

qwe <- letters[c(1,3,2,2,3,4,3,4,5)]
qwe

unique(x=qwe)
table(qwe)
qwe.t <- table(qwe)
qwe.t["b"]
numbers["two"]

aa <- 1:5
bb <- 5:9
aa*bb

b <- 5
aa * b

b <- c(5,6)
aa * b

qwe <- c(1,3,5,7,9,2,4,6,8,10)
y <- sort(qwe)

z <- sort(x=qwe,decreasing = TRUE)
z

z <- c("b","c","e","d","a")
order(z)
z[order(z)]

# 2.4 Factors

rm(list = ls(all.names=TRUE))
f.vec <- c("open","open","open","closed","closed")
f.vec
f.fac <- factor(f.vec)
f.fac

f.fac1 <- factor(x=f.vec,levels=c("closed","open"))
f.fac1

f.fac2 <- factor(x=f.vec,levels=c("open","closed"))
f.fac2

num.vector <- 1:9
cut.factor <- cut(x=num.vector, breaks = 3)
cut.factor

table(num.vector,cut.factor)

a <- factor(c("alpha","charly","bravo"))
a
cat(a,sep="\n",file="_outputfiles/02_somefactor01_txt")


cat(as.character(a),sep="\n",file="_outputfiles/02_somefactor01_txt")

# 2.4.3 Working with factors
f.fac.l1 <- factor(x=f.vec,levels=c("closed","open"))
f.fac.l1
f.fac.l1[2] <- "closed";f.facl1

f.facl1 <- factor(f.fac.l1,levels = c(levels=c(levels(f.facl1),"half-open")))
f.facl1[3] <- "open"; f.fac.l1

f.fac.l <- droplevels(f.fac.l1)
f.fac.l

# 2.5 Data frames
# 2.5.1 Generating data frames

rm(list = ls(all.names = TRUE))

TOKENFREQ <- c(421,337,1411,458,455)
TYPEFREQ <- c(271,103,735,18,37)
POS <- c("adj","adv","n","conj","prep")
CLASS <- rep(c("open","closed"),c(3,2))

x <- data.frame(TOKENFREQ,TYPEFREQ,POS,CLASS,stringsAsFactors = TRUE)
x
str(x)

summary(x)

# 2.5.2 Loading and saving data frames
rm(list = ls(all.names = TRUE))
summary(x <- read.table(file="_inputfiles/02_dataframe1.csv",header=TRUE,sep="\t",quote="",comment.char = "",stringsAsFactors = TRUE))
write.table(x=x, file="_outputfiles/02_dataframe1.csv",sep="\t",quote = FALSE,row.names=FALSE,col.names=TRUE)

with(x, TOKENFREQ)
x$TOKENFREQ
attach(x)
TOKENFREQ
detach(x)


x[2,]
x[2:3,]
x[c(4,2),]
x[,2]
x[,c(2,3)]
x[2,3:4]
x$TOKENFREQ
which(x$TOKENFREQ > 450)
x[x$TOKENFREQ > 450,]
x$CLASS
which(x$CLASS=="open")
x[x$CLASS == "open",]
qwe <- subset(x, subset=TOKENFREQ>450)
qwe
qwe <- subset(x, subset=CLASS=="open")
qwe
summary(qwe)

summary(qwe <- droplevels(subset(x, subset=CLASS=="open")))

x.split.1 <- split(x=x,f=x$CLASS)
x.split.1
x.split.2 <- split(x=x,f=x$TOKENFREQ>450)
x.split.2
x.split.3 <- split(x=x,f=list(x$CLASS,x$TOKENFREQ>450))
x.split.3

ordering.index <- order(x$TOKENFREQ)
ordering.index

x[ordering.index,]

ordering.index <- order(x$TOKENFREQ,decreasing=TRUE)
ordering.index <- order(-x$TOKENFREQ)
ordering.index <- order(x$POS)
ordering.index <- order(x$POS, deceasing=TRUE)
x$POS
rank(x$POS)
ordering.index <- order(x$CLASS,-rank(x$POS))
x[ordering.index,]

# 2.6 Lists

some.vect <- c(1:10)
some.dafr <- x
some.dafr
some.fact <- factor(letters[1:10])
a.list <- list(some.vect,some.dafr,some.fact)
str(a.list)

a.list[[1]]
a.list[[2]]
a.list[[3]]
a.list[1]
names(a.list)
a.list <- list("Part1"=some.vect, "Part2=some.dafr","Part3=some.fact")
a.list
a.list[[1]]
a.list[["Part1"]]
a.list$Part1
a.list[[2]][2:3,3:4]
a.list[["Part2"]][2:3,3:4]
a.list$Part2[2:3,3:4]
a.list[[2]]
x.split.1 <- split(x=x,f=x$CLASS)
x.split.1$closed
x.split.1$open
