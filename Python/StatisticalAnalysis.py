import matplotlib.pyplot as plt
import ast
import numpy as np
import matplotlib.mlab as mlab
import math
import csv

with open('C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/periods.csv', 'rb') as csvfile:
	periods = csv.reader(csvfile, delimiter=' ', quotechar='|')
	for row in periods:
		linea = row

a = linea[0].split(',')
a.remove(a[0])
dat = [int(item) for item in a]


fig2 = plt.figure(2)
fig2.canvas.set_window_title('Histogram of track')
mu = 0
SD2 = []
num_bins = 15

#standard deviation of distribution
SD = sum(dat)/len(dat)
for i in range(len(dat)):
    SD2.append((dat[i]-SD)*(dat[i]-SD))
SD3 = math.sqrt(sum(SD2)/len(dat))
sigma = SD3
mu = SD

ax2 = fig2.add_subplot(111)

ax2.set_title('$\mathrm{Histogram:}\ \mu=%.3f,\ \sigma=%.3f$\n' %(mu, sigma))  
ax2.set_xlabel('Smarts')
ax2.set_ylabel('Probability')

x = dat

n, bins, patches = plt.hist(x, num_bins, normed=1, facecolor='green', alpha=0.5, hatch='//')

y = mlab.normpdf(bins, mu, sigma)
ax2.plot(bins, y, 'r--', linewidth=2)

plt.show()
