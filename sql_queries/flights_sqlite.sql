CREATE temp TABLE flights_results AS
  SELECT  airlinename AS CarrierName,
      mmonth,myear,dayofweek,origincity,originstate,destcity,deststate,
        distance,cancellationreason,cancelled,diverted,crsarrtime,crsdeptime,airtimeint,arrdelayint,carrierdelayint,actualelapsedtime,
       crselapsedtimeint,depdelayint,lateaircraftdelayint,nasdelayint,securitydelayint,taxinint,taxioutint,weatherdelayint,airlineyearfounded,myyear AS AirlineYearDefunct,
            originlongitudedecimal AS OriginLongitude, originlatitudedecimal AS OriginLatitude, originaltitude, destaltitude,
               destlongitudedecimal AS DestLongitude,  destlatitudedecimal AS DestLatitude, opuniquecarrier AS CarrierCode, opcarrierflnum AS FlightNumber, dayofmonth AS myDay,
               origin AS OriginAirportIATACode, dest AS DestAirportIATACode
  FROM   (SELECT *
          FROM   (SELECT opuniquecarrier,
                         opcarrierflnum,
                         dayofmonth,
                         mmonth,
                         myear,
                         dayofweek,
                         origincity,
                         originstate,
                         origin,
                         origin.longitudedecimal     AS originlongitudedecimal,
                         origin.latitudedecimal      AS originlatitudedecimal,
                         origin.altitude             AS originaltitude,
                         destcity,
                         deststate,
                         dest,
                         dest.longitudedecimal       AS destlongitudedecimal,
                         dest.latitudedecimal        AS destlatitudedecimal,
                         dest.altitude               AS destaltitude,
                         cancellationreason,
                         cancelled,
                         diverted,
                         crsarrtime,
                         crsdeptime,
                         actualelapsedtime,
                         airtimeint,
                         arrdelayint,
                         carrierdelayint,
                         crselapsedtimeint,
                         depdelayint,
                         lateaircraftdelayint,
                         nasdelayint,
                         securitydelayint,
                         taxinint,
                         taxioutint,
                         weatherdelayint,
                         distance / 0.00062137119224 AS distance
                  FROM   (SELECT myear,
                                 origin,
                                 dest,
                                 gettime(crsdeptime)
                                 AS
                                         crsdeptime,
                                 gettime(crsarrtime)
                                 AS
                                         crsarrtime,
                                 Getcity_py(origincityname)
                                 AS
                                         origincity,
                                 Getstate_py(origincityname)
                                 AS
                                         originstate,
                                 Getcity_py(destcityname)
                                 AS
                                         destcity,
                                 Getstate_py(destcityname)
                                 AS
                                         deststate,
                                 Cancelledbool(cancelled)
                                 AS
                                         cancelled,
                                 Divertedmap(diverted, cancellationcode)
                                 AS
                                         CancellationReason,
                                 diverted,
                                 Fillintimes(actualelapsedtime, divreacheddest,
                                 divactualelapsedtime) AS
                                 ActualElapsedTime,
                                 opuniquecarrier,
                                 distance,
                                 mmonth,
                                 dayofweek,
                                 opcarrierflnum,
                                 dayofmonth,
                                 CASE
                                   WHEN airtime = '' THEN 0
                                   ELSE Cast(Cast (airtime AS FLOAT) AS INT)
                                 END
                                 AS
                                         airtimeint,
                                 CASE
                                   WHEN arrdelay = '' THEN 0
                                   ELSE Cast(Cast (arrdelay AS FLOAT) AS INT)
                                 END
                                 AS
                                         arrdelayint,
                                 CASE
                                   WHEN carrierdelay = '' THEN 0
                                   ELSE Cast(Cast (carrierdelay AS FLOAT) AS INT
                                        )
                                 END
                                 AS
                                         carrierdelayint,
                                 CASE
                                   WHEN crselapsedtime = '' THEN 0
                                   ELSE Cast(Cast (crselapsedtime AS FLOAT) AS
                                             INT
                                        )
                                 END
                                 AS
                                         crselapsedtimeint,
                                 CASE
                                   WHEN depdelay = '' THEN 0
                                   ELSE Cast(Cast (depdelay AS FLOAT) AS INT)
                                 END
                                 AS
                                         depdelayint,
                                 CASE
                                   WHEN lateaircraftdelay = '' THEN 0
                                   ELSE Cast(Cast (lateaircraftdelay AS FLOAT)
                                             AS
                                             INT)
                                 END
                                 AS
                                         LateAircraftDelayint,
                                 CASE
                                   WHEN nasdelay = '' THEN 0
                                   ELSE Cast(Cast (nasdelay AS FLOAT) AS INT)
                                 END
                                 AS
                                         nasdelayint,
                                 CASE
                                   WHEN securitydelay = '' THEN 0
                                   ELSE Cast(Cast (securitydelay AS FLOAT) AS
                                             INT)
                                 END
                                 AS
                                         securitydelayint,
                                 CASE
                                   WHEN taxiin = '' THEN 0
                                   ELSE Cast(Cast (taxiin AS FLOAT) AS INT)
                                 END
                                 AS
                                         taxinint,
                                 CASE
                                   WHEN taxiout = '' THEN 0
                                   ELSE Cast(Cast (taxiout AS FLOAT) AS INT)
                                 END
                                 AS
                                         taxioutint,
                                 CASE
                                   WHEN weatherdelay = '' THEN 0
                                   ELSE Cast(Cast (weatherdelay AS FLOAT) AS INT
                                        )
                                 END
                                 AS
                                         weatherdelayint
                          FROM   flights) FF
                         left join airports ORIGIN
                                ON origin = ORIGIN.iatacode
                         left join airports DEST
                                ON dest = DEST.iatacode) FFF,
                 (SELECT Getairlineyear(description) AS airlineyearfounded,
                         Defunctyear(description)    AS myyear,
                         Getairlinename(description) AS airlinename,
                         code
                  FROM   carrier_history) XX
          WHERE  opuniquecarrier = code
                 AND ( myear < myyear
                        OR myyear = -1 )) TTT;
