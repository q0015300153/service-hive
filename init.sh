#!/usr/bin/env bash

# tw: 載入 dotenv
# en: Load dotenv
. $(dirname "$0")/dotenv

# tw: 下載 Hadoop 與 Hive 檔案
# en: Download Hadoop and Hive files
if ! [ -f "./hadoop/hadoop.tar.gz" ]; then
	version=3.2.0
	wget -O ./hadoop/hadoop.tar.gz \
		https://www.apache.org/dist/hadoop/common/hadoop-${version}/hadoop-${version}.tar.gz
fi

if ! [ -f "./hive/apache-hive-bin.tar.gz" ]; then
	version=3.1.1
	wget -O ./hive/apache-hive-bin.tar.gz \
		https://www.apache.org/dist/hive/hive-${version}/apache-hive-${version}-bin.tar.gz
fi

if ! [ -f "./hive/mariadb-java-client.jar" ]; then
	version=2.4.3
	wget -O ./hive/mariadb-java-client.jar \
		https://downloads.mariadb.com/Connectors/java/connector-java-${version}/mariadb-java-client-${version}.jar
fi

if ! [ -f "./hive/mysql-connector-java.jar" ]; then
	version=8.0.17
	wget -O ./hive/mysql-connector-java.tar.gz \
		https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-${version}.tar.gz
	tar zxvf ./hive/mysql-connector-java.tar.gz -C ./hive
	cp ./hive/mysql-connector-java-${version}/mysql-connector-java-${version}.jar \
		./hive/mysql-connector-java.jar
	rm -r  ./hive/mysql-connector-java.tar.gz
	rm -rf ./hive/mysql-connector-java-${version}
fi

# tw: 建立資料夾
# en: Create folder
.env -f ./.env parse NAME_NODE DATA_NODE HIVE_DATA
for path in "${REPLY[@]}"; do
	IFS='=' read -ra param <<< "$path"
	if ! [[ -n "${param[1]}" ]]; then
		continue
	fi

	if ! [ -d "$(dirname "$0")/${param[1]}" ]; then
		mkdir -p "$(dirname "$0")/${param[1]}"
	fi
done
