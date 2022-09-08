sudo apt-get install bison
tar -xf pypy_v.7.3.6.tar.gz
python3 -m pip install apsw
python3 -m pip install pymonetdb 
tar -xf pypy_v.7.3.6.tar.gz
export LD_LIBRARY_PATH="$PWD/udfs/;$PWD/pypy2.7-v7.3.6-linux64/bin;$PWD/YeSQL_MonetDB/cffi_wrappers/"
export PYTHONPATH="$PWD/udfs"
export CURRENT=$PWD
cd YeSQL_MonetDB/MonetDB-11.41.11
mkdir build
cd build
mkdir $CURRENT/monetdb_release
cmake -DCMAKE_INSTALL_PREFIX=$CURRENT/monetdb_release ../
cmake --build .
cmake --build . --target install
cd $CURRENT
./monetdb_release/bin/monetdbd create flights
./monetdb_release/bin/monetdbd set port=50090 flights
./monetdb_release/bin/monetdbd start flights
./monetdb_release/bin/monetdb -p 50000 create fldb
./monetdb_release/bin/monetdb -p 50000 set embedc=true fldb
./monetdb_release/bin/monetdb -p 50000 release fldb
./monetdb_release/bin/monetdb -p 50000 start fldb
./monetdb_release/bin/mclient -p 50000 -d fldb -t performance < YeSQL_MonetDB/cffi_wrappers/createfuncs.sql
./monetdb_release/bin/mclient -p 50000 -d fldb -t performance < data/loadschema.sql
./monetdb_release/bin/mclient -p 50000 -d fldb -s "COPY INTO carrier_history from '$PWD/data/L_CARRIER_HISTORY.csv' USING DELIMITERS ',', '\n','\"'"
./monetdb_release/bin/mclient -p 50000 -d fldb -s "COPY INTO AIRPORTS from '$PWD/data/GlobalAirportDatabase.txt' USING DELIMITERS ':', '\n','\"'"
./monetdb_release/bin/mclient -p 50000 -d fldb -s "COPY INTO flights_temp from '$PWD/data/flights.csv' USING DELIMITERS ',', '\n','\"'"
./monetdb_release/bin/mclient -p 50000 -d fldb < data/loadflights.sql
./monetdb_release/bin/mclient -p 50000 -d fldb -s "COPY INTO zillow from '$PWD/data/zillow.csv' USING DELIMITERS ',', E'\n', '\"';" 

