#!/bin/bash
cd "$(dirname "$0")"; export MOCK=mockup2.html OUT=tools/out2
run(){ ./gen.sh "$@"; }
run burgundy-classic wedding1 "0;#welcome;#schedule;#rsvp" '#f3d6d0' '#fbeeea' 'rgba(120,30,40,.35)' &
run white-green wedding2 "0;#welcome;#schedule;#rsvp" '#dde8d9' '#f4f8f1' 'rgba(60,90,50,.35)' &
wait
run love wedding3 "0;#calendar;#schedule;#rsvp" '#f1d9d6' '#fbf0ee' 'rgba(150,60,70,.3)' &
run blue-white wedding4 "0;.invitation;.timeline-section;.rsvp" '#d6e3f1' '#f1f6fb' 'rgba(40,80,130,.35)' &
wait
run black-white-classic wedding5 "0;900;1900;2900" '#dcdad5' '#f3f1ed' 'rgba(40,40,40,.35)' &
run tender-chocolate wedding6 "0;.invitation;.timeline-section;.rsvp" '#e6d5c8' '#f6eee7' 'rgba(90,55,35,.35)' &
wait
run black-white-classic-2 wedding7 "0;1500;2300;3300" '#dcdad5' '#f3f1ed' 'rgba(60,20,30,.35)' &
run birthday-pink birthday1 "0;.timing;.location;.finish" '#f6d5e1' '#fdeff4' 'rgba(190,70,110,.35)' &
wait
run operation-birthday birthday3 "0;.dossier;.rules;.rsvp" '#e6ddc9' '#f5f0e4' 'rgba(20,50,35,.45)' &
run gender-party gender1 "0;#reveal;#calendar;#rsvp" '#dbe5f0' '#f7ebef' 'rgba(70,90,130,.35)' &
wait
echo ALLDONE
