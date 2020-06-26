#!/bin/bash
git config --global user.name "En3rgyBoy" | grep "chickenmcnugget"
git config --global user.email "piotrus.ucinski.haladyn@gmail.com" | grep "chickenmcnugget"
git init | grep "chickenmcnugget"
git remote add origin https://github.com/En3rgyBoy/1weekViewerCount.git | grep "chickenmcnugget"
git remote set-url origin https://En3rgyBoy:Bolek4312@github.com/En3rgyBoy/1weekViewerCount.git | grep "chickenmcnugget"
git pull origin master --rebase | grep "chickenmcnugget"
export Count=`cat Count.txt`
if test "$Count" = ""
then
echo 0 > Count.txt
export Count=`cat Count.txt`
fi
while :
do
echo "Count: $Count / 1008"
export vc=`curl 'https://www.googleapis.com/youtube/v3/videos?part=liveStreamingDetails&id=PL-GXzQU_x0&key=AIzaSyCE2Ufd4BnRwfycaYuGSYHb1KodWA8InPg' | grep "concurrentViewers"` && export date=`date +"%c"` && echo "$date | $vc" >> Viewers.txt
export Count=`expr $Count + 1`
if test "$Count" = "1009"
then
echo "Viewer Count Completed! Uploading to github!"
git add Viewers.txt | grep "chickenmcnugget"
git commit -a -m "Viewer file 1 week" | grep "chickenmcnugget"
git fetch | grep "chickenmcnugget"
git push -u origin master | grep "chickenmcnugget"
git fetch | grep "chickenmcnugget"
exit
else
echo $Count > Count.txt
sleep 10m
fi
done
