---MySql
--1 Create a trigger to fill up the full_name column in the dependents table while inserting any new records.
CREATE TRIGGER fill_full_name_trigger
BEFORE INSERT ON dependents
FOR EACH ROW
BEGIN
    SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);
END;


--2. Create a trigger that stores the transaction records of each insert, update and delete operations performed on the locations table into locations_info table

--Create the locations_info table
CREATE TABLE locations_info (
    location_id INT,
    operation VARCHAR(10),
    street_adress VARCHAR(50),
    pincode VARCHAR(50),
    city VARCHAR(100),
    state_province VARCHAR(100),
    country_id INT,
    operation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (location_id)
);
---Create the trigger
CREATE TRIGGER locations_trigger
AFTER INSERT OR UPDATE OR DELETE ON locations
FOR EACH ROW
BEGIN
    DECLARE operation VARCHAR(10);

    IF (INSERTING) THEN
        SET operation = 'INSERT';
    ELSEIF (UPDATING) THEN
        SET operation = 'UPDATE';
    ELSEIF (DELETING) THEN
        SET operation = 'DELETE';
    END IF;

    INSERT INTO locations_info (operation, location_id, street_adress , pincode , city ,state_province ,country_id , operation_timestamp)
    VALUES (operation, OLD.location_id,OLD.street_adress ,OLD.pincode , OLD.city ,OLD.state_province ,OLD.country_id ,CURRENT_TIMESTAMP);
END;


/*3. For the following tables create a view named employee_information with
employee first name, last name, salary, department name, city, postal code insert
only those records whose postal code length is less than 5.*/


CREATE VIEW employee_information AS
SELECT
  e.first_name,
  e.last_name,
  e.salary,
  d.department_name,
  l.city,
  l.pincode 
FROM
  employees e
JOIN
  departments d ON e.department_id = d.department_id
JOIN 
	locations l ON l.location_id =d.location_id 
WHERE
  LENGTH(l.pincode) < 5;
  
  

--4

/* ACID is an acronym that stands for Atomicity, Consistency, Isolation, and Durability. These properties are crucial in database systems to ensure reliable and consistent transaction processing. Let's explore each property with an example:

1. Atomicity: Atomicity ensures that a transaction is treated as a single, indivisible unit of work. It guarantees that either all the changes made in a transaction are committed successfully, or none of them are. If any part of the transaction fails, the entire transaction is rolled back, and the database is restored to its state before the transaction started.

For example, consider a banking transaction where a user transfers money from one account to another. To maintain atomicity, the system ensures that the debit from one account and the credit to another account occur as a single operation. If the debit is successful but the credit fails due to a network error, the entire transaction is rolled back, and the money is returned to the original account.

2. Consistency: Consistency guarantees that a transaction brings the database from one valid state to another. It ensures that data follows defined integrity constraints and business rules. In other words, the database remains in a consistent state before and after the transaction.

Continuing with the banking example, let's say a user transfers money from Account A to Account B. The consistency property ensures that after the transaction, the total balance in both accounts is consistent, and no funds are lost or created. If the transaction violates any constraints or rules, it is aborted, and the database remains unchanged.

3. Isolation: Isolation ensures that concurrent transactions do not interfere with each other, even when they are executed simultaneously. Each transaction should operate independently and as if it is the only transaction being executed, without being affected by the actions of other concurrent transactions.

For instance, if two users transfer money concurrently, the isolation property ensures that they cannot read each other's uncommitted changes. If User A transfers $100 from Account X to Account Y, User B should not be able to see the changes until User A's transaction is committed. This prevents conflicts and maintains data integrity.

4. Durability: Durability guarantees that once a transaction is committed, its changes are permanent and survive any subsequent failures, such as power outages or system crashes. Committed data is stored in non-volatile storage, such as a hard disk, to ensure its persistence.

Following the banking example, after a successful money transfer, the durability property ensures that the updated balances are stored securely and will not be lost, even if the system crashes. When the system recovers, it can restore the committed changes from the durable storage to maintain consistency.

By adhering to the ACID properties, database systems ensure reliable and consistent data management, even in the presence of failures or concurrent transactions.*/



--5
/*
 we can make a composite primary key by using the three attributes name,age and occupation , because these three attributes 
 have unique values .
 and then we can make an index file with this composite primary key
 */
CREATE TABLE records (
    name varchar(50),
    age int,
    occupation varchar(50),
    category char,
    PRIMARY KEY (name,age,occupation)
);

create index recordindex on records (name,age,occupation);




