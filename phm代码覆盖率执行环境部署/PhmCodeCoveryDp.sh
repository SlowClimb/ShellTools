#！/bin/bash
#-------------------------------------
#	dest: DP域中部署phm代码覆盖率统计环境
#	auth: SlowFeiXu
# 	date: 22:28 2011/12/4
#-------------------------------------
SD=`192.168.2.4`

`chmod 777 /lib/lib64/libctchota`
`chmod +x /usr/sbin/execution-manager`

`scp /usr/sbin/execution-manager root\@${SD}:/usr/sbin`
`scp /usr/lib/libctchota.so root\@${SD}:/usr/lib64`
`scp /usr/lib/libara_phm_server.so.3.11.0 root\@${SD}:/usr/lib`
`scp /usr/lib/libara_phm_client.so.3.13.0 root\@${SD}:/usr/lib`