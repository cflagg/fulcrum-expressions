////ABS

/**
 * ABS
 * Returns the absolute value of a number.
 * @param {Number} value The number of which to return the absolute value.
 * @returns {Number} the absolute value of the `value` parameter
 * @example
 * // returns 1
 * ABS(-1)
 * @example
 * // returns 42
 * ABS(42)
 */
function ABS() {}


////ACOS

/**
 * ACOS
 * Returns the inverse cosine of a value, in radians.
 * Use the {@link DEGREES} function to convert the result of {@link DEGREES} into degrees.
 * @param {Number} value The value for which to calculate the inverse cosine. Must be between -1 and 1, inclusive.
 * @returns {Number}
 * @example
 * // returns 0.6435011087932843
 * ACOS(0.8)
 */
function ACOS() {}


////ACOSH

/**
 * ACOSH
 * Returns the inverse hyperbolic cosine of a number.
 *
 * Related:
 * {@link TANH}
 * @param {Number} value The value for which to calculate the inverse hyperbolic cosine. Must be greater than or equal to 1.
 * @returns {Number}
 * @example
 * // returns 2.6339157938496336
 * ACOSH(7)
 */
function ACOSH() {}


////AND

/**
 * AND
 * Returns true if all of the provided arguments are logically true, and false if any of the provided arguments are logically false.
 * @param {...*} var_args_expressions An expression or reference that represents some logical value, i.e. TRUE or FALSE, or an expression that can be converted to a logical value.
 * @returns {Boolean}
 * @example
 * // returns false
 * AND(1, 0, false)
 * @example
 * // returns true
 * AND(3 + 3 == 6, 10 + 2 == 12)
 */
function AND() {}


////AVERAGE

/**
 * AVERAGE
 * Returns the numerical average value in a dataset, ignoring text.
 * @param {...Number} var_args_values values to use when calculating the average value.
 * @returns {Number}
 * @example
 * // returns 2
 * AVERAGE(1, 2, 3)
 */
function AVERAGE() {}


////CEILING

/**
 * CEILING
 * Rounds a number up to the nearest integer multiple of specified significance.
 * @param {Number} value The value to round up to the nearest integer multiple of factor.
 * @param {Number} [factor=1] The number to whose multiples value will be rounded.
 * @returns {Number}
 * @example
 * // returns 139.9
 * CEILING(139.85, 0.1)
 * @example
 * // returns 140
 * CEILING(139.001)
 */
function CEILING() {}


////CHAR

/**
 * CHAR
 * Convert a number into a character according to the current Unicode table.
 * @param {Number} number The number of the character to look up from the current Unicode table in decimal format.
 * @returns {String}
 * @example
 * // returns A
 * CHAR(65)
 * @example
 * // returns Թ
 * CHAR(1337)
 */
function CHAR() {}


////CLEAN

/**
 * CLEAN
 * Returns the text with the non-printable ASCII characters removed.
 * @param {String} text The text whose non-printable characters are to be removed.
 * @returns {String}
 * @example
 * // returns Test
 * CLEAN('Test' + CHAR(31))
 */
function CLEAN() {}


////CODE

/**
 * CODE
 * Returns the numeric Unicode map value of the first character in the string provided.
 * @param {String} text The string whose first character's Unicode map value will be returned.
 * @returns {Number}
 * @example
 * // returns 84
 * CODE('Test')
 */
function CODE() {}


////COMPACT

/**
 * COMPACT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COMPACT()
 */
function COMPACT() {}


////CONCATENATE

/**
 * CONCATENATE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * CONCATENATE()
 */
function CONCATENATE() {}


////CONFIG

/**
 * CONFIG
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * CONFIG()
 */
function CONFIG() {}


////CONFIGURE

/**
 * CONFIGURE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * CONFIGURE()
 */
function CONFIGURE() {}


////COS

/**
 * COS
 * Returns the cosine of a value, in radians.
 * @param {Number} value The value for which to calculate the cosine. Must be between -1 and 1, inclusive.
 * @returns {Number}
 * @example
 * // returns 0.15425144988758405
 * COS(30)
 */
function COS() {}


////COSH

/**
 * COSH
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COSH()
 */
function COSH() {}


////COUNT

/**
 * COUNT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COUNT()
 */
function COUNT() {}


////COUNTA

/**
 * COUNTA
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COUNTA()
 */
function COUNTA() {}


////COUNTBLANK

/**
 * COUNTBLANK
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COUNTBLANK()
 */
function COUNTBLANK() {}


////COUNTRY

/**
 * COUNTRY
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * COUNTRY()
 */
function COUNTRY() {}


////CURRENCYCODE

/**
 * CURRENCYCODE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * CURRENCYCODE()
 */
function CURRENCYCODE() {}


////CURRENCYSYMBOL

/**
 * CURRENCYSYMBOL
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * CURRENCYSYMBOL()
 */
function CURRENCYSYMBOL() {}


////DATE

/**
 * DATE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DATE()
 */
function DATE() {}


////DATEVALUE

/**
 * DATEVALUE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DATEVALUE()
 */
function DATEVALUE() {}


////DAY

/**
 * DAY
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DAY()
 */
function DAY() {}


////DAYS360

/**
 * DAYS360
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DAYS360()
 */
function DAYS360() {}


////DECIMALSEPARATOR

/**
 * DECIMALSEPARATOR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DECIMALSEPARATOR()
 */
function DECIMALSEPARATOR() {}


////DEGREES

/**
 * DEGREES
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DEGREES()
 */
function DEGREES() {}


////DOLLAR

/**
 * DOLLAR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * DOLLAR()
 */
function DOLLAR() {}


////EVEN

/**
 * EVEN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * EVEN()
 */
function EVEN() {}


////EXACT

/**
 * EXACT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * EXACT()
 */
function EXACT() {}


////EXP

/**
 * EXP
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * EXP()
 */
function EXP() {}


////FACT

/**
 * FACT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FACT()
 */
function FACT() {}


////FACTDOUBLE

/**
 * FACTDOUBLE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FACTDOUBLE()
 */
function FACTDOUBLE() {}


////FALSE

/**
 * FALSE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FALSE()
 */
function FALSE() {}


////FIND

/**
 * FIND
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FIND()
 */
function FIND() {}


////FIXED

/**
 * FIXED
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FIXED()
 */
function FIXED() {}


////FLOOR

/**
 * FLOOR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FLOOR()
 */
function FLOOR() {}


////FORMATNUMBER

/**
 * FORMATNUMBER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * FORMATNUMBER()
 */
function FORMATNUMBER() {}


////GCD

/**
 * GCD
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * GCD()
 */
function GCD() {}


////GROUPINGSEPARATOR

/**
 * GROUPINGSEPARATOR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * GROUPINGSEPARATOR()
 */
function GROUPINGSEPARATOR() {}


////GROUPINGSIZE

/**
 * GROUPINGSIZE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * GROUPINGSIZE()
 */
function GROUPINGSIZE() {}


////HASERROR

/**
 * HASERROR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * HASERROR()
 */
function HASERROR() {}


////HASOTHER

/**
 * HASOTHER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * HASOTHER()
 */
function HASOTHER() {}


////IF

/**
 * IF
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * IF()
 */
function IF() {}


////IFERROR

/**
 * IFERROR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * IFERROR()
 */
function IFERROR() {}


////INT

/**
 * INT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * INT()
 */
function INT() {}


////ISBLANK

/**
 * ISBLANK
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISBLANK()
 */
function ISBLANK() {}


////ISERR

/**
 * ISERR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISERR()
 */
function ISERR() {}


////ISERROR

/**
 * ISERROR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISERROR()
 */
function ISERROR() {}


////ISEVEN

/**
 * ISEVEN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISEVEN()
 */
function ISEVEN() {}


////ISLOGICAL

/**
 * ISLOGICAL
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISLOGICAL()
 */
function ISLOGICAL() {}


////ISNAN

/**
 * ISNAN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISNAN()
 */
function ISNAN() {}


////ISNEW

/**
 * ISNEW
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISNEW()
 */
function ISNEW() {}


////ISNONTEXT

/**
 * ISNONTEXT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISNONTEXT()
 */
function ISNONTEXT() {}


////ISNUMBER

/**
 * ISNUMBER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISNUMBER()
 */
function ISNUMBER() {}


////ISODD

/**
 * ISODD
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISODD()
 */
function ISODD() {}


////ISTEXT

/**
 * ISTEXT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISTEXT()
 */
function ISTEXT() {}


////ISUPDATE

/**
 * ISUPDATE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ISUPDATE()
 */
function ISUPDATE() {}


////LANGUAGE

/**
 * LANGUAGE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LANGUAGE()
 */
function LANGUAGE() {}


////LCM

/**
 * LCM
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LCM()
 */
function LCM() {}


////LEFT

/**
 * LEFT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LEFT()
 */
function LEFT() {}


////LEN

/**
 * LEN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LEN()
 */
function LEN() {}


////LN

/**
 * LN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LN()
 */
function LN() {}


////LOCALE

/**
 * LOCALE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LOCALE()
 */
function LOCALE() {}


////LOG

/**
 * LOG
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LOG()
 */
function LOG() {}


////LOG10

/**
 * LOG10
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LOG10()
 */
function LOG10() {}


////LOWER

/**
 * LOWER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * LOWER()
 */
function LOWER() {}


////MATCH

/**
 * MATCH
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MATCH()
 */
function MATCH() {}


////MATH_FUNC

/**
 * MATH_FUNC
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MATH_FUNC()
 */
function MATH_FUNC() {}


////MAX

/**
 * MAX
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MAX()
 */
function MAX() {}


////MAXA

/**
 * MAXA
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MAXA()
 */
function MAXA() {}


////MEDIAN

/**
 * MEDIAN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MEDIAN()
 */
function MEDIAN() {}


////MEMOIZED_FACT

/**
 * MEMOIZED_FACT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MEMOIZED_FACT()
 */
function MEMOIZED_FACT() {}


////MEMOIZED_FACTDOUBLE

/**
 * MEMOIZED_FACTDOUBLE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MEMOIZED_FACTDOUBLE()
 */
function MEMOIZED_FACTDOUBLE() {}


////MID

/**
 * MID
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MID()
 */
function MID() {}


////MIN

/**
 * MIN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MIN()
 */
function MIN() {}


////MINA

/**
 * MINA
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MINA()
 */
function MINA() {}


////MOD

/**
 * MOD
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * MOD()
 */
function MOD() {}


////N

/**
 * N
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * N()
 */
function N() {}


////NOT

/**
 * NOT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * NOT()
 */
function NOT() {}


////NOT_IMPLEMENTED

/**
 * NOT_IMPLEMENTED
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * NOT_IMPLEMENTED()
 */
function NOT_IMPLEMENTED() {}


////NO_VALUE

/**
 * NO_VALUE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * NO_VALUE()
 */
function NO_VALUE() {}


////NUM

/**
 * NUM
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * NUM()
 */
function NUM() {}


////NUMS

/**
 * NUMS
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * NUMS()
 */
function NUMS() {}


////ODD

/**
 * ODD
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ODD()
 */
function ODD() {}


////ONCE

/**
 * ONCE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ONCE()
 */
function ONCE() {}


////OR

/**
 * OR
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * OR()
 */
function OR() {}


////OTHER

/**
 * OTHER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * OTHER()
 */
function OTHER() {}


////PI

/**
 * PI
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * PI()
 */
function PI() {}


////POWER

/**
 * POWER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * POWER()
 */
function POWER() {}


////PRECISION

/**
 * PRECISION
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * PRECISION()
 */
function PRECISION() {}


////PRODUCT

/**
 * PRODUCT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * PRODUCT()
 */
function PRODUCT() {}


////PROPER

/**
 * PROPER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * PROPER()
 */
function PROPER() {}


////QUOTIENT

/**
 * QUOTIENT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * QUOTIENT()
 */
function QUOTIENT() {}


////RADIANS

/**
 * RADIANS
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * RADIANS()
 */
function RADIANS() {}


////RAND

/**
 * RAND
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * RAND()
 */
function RAND() {}


////RANDBETWEEN

/**
 * RANDBETWEEN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * RANDBETWEEN()
 */
function RANDBETWEEN() {}


////REPLACE

/**
 * REPLACE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * REPLACE()
 */
function REPLACE() {}


////RESETCONFIG

/**
 * RESETCONFIG
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * RESETCONFIG()
 */
function RESETCONFIG() {}


////RIGHT

/**
 * RIGHT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * RIGHT()
 */
function RIGHT() {}


////ROUND

/**
 * ROUND
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ROUND()
 */
function ROUND() {}


////ROUNDDOWN

/**
 * ROUNDDOWN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ROUNDDOWN()
 */
function ROUNDDOWN() {}


////ROUNDUP

/**
 * ROUNDUP
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * ROUNDUP()
 */
function ROUNDUP() {}


////SEARCH

/**
 * SEARCH
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SEARCH()
 */
function SEARCH() {}


////SELECTED

/**
 * SELECTED
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SELECTED()
 */
function SELECTED() {}


////SIGN

/**
 * SIGN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SIGN()
 */
function SIGN() {}


////SIN

/**
 * SIN
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SIN()
 */
function SIN() {}


////SINH

/**
 * SINH
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SINH()
 */
function SINH() {}


////SQRT

/**
 * SQRT
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SQRT()
 */
function SQRT() {}


////SQRTPI

/**
 * SQRTPI
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SQRTPI()
 */
function SQRTPI() {}


////SUBSTITUTE

/**
 * SUBSTITUTE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SUBSTITUTE()
 */
function SUBSTITUTE() {}


////SUM

/**
 * SUM
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SUM()
 */
function SUM() {}


////SUMSQ

/**
 * SUMSQ
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * SUMSQ()
 */
function SUMSQ() {}


////T

/**
 * T
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * T()
 */
function T() {}


////TIMEZONE

/**
 * TIMEZONE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * TIMEZONE()
 */
function TIMEZONE() {}


////TRIM

/**
 * TRIM
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * TRIM()
 */
function TRIM() {}


////TRUE

/**
 * TRUE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * TRUE()
 */
function TRUE() {}


////UPPER

/**
 * UPPER
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * UPPER()
 */
function UPPER() {}


////VALUE

/**
 * VALUE
 * Description
 * @param {Number} value argument
 * @returns {Number}
 * @example
 * // returns VALUE
 * VALUE()
 */
function VALUE() {}


////VERSIONINFO

/**
 * VERSIONINFO
 * Returns version information about the app.
 * @returns {String}
 * @example
 * // returns Apple iPhone6,2 iOS 8.1 Fulcrum 2.7.0 2162
 * VERSIONINFO()
 */
function VERSIONINFO() {}
