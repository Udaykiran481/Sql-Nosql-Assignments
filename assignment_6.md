
# Assignment_06-Normalisation Theory

### 1.Determine the highest normal form of this relation scheme  
The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
the following functional dependencies:  
StudentName, courseNo → grade  
EnrollmentNo, courseNo → grade  
StudentName →EnrollmentNo  
EnrollmentNo →StudentName  

**answer**  

To determine the highest normal form of the relation scheme, we need to analyze the functional dependencies and check for any violations of normal forms. Let's go through the steps:  

Step 1: Identify the candidate key(s) of the relation scheme.
 From the given functional dependencies, we can identify two candidate keys:  
1.StudentName, CourseNo  
2.EnrollmentNo, CourseNo 

Step 2: Check for violations of the 1st Normal Form (1NF).
1NF requires that each attribute in a relation should have atomic (indivisible) values. In the given relation scheme, all attributes seem to have atomic values, so there is no violation of 1NF.

Step 3: Check for violations of the 2nd Normal Form (2NF).
2NF requires that the relation is in 1NF and every non-key attribute is fully functionally dependent on the entire candidate key. In other words, there should be no partial dependencies.  

From the given functional dependencies, we have:

StudentName, CourseNo → Grade (1st functional dependency)
EnrollmentNo, CourseNo → Grade (2nd functional dependency)
Both of these dependencies indicate that Grade is fully functionally dependent on the entire candidate keys. Therefore, there is no violation of 2NF.

Step 4: Check for violations of the 3rd Normal Form (3NF).
3NF requires that the relation is in 2NF and there should be no transitive dependencies, where an attribute depends on another non-key attribute.

From the given functional dependencies, we have:

StudentName → EnrollmentNo (3rd functional dependency)
EnrollmentNo → StudentName (4th functional dependency)
These dependencies indicate a transitive dependency between StudentName and EnrollmentNo. To eliminate the transitive dependency, we can decompose the relation into two separate relations:

Relation 1: (StudentName, EnrollmentNo)  
Relation 2: (EnrollmentNo, CourseNo, Grade)

This decomposition eliminates the transitive dependency and satisfies 3NF.

Therefore, the highest normal form of the relation scheme "student Performance (StudentName, CourseNo, EnrollmentNo, Grade)" is 3NF.

----

### 2.Suppose you are given a relation R= (A, B, C, D, E ) with the following functional  
dependencies:   {CE →D, D→B, C →A}

#### a. Find all candidate keys  

**answer**  

To find the candidate keys, we can apply Armstrong's axioms and closure to determine the attributes that can functionally determine all other attributes.

Start with each attribute as a potential candidate key:
Candidate keys: {A}, {B}, {C}, {D}, {E}

Apply the functional dependencies to compute the closure of each candidate key:
Closure of {A}: {A, C, D, E, B}  
Closure of {B}: {B}  
Closure of {C}: {A, C, D, E, B}  
Closure of {D}: {A, C, D, E, B}  
Closure of {E}: {E}  

Remove any candidate key if it is a proper subset of another candidate key:  
Candidate keys after removing subsets: {A, C, D, E}

Thus, the candidate keys for relation R are {A, C, D, E}  

#### b.Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

**answer**  

identifying the best normal form:  

1. To determine the best normal form satisfied by relation R, we need to analyze the functional dependencies and determine the highest normal form they satisfy.

2. Check for 1NF (First Normal Form):
1NF requires that all attributes are atomic (indivisible). The given relation R already satisfies 1NF since there are no composite attributes.

3. Check for 2NF (Second Normal Form):  
2NF requires that the relation is in 1NF and every non-key attribute is fully functionally dependent on the entire candidate key. In this case, we need to check if any non-key attribute is dependent on only part of the candidate key.None of the given functional dependencies violates 2NF, so relation R satisfies 2NF.

3. Check for 3NF (Third Normal Form):
3NF requires that the relation is in 2NF and there are no transitive dependencies where a non-key attribute depends on another non-key attribute.  

The functional dependency CE → D indicates a transitive dependency between C and D. To satisfy 3NF, we need to decompose the relation.  

### c.If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy.  

**answer**

Decomposing the relation into BCNF:
To decompose the relation R into BCNF, we will remove the transitive dependency by creating a new relation.

Step 1: Create a new relation R1 with attributes C, E, and D.
R1 = (C, E, D)

Functional dependencies for R1:  
CE → D  
C → A (inherited from R)

Candidate keys for R1: {C, E}

R1 satisfies 3NF.

Step 2: Create a new relation R2 with attributes D and B.  
R2 = (D, B)

Functional dependencies for R2:  
D → B

Candidate keys for R2: {D}  

R2 satisfies 3NF.

The decomposition results in two new relations, R1 and R2, both satisfying 3NF. The original relation R can be reconstructed by joining R1 and R2 on the common attribute D.

Final decomposition:
R1 = (C, E, D)
R2 = (D, B)

In this decomposition, we achieved BCNF as well since all dependencies in each relation involve the candidate keys.

----

### 3.You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F): 
### F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}

### a. Find all keys of R based on these functional dependencies.

**answer**  
1. Start with each attribute individually and check if it determines all other attributes:  
   - ABC determines D, E, and F (using ABC → D, ABC → E, ABC → F).  
   - ABD determines C, E, and F (using ABD → C, ABD → E, ABD → F).  
   - CD determines B, D, E, and F (using CD → B, CD → D, CD → E, CD → F).  
   - CDF determines B, D, and F (using CDF → B, CDF → D, CDF → F).  
   - BF determines D and F (using BF → D, BF → F). 

2. combine attributes to see if they determine all other attributes:   

    - ABCD determines E and F (using ABCD → E, ABCD → F).  
    - ABCE determines D, F, and B (using ABCE → D, ABCE → F, ABCE → B).  
    - ABDF determines C, F, and B (using ABDF → C, ABDF → F, ABDF → B).  
    - ACDF determines B and E (using ACDF → B, ACDF → E).  
    - BCDF determines A, D, and E (using BCDF → A, BCDF → D, BCDF → E).  
    - ABCDE determines F (using ABCDE → F).  
3. The possible keys of R are: ABCD, ABCE, ABDF, ACDF, BCDF, and ABCDE.  

### b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.  

Checking for Boyce-Codd Normal Form (BCNF) and Third Normal Form (3NF):
To determine if the relation is in BCNF or 3NF, we need to check if it satisfies the criteria for these normal forms.   

Boyce-Codd Normal Form (BCNF):  
A relation is in BCNF if, for every non-trivial functional dependency X → Y, X is a superkey of the relation. In other words, the left side of every functional dependency must be a superkey.

Looking at the given functional dependencies:  

- ABC → D: ABC is not a superkey since there are other attributes (E, F) not in ABC.  
- ABD → E: ABD is not a superkey since there are other attributes (C, F) not in ABD.  
- CD → F: CD is not a superkey since there are other attributes (B, D, E) not in CD.  
- CDF → B: CDF is not a superkey since there are other attributes (A, D, E) not in CDF.  
- BF → D: BF is not a superkey since there are other attributes (A, C, E, F) not in BF.  
Since none of the left sides of the functional dependencies are superkeys, the relation is not in BCNF.  

Third Normal Form (3NF):  
A relation is in 3NF if, for every non-trivial functional dependency X → Y, either X is a superkey of the relation or Y is a prime attribute (part of a candidate key).

Looking at the given functional dependencies:

- ABC → D: ABC is not a superkey, and D is not a prime attribute.  
- ABD → E: ABD is not a superkey, and E is not a prime attribute.  
- CD → F: CD is not a superkey, and F is not a prime attribute.  
- CDF → B: CDF is not a superkey, and B is not a prime attribute. 
- BF → D: BF is not a superkey, and D is not a prime attribute.   

Since none of the functional dependencies satisfy the conditions for 3NF, the relation is not in 3NF.  

In summary, the relation R is neither in BCNF nor in 3NF.

----


### 4. Write the advantages and disadvantages of normalization.  

**answer :**   
 
Normalization is a data preprocessing technique used in various fields, including statistics, machine learning, and databases. It involves transforming data to a standardized format to improve analysis, reduce redundancy, and enhance data integrity. While normalization offers several benefits, it also has some drawbacks. Let's explore the advantages and disadvantages of normalization:  

Advantages of Normalization:  

1. Reduced Redundancy: Normalization eliminates data redundancy by organizing information efficiently. It minimizes the storage space required and improves data consistency since redundant data is avoided.

2. Data Integrity: By breaking down data into smaller, manageable tables and removing duplicate entries, normalization improves data integrity. It helps maintain data consistency and accuracy, ensuring that updates or modifications are applied uniformly across the dataset.

3. Improved Query Performance: Normalized data typically leads to more efficient query execution since it allows for quicker retrieval and indexing. The organized structure facilitates faster data access, enhancing overall system performance.

4. Flexibility and Scalability: Normalized data is more flexible and adaptable to changes. Adding, modifying, or deleting records becomes easier, as normalization reduces the chances of data inconsistency. This scalability is particularly beneficial in dynamic environments where data is subject to frequent updates.

5. Simplified Updates: Normalization separates data into logical components, reducing the scope of updates. Instead of modifying multiple instances of the same data, updates can be made in a single place. This streamlines the update process and reduces the risk of errors.  


Disadvantages of Normalization:

1. ncreased Complexity: Normalization can make the database structure more complex. Breaking down data into multiple tables requires establishing relationships through primary and foreign keys, which can be challenging to understand and manage for those unfamiliar with the structure.

2. Query Performance Trade-off: While normalization can improve query performance in many cases, there are scenarios where it may lead to decreased performance. Joining multiple tables to retrieve data from normalized structures can be more time-consuming and resource-intensive than querying denormalized data.

3. Increased Storage Requirements: Normalization may increase storage requirements compared to denormalized data structures. Due to the separation of data into multiple tables, there is a need for additional storage to maintain relationships between the tables.

4. Data Retrieval Complexity: Retrieving data from normalized tables often requires joining multiple tables using primary and foreign keys. This complexity can make queries more intricate and prone to errors, especially for individuals who are not familiar with the database schema.

5. Update Anomalies: Normalization can introduce update anomalies, such as insertion, deletion, and modification anomalies. These anomalies occur when modifying data in one table affects other tables' data, potentially leading to inconsistencies if updates are not performed correctly.


-----


### 5.Determine the decomposition.
### Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.
### Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅.

**answer :**  

To determine the decomposition of the schema R = (S, T, U, V) with the given functional dependencies, we can start by analyzing the given dependencies:

1. S → T  
2. T → U  
3. U → V  
4. V → S    

We can observe that these dependencies form a cycle: S → T → U → V → S. This cycle indicates that the schema R is not in Boyce-Codd Normal Form (BCNF). To decompose R into smaller schemas that satisfy BCNF, we can use the dependency preservation decomposition algorithm.

Here's the step-by-step process to decompose R into R1 and R2:

1. Start with the original schema R = (S, T, U, V).
2. Choose any dependency from the given set of dependencies. In this case, we can choose S → T.

3. Decompose R into two schemas:

    -  R1 = (S, T)
    - R2 = (R - R1) = (U, V)
Here, R - R1 represents the attributes of R that are not present in R1.

4. heck if the decomposed schemas R1 and R2 satisfy BCNF. BCNF requires that for every non-trivial functional dependency X → Y in a schema R', either X is a superkey in R', or Y is a subset of a key for R'.  In R1, we have the functional dependency S → T. Here, S is not a superkey in R1, so R1 does not satisfy BCNF.

5. Since R1 does not satisfy BCNF, we need to further decompose it.

6. Choose another dependency from the given set of dependencies. Here, we can choose T → U.

7. Decompose R1 into two schemas:

    - R1 = (T, U)  
   - R3 = (R1 - R2) = (S)  
Here, R1 - R2 represents the attributes of R1 that are not present in R2.  

8. Check if the decomposed schemas R1, R2, and R3 satisfy BCNF.

    - R1 = (T, U) satisfies BCNF because T is a superkey.
    - R2 = (U, V) satisfies BCNF because U is a superkey.
    - R3 = (S) satisfies BCNF as there are no functional dependencies.
9. The final decomposition is:

    - R1 = (T, U)   
    - R2 = (U, V)
    - R3 = (S)  

Note that in this decomposition, R1 ∩ R2 ≠ ∅, as U is a common attribute present in both R1 and R2.

Therefore, the decomposition of the schema R = (S, T, U, V) with the given dependencies is R1 = (T, U), R2 = (U, V), and R3 = (S), where R1 ∩ R2 ≠ ∅.


------








    

