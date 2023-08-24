#!/usr/bin/env bash

pages=(
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~73b9f224a6fd11eda25a0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~d45820f0a6c711eda3c0ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~93502930a6c811eda3c0ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~0c781426a6c911ed9ae20cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~6757305ca6c911ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~29a7dbcaa6ca11ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~8609a93aa6fb11ed9ae20cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~d0697828a6e911edb1f50cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~950ecf54a6ca11ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~16362e24a6cb11eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~af3af7c6a6cb11ed8b4e0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~2ed8b2caa6cc11ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~8fc067b8a6cc11edba5b0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~202d19cca6cd11ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~7891e2f0a6cd11ed8c6f0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~e59963cea6ea11eda3c0ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~ac12b28ea6ec11ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~fd0230f8a6cd11ed8980ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~b4cc71f0a6f411eda25a0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~f727a3cca6f311ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~cc6915a8a6ee11edb1f50cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~dcc7983ca6f011eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~fcf20ae4a6ef11ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~4f4d19e4a6ed11ed9ae20cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~f442228ca6cf11edba5b0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~0d4f471ca6fa11edbe29ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~3a812342a6f311eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~608221c2a6d011ed8d680cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~d4b90a7ea6d011ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~71764b88a6d111edba5b0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~18d5def2a6d211eda25a0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~4b116d70a6ee11eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~53952c2ca6dd11ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~c88e1cfaa6dd11ed8b4e0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~663b0f60a6ea11edbe29ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~327bc7a6a6df11ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~3bbbd562a6e011ed8c6f0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~5bd8452ea6ef11ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~2bb63b90a6f811ed8c6f0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~6258cae8a6f111ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~9800fce4a6e011eda3c0ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~ac3bec20a6e811edba5b0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~baf5fdbea6ed11edba63ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~f70dbe88a6fa11ed8c6f0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~03de5b32a6e111ed8b4e0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~6fc2756ca6e211eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~fec5d09ca6e211eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~978ba4c8a6e311edbc030cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~6f0392f6a6f511ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~0e87c6cea6e411eda9eeac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~f4769a50a6e611edb1f50cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~2bfbb63ca6e611ed82b7ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~65a6718ca6e711eda873ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~d73ef65ca6e711edba63ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~3ff2ba30a6e811ed93abac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~1abb5842a6f911ed8c6f0cc47ab5f122/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~4a02e968a6e911edbe29ac1f6b220ee8/"
"https://zpravy.aktualne.cz/domaci/praha-zmizela-pred-130-lety-byl-vydan-zakon-asanaci-casti-st/r~01ae3c32a6c411eda3c0ac1f6b220ee8/r~2ebee1e0a6ec11ed8b4e0cc47ab5f122/")

cntr=0
for str in ${pages[@]}; do

  cntr=$((++ctnr))

  echo "$cntr $str"

  curl --silent $str -o "$cntr.html"

  # description
  cat "$cntr.html" | htmlq --text ".gallery-slide__desc span" > "$cntr.txt"

  # image
  imgurl=`cat $cntr.html | htmlq -a src ".gallery-slide__image img"`

  imgurl="https:$imgurl"
  echo $imgurl

  curl --silent $imgurl -o "$cntr.jpg"

#  if [[ $cntr -eq 1 ]] then
#      exit 0
#  fi

done
