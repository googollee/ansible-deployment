FROM my/service1:new

ARG stage=test
RUN echo stage is ${stage} && mkdir -p /etc/service
COPY ./generated/${stage}/config.toml /etc/service1/
COPY ./run.sh /run.sh
ENTRYPOINT ["/run.sh"]
