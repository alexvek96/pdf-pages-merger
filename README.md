Objectives:

1)	Given an original .pdf file, which has been separated into two separate .pdf files,
	each one including the odd-numbered and even-numbered pages respectively, write a bash
	script to rearrange the pages of the 2 separate .pdf files in the correct order.
	The goal is to recreate the original file with its pages in the correct order,
	using these 2 .pdf files.
	
2)	Your code must be operational on .pdf files that have both odd or even number of
	total pages, in their original form. DO NOT use the SHUFFLE command.
	
	
For this work, 2 books were selected:

	- Call of the Wild (Jack London) (85 pages), odd number of total pages
	- All around the Moon (Jules Verne) (262 pages), even number of total pages

Using pdftk command these 2 books were seperated into 2 .pdf files each, the first
having all the odd-numbered pages and the other having all the even-numbered pages of
the original one:

	callofwild.pdf → callodd.pdf & calleven.pdf
	jules.pdf → julesodd.pdf & juleseven.pdf

This bash script focuses only in the right order rearrangement of the pages, merging
the 2 sub-pdf files into the original one:

	callodd.pdf & calleven.pdf → callofwild.pdf
	julesodd.pdf & juleseven.pdf → jules.pdf
	
To achieve the goal, we use a "helper.pdf" file to gradually approach the original .pdf
file through the "file1.pdf" file. The final form of the "file1.pdf" is called "original.pdf"
and is the same with the authentic .pdf form of each book. If someone wants to check the whole 
procedure multiple times for different original .pdf files, they must remember to move the
finally produced "original.pdf" of each procedure to another file. If they don't, the new
"original.pdf" will replace the previous one by deleting it.