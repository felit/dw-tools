
-- hive
CREATE TABLE IF NOT EXISTS dim_time (
  time      string,
  minute    string,
  minute_5  string,
  minute_10 string,
  minute_15 string,
  minute_30 string,
  hour      int
)ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
copy (select * from trade.dim_time) to  'dim_time.csv' with csv;
load data local inpath "/home/hadoop/dim_time.csv" into table dim_time;