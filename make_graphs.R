# Copyright: 2014 Dariusz Dwornikowski <dariusz.dwornikowski@cs.put.poznan.pl>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# change the file to read

file_to_read <- "alltime_nnn.csv"

d  <- read.csv(file_to_read)

png(filename="plot1.png", width=1300, height=1200, units="px", bg="white")
d$date <- as.Date(d$date)
d$num <- seq(from=1, to=length(d$date))
par(mfrow=c(2,1))
plot(d$date, d$open, type="l", ylab="number of bugs", xlab="Time", xaxt="n", main="RFS bugs with status open - daily")
axis(1, d$date, format(d$date, "%m-%y"), cex.axis=.8, at=d$date[seq(1, length(d$date), 10)], labels=d$date[seq(1, length(d$date), 10)])

plot(d$date, d$done, type="l", ylab="number of bugs", xlab="Time", xaxt="n", main="RFS bugs with status done - daily")
axis(1, d$date, format(d$date, "%m-%y"), cex.axis=.8, at=d$date[seq(1, length(d$date), 10)], labels=d$date[seq(1, length(d$date), 10)])
dev.off()

png(filename="plot2.png", width=1200, height=1200, units="px", bg="white")
par(mfrow=c(2,1))
par(mar=c(5,4,4,6) + 0.1) 
plot(d$date, d$opened, type="l", ylab="number of bugs", xlab="Time", xaxt="n", main="RFS bugs opened daily")
# max
date_max <- as.Date(d[d$opened == max(d$opened),]$date)
text(date_max,max(d$opened), labels=paste("max at", date_max, "=", max(d$opened)), col=4, pos=4)
# mean
mo <- round(mean(d$opened), digits=2)
abline(h=mo, col=2, lwd=2)
axis(4, at=mo, labels=paste("mean", mo), las=2)
axis(1, d$date, format(d$date, "%m-%y"), cex.axis=.8, at=d$date[seq(1, length(d$date), 10)], labels=d$date[seq(1, length(d$date), 10)])

plot(d$date, d$closed, type="l", ylab="number of bugs", xlab="Time", xaxt="n", main="RFS bugs closed daily")
# max
date_max <- as.Date(d[d$closed == max(d$closed),]$date)
text(date_max,max(d$closed), labels=paste("max at", date_max, "=", max(d$closed)), col=4, pos=4)
mc <- round(mean(d$closed), digits=2)
abline(h=mc, col=2, lwd=2)
axis(4, at=mc, labels=paste("mean", mc), las=2)
axis(1, d$date, format(d$date, "%m-%y"), cex.axis=.8, at=d$date[seq(1, length(d$date), 10)], labels=d$date[seq(1, length(d$date), 10)])
dev.off()

png(filename="plot3.png", width=1200, height=1200, units="px", bg="white")
par(mfrow=c(1,1))
plot(d$date, d$mttgs, type="l", ylab="MTTGS [days]", xlab="Time", xaxt="n", main="MTTGS daily")

axis(1, d$date, format(d$date, "%m-%y"), cex.axis=.8, at=d$date[seq(1, length(d$date), 10)], labels=d$date[seq(1, length(d$date), 10)])
dev.off()


