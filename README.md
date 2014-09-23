debrfstats
==========

Debian RFS statistics software.

This is a collection of scripts to generate statistics of a RFS queue in Debian.

Look into main.py file for examples. 

# Requires

SOAPpy, dateutil, requests, and Python 2.7 :cry:.

# How to use

Imports:
 ```python
    from debrfstats.RFSStats import RFSStats
    from debrfstats.get_done_date import get_done_date
    from datetime import date
```

Check done_date of bug:

```python
    print(get_done_date(657783))
```

Do not use cache:

```python
    print(get_done_date(759603, nocache=True))
```

Make some stats. First create an object - it can last, all RFS bugs are downloaded using SOAP.

```python
    stats = RFSStats()
```

Calculate global MTTGS (from 2012-1-1 until now()):

```python
    print(stats.get_global_mttgs())
```

Calculate global MTTGS in range:

```python
    print(stats.get_global_mttgs(end=date(2014-1-1))
    print(stats.get_global_mttgs(start=date(2013-1-1), end=date(2014-1-1))
```

Get closed bugs on e.g. 2013-9-24:

    
```python
    for i in stats.get_closed_by_day(date(2013,9,24)):
      print(i)
```


Get range stats csv to stdout `date,open,done,opened,closed,mttgs`:

```python
    for i in stats.get_range_stats(date(2012,1,1), date.today()):
      print(i)
```


