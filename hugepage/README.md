Parquet format files
====================

Command used to generate 20120510.parquet

$ unxz *.xz
$ time pcp2arrow -a 20120510 -t 15s -o 20120510
$ mv 20120510/part-0.parquet 20120510.parquet
