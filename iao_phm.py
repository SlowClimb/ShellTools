import re
import os

system_type = '1951'
tmp_config_path = r'D:\Normal\project\python\splipconfigs\phm_configs'
#configs types: new_gen.json、new_gen_sd.json、new_gen_new.json、new_gen_[1-9].json
case_path = r'/home/Solution_Test/Hubble/ftpd/ubuntu/AOS_AP_CMPT_PHM_Function_Action_001'

def delete_config_suffix(system_type = None, case_path = None):
    '''
    去掉ftpd目录下phm配置文件的平台相关后缀，删除平台无关文件
    :param self:
    :return:bool
    '''
    system_keyword = 'qemu' if system_type == 'qemu' else '1951'
    delete_keyword = 'qemu' if system_type != 'qemu' else '1951'

    config_path = os.path.join(case_path, 'config').replace('\\', '/')
    print(config_path)
    all_config_list = os.listdir(tmp_config_path)

    for single_file in all_config_list:
        if re.search(system_keyword, single_file):
            new_single_name = re.sub('_'+system_keyword, '', single_file)
            cmd = 'mv {0}/{1} {0}/{2}'.\
                format(config_path, single_file, new_single_name)
            print(cmd)
        elif re.search(delete_keyword, single_file):
            # 防止误删除new_gen_new.json
            cmd = 'rm -rf {0}/{1}'.format(config_path, single_file)
            print(cmd)

delete_config_suffix(system_type = system_type, case_path = case_path)