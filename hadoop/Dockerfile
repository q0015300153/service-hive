FROM debian:9

# 安裝元件
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openjdk-8-jdk \
        net-tools \
        curl \
        netcat \
        gnupg \
        procps \
    && rm -rf /var/lib/apt/lists/*

# 安裝 java open jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN curl -O   https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg  --import KEYS

# 複製 hadoop
WORKDIR /opt
ADD    ./hadoop.tar.gz /opt

RUN ln -s /opt/hadoop/etc/hadoop /etc/hadoop
RUN mkdir /opt/hadoop/logs
RUN mkdir /hadoop-data

# 環境變數
ENV HADOOP_HOME        /opt/hadoop
ENV HADOOP_CONF_DIR    /etc/hadoop
ENV MULTIHOMED_NETWORK 1
ENV USER               root
ENV PATH               $HADOOP_HOME/bin/:$PATH

# 複製 sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x     /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]