#!/bin/bash
# Обложки (mockup2, 1200x900) и карточки для модалки (mockup3, 1448x1086) новых шаблонов
cd "$(dirname "$0")"
gen(){ # demo name s2 s3 c1 c2 c3
  MOCK=mockup2.html OUT=tools/out2 ./gen.sh "$1" "$2" "$3" "$5" "$6" "$7" &
  MOCK=mockup3.html OUT=tools/out3 W=1448 H=1086 ./gen.sh "$1" "$2" "$4" "$5" "$6" "$7" &
}
gen film-roll wedding8 "0;#chosen;#schedule;#rsvp" "0;#chosen;.sheet;#when;#schedule;.loc-grid;#costume;footer;#rsvp" '#d9d6cf' '#f1eee8' 'rgba(15,15,15,.45)'
wait
gen poster-type wedding9 "0;#info;#program;#rsvp" "0;#info;.photos;#count;#program;#dress;#rsvp;footer;#rsvpForm" '#f6c9bb' '#faf0e9' 'rgba(255,75,31,.4)'
wait
gen herbarium wedding10 "0;#letter;#places;#rsvp" "0;#letter;#when;#places;#log;#dress;#photos;footer;#rsvp" '#d9d0e4' '#f3efe6' 'rgba(80,60,120,.35)'
wait
gen neon-party birthday4 "0;#info;#lineup;#rsvp" "0;#info;#count;#lineup;.gal;#dress;.marquee;footer;#rsvp" '#3a1260' '#0d0816' 'rgba(255,46,147,.5)'
wait
gen space-kids birthday5 "0;#mission;#plan;#rsvp" "0;#mission;#launch;#plan;.crew;#dress;.cal;footer;#rsvp" '#2c3190' '#0d1033' 'rgba(0,0,40,.6)'
wait
echo ALLDONE
