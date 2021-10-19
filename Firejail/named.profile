# Firejail profile for BIND 9 (named)
# Description: Authoritative DNS Server and DNS resolver
name named

# Persistent local customizations
include named.local

# Persistent global definitions
include globals.local

noblacklist /sbin
noblacklist /usr/sbin

blacklist /tmp/.X11-unix
blacklist ${RUNUSER}/wayland-*

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-passwdmgr.inc
include disable-programs.inc
include disable-xdg.inc

include whitelist-usr-share-common.inc

whitelist /etc/bind
whitelist /etc/passwd
whitelist /var/cache/bind
whitelist /var/run

caps.keep net_admin,net_bind_service,setgid,setuid,sys_chroot,sys_resource
ipc-namespace
machine-id
netfilter
no3d
nodvd
nonewprivs
nosound
notv
nou2f
novideo
protocol inet,inet6,unix,netlink
seccomp.drop _sysctl,acct,add_key,adjtimex,clock_adjtime,delete_module,fanotify_init,finit_module,get_mempolicy,init_module,io_cancel,io_destroy,io_getevents,io_setup,io_submit,ioperm,iopl,kcmp,kexec_file_load,kexec_load,keyctl,lookup_dcookie,mbind,migrate_pages,modify_ldt,mount,move_pages,open_by_handle_at,perf_event_open,perf_event_open,pivot_root,process_vm_readv,process_vm_writev,ptrace,remap_file_pages,request_key,set_mempolicy,swapoff,swapon,sysfs,syslog,umount2,uselib,vmsplice

disable-mnt
private
private-dev
private-tmp
writable-var

dbus-user none
dbus-system none

# mdwe can break modules/plugins
memory-deny-write-execute
