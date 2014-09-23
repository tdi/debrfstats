#!/usr/bin/python
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

import time
import SOAPpy
from datetime import date
from RFSStats import RFS

if __name__ == "__main__":

    url = 'http://bugs.debian.org/cgi-bin/soap.cgi'
    namespace = 'Debbugs/SOAP'
    server = SOAPpy.SOAPProxy(url, namespace)

    bugi = server.get_bugs("package", "sponsorship-requests", "status", "open")
    buglist = [RFS(b.value) for b in server.get_status(bugi).item]
    buglist_sorted_by_dust = sorted(buglist, key=lambda x: x.dust, reverse=False)
    print("Age  Dust Number  Title")
    for i in buglist_sorted_by_dust:
        print("{:<4} {:<4} {:<7} {}".format(i.age, i.dust, i.bug_number, i.subject))


