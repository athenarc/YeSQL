CREATE or replace FUNCTION getairlinename(input string)
RETURNS string
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    getairlinename_wrapped(input.data, input.count,result->data);
};


CREATE or replace FUNCTION getcity(input string)
RETURNS string
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    getcity_wrapped(input.data, input.count,result->data);
};


CREATE or replace FUNCTION getstate(input string)
RETURNS string
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    getstate_wrapped(input.data, input.count,result->data);
};

CREATE or replace FUNCTION getairlineyear(input string)
RETURNS int
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    getairlineyear_wrapped(input.data, input.count,result->data);
};


CREATE or replace FUNCTION defunctyear(input string)
RETURNS int
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    defunctyear_wrapped(input.data, input.count,result->data);
};

CREATE or replace FUNCTION gettime(input int)
RETURNS string
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    gettime_wrapped(input.data, input.count,result->data);
};

CREATE or replace FUNCTION cleancode(c CHAR)
RETURNS STRING
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, c.count);
    cleancode_wrapped(c.data,c.count,result->data);
};


CREATE or replace FUNCTION cancelledbool(input float)
RETURNS BOOLEAN
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, input.count);
    cancelledbool_wrapped(input.data, input.count,result->data);
};


CREATE or replace FUNCTION divertedmap(c FLOAT, d STRING )
RETURNS STRING
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, c.count);
    divertedmap_wrapped(c.data, d.data,  c.count,result->data);
};

CREATE or replace FUNCTION fillInTimes(c FLOAT, d STRING, e STRING)
RETURNS FLOAT
LANGUAGE C
{
    #pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
    #pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
    #include "udfs.h"
    result->initialize(result, c.count);
    fillInTimesUDF_wrapped(c.data, d.data, e.data,  c.count,result->data);
};


CREATE or replace FUNCTION extractbd(input STRING)
RETURNS INT
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractbd_wrapped(input.data, input.count, result->data);
};


CREATE or replace FUNCTION extracttype(input STRING)
RETURNS STRING
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extracttype_wrapped(input.data, input.count, result->data);

};


CREATE or replace FUNCTION extractmethod(input STRING)
RETURNS STRING
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractmethod_wrapped(input.data, input.count, result->data);

};

CREATE or replace FUNCTION extractba(input STRING)
RETURNS INT
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractba_wrapped(input.data, input.count, result->data);
};


drop function extractsqfeet;
CREATE or replace FUNCTION extractsqfeet(input STRING)
RETURNS INT
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractsqfeet_wrapped(input.data, input.count, result->data);
};

CREATE or replace FUNCTION extractprice_sell(input STRING)
RETURNS INT
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractprice_sell_wrapped(input.data, input.count, result->data);
};

CREATE or replace FUNCTION extractpcode(input STRING)
RETURNS STRING
LANGUAGE C {
#pragma CFLAGS -I$CURRENT/YeSQL_MonetDB/cffi_wrappers
#pragma LDFLAGS -L$CURRENT/YeSQL_MonetDB/cffi_wrappers -lwrappedudfs
#include "udfs.h"
result->initialize(result, input.count);
extractpcode_wrapped(input.data, input.count, result->data);
};




