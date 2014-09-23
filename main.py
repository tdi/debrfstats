#!/usr/bin/env python

# Copyright: 2014 Dariusz Dwornikowski <dariusz.dwornikowski@cs.put.poznan.pl>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from RFSStats import RFSStats
from get_done_date import get_done_date
from datetime import date

if __name__ == "__main__":

    print(get_done_date(657783))
    print(get_done_date(759603, nocache=True))
    stats = RFSStats()

    # MTTGS calculated from 2012-1-1 until now() 
    print(stats.get_global_mttgs())

    # MTTGS calculated from 2012-1-1 until  2014-1-1
    # print(stats.get_global_mttgs(end=date(2014-1-1))

    # MTTGS calculated from 2013-1-1 until 2014-1-1
    # print(stats.get_global_mttgs(start=date(2013-1-1), end=date(2014-1-1))


    # Get closed bugs on 2013-9-24
    # for i in stats.get_closed_by_day(date(2013,9,24)):
    #     print(i)

    # Get range stats csv to stdout date,open,done,opened,closed,mttgs
    # for i in stats.get_range_stats(date(2012,1,1), date.today()):
    # print(i)

    






