#!/bin/bash
set -x
set -e
set -u

echo "============================"
echo "     SCRIPT START"
echo "============================"

###############################################################################

#5.4.4 Ensure default user umask is 027 or more restrictive
sed -e '/umask 027/d' -i /etc/profile
echo 'umask 027' >> /etc/profile

# 5.2.15 Ensure that strong Key Exchange algorithms are used
echo "KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256" >> /etc/ssh/sshd_config

# 4.1.3, 4.1.4, 4.1.5, 4.1.6, 4.1.7, 4.1.8, 4.1.9, 4.1.10, 4.1.11, 4.1.14, 4.1.15, 4.1.16, 4.1.17, 4.1.18
echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/rules.d/audit.rules
echo "-w /var/run/faillock/ -p wa -k logins" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> /etc/audit/rules.d/audit.rules
echo "-w /sbin/insmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "-w /sbin/rmmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "-w /sbin/modprobe -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> /etc/audit/rules.d/audit.rules
echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/rules.d/audit.rules
echo "-e 2" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/sudoers -p wa -k scope" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/sudoers.d/ -p wa -k scope" >> /etc/audit/rules.d/audit.rules
echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/selinux/ -p wa -k MAC-policy" >> /etc/audit/rules.d/audit.rules
echo "-w /usr/share/selinux/ -p wa -k MAC-policy" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "-w /var/run/utmp -p wa -k session" >> /etc/audit/rules.d/audit.rules
echo "-w /var/log/wtmp -p wa -k logins" >> /etc/audit/rules.d/audit.rules
echo "-w /var/log/btmp -p wa -k logins" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/issue -p wa -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/issue.net -p wa -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/hosts -p wa -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/sysconfig/network -p wa -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/sysconfig/network-scripts/ -p wa -k system-locale" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/group -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> /etc/audit/rules.d/audit.rules
echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/localtime -p wa -k time-change" >> /etc/audit/rules.d/audit.rules
# sed -i '1d' /etc/default/grub #remove the first line of the file
echo " " >> /etc/default/grub
echo "GRUB_CMDLINE_LINUX=\"audit=1\"" >> /etc/default/grub
echo "GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"" >> /etc/default/grub
# 4.1.3 Helper
grub2-mkconfig -o /boot/grub2/grub.cfg