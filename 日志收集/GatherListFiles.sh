#！/bin/bash
#-------------------------------------
#	dest: 移动文件中执行目录项到目标位置
#	auth: SlowFeiXu
# 	date: 22:28 2011/11/27
#-------------------------------------

source_file='/home/xufei/function/NoneMon.txt'
file_directory='/home/xufei/function'
file_dest='/home/xufei/function/tmp_test'

#收集日志文件：$1记录散落文件列表，$2搜寻目录，$3收集后放置文件的目录
function GatherListFiles(){
	
	`sed -i "s/'\r'/''/g" ${1}`

	if [[ -d ${3} ]]
	then
		`mkdir -p ${3}`
	fi

	while read line
	do
		for file_path in `find ${2} -name ${line}`
		do
			`cp -r ${file_path} ${3}`
			echo "copy ${line} to ${3}"
		done

	done < ${1}
}

function ${source_file} ${file_directory} ${file_dest}