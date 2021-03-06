FROM kiyoto/fluentd:0.10.56-2.1.1
MAINTAINER nathanpower78@gmail.com
RUN mkdir /etc/fluent
ADD fluent.conf /etc/fluent/
RUN ["/usr/local/bin/gem", "install", "fluent-plugin-record-reformer", "--no-rdoc", "--no-ri"]
RUN ["/usr/local/bin/gem", "install", "docker-api", "-v", "1.15"]
RUN ["/usr/local/bin/gem", "install", "fluent-plugin-docker-tag-resolver"]
RUN ["/usr/local/bin/gem", "install", "fluent-plugin-docker-metrics"]
RUN ["/usr/local/bin/gem", "install", "fluent-plugin-secure-forward"]
ENTRYPOINT ["/usr/local/bin/fluentd", "-c", "/etc/fluent/fluent.conf", "--use-v1-config"]
