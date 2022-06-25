
create table airports(ICAOCode string, IATACode string, AirportName string, AirportCity string, Country string,
                LatitudeDegrees string, LatitudeMinutes string, LatitudeSeconds string, LatitudeDirection string,
                LongitudeDegrees string, LongitudeMinutes string, LongitudeSeconds string,
                LongitudeDirection string, Altitude string, LatitudeDecimal string, LongitudeDecimal string);



create table carrier_history(code string, description string);

create table flights_temp(MYEAR STRING,QUARTER STRING,MMONTH STRING,DAYOFMONTH STRING,DAYOFWEEK STRING,FLDATE STRING,OPUNIQUECARRIER STRING,OPCARRIERAIRLINEID STRING, OPCARRIER STRING,TAILNUM STRING,OPCARRIERFLNUM STRING,ORIGINAIRPORTID STRING,ORIGINAIRPORTSEQID STRING,ORIGINCITYMARKETID STRING,ORIGIN STRING,ORIGINCITYNAME STRING,ORIGINSTATEABR STRING,ORIGINSTATEFIPS STRING,ORIGINSTATENM STRING,ORIGINWAC STRING,DESTAIRPORTID STRING,DESTAIRPORTSEQID STRING,DESTCITYMARKETID STRING,DEST STRING,DESTCITYNAME STRING,DESTSTATEABR STRING,DESTSTATEFIPS STRING,DESTSTATENM STRING,DESTWAC STRING,CRSDEPTIME STRING,DEPTIME STRING,DEPDELAY STRING,DEPDELAYNEW STRING,DEPDEL15 STRING,DEPDELAYGROUP STRING,DEPTIMEBLK STRING,TAXIOUT STRING,WHEELSOFF STRING,WHEELSON STRING,TAXIIN STRING,CRSARRTIME STRING,ARRTIME STRING,ARRDELAY STRING,ARRDELAYNEW STRING,ARRDEL15 STRING, ARRDELAYGROUP STRING,ARRTIMEBLK STRING,CANCELLED STRING,CANCELLATIONCODE STRING,DIVERTED STRING,CRSELAPSEDTIME STRING,ACTUALELAPSEDTIME STRING,AIRTIME STRING,FLIGHTS STRING,DISTANCE STRING,DISTANCEGROUP STRING,CARRIERDELAY STRING,WEATHERDELAY STRING,NASDELAY STRING,SECURITYDELAY STRING,LATEAIRCRAFTDELAY STRING,FIRSTDEPTIME STRING,TOTALADDGTIME STRING,LONGESTADDGTIME STRING,DIVAIRPORTLANDINGS STRING,DIVREACHEDDEST STRING,DIVACTUALELAPSEDTIME STRING,DIVARRDELAY STRING,DIVDISTANCE STRING,DIV1AIRPORT STRING,DIV1AIRPORTID STRING,DIV1AIRPORTSEQID STRING,DIV1WHEELSON STRING,DIV1TOTALGTIME STRING,DIV1LONGESTGTIME STRING,DIV1WHEELSOFF STRING,DIV1TAILNUM STRING,DIV2AIRPORT STRING,DIV2AIRPORTID STRING,DIV2AIRPORTSEQID STRING,DIV2WHEELSON STRING,DIV2TOTALGTIME STRING,DIV2LONGESTGTIME STRING,DIV2WHEELSOFF STRING,DIV2TAILNUM STRING,DIV3AIRPORT STRING,DIV3AIRPORTID STRING,DIV3AIRPORTSEQID STRING,DIV3WHEELSON STRING,DIV3TOTALGTIME STRING,DIV3LONGESTGTIME STRING,DIV3WHEELSOFF STRING,DIV3TAILNUM STRING,DIV4AIRPORT STRING,DIV4AIRPORTID STRING,DIV4AIRPORTSEQID STRING,DIV4WHEELSON STRING,DIV4TOTALGTIME STRING,DIV4LONGESTGTIME STRING,DIV4WHEELSOFF STRING,DIV4TAILNUM STRING,DIV5AIRPORT STRING,DIV5AIRPORTID STRING,DIV5AIRPORTSEQID STRING,DIV5WHEELSON STRING,DIV5TOTALGTIME STRING,DIV5LONGESTGTIME STRING,DIV5WHEELSOFF STRING,DIV5TAILNUM STRING);
create table flights(MYEAR INT,QUARTER STRING,MMONTH STRING,DAYOFMONTH STRING,DAYOFWEEK STRING,FLDATE STRING,OPUNIQUECARRIER STRING,OPCARRIERAIRLINEID STRING, OPCARRIER STRING,TAILNUM STRING,OPCARRIERFLNUM STRING,ORIGINAIRPORTID STRING,ORIGINAIRPORTSEQID STRING,ORIGINCITYMARKETID STRING,ORIGIN STRING,ORIGINCITYNAME STRING,ORIGINSTATEABR STRING,ORIGINSTATEFIPS STRING,ORIGINSTATENM STRING,ORIGINWAC STRING,DESTAIRPORTID STRING,DESTAIRPORTSEQID STRING,DESTCITYMARKETID STRING,DEST STRING,DESTCITYNAME STRING,DESTSTATEABR STRING,DESTSTATEFIPS STRING,DESTSTATENM STRING,DESTWAC STRING,CRSDEPTIME INT,DEPTIME STRING,DEPDELAY STRING,DEPDELAYNEW STRING,DEPDEL15 STRING,DEPDELAYGROUP STRING,DEPTIMEBLK STRING,TAXIOUT STRING,WHEELSOFF STRING,WHEELSON STRING,TAXIIN STRING,CRSARRTIME INT,ARRTIME STRING,ARRDELAY STRING,ARRDELAYNEW STRING,ARRDEL15 STRING, ARRDELAYGROUP STRING,ARRTIMEBLK STRING,CANCELLED FLOAT,CANCELLATIONCODE STRING,DIVERTED FLOAT,CRSELAPSEDTIME STRING,ACTUALELAPSEDTIME FLOAT,AIRTIME STRING,FLIGHTS STRING,DISTANCE STRING,DISTANCEGROUP STRING,CARRIERDELAY STRING,WEATHERDELAY STRING,NASDELAY STRING,SECURITYDELAY STRING,LATEAIRCRAFTDELAY STRING,FIRSTDEPTIME STRING,TOTALADDGTIME STRING,LONGESTADDGTIME STRING,DIVAIRPORTLANDINGS STRING,DIVREACHEDDEST STRING,DIVACTUALELAPSEDTIME STRING,DIVARRDELAY STRING,DIVDISTANCE STRING,DIV1AIRPORT STRING,DIV1AIRPORTID STRING,DIV1AIRPORTSEQID STRING,DIV1WHEELSON STRING,DIV1TOTALGTIME STRING,DIV1LONGESTGTIME STRING,DIV1WHEELSOFF STRING,DIV1TAILNUM STRING,DIV2AIRPORT STRING,DIV2AIRPORTID STRING,DIV2AIRPORTSEQID STRING,DIV2WHEELSON STRING,DIV2TOTALGTIME STRING,DIV2LONGESTGTIME STRING,DIV2WHEELSOFF STRING,DIV2TAILNUM STRING,DIV3AIRPORT STRING,DIV3AIRPORTID STRING,DIV3AIRPORTSEQID STRING,DIV3WHEELSON STRING,DIV3TOTALGTIME STRING,DIV3LONGESTGTIME STRING,DIV3WHEELSOFF STRING,DIV3TAILNUM STRING,DIV4AIRPORT STRING,DIV4AIRPORTID STRING,DIV4AIRPORTSEQID STRING,DIV4WHEELSON STRING,DIV4TOTALGTIME STRING,DIV4LONGESTGTIME STRING,DIV4WHEELSOFF STRING,DIV4TAILNUM STRING,DIV5AIRPORT STRING,DIV5AIRPORTID STRING,DIV5AIRPORTSEQID STRING,DIV5WHEELSON STRING,DIV5TOTALGTIME STRING,DIV5LONGESTGTIME STRING,DIV5WHEELSOFF STRING,DIV5TAILNUM STRING);
create table zillow(title STRING, address STRING, city STRING, state STRING, postal_code STRING, price STRING, facts_and_features STRING, real_estate_provider STRING, url STRING);



