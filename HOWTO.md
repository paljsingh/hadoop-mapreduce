# hadoop-mapreduce
---

### Installing / run hadoop on docker desktop.

Clone docker-hadoop repo
> $ git clone https://github.com/big-data-europe/docker-hadoop.git  
> $ cd docker-hadoop   
> $ docker-compose up -d  

---

### Set up map-reduce jobs.

In another terminal window, run the following steps - 

> $ cd /path/to/assignment-2-group-193

Copy files.
> $ for i in input q* ; do docker cp $i namenode:$i ; done  

Install python3 on namenode, datanode, resourcemanager, nodemanager.  
> $ for i in namenode datanode resourcemanager nodemanager; do docker exec -it $i bash -c "apt update && apt install python3 -y" ; done
>  

Connect to hadoop namenode.  
> $ docker exec -it namenode bash  

Copy csv to hdfs filesystem.  
> $ hdfs dfs -put ./input/* input/

### Run jobs

> $ ./q1-run.sh  
> (also ./q2-run.sh, q3-run.sh, q4-run.sh)   
> Q4 problem statement mentions top 10 order_ids for a year, however, as the order_ids are unique, the reducer job doesn't have much to do except to print first 10 items.  
> ^ This is implemented in q4-run.sh (and q4/{mapper.py,reducer.py}
> 
> Another variant of problem statement is implemented in q4-b, where instead of order_id, the output is printed as top 10 item types per year.  
> ^ This makes use of two mapreduce jobs chained together, the first one  maps and aggregates the item_type total profits by year, the second job works on the previous job's output and limits it to 10 items.

### View output
> $ hdfs dfs -cat output-q1/part-00000








