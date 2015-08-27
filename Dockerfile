FROM alpine
RUN apk update && \
  apk add bash curl tar
ENV ETCD_VERSION v2.1.2
RUN curl -L https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz -s | tar -C /usr/local/bin --strip-components 1 -zxf - etcd-$ETCD_VERSION-linux-amd64/etcdctl && \
  mkdir /output
ENTRYPOINT ["/etcd-envs.sh"]
ADD etcd-envs.sh /
