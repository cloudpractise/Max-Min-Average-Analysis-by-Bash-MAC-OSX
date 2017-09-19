#!/bin/bash
cd /Users/shiwan/Desktop/Report_Data
#begin to process the log of HQ GSIS Evening
echo HQ Evening > hq-evening.log 
cat HQ/gsis_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk  '{sum+=$1};END{printf "HQ_GSIS_Evening_Average: %i\n", sum/NR >> "hq-evening.log"}'
HQ_GSIS_Evening_Average=`cat hq-evening.log | grep HQ_GSIS_Evening_Average | cut -d ":" -f 2` 
cat HQ/gsis_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END{printf "HQ_GSIS_Evening_MAX: %i\n", max >> "hq-evening.log"}'
HQ_GSIS_Evening_MAX=`cat hq-evening.log | grep HQ_GSIS_Evening_MAX | cut -d ":" -f 2`
cat HQ/gsis_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk 'BEGIN {min = 999} {if ($1<min) min=$1 fi} END{printf "HQ_GSIS_Evening_MIN: %i\n", min >> "hq-evening.log"}'
HQ_GSIS_Evening_MIN=`cat hq-evening.log | grep HQ_GSIS_Evening_MIN | cut -d ":" -f 2`
HQ_GSIS_Evening_Lost=`cat HQ/gsis_7_evening.log | grep timed | wc -l`
echo HQ_GSIS_Evening_Lost is : $HQ_GSIS_Evening_Lost >> hq-evening.log
HQ_GSIS_Ping_Total=`cat HQ/gsis_7_evening.log | grep Reply | wc -l`
echo HQ_GSIS_Ping_Total is : $HQ_GSIS_Ping_Total >> hq-evening.log
HQ_GSIS_Evening_LostRate=`echo "scale=4; $HQ_GSIS_Evening_Lost / $HQ_GSIS_Ping_Total"| bc ` 
echo HQ_GSIS_Evening_LostRate is : $HQ_GSIS_Evening_LostRate >> hq-evening.log
# end
#begin to process the log of HQ AWS(new) Evening
cat HQ/new_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk  '{sum+=$1};END{printf "HQ_new_Evening_Average: %i\n", sum/NR >> "hq-evening.log"}'
HQ_new_Evening_Average=`cat hq-evening.log | grep HQ_new_Evening_Average | cut -d ":" -f 2` 
cat HQ/new_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END{printf "HQ_new_Evening_MAX: %i\n", max >> "hq-evening.log"}'
HQ_new_Evening_MAX=`cat hq-evening.log | grep HQ_new_Evening_MAX | cut -d ":" -f 2`
cat HQ/new_7_evening.log |grep Average| cut -d "=" -f 4 | sed 's/ms//'| awk 'BEGIN {min = 999} {if ($1<min) min=$1 fi} END{printf "HQ_new_Evening_MIN: %i\n", min >> "hq-evening.log"}'
HQ_new_Evening_MIN=`cat hq-evening.log | grep HQ_new_Evening_MIN | cut -d ":" -f 2`
HQ_new_Evening_Lost=`cat HQ/new_7_evening.log | grep timed | wc -l`
echo HQ_new_Evening_Lost is : $HQ_new_Evening_Lost >> hq-evening.log
HQ_new_Ping_Total=`cat HQ/new_7_evening.log | grep Reply | wc -l`
echo HQ_new_Ping_Total is : $HQ_new_Ping_Total >> hq-evening.log
HQ_new_Evening_LostRate=`echo "scale=4; $HQ_new_Evening_Lost / $HQ_new_Ping_Total"| bc ` 
echo HQ_new_Evening_LostRate is : $HQ_new_Evening_LostRate >> hq-evening.log
# end
