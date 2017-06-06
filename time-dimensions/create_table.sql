DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date (
  date         DATE,
  year         INT,
  semester     VARCHAR(16),
  quarter      VARCHAR(16),
  month        INT,
  ten_days_num varchar(16),
  day_of_month INT,
  week         INT,
  week_of_year     INT,
  is_weekend   BOOLEAN,
  is_holiday   BOOLEAN,
  holiday      VARCHAR(16),
  special_day  VARCHAR(32),
  is_workday   BOOLEAN,
  solar_terms  VARCHAR(32));
COMMENT ON TABLE dim_date IS '日期维度表';
COMMENT ON COLUMN dim_date.date IS '日期';
COMMENT ON COLUMN dim_date.year IS '年份';
COMMENT ON COLUMN dim_date.semester IS '半年';
COMMENT ON COLUMN dim_date.quarter IS '季度';
COMMENT ON COLUMN dim_date.month IS '月份';
COMMENT ON COLUMN dim_date.ten_days_num IS '上中下旬';
COMMENT ON COLUMN dim_date.day_of_month IS '每个月中的第n天';
COMMENT ON COLUMN dim_date.week IS '星期几';
COMMENT ON COLUMN dim_date.week_of_year IS '一年内第几周';
COMMENT ON COLUMN dim_date.is_weekend IS '是否是周日';
COMMENT ON COLUMN dim_date.is_holiday IS '是否为节假日';
COMMENT ON COLUMN dim_date.holiday IS '节假日名称';
COMMENT ON COLUMN dim_date.special_day IS '特殊日子，如儿童节、情人节等';
COMMENT ON COLUMN dim_date.is_workday IS '是否为工作日';
COMMENT ON COLUMN dim_date.solar_terms IS '24节气';

update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='元旦' where date='2016-12-31';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='元旦' where date='2017-1-1';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='元旦' where date='2017-1-2';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='除夕' where date='2017-1-27';
update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='2017-1-22';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-1-27';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-1-28';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-1-29';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-1-30';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-1-31';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-2-1';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='春节' where date='2017-2-2';
update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='2017-2-4';
update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='2017-4-1';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='清明节' where date='2017-4-2';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='清明节' where date='2017-4-3';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='清明节' where date='2017-4-4';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='劳动节' where date='2017-4-29';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='劳动节' where date='2017-4-30';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='劳动节' where date='2017-5-1';
update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='2017-5-27';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='端午节' where date='2017-5-28';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='端午节' where date='2017-5-29';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='端午节' where date='2017-5-30';
update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='2017-9-30';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-1';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-2';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-3';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-4';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-5';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-6';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-7';
update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='国庆节' where date='2017-10-8';
-- 特殊节日
update dim_date set special_day='腊八节' where date='2017-01-05';
update dim_date set special_day='小年' where date='2017-01-20';
update dim_date set special_day='小年' where date='2017-01-20';

DROP TABLE IF EXISTS dim_time;
CREATE TABLE dim_time (
  time      VARCHAR(16),
  minute    VARCHAR(16),
  minute_5  VARCHAR(16),
  minute_10 VARCHAR(16),
  minute_15 VARCHAR(16),
  minute_30 VARCHAR(16),
  hour      int
);

COMMENT ON TABLE dim_time IS '时间维度表';
COMMENT ON COLUMN dim_time.minute IS '分钟,向下取整';
COMMENT ON COLUMN dim_time.minute_5 IS '每5分钟,向下取整';
COMMENT ON COLUMN dim_time.minute_10 IS '每10分钟,向下取整';
COMMENT ON COLUMN dim_time.minute_15 IS '每15分钟,向下取整';
COMMENT ON COLUMN dim_time.minute_30 IS '每30分钟,向下取整';
COMMENT ON COLUMN dim_time.hour IS '小时,向下取整';


