#！/bin/bash
#-------------------------------------
#	dest: 单个用例多次执行并收集指定关键字
#	auth: SlowFeiXu
# 	date: 22:28 2011/12/5
#-------------------------------------

result='/home/xufei/result/result.txt'
logroot='/home/SoluteTest/Hubble/log/sault_log/manual'
targetlogfiles=`find ${logroot} -type d -name "AOS_AP_CMPT_Function_localSupervision*"`
keypoint_1='Terminal'
keypoint_2='ternimated'
exceptime=20

[ -d `dirname ${result}` ] || mkdir -p `dirname ${result}`
	`rm -rf ${result}`

for logfiledir in ${targetlogfiles}
do
	echo "start ${logfiledir}" >> ${result}
	logfile=`find ${logfiledir} -type f -name "AOS_AP_CMPT_Function_localSupervision.txt"`

	cat ${logfile} | grep "${keypoint_1}" >> ${result}
	startkilltime=`cat ${logfile} | grep "${keypoint_1}" | cut -d ":" -f 3 | cut -d " " -f 1`

	cat ${logfile} | grep "${keypoint_2}" >> ${result}
	endkilltime=`cat ${logfile} | grep "${keypoint_2}" | cut -d ":" -f 3 | cut -d " " -f 1`

	timespan=`expr ${endkilltime} - ${startkilltime}`
	
#	if [ cat ${logfile} | grep "{keypoint_1}" | wc -l -eq 0 ]
#	then
#		continue
#	fi

	if [ ${timespan} -gt ${exceptime} ]
	then
		echo "Error: ${logfiledir} runtime [${timespan}] timeout"
		echo "Error: ${logfiledir} runtime [${timespan}] timeout" >> ${result}
	else
		echo "Normal: ${logfiledir} runtime [${timespan}]"
		echo "Normal: ${logfiledir} runtime [${timespan}]" >> ${result}
	fi
	echo "end ${logfiledir}" >> ${result}
	echo "" >> ${result}
done
