#/bin/sh

hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
  -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapreduce.partition.keypartitioner.options=-k1,1  \
  -D stream.num.map.output.key.fields=3  \
  -D mapreduce.partition.keycomparator.options="-k1,1n -k3,3nr" \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -file q4/mapper.py -mapper q4/mapper.py \
  -file q4/reducer.py  -reducer q4/reducer.py \
  -input input/ -output output-q4
