create temp table flights_results as SELECT airlinename AS CarrierName,
      mmonth,myear,dayofweek,origincity,originstate,destcity,deststate,
        distance,cancellationreason,cancelled,diverted,crsarrtime,crsdeptime,airtimeint,arrdelayint,carrierdelayint,actualelapsedtime,
       crselapsedtimeint,depdelayint,lateaircraftdelayint,nasdelayint,securitydelayint,taxinint,taxioutint,weatherdelayint,airlineyearfounded,myyear AS AirlineYearDefunct,
            originlongitudedecimal AS OriginLongitude, originlatitudedecimal AS OriginLatitude, originaltitude, destaltitude,
               destlongitudedecimal AS DestLongitude,  destlatitudedecimal AS DestLatitude, opuniquecarrier AS CarrierCode, opcarrierflnum AS FlightNumber, dayofmonth AS myDay,
               origin AS OriginAirportIATACode, dest AS DestAirportIATACode
        FROM   (SELECT *
                FROM   (SELECT  opuniquecarrier, opcarrierflnum,dayofmonth, mmonth, myear, dayofweek, origincity, originstate, origin, origin.longitudedecimal as originlongitudedecimal,
                       origin.latitudedecimal as originlatitudedecimal,  origin.altitude as originaltitude, destcity, deststate, dest, dest.longitudedecimal as destlongitudedecimal, dest.latitudedecimal as destlatitudedecimal,dest.altitude as destaltitude, cancellationreason, cancelled, diverted, crsarrtime,
                       crsdeptime, actualelapsedtime, airtimeint, arrdelayint, carrierdelayint, crselapsedtimeint, depdelayint, lateaircraftdelayint, nasdelayint, securitydelayint, taxinint, taxioutint,
                       weatherdelayint, distance / 0.00062137119224 AS distance
                        FROM   (SELECT         myear, origin, dest,
                                               gettime(crsdeptime) AS crsdeptime,
                                               gettime(crsarrtime) AS crsarrtime,
                                               getcity(origincityname) AS origincity,
                                               getstate(origincityname) AS originstate,
                                               getcity(destcityname) AS destcity,
                                               getstate(destcityname) AS deststate,
                                               cancelledbool(cancelled) AS cancelled,
                                               divertedmap(diverted, cancellationcode) AS CancellationReason,  diverted,
                                               fillintimes(actualelapsedtime, divreacheddest, divactualelapsedtime) AS ActualElapsedTime,
                                               opuniquecarrier, distance, mmonth, dayofweek,opcarrierflnum, dayofmonth,
                                               case when airtime='' then 0 else cast(cast (airtime as float) as int) end  AS airtimeint,
                                                case when arrdelay='' then 0 else cast(cast (arrdelay as float) as int) end  AS arrdelayint,
                                                case when carrierdelay='' then 0 else cast(cast (carrierdelay as float) as int) end            AS carrierdelayint,
                                                case when crselapsedtime='' then 0 else cast(cast (crselapsedtime as float) as int) end          AS crselapsedtimeint,
                                                case when depdelay='' then 0 else cast(cast (depdelay as float) as int) end                AS depdelayint,
                                                case when LateAircraftDelay='' then 0 else cast(cast (LateAircraftDelay as float) as int) end       AS LateAircraftDelayint,
                                                case when nasdelay='' then 0 else cast(cast (nasdelay as float) as int) end                AS nasdelayint,
                                                case when securitydelay='' then 0 else cast(cast (securitydelay as float) as int) end           AS securitydelayint,
                                                 case when taxiin='' then 0 else cast(cast (taxiin as float) as int) end                  AS taxinint,
                                                case when taxiout='' then 0 else cast(cast (taxiout as float) as int) end  AS taxioutint,
                                                case when weatherdelay='' then 0 else cast(cast (weatherdelay as float) as int) end            AS weatherdelayint
                                       FROM flights) FF
                                           LEFT JOIN airports ORIGIN
                                              ON origin = ORIGIN.iatacode
                                           LEFT JOIN airports DEST
                                              ON dest = DEST.iatacode) FFF,
                                       (SELECT getairlineyear(description) AS
                                               airlineyearfounded,
                                               defunctyear(description)    AS
                                               myyear,
                                               getairlinename(description) AS
                                               airlinename, code
                                        FROM   carrier_history) XX
                                WHERE  opuniquecarrier = code and (myear < myyear OR myyear = -1) )  TTT on commit preserve rows;
