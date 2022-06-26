def getcity(arg): # input c data object
    j = 0
    while True:
        if arg[j] == b',':
            arg[j] = chr(0).encode()
            break
        j += 1
    return arg

getcity.registered = True

def getcity_py(x):
    return  x[:x.rfind(',')]

getcity_py.registered = True


def getstate(arg): # input c data object
    j = 0
    while True:
        if arg[j] == b',':
            break
        j += 1
    return arg+j+1
getstate.registered = True

def getstate_py(x):
    return x[x.rfind(',')+1:]
getstate_py.registered = True

def toint(val):
    return int(float(val)) if val else 0

def getairlineyear(arg):
    try:
        return int(arg[arg.rfind('(') + 1:arg.rfind('-')])
    except:
        return -1
getairlineyear.registered = True


def getairlinename(inp):
    inp = inp[:inp.rfind('(')].strip()
    return inp.replace('Inc.', '').replace('LLC', '').replace('Co.', '').strip()
getairlinename.registered = True


def defunctyear(arg):
    desc = arg[arg.rfind('-') + 1:arg.rfind(')')].strip()
    try:
        return int(desc) if len(desc) > 0 else -1
    except:
        return -1
defunctyear.registered = True

def gettime(val):
    return '{:02}:{:02}'.format(int(val / 100), val % 100) if val else ''
gettime.registered = True


def cleanCode(code):
    if code == 'A':
        return 'carrier'
    elif code == 'B':
        return 'weather'
    elif code == 'C':
        return 'national air system'
    elif code == 'D':
        return 'security'
    else:
        return ''


def cancelledbool(arg):
    return bool(arg)
cancelledbool.registered = True


def divertedmap(arg1, arg2):
    if cancelledbool(arg1):
        return 'diverted'
    else:
        ccode = cleanCode(arg2)
        if ccode != '':
            return ccode
        else:
            return 'None'
divertedmap.registered = True


def fillintimes(c, d, e):
      if d != "":
          if float(d) > 0:
              return  float(e)
          else:
              return c 
      else:
            return c

fillintimes.registered = True



