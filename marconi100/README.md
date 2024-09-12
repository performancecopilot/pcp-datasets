See references in the accompanying notebook for details of these archives
- data originally collected from Ganglia on the Marconi100 supercomputer.

Parquet files created subsequently as follows:

> unxz */*.xz
> for i in marconi100_node*; do
    echo $i
    pcp2arrow -t 10 -a $i/20220901 -o $i/20220901.parquet
    mv $i/20220901.parquet $i/20220901.parquet.tmp
    mv $i/20220901.parquet.tmp/part-0.parquet $i/20220901.parquet
    rmdir $i/20220901.parquet.tmp
    xz -9 $i/20220901.0
    ls -lh $i/20220901.*
  done
