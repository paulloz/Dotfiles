#!/bin/bash
#================================================================================
### mixer-osd
#================================================================================

case $1 in
  
  volup) A="VOLUME: $(amixer set Master 5%+ | grep "Front Left:" | awk '{print $5}' | tr -d '[]')" ;;

  voldown) A="VOLUME: $(amixer set Master 5%- | grep "Front Left:" | awk '{print $5}' | tr -d '[]')" ;;

  mute)
    case $(amixer set Master toggle | grep "Front Left:" | awk '{print $6}' | tr -d '[]') in
      on) A="UNMUTED" ;;
      off) A="MUTED" ;;
    esac ;;

  *) echo "Usage: $0 { volup | voldown | mute }" ;;

esac

MUTESTATUS=$(amixer get Master | grep "Front Left:" | awk '{print $6}' | tr -d '[]')

if [ "$MUTESTATUS" == "off" ]; then
  OSDCOLOR=red; else
  OSDCOLOR=yellow
fi

killall aosd_cat &> /dev/null

echo "$A" | aosd_cat -n "Sans 20 bold" -o 3000 -R $OSDCOLOR -f 0
