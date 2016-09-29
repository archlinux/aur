whitelist ${HOME}/scripts/fetchmail-real.sh
# whitelist ${HOME}/.fetchmailrc.gpg
# whitelist /tmp/fetchmailrc
whitelist ${HOME}/Mail
whitelist ${HOME}/.procmailrc.gmail
whitelist ${HOME}/.procmailrc.brown

noroot
private-dev
caps.drop all
seccomp
nogroups
nosound