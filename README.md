## Assignment - 1

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
