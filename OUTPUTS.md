hdfs dfs -cat output-q1/part-00000 | grep -i Belarus | grep 2021
2021	Baby Food	Belarus	255.28
2021	Beverages	Belarus	47.45
2021	Cereal	Belarus	205.69999999999996
2021	Cosmetics	Belarus	437.2
2021	Fruits	Belarus	9.33
2021	Household	Belarus	668.27
2021	Meat	Belarus	421.89
2021	Office Supplies	Belarus	651.21
2021	Personal Care	Belarus	81.73
2021	Snacks	Belarus	152.58
2021	Vegetables	Belarus	154.06

is the same as:
cat data/geosales.csv| ./q1/mapper.py | sort -n -k1 -k2 -k3 | ./q1/reducer.py | grep Belarus | grep 2021
2021	Baby Food	Belarus	255.28
2021	Beverages	Belarus	47.45
2021	Cereal	Belarus	205.69999999999996
2021	Cosmetics	Belarus	437.2
2021	Fruits	Belarus	9.33
2021	Household	Belarus	668.27
2021	Meat	Belarus	421.89
2021	Office Supplies	Belarus	651.21
2021	Personal Care	Belarus	81.73
2021	Snacks	Belarus	152.58
2021	Vegetables	Belarus	154.06

------
hdfs dfs -cat output-q2/part-00000 | grep -i China | grep 2020
2020	Baby Food	China	41432
2020	Beverages	China	30895
2020	Cereal	China	35020
2020	Clothes	China	49739
2020	Cosmetics	China	11377
2020	Fruits	China	29640
2020	Household	China	40984
2020	Meat	China	42703
2020	Office Supplies	China	32745
2020	Personal Care	China	33878
2020	Snacks	China	14972
2020	Vegetables	China	65663

is the same as the output of:
cat data/geosales.csv| ./q2/mapper.py | sort -k1n -k2 -k3 | ./q2/reducer.py | grep China | grep 2020


---
hdfs dfs -cat output-q3/part-00000 | grep -i India | grep 2019
2019	Baby Food	India	9358	3371
2019	Beverages	India	8974	345
2019	Cereal	India	8898	2238
2019	Clothes	India	9841	1359
2019	Cosmetics	India	9293	1690
2019	Fruits	India	7782	816
2019	Household	India	9560	5107
2019	Meat	India	8686	4193
2019	Office Supplies	India	9618	84
2019	Personal Care	India	5846	693
2019	Snacks	India	9552	4151
2019	Vegetables	India	6194	1377

is the same as:
cat data/geosales.csv| ./q3/mapper.py | sort -k1n -k2 -k3 | ./q3/reducer.py | grep India | grep 2019
