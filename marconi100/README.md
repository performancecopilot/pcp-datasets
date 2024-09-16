See references in the accompanying notebook for details of these archives
(data originally collected from Ganglia on the Marconi100 supercomputer).

| System characteristic | Description                   |
| --------------------- | ----------------------------- |
| Nodes                 | 980                           |
| Processors per node   | 2x16 cores IBM Power9 3.1GHz  |
| Accelerators per node | 4 NVIDIA Volta V100 GPUs 16GB |
| CPU cores per node    | 32                            |
| Memory per node       | 256GB                         |
| Peak performance      | 32 PFlop/s                    |

The notebook creates individual PCP archives for each metric (convenient
due to layout of original dataset).  These need to be stitched together
using pmlogextras - use the marconi100-merge.sh script to achieve this.
Note you'll need a bit over 9GiB for this archive when uncompressed.

Finally, a parquet file can be created as follows:

```
> cd marconi100
> unxz *.xz
> time pcp2arrow -t 20 -a 20220901 -o 20220901.parquet
> mv 20220901.parquet 20220901.parquet.tmp
> mv 20220901.parquet.tmp/part-0.parquet 20220901.parquet
> rmdir 20220901.parquet.tmp
> xz -9 20220901.0
> ls -lh 20220901.*
```
