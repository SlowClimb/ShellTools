#！/bin/bash
#-------------------------------------
#	dest: 执行机中phm代码覆盖率统计部署环境
#	auth: SlowFeiXu
# 	date: 22:28 2011/12/4
#-------------------------------------

filepath='/home/xwx1110809/tools/TestWellCTC/ctc_function_060'
DP='192.168.1.3'

if [ ! -d ${filepath}]
then
	`echo "FilePath \[${filepath}\] not exist"`
fi

`chmod 777 ${filepath}/libctchota\.so`
`chmod +x ${filepath}/execution-manager`

#`cd /home/Solution_Test/Hubble/`
`cp ${filepath}/libara_phm_server.so.3.11.0 ./aos-linux/sysroot/usr/lib`
`cp ${filepath}/libara_phm_client.so.3.13.0 ./aos-linux/sysroot/usr/lib`
`cp ${filepath}/libctchota.so ./aos-linux/sysroot/usr/lib`
`cp ${filepath}/execution-manager /usr/sbin`

#拷贝ctc库到dp节点
`scp ${filepath}/libara_phm_server.so.3.11.0 root\@${DP}:/usr/lib`
`scp ${filepath}/libara_phm_client.so.3.13.0 root\@${DP}:/usr/lib`
`scp ${filepath}/libctchota.so root\@${DP}:/usr/lib64`
`scp ${filepath}/execution-manager root\@${DP}:/usr/sbin`

#安装特性类
#`cd /home/Solution_Test/Hubble/Sault/Sault3/featers/system`
`mv iaos_phm.py iaos_phm_bk.py`
`cp ${filepath}/iaos_phm.py ./`
`cd ../../`
`mv base.py base_bk.py`
`cp ${filepath}/base.py ./`
`cd ../`
`python3 setup.py install`

#修改makefile
`sed`
