FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y libaio-dev mdadm curl build-essential nvme-cli ioping
RUN curl -L https://github.com/axboe/fio/archive/fio-3.17.tar.gz | tar xvz
RUN ./fio-fio-3.17/configure && make -C fio-fio-3.17 && make -C fio-fio-3.17 install
RUN mkdir /testfolder

COPY ./job.fio /
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
