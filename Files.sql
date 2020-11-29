create tablespace ts_Rattler
datafile 'Z:\Rattler\ts_Rattler.dbf'
size 10 m
autoextend on next 500k
maxsize 100m
extent management local;

create temporary tablespace ts_temp_Rattler
tempfile 'Z:\Rattler\ts_temp_Rattler.dbf'
size 10 m
autoextend on next 500k
maxsize 100m
extent management local;

