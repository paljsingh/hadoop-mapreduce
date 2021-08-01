# hadoop-mapreduce
> $ git clone https://github.com/big-data-europe/docker-hadoop.git
>
> $ docker-compose up -d
>
> $ docker cp mapper.py namenode:mapper.py
>
> $ docker cp reducer.py namenode:reducer.py
>
> $ docker exec -it namenode bash
>
> $ mkdir input
>
> $ docker cp ../hadoop-mapreduce/data/geosales.csv namenode:input/geosales.csv
>
> $ docker exec -it namenode bash -c "apt update && apt install python3 -y"
>
> $ docker exec -it datanode bash -c "apt update && apt install python3 -y"
> 
> $ docker exec -it resourcemanager bash -c "apt update && apt install python3 -y"
> 
> $ docker exec -it nodemanager bash -c "apt update && apt install python3 -y"
>
> $ `hdfs dfs -put ./input/* input/`







