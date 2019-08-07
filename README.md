service-hive
==========

###### tags: `hive` `hadoop` `docker-compose` `docker` `mariadb`

上方為中文說明  
Chinese description above  

下方英文說明為 Google 翻譯  
The English description below is Google Translate  

專案說明
---
此專案修改自[big-data-europe/docker-hive](https://github.com/big-data-europe/docker-hive)  
將原本的 Postgresql 改為 MariaDB  
並且升級  
　　Hadoop 2 至 Hadoop 3  
　　Hive 2 至 Hive 3  

使用教學
---
將檔案複製到本地
```bash
git clone https://github.com/q0015300153/service-hive.git
```

執行初始化
```bash
sh init.sh
```

然後執行 docker-compose
```bash
docker-compose up
```

>預設會在上一層資料夾建立以下資料夾  
>>`../database/data-node`  
>>`../database/name-node`  
>>`../database/hive-data`  

可以開啟 http://localhost:9870  
開啟 Hadoop 網頁介面  

可以開啟 http://localhost:10002  
開啟 Hive 網頁介面  

- - -

Project description
---
This project was modified from[big-data-europe/docker-hive](https://github.com/big-data-europe/docker-hive)  
Change the original Postgresql to MariaDB  
And upgrade  
　　Hadoop 2 to Hadoop 3  
　　Hive 2 to Hive 3  

Use teaching
---
Copy the file to your local
```bash
git clone https://github.com/q0015300153/service-hive.git
```

Perform initialization
```bash
sh init.sh
```

Then execute docker-compose
```bash
docker-compose up
```

>The preset will create the following folders in the previous folder.  
>>`../database/data-node`  
>>`../database/name-node`  
>>`../database/hive-data`  

Can open http://localhost:9870  
Open the Hadoop web interface

Can open http://localhost:10002  
Open Hive web interface
