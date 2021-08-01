docker run -it --rm \
  --name hadoop \
  -p 50070:50070 \
  -p 50030:50030 \
  -v $PWD:/app \
  -v $PWD/data:/data \
  sequenceiq/hadoop-docker:2.7.1 \
  /etc/bootstrap.sh \
  -bash

