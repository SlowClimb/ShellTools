#！/bin/bash
#-------------------------------------
#	dest: 移动文件中执行目录项到目标位置
#	auth: SlowFeiXu
# 	date: 22:28 2011/11/27
#-------------------------------------

source_file='/home/xufei/function/NoneMon.txt'
file_directory='/home/xufei/function'
file_dest='/home/xufei/function/tmp_test'

`sed -i "s/'\r'/''/g" ${file_dest}`

if [[ -d ${file_dest} ]]
then
	`mkdir -p ${file_dest}`
fi

while read line
do
	
	for file_path in `find ${file_directory} -name ${line}`
	do
		`cp -r ${file_path} ${file_dest}`
		echo "copy ${file_name} to ${file_dest}"
	done

done < ${source_file}