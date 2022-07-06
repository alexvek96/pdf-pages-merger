#!/bin/bash
			# works for books with both odd or even number of total pages
file1=$1	# user inserts the 2 file names from keyboard
file2=$2
pages1=$(pdfinfo "$file1" | grep Pages | sed 's/[^0-9]*//')
pages2=$(pdfinfo "$file2" | grep Pages | sed 's/[^0-9]*//')
# making the script more user-friendly
echo "$file1 has $pages1 pages"
echo "$file2 has $pages2 pages"
echo "Executing merging of files '$file1' and '$file2'..."
let epages=1						# counter for the even pages
allpages=$(($pages1 + $pages2))
prev=$(($allpages-1))
let i=1								# counter for the odd pages
if [ $(($allpages%2)) -eq 1 ]; then
	while [ $i -lt $allpages ]
	do
		let next=$i
		let next+=1
		pdftk A=$file1 B=$file2 cat A1-$i B$epages A$next-end output original.pdf
		let epages+=1					# going for the next page of file with the even pages
		cp original.pdf ./helper.pdf	# cloning the new file to avoid error messages
		file1=helper.pdf				# updating $file1 gradually
		let i+=2
	done
else
	while [ $i -lt $allpages ]
	do
		let next=$i
		let next+=1
		if [ $i -eq $prev ]; then
			pdftk A=$file1 B=$file2 cat A1-$i B$epages output original.pdf
		else
			pdftk A=$file1 B=$file2 cat A1-$i B$epages A$next-end output original.pdf
		fi
		let epages+=1					# going for the next page of file with the even pages
		cp original.pdf ./helper.pdf	# cloning the new file to avoid error messages
		file1=helper.pdf				# updating $file1 gradually
		let i+=2
	done
fi
echo "-----Your original file is ready-----"
echo "File name: original.pdf"
