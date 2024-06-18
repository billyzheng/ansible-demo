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

def read_all_control_ids(file_path):
    file = open(file_path, "r")
    lines = file.readlines()
    control_ids = []

    for number in lines:
        if number not in control_ids:
            control_ids.append(number.strip())
    return control_ids

common_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_common/tasks/main.yml"
server_2019_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2019/tasks/main.yml"
server_2022_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2022/tasks/main.yml"
server_2016_path = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Windows/roles/windows_baseline_2016/tasks/main.yml"
all_control_ids = "C:/Users/CNROCHE33/Desktop/Rone/Ansible/ansible-demo/Andrews_baselines_CID"

common_ids = get_control_ids(common_path)
server_2019_ids = get_control_ids(server_2019_path)
server_2022_ids = get_control_ids(server_2022_path)
server_2016_ids = get_control_ids(server_2016_path)
common_ids += server_2019_ids
common_ids += server_2022_ids
common_ids += server_2016_ids

all_ids = read_all_control_ids(all_control_ids)

all_ids_set = set(all_ids)
all_implemented_ids_set = set(common_ids)

print(f'All control IDs: {len(all_ids_set)}')
print(f'Implemented control IDs: {len(all_implemented_ids_set)}')

print(f'Implemented control IDs but not in Andrews file: {len(all_implemented_ids_set - all_ids_set.intersection(all_implemented_ids_set))}')
print(sorted(all_implemented_ids_set - all_ids_set.intersection(all_implemented_ids_set)))

to_be_implemented_ids = all_ids_set - all_ids_set.intersection(all_implemented_ids_set)

# remove some control IDs that do not need to be implemented, which is due to the regular expression matching
to_be_implemented_ids.remove('11023')

# remove some control IDs that are not implemented, which is implemented in the other file
to_be_implemented_ids.remove('1115')
to_be_implemented_ids.remove('3377')
to_be_implemented_ids.remove('5241')

print(f'To be implemented control IDs: {len(to_be_implemented_ids)}')
print(sorted(to_be_implemented_ids))

print(f'Finish rate: {(len(all_implemented_ids_set) - len(all_implemented_ids_set - all_ids_set.intersection(all_implemented_ids_set))) / len(all_ids_set) * 100:.4}%')