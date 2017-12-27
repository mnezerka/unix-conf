#~/bin/bash
upower -e | grep BAT | xargs upower -i | grep perce
