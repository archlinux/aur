# notify-when-done-i3

![Sample screenshot](https://i.imgur.com/qmW2BGt.png)

## Install

You need `libnotify`, `bash-preexec` and must use `i3` as a window manager.

If you have archlinux, you can download the package from the aur

    https://aur.archlinux.org/packages/notify-when-done-i3-git/

or for other distributions

    git clone https://github.com/giuscri/notify-when-done-i3 nwd
    cd nwd
    mkdir ~/.nwd
    cp nwn-preexec.sh ~/.nwd/nwd-preexec.sh
    echo '[[ -f ~/.nwd/nwd-preexec ]] && source ~/.nwd/nwd-preexec.sh' >> ~/.bashrc

## The problem

Some commands take very long time to execute that you either stare at the screen doing nothing
waiting for them to complete, or you totally forget them after you started browsing twitter.

## Solution 1

`notify-send` is easy to use. Just `alias ndone=notify-send "Long cmd fininshed"`,
and append the alias after any *long* command that you will execute.

The problem with this solution is that most of the time you don't know if the
command you're typing will take very long to execute.

What happens instead is that you realize some command will execute for a long time
*after* the command has been issued. ~~Also when you notice that you don't have
the courage to interrupt the execution to append the alias, since who knows?,
maybe is going to finish in 10 seconds from now - instead it will take another 2, 3 minutes.~~
(EDIT: [/u/HidariRyoushin](https://www.reddit.com/user/HidariRyoushin) made me notice that
you can just suspend the command and restart it via `fg; ndone`)

Moreover, the fact that you have to append a command after every command is boring,
and you'll eventually forget to do that, until you'll stumble into a long command again.

## Solution 2 (provided by this package)

Wrap *every* command, such that when one command finishe execution,
a notification will be sent if the current workspace is not the same
from which you initially issued the command. Simple as pie.

## Sound

Sound should not be handled by this script. Instead, it's likely
that your notification server already has some way of playing
a sound every time a notification is issued. Dunst has one for example.

If you need a notification sound, you can find a .wav one, base64 encoded, here

    https://gist.githubusercontent.com/giuscri/621bddfe5600d3f08e2b0b385db48a3b/raw/916ca26bc8c8fb4d8b343850e1b6cac2ffcdbedd/sound.wav.b64

## Troubleshooting

+ If you're using dunst as a notification server and for any curl
command you seem a strange `(U)` prepended, that's actually a dunst
feature: https://github.com/dunst-project/dunst/blob/master/docs/dunst.pod#actions
I didn't want to use this feature: you can disable it via `show_indicators=no`
in your dunstrc
