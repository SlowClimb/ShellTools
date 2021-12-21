#!/bin/bash

sys_log=/home/xwx1110809/log/record.log

[ ! -d `dirname ${sys_log}` ] && mkdir -p `dirname ${sys_log}`
	rm -rf ${sys_log}

function log_info(){
	local date=`date`
	local para=$1
	echo "[INFO]: ${date} $1" >> ${sys_log}
}

function log_error(){
	local date=`date`
	local para=$1
	echo "[ERROR]: ${date} $1" >> ${sys_log}
}

#是否携带参数检测
str='bin_name -i 2 -p 100'
if [[ ${str} =~ ^[a-zA-Z0-9_]+$ ]]
then
	log_info "str has no para"
	para_list=""
else
	log_info "str has para : ${str}"
	para_list=`echo ${str} | awk '{if($NF>2){for(i=2;i<=$NF;i=i+1) printf $i " "}}'`
fi

