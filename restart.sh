#!/bin/bash
#
# moOde audio player (C) 2014 Tim Curtis
# http://moodeaudio.org
#
# This Program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This Program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

if [[ -z $1 ]]; then
	echo "args are reboot, poweroff"
	exit 0
fi

if [[ $1 = "reboot" ]]; then
        curl -X POST http://localhost:8080/reboot
	mpc stop
	systemctl stop nginx
	reboot
fi

if [[ $1 = "poweroff" ]]; then
        curl -X POST http://localhost:8080/shutdown
	mpc stop
	systemctl stop nginx
	poweroff
fi

echo "args are reboot, poweroff"
exit 0
