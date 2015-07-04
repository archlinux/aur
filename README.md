pacmirror
=========
Update the pacman mirror list using reflector.

Commands
========
The available commands are backup and update. The backup command will copy the mirrorlist file to mirrorlist.backup. The update command will map the configuration to a reflector command, then run that command.

Configuration
=============
A sample configuration file is included in /etc/pacmirror/pacmirror.conf.sample. This should be copied to /etc/pacmirror/pacmirror.conf and edited to your liking. You may also specify a configuration file using the --conf or -c parameter. The reflector section maps directly to reflector command-line options, so view the documentation for reflector to see what each option will do. The pacmirror section includes some options for pacmirror. These options should be self-documenting, or commented where appropriate.
