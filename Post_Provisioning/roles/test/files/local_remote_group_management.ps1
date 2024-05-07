﻿
#Local Adminstrator & Remote Desktop Group Management - AME, APC, DC1,DC2,DC3, xa,xe,xp
Switch ({{ ansible_domain }})
{
Americas.abb.com{
	Add-LocalGroupMember -Group Administrators -Member 'abb\HPAM-TCS-Backup-Servers-Admins-RW', 'abb\HPAM-TCS-Wintel-Servers-Admins-RW', 'abb\HPAM-TCS-CC-Servers-Admins-RW', 'abb\xaqgscan', 'americas\abbitim-abb_dc2_admin_access_windows', 'americas\abbitim-abb_dc2_rdusers_access_windows', 'americas\tcsitim-tcsch_windows_team', 'americas\tcs-ame-win-srv', 'ABB\GLB-ABBCMDB', 'ABB\TCS-PAM-Scan' -ErrorAction SilentlyContinue
	write-log "Local Administrators added"
	Add-LocalGroupMember -Group "Remote Desktop Users" -Member 'Americas\abbitim-abb_dc2_rdusers_access_windows' -ErrorAction SilentlyContinue
	write-log "Remote Desktop Users added"
	}
Asiapacific.abb.com{
	Add-LocalGroupMember -Group Administrators -Member 'abb\HPAM-TCS-Backup-Servers-Admins-RW', 'abb\HPAM-TCS-Wintel-Servers-Admins-RW', 'abb\HPAM-TCS-CC-Servers-Admins-RW', 'abb\xpqgscan', 'asiapacific\abbitim-abb_dc3_admin_access_windows', 'asiapacific\abbitim-abb_dc3_rdusers_access_windows', 'asiapacific\tcsitim-tcsch_windows_team', 'asiapacific\tcs-apc-win-srv', 'ABB\GLB-ABBCMDB', 'ABB\TCS-PAM-Scan' -ErrorAction SilentlyContinue
	write-log "Local Administrators added"
	Add-LocalGroupMember -Group "Remote Desktop Users" -Member 'asiapacific\abbitim-abb_dc3_rdusers_access_windows' -ErrorAction SilentlyContinue
	write-log "Remote Desktop Users added"
	}
Europe.abb.com{
	Add-LocalGroupMember -Group Administrators -Member 'abb\HPAM-TCS-Backup-Servers-Admins-RW', 'abb\HPAM-TCS-Wintel-Servers-Admins-RW', 'abb\HPAM-TCS-CC-Servers-Admins-RW', 'abb\xeqgscan', 'asiapacific\abbitim-abb_dc1_admin_access_windows', 'asiapacific\abbitim-abb_dc1_rdusers_access_windows', 'asiapacific\tcsitim-tcsch_windows_team', 'asiapacific\tcs-eur-win-srv', 'ABB\GLB-ABBCMDB', 'ABB\TCS-PAM-Scan' -ErrorAction SilentlyContinue
	write-log "Local Administrators added"
	Add-LocalGroupMember -Group "Remote Desktop Users" -Member 'europe\abbitim-abb_dc1_rdusers_access_windows' -ErrorAction SilentlyContinue
	write-log "Remote Desktop Users added"
	}
}

