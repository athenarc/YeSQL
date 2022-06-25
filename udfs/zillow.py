import math

def extractbd(val):
      try:
        max_idx = val.find(' bd')
        if max_idx < 0:
            max_idx = len(val)
        s = val[:max_idx]
        split_idx = s.rfind(',')
        if split_idx < 0:
            split_idx = 0
        else:
            split_idx += 2
        r = s[split_idx:]
        return int(r)
      except:
        return -1
extractbd.registered = True

def extractba(val):
      try:
        max_idx = val.find(' ba')
        if max_idx < 0:
            max_idx = len(val)
        s = val[:max_idx]
        split_idx = s.rfind(',')
        if split_idx < 0:
            split_idx = 0
        else:
            split_idx += 2
        r = s[split_idx:]
        ba = math.ceil(2.0 * float(r)) / 2.0
        return int(ba)
      except:
        return -1
extractba.registered = True

def extractsqfeet(val):
      try:
        max_idx = val.find(' sqft')
        if max_idx < 0:
            max_idx = len(val)
        s = val[:max_idx]
        split_idx = s.rfind('ba ,')
        if split_idx < 0:
            split_idx = 0
        else:
            split_idx += 5
        r = s[split_idx:]
        r = r.replace(',', '')
        return int(r)
      except:
        return -1
extractsqfeet.registered = True


def extractprice_sell(val):
      try:
        return  int(val[1:].replace(',', ''))
      except:
        return -1
extractprice_sell.registered = True


def extractid(val):
  match = re.search("(\d+)_zpid/$",val)
  try:
      return int(match.group(1))
  except:
      return  0

extractid.registered = True


def extractprice_sell(val):
      try:
        return  int(val[1:].replace(',', ''))
      except:
        return -1
extractprice_sell.registered = True


def extractpcode(val):
      try:
        return '%05d' % int(val)
      except:
        return ''
extractpcode.registered = True


def extracttype(val):
      try:
        t = val.lower()
        type = 'unknown'
        if 'condo' in t or 'apartment' in t:
            type = 'condo'
        if 'house' in t:
            type = 'house'
        return  type
      except:
        return 'null'

extracttype.registered = True

