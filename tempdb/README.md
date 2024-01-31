Parquet format files
====================

Command used to generate {20090106,20090113}.parquet

$ unxz *.xz
$ time pcp2arrow -a 20090106 -t 15s -o 20090106
$ mv 20090106/part-0.parquet 20090106.parquet
$ time pcp2arrow -a 20090113 -t 15s -o 20090113
$ mv 20090113/part-0.parquet 20090113.parquet
