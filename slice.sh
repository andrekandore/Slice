for file in *.png
do
	filename=$(echo $file | cut -f1 -d-)
	densityAndExtension=$(echo $file | cut -f2 -d-)

	if [[ $densityAndExtension == *9\.png* ]]
	then
		density=$(echo $densityAndExtension | cut -f1 -d.)
		density=$(echo "drawable-"$density) 
		extensionBase=$(echo $densityAndExtension | cut -f2 -d.)
		extension=$(echo $densityAndExtension | cut -f3 -d.)
		newFileName=$(echo $filename.$extensionBase.$extension)
	else
		density=$(echo $densityAndExtension | cut -f1 -d.)
		if [[ $density == *dpi* ]] 
		then
			density=$(echo "drawable-"$density) 
		fi
		extension=$(echo $densityAndExtension | cut -f2 -d.)
		newFileName=$(echo $filename.$extension)
	fi

	newFileLocation=$(echo $density/$newFileName)

#	echo "$filename" 
#	echo "$density"
#	echo "$extension"
#	echo "$newFileName"

	mkdir $density
	rm -f $newFileName

	mv $file $newFileName
	mv $newFileName $newFileLocation
done