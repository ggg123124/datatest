#!env perl
my $para_num = "2";
my $tpl_tid="0263";
my %para;
@checkpoints = ();
@appendixes = ();

$para{Linux_su_user} = $ARGV[0];
$para{Linux_su_password} = $ARGV[1];

# 检查项/点

$cmd{1} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep minlen`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep minlen;else echo \$ret1;fi;unset ret1";
$cmd{2} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep ucredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep ucredit;else echo \$ret1;fi;unset ret1";
$cmd{3} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep lcredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep lcredit;else echo \$ret1;fi;unset ret1";
$cmd{4} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep dcredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep dcredit;else echo \$ret1;fi;unset ret1";
$cmd{5} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep ocredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep ocredit;else echo \$ret1;fi;unset ret1";
$cmd{6} = "cat /etc/login.defs";
$cmd{7} = "cat /etc/login.defs";
$cmd{8} = "cat /etc/login.defs";
$cmd{9} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};'";
$cmd{10} = "cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep password";
$cmd{11} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$cmd{12} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$cmd{13} = "stat -c %a /etc/shadow";
$cmd{14} = "stat -c %a /etc/passwd";
$cmd{15} = "stat -c %a /etc/group";
$cmd{16} = "stat -c %a /etc/services";
$cmd{18} = "stat -c %a /etc/security";
$cmd{19} = "if [ -s /boot/grub/grub.cfg ];then stat -c %a /boot/grub/grub.cfg;elif [ -s /boot/grub/grub.conf ];then stat -c %a /boot/grub/grub.conf;elif [ -s /boot/grub2/grub.cfg ];then stat -c %a /boot/grub2/grub.cfg;elif [ -s /etc/grub.conf ];then stat -c %a /etc/grub.conf;elif [ -s /etc/grub2.cfg ];then stat -c %a /etc/grub2.cfg;else echo 600;fi";
$cmd{20} = "if [ -s  /etc/rc.d/init.d ];then stat -c %a /etc/rc.d/init.d ;else echo 600;fi";
$cmd{21} = "if [ -s /etc/rc.d/rc0.d ];then stat -c %a /etc/rc.d/rc0.d;else stat -c %a /etc/rc0.d;fi";
$cmd{22} = "if [ -s /etc/rc.d/rc1.d ];then stat -c %a /etc/rc.d/rc1.d;else stat -c %a /etc/rc1.d;fi";
$cmd{23} = "if [ -s /etc/rc.d/rc2.d ];then stat -c %a /etc/rc.d/rc2.d;else stat -c %a /etc/rc2.d;fi";
$cmd{24} = "if [ -s /etc/rc.d/rc3.d ];then stat -c %a /etc/rc.d/rc3.d;else stat -c %a /etc/rc3.d;fi";
$cmd{25} = "if [ -s /etc/rc.d/rc4.d ];then stat -c %a /etc/rc.d/rc4.d;else stat -c %a /etc/rc4.d;fi";
$cmd{26} = "if [ -s /etc/rc.d/rc5.d ];then stat -c %a /etc/rc.d/rc5.d;else stat -c %a /etc/rc5.d;fi";
$cmd{27} = "if [ -s /etc/rc.d/rc6.d ];then stat -c %a /etc/rc.d/rc6.d;else stat -c %a /etc/rc6.d;fi";
$cmd{28} = "ls -al /tmp | head -10";
$cmd{29} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$cmd{30} = "cat /etc/hosts.deny";
$cmd{31} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.info\" | grep \"/var/log/messages\";fi";
$cmd{32} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv\\.\\* \" | grep \"/var/log/secure\";fi";
$cmd{33} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd{34} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd{35} = "ps -ef | grep ssh | grep -v grep";
$cmd{36} = "systemctl status telnet.socket | grep Active";
$cmd{37} = "ps -ef | grep telnet | grep -v grep";
$cmd{38} = "cat /etc/ssh/sshd_config";
$cmd{39} = "cat /etc/pam.d/login | grep -v \"^[[:space:]]*#\" | egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"";
$cmd{40} = "if [ -s /etc/vsftpd.conf ];then cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable\";elif [ -s /etc/vsftpd/vsftpd.conf ]; then cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable\";fi";
$cmd{41} = "ps -ef | grep vsftpd | grep -v grep";
$cmd{42} = "if [ -s /etc/ftpusers ];then cat /etc/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\";elif [ -s /etc/vsftpd/ftpusers ]; then cat /etc/vsftpd/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\";fi";
$cmd{43} = "ps -ef | grep vsftpd | grep -v grep";
$cmd{44} = "if [ -s /etc/vsftpd.conf ];then cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"chroot_local_user\";elif [ -s /etc/vsftpd/vsftpd.conf ]; then cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"chroot_local_user\";fi";
$cmd{45} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd{46} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\"";
$cmd{47} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$cmd{48} = "cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\" | awk '{ORS=\",\"}{print \$0}';cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\" | awk '{ORS=\",\"}{print \$0}'";
$cmd{49} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$cmd{50} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$cmd{51} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$cmd{52} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\"";
$cmd{54} = "sysctl -n net.ipv4.ip_forward";
$cmd{55} = "sysctl -n net.ipv4.conf.all.send_redirects";
$cmd{56} = "sysctl -n net.ipv4.icmp_echo_ignore_broadcasts";
$cmd{57} = "sysctl -n net.ipv4.conf.all.accept_source_route";
$cmd{58} = "sysctl -n net.ipv4.conf.all.accept_redirects";
$cmd{59} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTSIZE\"";
$cmd{60} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\"";
$cmd{61} = "df /";
$cmd{62} = "unset rsyslogd_status LOGDIR;rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/\\*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;fi;unset rsyslogd_status LOGDIR";
$cmd{63} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;echo \"UIDMIN=\"\$up_uidmin;echo \"UIDMAX=\"\$up_uidmax;egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;unset up_uidmin up_uidmax";
$cmd{64} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;unset GID_MIN GID_MAX";
$cmd{65} = "ps -ef | grep vsftpd | grep -v grep";
$cmd{69} = "ssh_status=`ss -antp | grep -i listen | grep \":22\\>\" | wc -l`;
if [ \$ssh_status != 0 ] && [ -f /etc/motd ];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;unset ssh_status";
$cmd{70} = "systemctl is-active chronyd";
$cmd{71} = "if [ -f /etc/chrony.conf ];then cat /etc/chrony.conf | grep -v \"^[[:space:]]*#\" | grep -E '^\\s*(pool|server)\\s';fi";

push(@checkpoints, 1);
push(@checkpoints, 2);
push(@checkpoints, 3);
push(@checkpoints, 4);
push(@checkpoints, 5);
push(@checkpoints, 6);
push(@checkpoints, 7);
push(@checkpoints, 8);
push(@checkpoints, 9);
push(@checkpoints, 10);
push(@checkpoints, 11);
push(@checkpoints, 12);
push(@checkpoints, 13);
push(@checkpoints, 14);
push(@checkpoints, 15);
push(@checkpoints, 16);
push(@checkpoints, 18);
push(@checkpoints, 19);
push(@checkpoints, 20);
push(@checkpoints, 21);
push(@checkpoints, 22);
push(@checkpoints, 23);
push(@checkpoints, 24);
push(@checkpoints, 25);
push(@checkpoints, 26);
push(@checkpoints, 27);
push(@checkpoints, 28);
push(@checkpoints, 29);
push(@checkpoints, 30);
push(@checkpoints, 31);
push(@checkpoints, 32);
push(@checkpoints, 33);
push(@checkpoints, 34);
push(@checkpoints, 35);
push(@checkpoints, 36);
push(@checkpoints, 37);
push(@checkpoints, 38);
push(@checkpoints, 39);
push(@checkpoints, 40);
push(@checkpoints, 41);
push(@checkpoints, 42);
push(@checkpoints, 43);
push(@checkpoints, 44);
push(@checkpoints, 45);
push(@checkpoints, 46);
push(@checkpoints, 47);
push(@checkpoints, 48);
push(@checkpoints, 49);
push(@checkpoints, 50);
push(@checkpoints, 51);
push(@checkpoints, 52);
push(@checkpoints, 54);
push(@checkpoints, 55);
push(@checkpoints, 56);
push(@checkpoints, 57);
push(@checkpoints, 58);
push(@checkpoints, 59);
push(@checkpoints, 60);
push(@checkpoints, 61);
push(@checkpoints, 62);
push(@checkpoints, 63);
push(@checkpoints, 64);
push(@checkpoints, 65);
push(@checkpoints, 69);
push(@checkpoints, 70);
push(@checkpoints, 71);

$cmd_sec{1} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep minlen`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep minlen;else echo \$ret1;fi;unset ret1";
$cmd_sec{2} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep ucredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep ucredit;else echo \$ret1;fi;unset ret1";
$cmd_sec{3} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep lcredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep lcredit;else echo \$ret1;fi;unset ret1";
$cmd_sec{4} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep dcredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep dcredit;else echo \$ret1;fi;unset ret1";
$cmd_sec{5} = "ret1=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep ocredit`;if [ -z \"\$ret1\" ];then cat /etc/security/pwquality.conf | grep -v \"^[[:space:]]*#\" | grep ocredit;else echo \$ret1;fi;unset ret1";
$cmd_sec{6} = "cat /etc/login.defs";
$cmd_sec{7} = "cat /etc/login.defs";
$cmd_sec{8} = "cat /etc/login.defs";
$cmd_sec{9} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};'";
$cmd_sec{10} = "cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep password";
$cmd_sec{11} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$cmd_sec{12} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$cmd_sec{13} = "stat -c %a /etc/shadow";
$cmd_sec{14} = "stat -c %a /etc/passwd";
$cmd_sec{15} = "stat -c %a /etc/group";
$cmd_sec{16} = "stat -c %a /etc/services";
$cmd_sec{18} = "stat -c %a /etc/security";
$cmd_sec{19} = "if [ -s /boot/grub/grub.cfg ];then stat -c %a /boot/grub/grub.cfg;elif [ -s /boot/grub/grub.conf ];then stat -c %a /boot/grub/grub.conf;elif [ -s /boot/grub2/grub.cfg ];then stat -c %a /boot/grub2/grub.cfg;elif [ -s /etc/grub.conf ];then stat -c %a /etc/grub.conf;elif [ -s /etc/grub2.cfg ];then stat -c %a /etc/grub2.cfg;else echo 600;fi";
$cmd_sec{20} = "if [ -s  /etc/rc.d/init.d ];then stat -c %a /etc/rc.d/init.d ;else echo 600;fi";
$cmd_sec{21} = "if [ -s /etc/rc.d/rc0.d ];then stat -c %a /etc/rc.d/rc0.d;else stat -c %a /etc/rc0.d;fi";
$cmd_sec{22} = "if [ -s /etc/rc.d/rc1.d ];then stat -c %a /etc/rc.d/rc1.d;else stat -c %a /etc/rc1.d;fi";
$cmd_sec{23} = "if [ -s /etc/rc.d/rc2.d ];then stat -c %a /etc/rc.d/rc2.d;else stat -c %a /etc/rc2.d;fi";
$cmd_sec{24} = "if [ -s /etc/rc.d/rc3.d ];then stat -c %a /etc/rc.d/rc3.d;else stat -c %a /etc/rc3.d;fi";
$cmd_sec{25} = "if [ -s /etc/rc.d/rc4.d ];then stat -c %a /etc/rc.d/rc4.d;else stat -c %a /etc/rc4.d;fi";
$cmd_sec{26} = "if [ -s /etc/rc.d/rc5.d ];then stat -c %a /etc/rc.d/rc5.d;else stat -c %a /etc/rc5.d;fi";
$cmd_sec{27} = "if [ -s /etc/rc.d/rc6.d ];then stat -c %a /etc/rc.d/rc6.d;else stat -c %a /etc/rc6.d;fi";
$cmd_sec{28} = "ls -al /tmp | head -10";
$cmd_sec{29} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$cmd_sec{30} = "cat /etc/hosts.deny";
$cmd_sec{31} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.info\" | grep \"/var/log/messages\";fi";
$cmd_sec{32} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv\\.\\* \" | grep \"/var/log/secure\";fi";
$cmd_sec{33} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$cmd_sec{34} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$cmd_sec{35} = "ps -ef | grep ssh | grep -v grep";
$cmd_sec{36} = "systemctl status telnet.socket | grep Active";
$cmd_sec{37} = "ps -ef | grep telnet | grep -v grep";
$cmd_sec{38} = "cat /etc/ssh/sshd_config";
$cmd_sec{39} = "cat /etc/pam.d/login | grep -v \"^[[:space:]]*#\" | egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"";
$cmd_sec{40} = "if [ -s /etc/vsftpd.conf ];then cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable\";elif [ -s /etc/vsftpd/vsftpd.conf ]; then cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable\";fi";
$cmd_sec{41} = "ps -ef | grep vsftpd | grep -v grep";
$cmd_sec{42} = "if [ -s /etc/ftpusers ];then cat /etc/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\";elif [ -s /etc/vsftpd/ftpusers ]; then cat /etc/vsftpd/ftpusers | grep -v \"^[[:space:]]*#\" | grep \"\\broot\\b\";fi";
$cmd_sec{43} = "ps -ef | grep vsftpd | grep -v grep";
$cmd_sec{44} = "if [ -s /etc/vsftpd.conf ];then cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"chroot_local_user\";elif [ -s /etc/vsftpd/vsftpd.conf ]; then cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"chroot_local_user\";fi";
$cmd_sec{45} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$cmd_sec{46} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\"";
$cmd_sec{47} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$cmd_sec{48} = "cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\" | awk '{ORS=\",\"}{print \$0}';cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\" | awk '{ORS=\",\"}{print \$0}'";
$cmd_sec{49} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$cmd_sec{50} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$cmd_sec{51} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$cmd_sec{52} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\"";
$cmd_sec{54} = "sysctl -n net.ipv4.ip_forward";
$cmd_sec{55} = "sysctl -n net.ipv4.conf.all.send_redirects";
$cmd_sec{56} = "sysctl -n net.ipv4.icmp_echo_ignore_broadcasts";
$cmd_sec{57} = "sysctl -n net.ipv4.conf.all.accept_source_route";
$cmd_sec{58} = "sysctl -n net.ipv4.conf.all.accept_redirects";
$cmd_sec{59} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTSIZE\"";
$cmd_sec{60} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\"";
$cmd_sec{61} = "df /";
$cmd_sec{62} = "unset rsyslogd_status LOGDIR;rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/\\*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;fi;unset rsyslogd_status LOGDIR";
$cmd_sec{63} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;echo \"UIDMIN=\"\$up_uidmin;echo \"UIDMAX=\"\$up_uidmax;egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;unset up_uidmin up_uidmax";
$cmd_sec{64} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;unset GID_MIN GID_MAX";
$cmd_sec{65} = "ps -ef | grep vsftpd | grep -v grep";
$cmd_sec{69} = "ssh_status=`ss -antp | grep -i listen | grep \":22\\>\" | wc -l`;
if [ \$ssh_status != 0 ] && [ -f /etc/motd ];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;unset ssh_status";
$cmd_sec{70} = "systemctl is-active chronyd";
$cmd_sec{71} = "if [ -f /etc/chrony.conf ];then cat /etc/chrony.conf | grep -v \"^[[:space:]]*#\" | grep -E '^\\s*(pool|server)\\s';fi";

# 附录检查项

$appendix_cmd{1} = "uname -a 2>/dev/null";
$appendix_cmd{2} = "cat /etc/os-release";
$appendix_cmd{3} = "ip addr 2>/dev/null";
$appendix_cmd{4} = "df -m 2>/dev/null";
$appendix_cmd{5} = "cat  /etc/group 2>/dev/null | head -200";
$appendix_cmd{6} = "cat  /etc/shadow 2>/dev/null | head -200";
$appendix_cmd{7} = "last -100 2>/dev/null";
$appendix_cmd{8} = "lastb -100 2>/dev/null";
$appendix_cmd{9} = "netstat -anp 2>/dev/null | head -300";
$appendix_cmd{10} = "systemctl list-units --type=service | head -40";
$appendix_cmd{11} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";
$appendix_cmd{12} = "rpm -qa | head -100";
$appendix_cmd{13} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";

push(@appendixes, 1);
push(@appendixes, 2);
push(@appendixes, 3);
push(@appendixes, 4);
push(@appendixes, 5);
push(@appendixes, 6);
push(@appendixes, 7);
push(@appendixes, 8);
push(@appendixes, 9);
push(@appendixes, 10);
push(@appendixes, 11);
push(@appendixes, 12);
push(@appendixes, 13);

$appendix_cmd_sec{1} = "uname -a 2>/dev/null";
$appendix_cmd_sec{2} = "cat /etc/os-release";
$appendix_cmd_sec{3} = "ip addr 2>/dev/null";
$appendix_cmd_sec{4} = "df -m 2>/dev/null";
$appendix_cmd_sec{5} = "cat  /etc/group 2>/dev/null | head -200";
$appendix_cmd_sec{6} = "cat  /etc/shadow 2>/dev/null | head -200";
$appendix_cmd_sec{7} = "last -100 2>/dev/null";
$appendix_cmd_sec{8} = "lastb -100 2>/dev/null";
$appendix_cmd_sec{9} = "netstat -anp 2>/dev/null | head -300";
$appendix_cmd_sec{10} = "systemctl list-units --type=service | head -40";
$appendix_cmd_sec{11} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";
$appendix_cmd_sec{12} = "rpm -qa | head -100";
$appendix_cmd_sec{13} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";

 # 生成结果文件
sub add_point{
 my ($str, $flag, $command, $value, $tpl_tid)= @_;
 $str .= "    ".'<ck_'.$tpl_tid.'_'.'common_'.$flag.'>'."\n";
 $str .= "      ".'<cmd><![CDATA['.$command."]]></cmd>\n";
 $str .= "      <value><![CDATA[".$value."]]></value>\n";
 $str .= "    ".'</ck_'.$tpl_tid.'_'.'common_'.$flag.'>'."\n";
 return $str;}
sub add_appendix{
 my ($str, $flag, $command, $value, $tpl_tid)= @_;
 $str .= "    ".'<ck_'.$tpl_tid.'_'.'info_'.$flag.'>'."\n";
 $str .= "      ".'<cmd><![CDATA['.$command."]]></cmd>\n";
 $str .= "      <value><![CDATA[".$value."]]></value>\n";
 $str .= "    ".'</ck_'.$tpl_tid.'_'.'info_'.$flag.'>'."\n";
 return $str;}
 sub generate_xml{
 $ARGC = @ARGV;
if($ARGC lt 2){
 print qq{usag: 0263.pl <SU用户(SU或高权限用户)> <SU密码>};
exit;}
 my $date = `date +%Y-%m-%d`;
 chomp $date;
my $ipaddr = "";
my $ipaddr = `ifconfig | grep -oE 'inet[[:space:]]*(addr)?\.?([0-9]{1,3}\.?){4}' | grep -v 127 | grep -oE '([0-9]{1,3}\.?){4}' | head -n 1`;
chomp $ipaddr;
$ipaddr =~ s/^\s+|\s+$//g;
my $ipaddr2 = "";
my $ipaddr2 = `ip addr show | awk '/inet /{print \$2}' | cut -d/ -f1 | grep -v 127 | head -n 1`;
chomp $ipaddr2;
$ipaddr2 =~ s/^\s+|\s+$//g;
if($ipaddr eq ""){
 $ipaddr = $ipaddr2;
}
 my $xml_str = "";
 $xml_str .='<?xml version="1.0" encoding="UTF-8"?>'."\n";
 $xml_str .= '<root tid= "'.'0263'.'" level="'.'S3A3G3'.'" ip="'.$ipaddr.'" time="'.$date.'">'."\n";
 $xml_str .= '<ck_'.$tpl_tid.'_init_0>'."
<cmd><![CDATA[]]></cmd>
"."<value><![CDATA[]]></value>
".'</ck_'.$tpl_tid.'_init_0>'."
";
 foreach $key (@checkpoints){
 $value = $cmd{$key};
 $value_sec = $cmd_sec{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_str = &add_point( $xml_str, $key, $value_sec, $tmp_result, $tpl_tid );}  
 foreach $key (@appendixes){
 $value = $appendix_cmd{$key};
 $value_sec = $appendix_cmd_sec{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_str = &add_appendix( $xml_str, $key, $value_sec, $tmp_result, $tpl_tid );}
 $xml_str .= "</root>"."\n";
 $xmlfile = $ipaddr."_"."0263"."_chk.xml";
 print $xmlfile."\n";
 open XML,">/tmp/".$xmlfile or die "Cannot create ip.xml:$!";
 print XML $xml_str;
 print "end write xml\n";
 print "OK\n";}
 generate_xml();
