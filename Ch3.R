library(gcookbook)
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity")

ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity")

ggplot(pg_mean, aes(x=group, y=weight)) +
geom_bar(stat="identity", fill="lightblue", colour="black")

ggplot(cabbage_exp, aes(x=Date, y=Weight,fill=Cultivar)) +
geom_bar(position="dodge",stat="identity")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(position="dodge", colour="black",stat="identity") +
scale_fill_brewer(palette="Pastel1")


ggplot(diamonds, aes(x=cut)) + geom_bar()

ggplot(diamonds,aes(x=carat))+geom_bar()

upc <- subset(uspopchange, rank(Change)> 40)
upc

ggplot(upc,aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat="identity")

ggplot(upc,aes(x=reorder(Abb,Change), y=Change, fill=Region)) + 
geom_bar(stat="identity", colour="black") +
scale_fill_manual(values=c("#669933","#FFCC66"))+
xlab("State")

#order by States
ggplot(upc,aes(x=reorder(Abb,Region), y=Change, fill=Region)) + 
geom_bar(stat="identity", colour="black") +
scale_fill_manual(values=c("#669933","#FFCC66"))+
xlab("State")

csub <- subset(climate, Source=="Berkeley" & Year >= 1900)

csub$pos <- csub$Anomaly10y >= 0

csub

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
geom_bar(stat="identity", position="identity")

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
geom_bar(stat="identity", position="identity", colour="black", size=0.25) +
scale_fill_manual(values=c("#CCEEFF","#FFDDDD"), guide=F)


ggplot(pg_mean, aes(x=group, y=weight)) +
geom_bar(stat="identity")


ggplot(pg_mean, aes(x=group, y=weight)) +
geom_bar(stat="identity", width=0.5)


ggplot(pg_mean, aes(x=group, y=weight)) +
geom_bar(stat="identity", width=1)



ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity", width=0.5, position="dodge")

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity", width=0.5, position=position_dodge(0.7))



ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity")


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity") + 
guides(fill=guide_legend(reverse=T))


library(plyr)
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar, order=desc(Cultivar))) +
geom_bar(stat="identity")


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity", colour="black") + 
guides(fill=guide_legend(reverse=T)) +
scale_fill_brewer(palette="Pastel1")

ce<-ddply(cabbage_exp, "Date", transform, percent_weight=Weight/sum(Weight)*100)

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) + 
geom_bar(stat="identity")

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
geom_bar(stat="identity", colour="black") + 
guides(fill=guide_legend(reverse=T)) +
scale_fill_brewer(palette="Pastel1")



ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
geom_bar(stat="identity")+
geom_text(aes(label=Weight), vjust=1.5, colour="white")


ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
geom_bar(stat="identity")+
geom_text(aes(label=Weight), vjust=-0.2)

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
geom_bar(stat="identity")+
geom_text(aes(label=Weight), vjust=-0.2) +
ylim(0, max(cabbage_exp$Weight)*1.05)


ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
geom_bar(stat="identity")+
geom_text(aes(y=Weight+0.1,label=Weight))


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity", position="dodge") + 
geom_text(aes(label=Weight), vjust=1.5, colour="white",
		position=position_dodge(.9), size=3)

ce <- arrange(cabbage_exp, Date, Cultivar)
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight))
ce


ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity")+
geom_text(aes(y=label_y,label=Weight), vjust=1.5, color="white")


ce <- arrange(cabbage_exp, Date, Cultivar)
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight)-0.5*Weight)

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) + 
geom_bar(stat="identity")+
geom_text(aes(y=label_y,label=Weight),color="white")



ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
geom_bar(stat="identity", colour="black") + 
geom_text(aes(y=label_y,label=paste(format(Weight, nsmall=2), "kg")),size=4)+
guides(fill=guide_legend(reverse=T)) +
scale_fill_brewer(palette="Pastel1")







