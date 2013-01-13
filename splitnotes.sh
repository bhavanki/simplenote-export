#!/bin/bash
#
# splitnotes.sh - splits Simplenote plain text export into one file per note
# Copyright 2013 Bill Havanki
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# ---
#
# Real easy: splitnotes.sh /path/to/simplenote_export_1.txt
 
split -p "^----$" "$1"
