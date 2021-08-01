#!/bin/sh

# options explained -
# mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator
#   use a KeyField based comparator
# mapreduce.partition.keypartitioner.options=-k1,2
#   parittion with first 2 fields of the key
# stream.num.map.output.key.fields=2
#   use 2 fields for the key.
# mapreduce.partition.keycomparator.options="-k1n,1 -k2,2"
#   Sort first by field1, then by field 2, (similar to unix's sort -k1,1 -k2,2)
#   sort first field numerically
# partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner
#   keyfield based paritioner.

hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
  -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapreduce.partition.keypartitioner.options=-k1,2 \
  -D mapreduce.partition.keycomparator.options="-k1n,1 -k2,2" \
  -D stream.num.map.output.key.fields=2 \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -file q4/mapper.py -mapper q4/mapper.py \
  -file q4/reducer.py -reducer q4/reducer.py \
  -input input -output output-q4 

# Take the above output and sort it by value and print top N(10) values.
hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
  -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapreduce.partition.keypartitioner.options=-k1,1  \
  -D stream.num.map.output.key.fields=3  \
  -D mapreduce.partition.keycomparator.options="-k1,1n -k3,3nr" \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -mapper cat \
  -file q4/reducer2.py  -reducer q4/reducer2.py \
  -input output-q4/part-00000 -output output-q4-final

# alternatively, specify number of top N items
hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
  -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapreduce.partition.keypartitioner.options=-k1,1  \
  -D stream.num.map.output.key.fields=3  \
  -D mapreduce.partition.keycomparator.options="-k1,1n -k3,3nr" \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -mapper cat \
  -file q4/reducer2.py  -reducer "q4/reducer2.py 2" \
  -input output-q4/part-00000 -output output-q4-final
