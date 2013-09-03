#determine folder prefix
scriptDir="${0%/*}/"
if [[ "$scriptDir" = "instaCD.bash/" ]]; then
	scriptDir="";
fi

dir=`perl ${scriptDir}instaCD.pl "$scriptDir" "$@"`
if [ -z $dir ]; then
	true
	#echo "nowhere to go"
else
	#echo "going to $dir"
	cd $dir
fi
