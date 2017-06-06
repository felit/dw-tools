# -*- coding:utf8 -*-
"""
create table dim_date(
    date date,
    year int,
    semester string,
    quarter string,
    month int,
    ten_days_num int,
    week int,
    week_num int,
    is_weekend boolean,
    is_holiday boolean,
    holiday string,
    is_workday boolean,
    solar_terms string);
"""
import datetime

first = datetime.datetime.strptime('2017-01-01', '%Y-%m-%d')
print first.weekday()

for i in range(0, 365):
    d = first + datetime.timedelta(days=i)
    sql = """
        insert into dim_date(
                   date,year,semester,
                   quarter,month,ten_days_num,day_of_month,week,week_of_year,
                   is_weekend,is_holiday,holiday,special_day,is_workday,solar_terms)
        values('%s',%s,'%s','%s',%s,'%s',%s,%s,%s,%s,%s,%s,%s,%s,%s);
    """ % (d,
           d.year,
           ('上半年' if d.month > 6 else '下半年'),
           ("第%s季度" % (d.month / 4 + 1)),
           d.month,
           ('上旬' if d.day <= 10 else ('下旬' if d.day > 20 else '中旬')),
           d.day,
           d.weekday() + 1,
           d.isocalendar()[1],
           d.weekday() > 4,
           False,
           'Null',
           'Null',
           d.weekday() <= 4,
           'Null')
    print sql
