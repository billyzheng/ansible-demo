import os
import re

def get_control_ids(file_path):
    file = open(file_path, "r")
    lines = file.readlines()
    control_ids = []

    for line in lines:
        match = re.search(r'\bwin_baseline_(\d+)_state', line)
        if match:
            number = match.group(1)  # 提取捕获组中的数字
            if number.isdigit():
                if number not in control_ids:
                    control_ids.append(number)
    return control_ids

# file = open("C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_common/vars/main.yml", "r")
# lines = file.readlines()
# control_ids = []

# for line in lines:
#     match = re.search(r'\bwin_baseline_(\d+)_state', line)
#     if match:
#         number = match.group(1)  # 提取捕获组中的数字
#         if number.isdigit():
#             if number not in control_ids:
#                 control_ids.append(number)

common_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_common/vars/main.yml"
server_2019_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2019/vars/main.yml"
server_2022_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2022/vars/main.yml"
server_2016_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2016/vars/main.yml"

common_ids = get_control_ids(common_path)
print(len(common_ids))

server_2019_ids = get_control_ids(server_2019_path)
print(len(server_2019_ids))

server_2022_ids = get_control_ids(server_2022_path)
print(len(server_2022_ids))

server_2016_ids = get_control_ids(server_2016_path)
print(len(server_2016_ids))

common_ids += server_2019_ids
common_ids += server_2022_ids
common_ids += server_2016_ids

print(len(common_ids))
