
for f in *flac; do flac -cd "$f" | lame -h - "${f%.flac}.mp3"; done
