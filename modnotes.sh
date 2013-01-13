#!/bin/bash
#
# modnotes.sh - modifies Simplenote files for reuse elsewhere
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
# Run on note files already renamed by namenotes.sh: modnotes.sh *.txt
# The following modifications occur:
# - each file is touched with its note's last update time
# - tags are moved to the bottom, if present
# - other note headers and "----" lines are removed

for f in "$@"
do
  datestr=$(grep -h "^Note Updated:" "$f" | sed 's/Note Updated: //g')
  if [[ -z $datestr ]]; then
    continue
  fi
  year=$(echo $datestr | cut -d " " -f 3)
  monthstr=$(echo $datestr | cut -d " " -f 1)
  case $monthstr in
    Jan*)
      month=01
      ;;
    Feb*)
      month=02
      ;;
    Mar*)
      month=03
      ;;
    Apr*)
      month=04
      ;;
    May)
      month=05
      ;;
    Jun*)
      month=06
      ;;
    Jul*)
      month=07
      ;;
    Aug*)
      month=08
      ;;
    Sep*)
      month=09
      ;;
    Oct*)
      month=10
      ;;
    Nov*)
      month=11
      ;;
    Dec*)
      month=12
      ;;
  esac
  day=$(echo $datestr | cut -d " " -f 2)
  time=$(echo $datestr | cut -d " " -f 4)
  hour=$(echo $time | cut -d ":" -f 1)
  minute=$(echo $time | cut -d ":" -f 2)
  mdategmt="$year$month$day$hour$minute"
  mdate=$(date -j -f "%Y%m%d%H%M%z" "$mdategmt+0000" "+%Y%m%d%H%M")

  tags=$(grep -h "^Note Tags:" "$f" | sed 's/Note Tags: //g')

  sed '/^Note Created:/d' "$f" | \
    sed '/^Note Updated:/d' | \
    sed '/^Note Tags:/d' | \
    sed '/^Note Contents:$/d' | \
    sed '/^----$/d' | tail +2 > "$f.cleaned.txt"
  mv "$f.cleaned.txt" "$f"
  if [[ -n $tags ]]; then
    echo "Note Tags: ${tags}" >> "$f"
  fi
  touch -t $mdate "$f"
done
