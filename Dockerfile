FROM ghcr.io/userver-framework/docker-userver-build-base:v1a

RUN mkdir "/app"
RUN git -C /app clone https://github.com/chistopat/cache_proxy.git
RUN cd /app/cache_proxy

WORKDIR /app/cache_proxy

RUN make install-debug

EXPOSE 8080

CMD ["cache_proxy", "--config", "/usr/local/etc/cache_proxy/static_config.yaml"]
