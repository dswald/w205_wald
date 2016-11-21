from __future__ import absolute_import, print_function, unicode_literals

import numpy as np
import matplotlib.pyplot as plt
import sys
import psycopg2

num_args = len(sys.argv)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("SELECT word, count from Tweetwordcount")
records = cur.fetchall()

records = sorted(records, key=lambda word: int(word[1]))  # sort by count

N = 20
most_used = records[-1:-21:-1][1]
# menStd = (2, 3, 4, 1, 2)

ind = np.arange(N)  # the x locations for the groups
width = 0.1       # the width of the bars

fig, ax = plt.subplots()
rects1 = ax.bar(ind, most_used, width, color='r')

# womenMeans = (25, 32, 34, 20, 25)
# womenStd = (3, 5, 2, 3, 3)
# rects2 = ax.bar(ind + width, womenMeans, width, color='y', yerr=womenStd)

# add some text for labels, title and axes ticks
ax.set_ylabel('count')
ax.set_title('Most used words in twitter')
ax.set_xticks(ind + width)
ax.set_xticklabels(records[-1:-21:-1][0])

# ax.legend((rects1[0], rects2[0]), ('Men', 'Women'))


def autolabel(rects):
    # attach some text labels
    for rect in rects:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/2., 1.05*height,
                '%d' % int(height),
                ha='center', va='bottom')

autolabel(rects1)
# autolabel(rects2)

plt.show()
