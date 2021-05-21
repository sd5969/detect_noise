
while [ 1 ]
do
arecord -D plughw:1,0 -f cd -t wav -d 2 -r 16000 /home/pi/scripts/detect_noise/public/noise.wav
volume=$(sox /home/pi/scripts/detect_noise/public/noise.wav -n stats -s 16 2>&1 | awk '/^Max\ level/ {print $3}')
echo "<span>$volume</span>" > /home/pi/scripts/detect_noise/public/noise.html
echo $volume
done
