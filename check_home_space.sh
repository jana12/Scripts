#!/bin/bash
#set -x
cd ~
#availspace=`(df -k|awk '{print $4}'|head -2|tail -1|sed 's/.$//')`;
availspace=`(df -k|awk '{print $4}'|head -2|tail -1)`;
#Humanread=`(df -k|awk '{print $4}'|head -2|tail -1|awk '{print substr($1,length($1),1)}')`;
echo $availspace;

Humanread=`echo "scale=5;$availspace/1048576"| bc` ;

#Humanread= awk "BEGIN '{print ($availspace / 1048576)}'"
echo $Humanread;

minspace=5242880;

if [ $availspace -gt $minspace ]
  then  echo "Available space is ${Humanread}GB for $USER. Which is greater than `echo "scale=3;$minspace / 1048576"| bc`GB"
else
   echo "Available space is ${Humanread}GB for $USER. Which is less than `echo "scale=3;$minspace / 1048576"| bc`GB"
fi
