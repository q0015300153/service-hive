FROM hadoop3.2.0:1.0.0

# 環境變數
ENV HIVE_HOME          /opt/hive
ENV PATH               $HIVE_HOME/bin:$PATH
ENV HIVE_CONF_DIR      $HIVE_HOME/conf
ENV HIVE_AUX_JARS_PATH $HIVE_HOME/lib/*

# 複製 hive
WORKDIR /opt
ADD              ./apache-hive-bin.tar.gz /opt
RUN mv           ./apache-hive-bin        /opt/hive
RUN chmod -R 755  /opt/hive
RUN rm    -f      /opt/hive/lib/log4j-slf4j-impl-2.10.0.jar

# 複製 mariadb jar
ADD    ./mariadb-java-client.jar /opt
RUN mv ./mariadb-java-client.jar $HIVE_HOME/lib/
RUN chmod -777 $HIVE_HOME/lib/mariadb-java-client.jar

# 複製 mysql jar
ADD    ./mysql-connector-java.jar /opt
RUN mv ./mysql-connector-java.jar $HIVE_HOME/lib/
RUN chmod -777 $HIVE_HOME/lib/mysql-connector-java.jar

# 複製設定檔
ADD ./conf/hive-site.xml                 $HIVE_HOME/conf
ADD ./conf/beeline-log4j2.properties     $HIVE_HOME/conf
ADD ./conf/hive-env.sh                   $HIVE_HOME/conf
ADD ./conf/hive-exec-log4j2.properties   $HIVE_HOME/conf
ADD ./conf/hive-log4j2.properties        $HIVE_HOME/conf
ADD ./conf/ivysettings.xml               $HIVE_HOME/conf
ADD ./conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 10000
EXPOSE 10002

ENTRYPOINT ["entrypoint.sh"]
CMD startup.sh
