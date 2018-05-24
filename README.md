## Assignment - 1

### Installation Notes
---
#### MySQL installation on Ubuntu
It is mandatory to update package information from the MySQL APT repository:

    sudo apt-get update

Install MySQL by the following command:

    sudo apt-get install mysql-server

    systemctl status mysql.service

    mysql_secure_installation

Using nano, vim or other available editor open mtsqld.cnf file:

    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

Locate the bind-address = 127.0.0.1 line and change 127.0.0.1 to 0.0.0.0 :



In nano, to save the file, type in (Ctrl + x) and confirm with the key y to save.

Now, restart the service so the previous setup takes effect:

    sudo systemctl restart mysql.service


    mysql -h localhost -u myname -p password mydb


    mysql -u root -p yourpassword

After successful login, create new user (instead of myuser and mypass choose your own combo):

    CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';

    CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass';

Create an empty database, which you will use for your data import:

    CREATE DATABASE busDB;


#### MySQL Queries

**Create table stops**

    CREATE TABLE `stops` (
      `Stop_id` int(11),
      `Name_stop` varchar(68),
      `Lat` decimal(7,4),
      `Log` decimal(8,4),
      PRIMARY KEY (`Stop_id`)
    );
    
**Create table trips**

    CREATE TABLE `trips` (
      `Block_id` varchar(9),
      `Route_id` varchar(8),
      `Trip_headsign` varchar(40),
      `Service_id` varchar(29),
      `Shape_id` varchar(8),
      `Trip_id` varchar(37),
      PRIMARY KEY (`Trip_id`)
    );
    
**Create table stoptimes**

    CREATE TABLE `stoptimes` (
      `Trip_id` varchar(37),
      `Arrival_time` varchar(8),
      `Departure_time` varchar(8),
      `Stop_id` int(11),
      `Stop_sequence` int(11),
      KEY `FK` (`Trip_id`, `Stop_id`)
    );


#### ElasticSearch installation

ElasticSearch requires Java. Let's install that first:

    sudo add-apt-repository -y ppa:webupd8team/java

    sudo apt-get update

    sudo apt-get -y install oracle-java8-installer

Download and install the Public Signing Key:

    wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

Save the repository definition to /etc/apt/sources.list.d/elasticsearch-6.x.list:

    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

Run apt-get update and the repository is ready for use. You can install it with:

    sudo apt-get update && sudo apt-get install elasticsearch

This information was taken from: https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

We have to do some configuration. File /etc/elasticsearch/elasticsearch.yml contains important configuration details that have to be considered. Open it.

    sudo nano /etc/elasticsearch/elasticsearch.yml

Restart the service so changes take the effect:

    sudo service elasticsearch restart

**More elaborated description is given in [this](https://web.cs.dal.ca/~kosmajac/CSCI5408_tutorials/a1.html#sql) link**
### Description
Halifax.ca is a government website that provides usual information about the events, rules, amenities, etc. We were given the task of extracting information using the Halifax transit open database[1]. For this assignment, we utilized the services provided by Amazon (AWS) and Microsoft Azure to run a Virtual Machine and install software to extract the data. By leveraging the power of cloud, we were able to showcase the answers to the questions asked in the Assignment.

### Database Design
	
The ERD (Entity-Relationship Diagram) below depicts the relationship between all the tables. The Halifax transit data has many important tables from which, we used the tables “stops”, “trips” and “stoptimes”. These three tables were enough to show the details of the buses and ferries running in the city of Halifax.

![ER Diagram](https://firebasestorage.googleapis.com/v0/b/assignment4-fc96b.appspot.com/o/ERD.png?alt=media&token=674b7407-335e-4921-b309-e2b956d63403)


### Test Results
The graph demonstrates the performance of MySQL and Elastic Search on each assignment problems. Digressing from the performance comparison for a moment, we tried to run ElasticSearch on AWS cloud service however the config we had was taking a really long time to run ElasticSearch which may have been the bottlenecking factor. We moved our setup to Microsoft Azure, who were providing us with a 4GB RAM system, which was enough to run ElasticSearch with less bottlenecking.


![Performance Chart](https://firebasestorage.googleapis.com/v0/b/assignment4-fc96b.appspot.com/o/Chart.png?alt=media&token=9e42f9e2-794c-4c3a-9174-9096f20a3eec)

From the graph, we can clearly see that even though MySQL queries were faster in some cases, the ElasticSearch performed consistently and way faster than MySQL in the last problem.

### Summary
ElasticSearch, which is built on top of Lucene engine, is a well suited to search a large document. It may not maybe as accurate as conventional databases, however it provides an approximation, which in most cases is enough for making some deductions. With this being said, a relational database has its own perks and one should blindly turn it down. Additionally, we found that Microsoft Azure made the task of configuring the VM a breeze. We would recommend students to use Azure since Microsoft provides $100 credit upfront when they sign-in for it.
