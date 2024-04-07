import os
import csv
import string

from ansible.module_utils.basic import AnsibleModule



def process_logfile(csv_file, log_file):
    """
    Process the logfile and extract information to be written to a CSV file.

    This function reads the contents of a logfile named "logfile.log" and extracts the information
    following the line containing 'PLAY RECAP'. It then writes this information to a CSV file named "output.csv".

    Args:
        None

    Returns:
        None
    """
    file = open(log_file, "r")
    lines = file.readlines()

    recap_information = ''

    # only get the last recap information
    for line in lines:
        if 'PLAY RECAP' in line:
            next_line = lines[lines.index(line) + 1]
            recap_information = next_line

    items = recap_information.split()
    file.close()

    if not os.path.exists(csv_file):
        header = ['Date', 'Time', 'p', 'User', 'n', 'Inventory', 'ok', 'changed', 'unreachable', 'failed', 'skipped', 'rescued', 'ignored']
        with open(csv_file, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(header)

    with open(csv_file, mode='a+', newline='') as file:
        writer = csv.writer(file)
        row = []
        for item in items:
            if '=' in item:
                item = item.split('=')[1]
            row.append(item)
        writer.writerow(row)


if __name__ == '__main__':
    # csv_file = "/Users/ronechen/Ansible/demos/Module_lineinfile/output.csv"
    # log_file = "logfile.log"
    # process_logfile(csv_file, log_file)

    fields = {
    "csv_file": {"required": True, "type": "str"},
    "log_file": {"required": True, "type": "str"}
    }

    module = AnsibleModule(argument_spec=fields)
    
    csv_file = os.path.expanduser(module.params['csv_file'])
    log_file = os.path.expanduser(module.params['log_file'])

    process_logfile(csv_file, log_file)

    module.exit_json(msg="Logfile processed successfully.")