# notify-when-done-i3

![Sample screenshot](http://i.imgur.com/qZeSuOt.png)

## Install

You need `jq`, `libnotify`, and must use `i3` as a window manager.

If you have archlinux, you can download the package from the aur

    https://aur.archlinux.org/packages/notify-when-done-i3-git/

or for other distributions

    git clone https://github.com/giuscri/notify-when-done-i3 nwd
    cd nwd
    mkdir ~/.nwd
    cp nwn-preexec.sh ~/.nwd/nwd-preexec.sh
    echo '[[ -f ~/.nwd/nwd-preexec ]] && source ~/.nwd/nwd-preexec.sh' >> ~/.bashrc
    source ~/.bashrc

## The problem

Some commands take very long time to execute that you either stare at the screen doing nothing
waiting for them to complete, or you totally forget them after you started browsing twitter.

## Solution 1

`notify-send` is easy to use. Just `alias ndone=notify-send "Long cmd fininshed"`,
and append the alias after any *long* command that you will execute.

The problem with this solution is that most of the time you don't know if the
command you're typing will take very long to execute.

What happens instead is that you realize some command will execute for a long time
*after* the command has been issued. Also when you notice that you don't have
the courage to interrupt the execution since who knows?, maybe is going to finish
in 10 seconds from now - instead it will take another 2, 3 minutes.

Moreover, the fact that you have to append a command after every command is boring,
and you'll eventually forget to do that, until you'll stumble into a long command again.

## Solution 2 (provided by this package)

Wrap *every* command, such that when one command finishe execution,
a notification will be sent if the current workspace is not the same
from which you initially issued the command. Simple.
