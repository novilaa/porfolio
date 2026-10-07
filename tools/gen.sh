#!/bin/bash
# usage: gen.sh demo-dir out-name "sel1;sel2;sel3" c1 c2 c3
cd "$(dirname "$0")/.."
CH="/c/Program Files/Google/Chrome/Application/chrome.exe"
OUT="${OUT:-tools/out}"; mkdir -p "$OUT"
enc(){ printf '%s' "$1" | sed 's/#/%23/g;s/;/%3B/g'; }
"$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --window-size=1200,900 --virtual-time-budget=60000 --screenshot="$(pwd -W)/$OUT/$2.png" "file:///$(pwd -W)/tools/${MOCK:-mockup.html}?d=demo/$1/&s=$(enc "$3")&c1=$(enc "$4")&c2=$(enc "$5")&c3=$(enc "$6")" >/dev/null 2>&1
