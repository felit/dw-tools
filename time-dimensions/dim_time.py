# -*- coding:utf8 -*-
import datetime

first = datetime.datetime.strptime('2017-01-01', '%Y-%m-%d')
print (first + datetime.timedelta(minutes=2)).time()
for i in range(0, 1440):
    t = first + datetime.timedelta(minutes=i)
    sql = """
        insert into dim_time(time,minute,minute_5,minute_10,minute_15,minute_30,hour) values ('%s','%s','%s','%s','%s','%s',%s);
    """ % (t.strftime('%H:%M'),
           '%02.0d:%02.0d' % (t.hour, t.minute),
           '%02.0d:%02.0d' % (t.hour, t.minute / 5 * 5),
           '%02.0d:%02.0d' % (t.hour, t.minute / 10 * 10),
           '%02.0d:%02.0d' % (t.hour, t.minute / 15 * 15),
           '%02.0d:%02.0d' % (t.hour, t.minute / 30 * 30),
           t.hour)
    print sql