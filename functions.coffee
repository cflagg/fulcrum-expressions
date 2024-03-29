_ = require('underscore')

_.str = require('underscore.string')

_.mixin(_.str.exports())

inspect = require('object-inspect')

Utils = require('./utils')

toArray = Utils.toArray

Defaults =
  locale: 'en_US'
  language: 'en-US'
  country: 'US'
  currencyCode: 'USD'
  currencySymbol: '$'
  timeZone: 'UTC'
  decimalSeparator: '.'
  groupingSeparator: ','
  groupingSize: 3

Config = _.extend({}, Defaults)

exports = {}

exports.NO_VALUE = undefined

exports.MATH_FUNC = MATH_FUNC = (mathFunction) ->
  -> mathFunction.apply(Math, toArray(arguments).map(NUM))

exports.ABS = MATH_FUNC(Math.abs)

exports.ACOS = MATH_FUNC(Math.acos)

exports.ACOSH = (number) ->
  number = NUM(number)

  Math.log(number + Math.sqrt(number * number - 1))

exports.AND = ->
  _.find(toArray(arguments), (item) -> not item) is undefined

exports.APPLICATION = ->
  Config.application ? ''

exports.APPLICATIONBUILD = ->
  Config.applicationBuild ? ''

exports.APPLICATIONINFO = (separator=', ') ->
  _.compact([ APPLICATION(), APPLICATIONVERSION(), APPLICATIONBUILD() ]).join(separator)

exports.APPLICATIONVERSION = ->
  Config.applicationVersion ? ''

exports.AVERAGE = ->
  args = toArray(arguments)
  return NaN if args.length is 0
  _.inject(args, ((memo, arg) -> memo + +arg), 0) / args.length

exports.CEILING = (number, significance = 1) ->
  significance ?= 1
  significance = ABS(significance)

  number = NUM(number)

  return NaN if isNaN(number) or isNaN(significance)

  return 0 if significance is 0

  precision = PRECISION(significance)

  if number >= 0
    ROUND(Math.ceil(number / significance) * significance, precision)
  else
    -ROUND(Math.floor(Math.abs(number) / significance) * significance, precision)

exports.CHAR = (number) ->
  number = NUM(number)
  String.fromCharCode number

exports.CHOICEVALUE = (field) ->
  values = CHOICEVALUES(field)

  return NO_VALUE unless _.isArray(values)
  return NO_VALUE if values.length is 0

  values[0]

exports.CHOICEVALUES = (field) ->
  return NO_VALUE unless field?.choice_values? or field?.other_values?

  return [] if ISBLANK(field)

  values = [].concat(field.choice_values).concat(field.other_values)

  _.compact(values)

CLEAN_REGEX = /[\x00\x08\x0B\x0C\x0E-\x1F]/g

exports.CLEAN = (text) ->
  text ?= ''
  text.replace CLEAN_REGEX, ''

exports.COALESCE = ->
  if arguments.length is 1 and _.isArray(arguments[0])
    COALESCE.apply(null, arguments[0])
  else
    (_.find toArray(arguments), (value) -> value?) ? NO_VALUE

exports.CODE = (string) ->
  string = string.toString() if _.isNumber(string)
  return NaN unless _.isString(string)
  (string ? '').charCodeAt(0)

# _.compact removes '' and 0 from the array, which is somewhat unexpected
exports.COMPACT = (value) ->
  return undefined unless _.isArray(value)

  _.filter value, (item) -> item?

exports.CONCATENATE = ->
  strings = _.map toArray(arguments), (arg) ->
    switch true
      when _.isString(arg)
        arg
      when _.isNumber(arg)
        '' + arg
      else
        ''

  strings.join('')

exports.CONFIG = ->
  Config

exports.CONFIGURE = (config, merge=true) ->
  if merge
    _.extend(Config, config)
  else
    Config = config

  Config

exports.COS = MATH_FUNC(Math.cos)

exports.COSH = (number) ->
  number = NUM(number)

  exp = Math.exp(number)

  (exp + 1 / exp) / 2

exports.COUNT = (value) ->
  return NO_VALUE unless _.isArray(value)

  numbers = _.select COMPACT(value).map(NUM), (num) -> not isNaN(num)

  numbers.length

exports.COUNTA = (value) ->
  return NO_VALUE unless _.isArray(value)

  value.length

exports.COUNTBLANK = (value) ->
  return NaN unless _.isArray(value)

  results = _.filter value, (item) ->
    switch true
      when not item?
        true
      when _.isArray(item)
        item.length is 0
      when _.isString(item)
        _.isBlank(item)
      else
        false

  results.length

exports.COUNTRY = ->
  Config.country or Defaults.country

exports.CURRENCYCODE = ->
  Config.currencyCode or Defaults.currencyCode

exports.CURRENCYSYMBOL = ->
  Config.currencySymbol or Defaults.currencySymbol

exports.DATE = (year, month, day) ->
  year = INT(year)
  month = INT(month)
  day = INT(day)

  return NO_VALUE if isNaN(year) or isNaN(month) or isNaN(day)

  new Date("#{year}/#{month}/#{day} 00:00:00")

exports.DATEADD = (date, number, type='day') ->
  date = DATEVALUE(date)
  number = INT(number)

  return NO_VALUE unless date?
  return NO_VALUE if isNaN(number)

  return NO_VALUE unless type is 'day'

  time = date.getTime()
  time += (number * (1000 * 60 * 60 * 24))

  new Date(time)

exports.DATEVALUE = (text) ->
  return text if _.isDate(text)

  text = text.replace(/-/g, '/') if _.isString(text) and text.length <= 10

  date = new Date(text)

  return NO_VALUE if isNaN(date.getTime())

  date

exports.DAY = (date) ->
  date = DATEVALUE(date)

  return NO_VALUE unless date?

  date.getDate()

exports.DECIMALSEPARATOR = ->
  Config.decimalSeparator or Defaults.decimalSeparator

exports.DEGREES = (value) ->
  value = NUM(value)
  return NaN unless _.isNumber(value)
  180.0 * value / Math.PI

exports.DEVICEINFO = (separator=', ') ->
  _.compact([ DEVICEMANUFACTURER(), DEVICEMODEL() ]).join(separator)

exports.DEVICEMODEL = ->
  Config.deviceModel ? ''

exports.DEVICEMANUFACTURER = ->
  Config.deviceManufacturer ? ''

exports.DOLLAR = (value, decimals=2, currency=null, language=null) ->
  decimals = NUM(decimals)
  decimals ?= 2
  decimals = 2 if isNaN(decimals)

  value = NUM(value)

  return NO_VALUE unless _.isNumber(value)

  currency ?= CURRENCYCODE()
  language ?= LANGUAGE()

  options =
    style: 'currency'
    currency: currency
    minimumFractionDigits: decimals
    maximumFractionDigits: decimals

  FORMATNUMBER(value, language, options)

exports.EMAIL = ->
  CONFIG().userEmail ? NO_VALUE

exports.EVEN = (value) ->
  value = NUM(value)

  return NaN unless _.isNumber(value)

  CEILING(value, -2, -1)

exports.EXACT = (value1, value2) ->
  _.isEqual(value1, value2)

exports.EXP = MATH_FUNC(Math.exp)

exports.MEMOIZED_FACT = []

exports.FACT = (value) ->
  value = NUM(value)

  return NaN if isNaN(value)
  return NaN if value < 0

  n = Math.floor(value)

  if n is 0 or n is 1
    1
  else if MEMOIZED_FACT[n] > 0
    MEMOIZED_FACT[n]
  else
    MEMOIZED_FACT[n] = FACT(n - 1) * n
    MEMOIZED_FACT[n]

exports.MEMOIZED_FACTDOUBLE = []

exports.FACTDOUBLE = (value) ->
  value = NUM(value)

  return NaN if isNaN(value)
  return NaN if value < 0

  n = Math.floor(value)

  if n <= 1
    1
  else if MEMOIZED_FACTDOUBLE[n] > 0
    MEMOIZED_FACTDOUBLE[n]
  else
    MEMOIZED_FACTDOUBLE[n] = FACTDOUBLE(n - 2) * n
    MEMOIZED_FACTDOUBLE[n]

exports.FALSE = ->
  false

exports.FIND = (needle, haystack, position) ->
  position = NUM(position)
  position = 0 if isNaN(position)

  return NO_VALUE unless haystack and haystack.indexOf
  return NO_VALUE if _.isArray(needle)

  index = haystack.indexOf(needle, position - 1)

  return NO_VALUE if index < 0

  index + 1

exports.FIXED = (number, decimals=2, suppressGroupingSeparator=false) ->
  number = NUM(number)
  decimals = NUM(decimals)
  decimals = 2 if isNaN(decimals)
  decimals = MAX(decimals, 0)
  decimals = MIN(decimals, 20)

  return NO_VALUE if isNaN(number)
  return NO_VALUE if isNaN(decimals)

  suppressGroupingSeparator = !!suppressGroupingSeparator

  power = Math.pow(10, decimals)

  scaled = parseInt(number * power)

  machineDecimalSeparator = '.'

  machineValue = number.toFixed(decimals)

  index = machineValue.indexOf(machineDecimalSeparator)

  return machineValue unless index > -1

  integerPart = parseInt(machineValue.substring(0, index))
  fractionPart = machineValue.substring(index + 1, machineValue.length)

  integerString = ''

  groupingSize = GROUPINGSIZE()
  groupingMax = Math.pow(10, groupingSize)

  if suppressGroupingSeparator or integerPart < groupingMax
    integerString = integerPart.toString()
  else
    groupingSeparator = GROUPINGSEPARATOR()

    parts = []

    while integerPart >= groupingMax
      thisIntegerPart = Math.floor(integerPart % groupingMax)

      zeroPadding = new Array(groupingSize + 1).join('0')

      parts.push(RIGHT(zeroPadding + thisIntegerPart.toString(), groupingSize))

      integerPart = Math.floor(integerPart / groupingMax)

    if integerPart > 0
      parts.push(integerPart.toString())

    integerString = parts.reverse().join(groupingSeparator)

  if decimals < 1
    integerString
  else
    integerString + DECIMALSEPARATOR() + fractionPart.toString()

exports.FLOOR = (number, significance) ->
  significance ?= 1
  significance = ABS(significance)

  number = NUM(number)

  return NaN if isNaN(number) or isNaN(significance)

  return 0 if significance is 0

  precision = PRECISION(significance)

  if number >= 0
    ROUND(Math.floor(number / significance) * significance, precision)
  else
    -ROUND(Math.ceil(Math.abs(number) / significance) * significance, precision)

exports.FORMATNUMBER = (number, language, options) ->
  number ?= NUM(number)
  language ?= LANGUAGE()

  options ?= {}

  style = 'decimal'
  style = 'currency' if options.style is 'currency'
  style = 'percent'  if options.style is 'percent'

  options.style = style

  if options.style is 'currency'
    options.currency ?= CURRENCYCODE()

  hasSignificantDigitsOption = _.isNumber(options.minimumSignificantDigits) or _.isNumber(options.maximumSignificantDigits)

  if hasSignificantDigitsOption
    options.minimumSignificantDigits ?= 1
    options.minimumSignificantDigits = NUM(options.minimumSignificantDigits)
    options.minimumSignificantDigits = MIN(MAX(options.minimumSignificantDigits, 1), 21)

    options.maximumSignificantDigits ?= options.minimumSignificantDigits
    options.maximumSignificantDigits = NUM(options.maximumSignificantDigits)
    options.maximumSignificantDigits = MIN(MAX(options.maximumSignificantDigits, 1), 21)
  else
    options.minimumIntegerDigits ?= 1
    options.minimumIntegerDigits = NUM(options.minimumIntegerDigits)
    options.minimumIntegerDigits = MIN(MAX(options.minimumIntegerDigits, 1), 21)

    options.minimumFractionDigits ?= if options.style is 'currency' then 2 else 0
    options.minimumFractionDigits = NUM(options.minimumFractionDigits)
    options.minimumFractionDigits = MIN(MAX(options.minimumFractionDigits, 0), 20)

    if options.style is 'currency'
      options.maximumFractionDigits ?= 2
    else if options.style is 'percent'
      options.maximumFractionDigits ?= MAX(options.minimumFractionDigits, 0)
    else
      options.maximumFractionDigits ?= MAX(options.minimumFractionDigits, 3)

    options.maximumFractionDigits = NUM(options.maximumFractionDigits)
    options.maximumFractionDigits = MIN(MAX(options.maximumFractionDigits, 0), 20)

  unless _.isBoolean(options.useGrouping)
    options.useGrouping = true

  HostFunctions.formatNumber(number, language, options)

exports.GCD = ->
  numbers = toArray(arguments).map(NUM)

  count = numbers.length

  return NaN if numbers.length is 0
  return NaN if numbers[0] < 0

  result = numbers[0]

  for i in [1..count - 1]
    return NaN if numbers[i] < 0

    num = numbers[i]

    while result and num
      if result > num
        result %= num
      else
        num %= result

    result += num

  result

exports.GETRESULT = ->
  $$runtime.$$result

exports.GROUPINGSEPARATOR = ->
  Config.groupingSeparator or Defaults.groupingSeparator

exports.GROUPINGSIZE = ->
  Config.groupingSize or Defaults.groupingSize

exports.HASOTHER = (value) ->
  !!(value and
     value.other_values and
     _.isArray(value.other_values) and
     value.other_values.length > 0)

exports.IF = (test, trueValue, falseValue) ->
  if test then trueValue else falseValue

exports.IFERROR = (value, errorValue) ->
  if ISERR(value) then errorValue else value

exports.INSPECT = (value) ->
  inspect(value)

exports.INT = exports.FLOOR

exports.ISBLANK = (value) ->
  return true unless value?
  return true if _.isNaN(value)
  return false if _.isBoolean(value)
  return false if _.isNumber(value)
  return false if _.isDate(value)
  return _.isBlank(value) if _.isString(value)
  return value.length is 0 if _.isArray(value)

  if value and (value.choice_values or
                value.choice_values is null or
                value.other_values or
                value.other_values is null)

    choice = value.choice_values
    others = value.other_values

    hasChoice = _.isArray(choice) and choice.length > 0
    hasOthers = _.isArray(others) and others.length > 0
    hasEither = hasChoice or hasOthers

    return not hasEither

  Object.keys(value).length is 0

exports.ISERR = (value) ->
  return true unless value?
  return true if isNaN(value)
  return true if value instanceof Error
  false

exports.ISERROR = (value) ->
  ISERR(value)

exports.ISLOGICAL = (value) ->
  _.isBoolean(value)

exports.ISNAN = (number) ->
  _.isNaN(NUM(number))

exports.ISEVEN = (value) ->
  value = NUM(value)

  return false unless _.isNumber(value)
  return false if isNaN(value)

  (Math.floor(Math.abs(value)) & 1) is 0

exports.ISNONTEXT = (value) ->
  not _.isString(value)

exports.ISNUMBER = (value) ->
  _.isNumber(value)

exports.ISODD = (value) ->
  value = NUM(value)

  return false unless _.isNumber(value)
  return false if isNaN(value)

  (Math.floor(Math.abs(value)) & 1) is 1

exports.ISSELECTED = (value, choice) ->
  return false if ISBLANK(value)
  return false unless choice?

  if _.isArray(choice)
    return (choice.filter (item) -> not ISSELECTED(value, item)).length is 0

  if value and value.choice_values
    return true if _.contains(value.choice_values, choice)

  if value and value.other_values
    return true if _.contains(value.other_values, choice)

  false

exports.ISTEXT = (value) ->
  _.isString(value)

exports.LANGUAGE = ->
  Config.language or Defaults.language

exports.LATITUDE = ->
  NUM(CONFIG().featureGeometry?.coordinates[1])

exports.LCM = ->
  numbers = toArray(arguments).map (num) -> INT(num)

  count = numbers.length

  a = Math.abs(numbers[0])

  for i in [1..count - 1] by 1
    b = Math.abs(numbers[i])
    c = a

    return NaN if isNaN(b)

    while a and b
      if a > b
        a %= b
      else
        b %= a

    a = Math.abs(c * numbers[i]) / (a + b)

  a

exports.LEFT = (value, numberOfCharacters = 1) ->
  numberOfCharacters ?= 1
  numberOfCharacters = FLOOR(numberOfCharacters)

  return NO_VALUE unless value?
  return NO_VALUE if _.isObject(value)
  return NO_VALUE if numberOfCharacters < 0
  return NO_VALUE if isNaN(numberOfCharacters)

  value = value.toString()

  value.substring(0, numberOfCharacters)

exports.LEN = (value) ->
  return NO_VALUE unless value?
  return NO_VALUE if _.isObject(value)

  value.toString().length

exports.LN = MATH_FUNC(Math.log)

exports.LOCALE = ->
  Config.locale or Defaults.locale

exports.LOG = (value, base) ->
  value = NUM(value)
  base = NUM(base ? 10)

  return NaN unless base?
  return NaN if isNaN(base)

  Math.log(value) / Math.log(base)

exports.LOG10 = (value) ->
  LOG(value, 10)

exports.LONGITUDE = ->
  NUM(CONFIG().featureGeometry?.coordinates[0])

exports.LOWER = (value) ->
  return NO_VALUE unless value?
  return NO_VALUE if _.isArray(value)
  return NO_VALUE if _.isObject(value)

  value.toString().toLowerCase()

exports.MAX = ->
  numbers = _.flatten(toArray(arguments))
  numbers = _.map(numbers, NUM)

  return NO_VALUE if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NO_VALUE if hasNaN

  Math.max.apply(Math, numbers)

exports.MAXA = ->
  return NO_VALUE if arguments.length < 1
  return NO_VALUE unless _.isArray(arguments[0])

  MAX.apply(null, arguments[0])

exports.MEDIAN = ->
  numbers = _.flatten(toArray(arguments))
  numbers = _.map(numbers, NUM)

  return NO_VALUE unless _.isArray(numbers)
  return NO_VALUE if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NO_VALUE if hasNaN

  numbers.sort (a, b) -> a - b

  half = Math.floor(numbers.length / 2)

  if numbers.length % 2
    numbers[half]
  else
    (numbers[half - 1] + numbers[half]) / 2.0

exports.MID = (value, startPosition, numberOfCharacters) ->
  startPosition = FLOOR(startPosition)
  numberOfCharacters = FLOOR(numberOfCharacters)

  return NO_VALUE unless value?
  return NO_VALUE if _.isObject(value)
  return NO_VALUE if startPosition < 1
  return NO_VALUE if isNaN(startPosition)
  return NO_VALUE if numberOfCharacters < 0
  return NO_VALUE if isNaN(numberOfCharacters)

  value = value.toString()
  value.substr(startPosition - 1, numberOfCharacters)

exports.MIN = ->
  numbers = _.flatten(toArray(arguments))
  numbers = _.map(numbers, NUM)

  return NO_VALUE if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NO_VALUE if hasNaN

  Math.min.apply(Math, numbers)

exports.MINA = ->
  return NO_VALUE if arguments.length < 1
  return NO_VALUE unless _.isArray(arguments[0])

  MIN.apply(null, arguments[0])

exports.MOD = (number, divisor) ->
  number = NUM(number)
  divisor = NUM(divisor)

  return NaN if isNaN(number)
  return NaN if isNaN(divisor)
  return NaN if divisor is 0

  modulus = Math.abs(number % divisor)

  if divisor > 0 then modulus else -modulus

exports.MONTH = (date) ->
  date = DATEVALUE(date)

  return NO_VALUE unless date?

  date.getMonth() + 1

exports.N = (value) ->
  return value if _.isNumber(value)
  return 1 if value is true
  return 0 if value is false
  0

exports.NOT = (value) ->
  not (value ? false)

exports.NUM = (value) ->
  return NaN if isNaN(value)
  parseFloat(value)

exports.NUMS = ->
  toArray(arguments).map(NUM)

exports.ODD = (value) ->
  value = NUM(value)

  return NaN unless _.isNumber(value)

  temp = Math.ceil(Math.abs(value))
  temp = if temp & 1 then temp else temp + 1

  if value >= 0 then temp else -temp

exports.ONCE = (value) ->
  $$runtime.$$currentValue ? value

exports.OR = ->
  _.find(toArray(arguments), (item) -> item) isnt undefined

exports.OTHER = (value) ->
  return NO_VALUE unless HASOTHER(value)
  return NO_VALUE if ISBLANK(value.other_values)
  return value.other_values[0]

exports.PI = ->
  Math.PI

exports.PLATFORM = ->
  Config.platform ? ''

exports.PLATFORMINFO = (separator=', ') ->
  _.compact([ PLATFORM(), PLATFORMVERSION() ]).join(separator)

exports.PLATFORMVERSION = ->
  Config.platformVersion ? ''

exports.POWER = (number, power) ->
  number = NUM(number)
  power = NUM(power)

  return NaN if isNaN(number)
  return NaN if isNaN(power)

  Math.pow(number, power)

exports.PRECISION = (number) ->
  number = NUM(number)
  return NaN if ISNAN(number)

  parts = (number + '').split('.')

  return 0 if parts.length < 2

  parts[1].length

exports.PRODUCT = ->
  numbers = toArray(arguments).map(NUM)

  return NaN if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NaN if hasNaN

  _.inject(numbers, ((memo, number) -> memo *= number), 1)

exports.PROPER = (value) ->
  return NO_VALUE unless value?
  return NO_VALUE if _.isArray(value)
  return NO_VALUE if _.isObject(value)

  _.titleize(value.toString())

exports.QUOTIENT = (numerator, denominator) ->
  numerator = NUM(numerator)
  denominator = NUM(denominator)

  return NaN if isNaN(numerator)
  return NaN if isNaN(denominator)
  return NaN if denominator is 0

  parseInt(numerator / denominator, 10)

exports.RADIANS = (degrees) ->
  degrees = NUM(degrees)

  (degrees / 180.0) * Math.PI

exports.RAND = ->
  Math.random()

exports.RANDBETWEEN = (low, high) ->
  low = NUM(low)
  high = NUM(high)

  return NaN if isNaN(low)
  return NaN if isNaN(high)

  low + Math.ceil((high - low + 1) * Math.random()) - 1

exports.RECORDID = ->
  CONFIG().recordID ? NO_VALUE

exports.REPEATABLEID = ->
  CONFIG().featureID ? NO_VALUE

exports.REPEATABLENUMBER = ->
  return NO_VALUE unless CONFIG().featureIndex?
  CONFIG().featureIndex + 1

exports.REPEATABLEVALUES = (repeatableValue, dataName) ->
  dataElement = $$runtime.elementsByDataName[dataName]

  return NO_VALUE unless dataElement

  repeatableElement = Utils.nearestRepeatable(dataElement)

  return NO_VALUE unless repeatableElement

  Utils.repeatableValues(repeatableElement, repeatableValue, dataName)

exports.REPEATABLESUM = (repeatableValue, dataName) ->
  SUM.apply(null, _.reject(REPEATABLEVALUES(repeatableValue, dataName), isNaN))

exports.REPLACE = (value, startPosition, numberOfCharacters, replacement) ->
  startPosition = FLOOR(startPosition)
  numberOfCharacters = FLOOR(numberOfCharacters)

  return NO_VALUE unless value?
  return NO_VALUE if arguments.length < 4
  return NO_VALUE if _.isObject(value)
  return NO_VALUE if startPosition < 1
  return NO_VALUE if isNaN(startPosition)
  return NO_VALUE if numberOfCharacters < 0
  return NO_VALUE if isNaN(numberOfCharacters)

  value = value.toString()

  prefix = value.substr(0, startPosition - 1)
  suffix = value.substr(startPosition - 1 + numberOfCharacters)

  prefix + replacement + suffix

exports.RESETCONFIG = ->
  Config = _.extend({}, Defaults)

exports.RIGHT = (value, numberOfCharacters) ->
  numberOfCharacters ?= 1
  numberOfCharacters = FLOOR(numberOfCharacters)

  return NO_VALUE unless value?
  return NO_VALUE if _.isObject(value)
  return NO_VALUE if numberOfCharacters < 0
  return NO_VALUE if isNaN(numberOfCharacters)

  value = value.toString()
  value.substring(value.length - numberOfCharacters)

exports.ROLE = ->
  CONFIG().userRoleName ? NO_VALUE

exports.ROUND = (number, digits = 0) ->
  number = NUM(number)
  digits = NUM(digits)

  Math.round(number * Math.pow(10, digits)) / Math.pow(10, digits)

exports.ROUNDDOWN = (number, digits = 0) ->
  number = NUM(number)
  digits = NUM(digits)

  sign = if number > 0 then 1 else -1

  sign * (Math.floor(Math.abs(number) * Math.pow(10, digits))) / Math.pow(10, digits)

exports.ROUNDUP = (number, digits = 0) ->
  number = NUM(number)
  digits = NUM(digits)

  sign = if number > 0 then 1 else -1

  sign * (Math.ceil(Math.abs(number) * Math.pow(10, digits))) / Math.pow(10, digits)

exports.SEARCH = (needle, haystack, startPosition) ->
  startPosition ?= 1
  startPosition = NUM(startPosition)
  startPosition = 1 if isNaN(startPosition)

  haystack = haystack.toString() if _.isNumber(haystack)
  needle = needle.toString() if _.isNumber(needle)

  return NO_VALUE unless _.isString(needle)
  return NO_VALUE unless _.isString(haystack)

  return 1 if needle is ''

  index = haystack.toLowerCase().indexOf(needle.toLowerCase(), startPosition - 1)

  return NO_VALUE if index < 0

  index + 1

exports.SETRESULT = (result) ->
  $$runtime.$$result = result

exports.SHOWERRORS = (showErrors=true) ->
  $$runtime.showErrors = showErrors

exports.SIGN = (number) ->
  number = NUM(number)

  return NaN if isNaN(number)

  switch true
    when number > 0
      1
    when number < 0
      -1
    when number is 0
      0

exports.SIN = MATH_FUNC(Math.sin)

exports.SINH = (number) ->
  number = NUM(number)

  exp = Math.exp(number)

  (exp - 1 / exp) / 2

exports.SQRT = MATH_FUNC(Math.sqrt)

exports.SQRTPI = (number) ->
  SQRT(NUM(number) * Math.PI)

exports.STATUS = ->
  CONFIG().recordStatus ? NO_VALUE

exports.STATUSLABEL = ->
  status = CONFIG().recordStatus ? NO_VALUE
  if status
    $$runtime.statusesByValue[status] ? NO_VALUE
  else
    NO_VALUE

exports.SUBSTITUTE = (text, oldText, newText, occurrence) ->
  occurrence = FLOOR(occurrence)

  return NO_VALUE if arguments.length < 3
  return NO_VALUE if occurrence < 0

  invalid = (!text or not _.isString(oldText) or not _.isString(newText))

  return NO_VALUE if invalid

  return text if _.isArray(text)
  return text if text.indexOf(oldText) < 0

  text = text.toString()
  oldText = oldText.toString()
  newText = newText.toString()

  if isNaN(occurrence)
    text.replace(new RegExp(oldText, 'g'), newText)
  else
    index = text.indexOf(oldText, index)
    count = 1

    while index >= 0
      if count is occurrence
        prefix = text.substring(0, index)
        suffix = text.substring(index + oldText.length)

        return prefix + newText + suffix

      index = text.indexOf(oldText, index + 1)

      count++

    text

exports.SUM = ->
  numbers = toArray(arguments).map(NUM)

  return NaN if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NaN if hasNaN

  _.inject(numbers, ((memo, number) -> memo += number), 0)

exports.SUMSQ = ->
  numbers = toArray(arguments).map(NUM)

  return NaN if numbers.length is 0

  hasNaN = _.some(numbers, isNaN)

  return NaN if hasNaN

  _.inject(numbers, ((memo, number) -> memo += (number * number)), 0)

exports.T = (value) ->
  return '' unless value?
  return value.toString()

exports.TIMEDIFF = (startTime, endTime, format='hours') ->
  return NO_VALUE unless _.isString(startTime) and _.isString(endTime)

  return NO_VALUE unless _.contains(['hours', 'minutes'], format)

  return NO_VALUE if startTime.length isnt 5
  return NO_VALUE if startTime[2] isnt ':'

  return NO_VALUE if endTime.length isnt 5
  return NO_VALUE if endTime[2] isnt ':'

  time1 = startTime.split(':')
  time2 = endTime.split(':')

  beginHour = NUM(time1[0])
  beginMinute = NUM(time1[1])

  endHour = NUM(time2[0])
  endMinute = NUM(time2[1])

  return NO_VALUE if beginHour > 23 or beginHour < 0
  return NO_VALUE if endHour > 23 or endHour < 0

  return NO_VALUE if beginMinute > 59 or beginMinute < 0
  return NO_VALUE if endMinute > 59 or endMinute < 0

  beginMinutes = (beginHour * 60) + beginMinute
  endMinutes = (endHour * 60) + endMinute

  totalMinutes = (endMinutes - beginMinutes)

  totalMinutes =
    if totalMinutes is 0
      1440
    else if totalMinutes > 0
      totalMinutes
    else
      1440 + totalMinutes

  if format is 'hours'
    totalMinutes / 60
  else
    totalMinutes

exports.TIMEZONE = ->
  Config.timeZone or Defaults.timeZone

exports.TRIM = (value) ->
  _.trim(value)

exports.TRUE = (value) ->
  true

exports.TYPEOF = (value) ->
  switch true
    when _.isUndefined(value)
      'undefined'
    when _.isNull(value)
      'null'
    when _.isNaN(value)
      'nan'
    when _.isNumber(value)
      'number'
    when _.isString(value)
      'string'
    when _.isBoolean(value)
      'boolean'
    when _.isDate(value)
      'date'
    when _.isArray(value)
      'array'
    when _.isRegExp(value)
      'regexp'
    when _.isFunction(value)
      'function'
    when _.isObject(value)
      'object'
    else
      'unknown'

exports.UPPER = (value) ->
  return NO_VALUE unless value?
  return NO_VALUE if _.isArray(value)
  return NO_VALUE if _.isObject(value)

  value.toString().toUpperCase()

exports.USERFULLNAME = ->
  CONFIG().userFullName ? NO_VALUE

exports.VERSIONINFO = (separator=', ') ->
  _.compact([ DEVICEINFO(' '), PLATFORMINFO(' '), APPLICATIONINFO(' ') ]).join(separator)

exports.YEAR = (date) ->
  date = DATEVALUE(date)

  return NO_VALUE unless date?

  date.getFullYear()

exports.X_ISNEW = ->
  CONFIG().featureIsNew is true

exports.X_ISUPDATE = ->
  not X_ISNEW()



hostFunctionExists = (name) ->
  _.isFunction($$runtime["$$#{name}"])

hostFunctionCall = (name, args) ->
  $$runtime["$$#{name}"].apply($$runtime, args)

HostFunctions = host = {}

host.formatNumber = (number, language, options) ->
  if hostFunctionExists('formatNumber')
    hostFunctionCall('formatNumber', arguments)
  else if typeof(Intl) isnt 'undefined'
    nf = new Intl.NumberFormat(language, options)
    nf.format(number)
  else
    '' + number

module.exports = exports
