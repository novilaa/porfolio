#!/bin/bash
cd "$(dirname "$0")"
./gen.sh burgundy-classic wedding1 "0;#calendar;#dresscode" '#f3d6d0' '#fbeeea' '#e3a79c' &
./gen.sh white-green wedding2 "0;#calendar;#schedule" '#dde8d9' '#f4f8f1' '#b5cfab' &
./gen.sh love wedding3 "0;#calendar;#schedule" '#f1d9d6' '#fbf0ee' '#e0a9a3' &
./gen.sh blue-white wedding4 "0;.invitation;.timeline-section" '#d6e3f1' '#f1f6fb' '#a9c6e4' &
wait
./gen.sh black-white-classic wedding5 "0;900;1900" '#d9d9d6' '#f2f1ee' '#a8a7a3' &
./gen.sh tender-chocolate wedding6 "0;.invitation;.timeline-section" '#e6d5c8' '#f6eee7' '#c7a38b' &
./gen.sh black-white-classic-2 wedding7 "0;1500;2300" '#d9d9d6' '#f2f1ee' '#a8a7a3' &
./gen.sh birthday-pink birthday1 "0;.timing;.dress-code" '#f6d5e1' '#fdeff4' '#ec9ebb' &
wait
./gen.sh operation-birthday birthday3 "0;.dossier;.mission" '#0d261c' '#1c4533' '#b8923f' &
./gen.sh gender-party gender1 "0;#reveal;#welcome" '#d8e4f0' '#f6e9ee' '#b9cfe6' &
wait
