library(tidyverse)
library(fmsb)

# https://plot.ly/r/radar-chart/
# https://www.ggplot2-exts.org/ggradar.html
# https://github.com/mangothecat/radarchart
# https://www.rdocumentation.org/packages/fmsb/versions/0.6.3/topics/radarchart
# https://www.r-graph-gallery.com/143-spider-chart-with-saveral-individuals/


############


# https://www.r-graph-gallery.com/143-spider-chart-with-saveral-individuals/

# Create data: note in High school for several students
set.seed(99)
data=as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data)=c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data)=paste("mister" , letters[1:3] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,5) , rep(0,5) , data)
data %>% glimpse()

#==================
# Plot 1: Default radar chart proposed by the library:
radarchart(data)


#==================
# Plot 2: Same plot with custom features
colors_border=c( rgb(0.9,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_border <- c("#00ffff", "#ff9933", "#00ff00")

colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )

radarchart( data  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            #custom labels
            vlcex=0.8 
)
legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)




###################################################################


# create data from radarchart() docs

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
maxmin <- data.frame(
        total=c(5, 1),
        phys=c(15, 3),
        psycho=c(3, 0),
        social=c(5, 1),
        env=c(5, 1))

dat <- data.frame(
        total=runif(3, 1, 5),
        phys=rnorm(3, 10, 2),
        psycho=c(0.5, NA, 3),
        social=runif(3, 1, 5),
        env=c(5, 2.5, 4))

dat <- rbind(maxmin,dat)
dat %>% glimpse()


######################


radarchart(dat, axistype=1, seg=5, plty=1, vlabels=c("Total\nQOL", "Physical\naspects", 
                                                     "Phychological\naspects", "Social\naspects", "Environmental\naspects"), 
           title="(axis=1, 5 segments, with specified vlabels)", vlcex=0.5)


###############


radarchart(dat, axistype=2, pcol=topo.colors(3), plty=1, pdensity=c(5, 10, 30), 
           pangle=c(10, 45, 120), pfcol=topo.colors(3), 
           title="(topo.colors, fill, axis=2)")


##############


radarchart(dat, axistype=3, pty=32, plty=1, axislabcol="grey", na.itp=FALSE,
           title="(no points, axis=3, na.itp=FALSE)")


#################


radarchart(dat, axistype=1, plwd=1:5, pcol=1, centerzero=TRUE, 
           seg=4, 
           caxislabels=c("worst", "test", "", "", "best"),
           title="(use lty and lwd but b/w, axis=1,\n centerzero=TRUE, with centerlabels)")




