# Assignment_09- Basics of REDIS

### 1. What are the main features of redis?

**Answer**
Redis, which stands for Remote Dictionary Server, is an open-source in-memory data structure store. It is often referred to as a data structure server because it allows you to store various data structures such as strings, hashes, lists, sets, sorted sets, and more. Here are some of the main features of Redis:

1. In-Memory Data Store: Redis primarily stores data in memory, which makes it extremely fast for read and write operations. It is optimized for high-performance and low-latency data access.

2. Data Structures: Redis supports a wide range of data structures, including strings, hashes, lists, sets, sorted sets (with optional range queries and ranking), bitmaps, hyperloglogs, and geospatial indexes. These data structures provide flexibility in storing and manipulating different types of data.

3. Persistence: Redis allows you to persist data on disk so that it can survive server restarts or power failures. It offers different persistence options, such as snapshots and append-only logs, to ensure data durability.

4. Pub/Sub Messaging: Redis includes a publish/subscribe messaging system where clients can subscribe to channels and receive messages published to those channels. It enables building real-time applications or implementing message queueing systems.

5. Replication: Redis supports replication, allowing you to create replicas (slaves) of a master instance. Replication provides high availability by ensuring that data is still accessible even if the master node fails. Additionally, it allows scaling read operations by distributing the workload across multiple replicas.

6. Clustering: Redis Cluster provides automatic sharding and partitioning of data across multiple Redis nodes. It allows you to horizontally scale your Redis deployment while providing fault tolerance. Redis Cluster provides a distributed solution for larger datasets and high availability.  

---

### 2.Write down the limitations of redis?

**Answer**


Redis, despite being a powerful and widely used in-memory data structure store, has certain limitations that users should be aware of. Here are some of the limitations of Redis:

1. Limited storage capacity: Redis stores data primarily in memory, which means the available storage capacity is limited by the amount of RAM on the server. If the dataset exceeds the available memory, it can result in performance issues or even data loss.

2. Single-threaded architecture: Redis operates as a single-threaded server by default, which means it can only utilize a single CPU core. This limitation can impact the overall performance and scalability, especially in scenarios with high concurrency or heavy write loads.

3. Lack of built-in durability: Redis is designed to prioritize performance and speed, and by default, it does not provide built-in durability features. While Redis offers persistence options such as snapshotting and append-only file (AOF) logging, these methods might introduce additional latency and potential data loss during failures.

4. Limited query capabilities: Redis provides a limited set of data querying capabilities compared to traditional relational databases. It does not support complex SQL-like queries or indexing for arbitrary fields. Although Redis offers data structures like sets, lists, and sorted sets that can be queried efficiently, it is not designed to replace full-fledged database systems in all scenarios.

5. Lack of transactions spanning multiple keys: Redis does not natively support transactions that span multiple keys. Although it provides atomic operations on individual keys, ensuring consistency across multiple keys requires implementing custom logic in the application layer.

6. Absence of strong data schema: Redis is schemaless, meaning it does not enforce strict data schema validations. While this provides flexibility, it also means that developers need to handle data validation and integrity checks in their application code.

----


### 3. Perform a basic CRUD operation using redis.

**Answer**  
```

uday@uday:~$ redis-cli
127.0.0.1:6379> select 0
OK
127.0.0.1:6379> SET user:1 "Uday"
OK
127.0.0.1:6379> get user:1
"Uday"
127.0.0.1:6379> set user:1 "Ramu"
OK
127.0.0.1:6379> del user:1
(integer) 1
127.0.0.1:6379> 

```

----

### 4. Explain TTL command with an example.

**Answer**  
In Redis, the TTL (Time-To-Live) command allows you to set an expiration time for a key. Once the TTL for a key expires, Redis automatically removes the key and its associated value from the database. The TTL command is useful for managing data with a limited lifespan, implementing caching strategies, and ensuring data is automatically cleared after a certain period.

The syntax for setting the TTL of a key in Redis is as follows: TTL key Here's an example to illustrate the TTL command:  

```
SET key "hii"
EXPIRE key 600
TTL key
```
In this example, we set the value of the key "key" to "hii" using the SET command. Then, we use the EXPIRE command to set the TTL of "mykey" to 600 seconds, indicating that it should expire and be deleted from the database after 60 seconds. Finally, we use the TTL command to check the remaining time to live for the key "mykey".

If the TTL command returns a positive value, it indicates the number of seconds remaining for the key to expire. If it returns a negative value or -2, it means that the key does not exist or has no associated TTL (i.e., it does not expire). A return value of -1 indicates that the key exists but has no specific TTL set.

By setting a TTL on keys, you can automate the process of key expiration and avoid manual deletion of expired data. This is particularly useful for implementing caching mechanisms, session management, and other scenarios where data needs to be automatically cleared after a certain time.

---

### 5.Create a transaction in redis to perform the following operations.

- Create two keys in a single line and one key differently. (one value should be number)  
- Read any two value in a single line
- Increment the number value
- Expire any two keys after some time  

**Answer**
```
uday@uday:~$ redis-cli
127.0.0.1:6379> MSET key1 "Hello" key2 "Redis" 
OK
127.0.0.1:6379> MSET key3 42
OK
127.0.0.1:6379>MGET key1 key2 
1) "Hello"
2) "Redis"
127.0.0.1:6379> INCR key3
(integer) 43
127.0.0.1:6379> EXPIRE key1 60
1
127.0.0.1:6379> EXPIRE key2 120
1
127.0.0.1:6379> EXEC
```
----



