#! /bin/sh

if [ -e index.html ]; then 
	rm index.html
fi

#DIRS=`ls --format=single-column`
ls --format=single-column > /tmp/a.txt

cat << __EOF__ > index.html
<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.0 Transitional//EN\>
<HTML>
<HEAD>
	<META HTTP-EQUIV=\"CONTENT-TYPE\" CONTENT=\"text/html; charset=utf-8\">
	<TITLE></TITLE>
	<style type="text/css">
         	table{border-collapse:collapse} td{ border:1px solid #999999}
		body {color:#FFFFFF; background-color:#000000;}
        </style>  
</HEAD>
<BODY LANG=en-CA\" DIR=\"LTR\">
__EOF__

##########################################################################
# ??3???????????, ??????????????? 

#cat /tmp/a.txt | while read line
#sed -n p /tmp/a.txt | while read line
grep ^ /tmp/a.txt | while read line; do 
	i=$line
	echo "<P STYLE=\"margin-bottom: 0cm\"><A HREF=\"./${i}\">${i}</A></P>" >> index.html
done

#while read line
#do
#	echo $line
#done < "input_file"
#??????
#?????subshell


#for i in $DIRS ; do
#	echo "<P STYLE=\"margin-bottom: 0cm\"><A HREF=\"./${i}/\">${i}</A></P>" >> index.html
#done


echo "</BODY>" >> index.html
echo "</HTML>" >> index.html
