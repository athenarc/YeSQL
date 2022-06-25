# About

[YeSQL](https://athenarc.github.io/YeSQL/) is an SQL extension that provides more usable, more expressive, and more perfomant Python UDFs and can be integrated into both server-based and embedded DBMSs. It enriches SQL with a functional syntax that unifies the expression of relational and user-defined functionality and optimizes the execution of both in a seamless fashion, assigning processing tasks to the DBMS or the UDF host language VM accordingly and employing efficient low-level implementation techniques. Key characteristics of the YeSQL language that enhance usability and expressiveness include (a) stateful, parametric, and polymorphic UDFs, (b) dynamically typed UDFs, (c) scalar and aggregate UDFs returning arbitrary table forms, and (d) UDF pipelining. Key performance characteristics include (a) seamless data exchange between the UDF and the DBMS, (b) JIT-compiled UDFs, (c) UDF parallelization, (d) stateful UDFs, and (e) UDF fusion.

YeSQL is designed to work in synergy with existing systems. It is fully implemented on top of SQLITE API, originally introduced in SQLite, but there is also a prototype implementation on top of a read optimised server database (MonetDB).

# Documentation

You'll find YeSQL [documentation here](https://athenarc.github.io/YeSQL/).

## Installation with MonetDB

### Requirements

Ubuntu 20.04 with cmake version 3.12 or newer

### Installation

Create a `.monetdb` file at your home and insert:
```
user=monetdb
password=monetdb
```

Clone the current repository and run
```
./exec.sh
```
This script contains the list of commands to install monetdb and other python and system dependencies, the commands to load the UDFs and data in MonetDB. 

### Experiment

run end-to-end experiments with 

```
./monetdb_release/bin/mclient -d fldb -p 50000 -t performance

```


Paste query at `sql_queries/flights.sql` in the terminal.
Paste query at `sql_queries/zillow.sql` in the terminal.
 
It is possible also to run the udfs defined at `udfs/flights.py` and `udfs/zillow.py` in isolation to run microbenchmarks with YeSQL's implementation on MonetDB.
The user can disable default monetdb's multithreading with `set optimizer='sequential_pipe';` in the terminal and run single threaded experiments. 
Also the number of threads can be defined as shown at https://www.monetdb.org/documentation-Jan2022/admin-guide/manpages/monetdb/ with nthreads property.
This is necessary to run the scalability experiments.


Note also that with:
```
python3 YeSQL_MonetDB/monetdb.py -d fldb -H localhost -P 50000 -u monetdb -p monetdb
``` 
The YeSQL's terminal with its language extensions (syntactic inversion) can be used with MonetDB. 

## Installation with SQLite

Load the data with
```
pypy2.7-v7.3.6-linux64/bin/pypy YeSQLite/mterm.py -f udfs -d data.db  < data/loaddata_sqlite.sql
```

run end-to-end experiments with
```
pypy2.7-v7.3.6-linux64/bin/pypy YeSQLite/mterm.py -f udfs -d data.db
```
Paste query at `sql_queries/flights_sqlite.sql` in the terminal.
Paste query at `sql_queries/zillow_sqlite.sql` in the terminal.

The terminal also executes any other queries using the SQLite's SQL dialect.
Thus, the user of this terminal can also run the udfs defined at `udfs/flights.py` and `udfs/zillow.py` in isolation to run microbenchmarks with YeSQL's implementation on SQLite.

## Notes

The repository contains the datasets and udfs for zillow and flights experiments (end-to-end and with microbenchmarks using single udfs executions). 
A  `flights.csv` file and a `zillow.csv` file is available at `data` folder.

Synthetic creation of larger tables of any size can be done with queries like `insert into flights select * from flights;`

The repository also includes the whole implementation of YeSQL on top of SQLite (i.e., the user is able to implement new UDFs in the udfs folder as .py files), and a prototype implementation of YeSQL on top of MonetDB (i.e., implementation of new UDFs is not supported in this prototype, however the user may edit the body of already existing UDFs)

For comparisons with `tuplex` and `pyspark` we used the implementations available at 
https://github.com/tuplex/tuplex/tree/master/benchmarks/flights (python files `runpyspark.py` and `runtuplex.py`)
and
https://github.com/tuplex/tuplex/tree/master/benchmarks/zillow/Z2 (python files `runpyspark.py` and `runtuplex.py`)

Instruction to install tuplex and run these scripts are available at https://github.com/tuplex/tuplex

