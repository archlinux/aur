# Necessary to get Mutt working
whitelist ${HOME}/.mutt
whitelist ${HOME}/.muttrc
whitelist ${HOME}/.mutt_certificates
whitelist ${HOME}/.signatures
whitelist ${HOME}/.mailcap
whitelist ${HOME}/sent
whitelist ${HOME}/.mutt_cache
whitelist ${HOME}/Mail
whitelist ${HOME}/.gnupg

# To store files
whitelist ${HOME}/Downloads

whitelist /tmp/user/1000/emacs1000/
whitelist /tmp/user/1000/mutt1000/

noexec ${HOME}/
noexec /tmp/

# Enhance security

private-bin sh,mutt,mutt_dotlock,bash,emacsclient,elinks,gpg,gpg-agent,pinentry

# private-dev
whitelist /dev/stdout
whitelist /dev/stdin
whitelist /dev/stderr
whitelist /dev/urandom
whitelist /dev/random

private-etc Muttrc.d/,Muttrc,alternatives/,resolv.conf,ssl/,mime.types
noroot
caps.drop all
seccomp.keep open,access,prctl,fstat,mmap,write,read,close,munmap,chown,unshare,fcntl,execve,brk,mprotect,arch_prctl,getpid,getuid,getgid,geteuid,getegid,rt_sigprocmask,rt_sigaction,uname,stat,getppid,getpgrp,getrlimit,getpeername,set_tid_address,set_robust_list,futex,getrusage,umask,ioctl,socket,connect,lseek,getsid,pipe,clone,dup2,wait4,openat,rt_sigreturn,getdents,exit_group,faccessat,lstat,pread64,pwrite64,ftruncate,select,unlink,mkdir,link,rmdir,alarm,readlink,sendto,fdatasync,recvfrom,chmod,getcwd,setrlimit,utime,mlock,clock_gettime,setresgid,chdir,fsync,nanosleep,poll,sendmmsg,bind,getsockname,recvmsg,writev,mremap,rename,truncate,sched_yield,sysinfo,kill,sendmsg,setresuid,setsid,listen,pselect6,accept,getsockopt,tgkill,madvise,exit,statfs,getrandom,fchmod,fchown,gettid
nogroups
