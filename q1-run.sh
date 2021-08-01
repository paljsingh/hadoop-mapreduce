#!/bin/sh

# options explained -
# mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator
#   use a KeyField based comparator
# mapreduce.partition.keypartitioner.options=-k1,3
#   parittion with first 3 fields of the key
# stream.num.map.output.key.fields=3
#   use 3 fields for the key.
# mapreduce.partition.keycomparator.options="-k1n,1 -k2,2 -k3,3"
#   Sort first by field1, then by field 2, then by field3 (similar to unix's sort -k1,1 -k2,2, -k3,3)
#   sort first field numerically
# partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner
#   keyfield based paritioner.

hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
  -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapreduce.partition.keypartitioner.options=-k1,3 \
  -D mapreduce.partition.keycomparator.options="-k1n,1 -k2,2 -k3,3" \
  -D stream.num.map.output.key.fields=3 \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -file mapper.py -mapper mapper.py \
  -file reducer.py -reducer reducer.py \
  -input input -output output-q1 
