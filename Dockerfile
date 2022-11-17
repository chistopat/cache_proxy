FROM ghcr.io/userver-framework/docker-userver-build-base:v1a

ENV PROJECT_NAME="cache_proxy"

WORKDIR /$PROJECT_NAME
COPY . /$PROJECT_NAME
RUN cd /$PROJECT_NAME

RUN make dist-clean
RUN make install

EXPOSE 8080

CMD ["cache_proxy", "--config", "/usr/local/etc/cache_proxy/static_config.yaml"]
