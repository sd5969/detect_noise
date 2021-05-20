
while [ 1 ]
do
arecord -D plughw:1,0 -f cd -t wav -d 2 -r 16000 /tmp/noise.wav
volume=$(sox /tmp/noise.wav -n stats -s 16 2>&1 | awk '/^Max\ level/ {print $3}')
echo $volume > /tmp/noise
echo $volume
done
