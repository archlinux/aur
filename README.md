#arch-phpsh-git
Arch Package for phpsh, a tool originally created by Facebook for running PHP as an interactive shell. Because phpsh is no longer in active development, the arch version relies on a fork (https://github.com/DerekTBrown/phpsh) with updates to accomodate more modern versions.

##Dependencies
phpsh relies on a working version of PHP5+, pcntl, pcre, posix and tokenizer. Many of these packages are built into the arch php and php-cgi packages, but some must be compiled manually into php. Because this poses a conflict with existing php installations, arch-phpsh will not install these for you. You must already have a working php installation with the above dependencies installed in order for arch-phpsh to work.
