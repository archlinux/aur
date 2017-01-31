# Swiss Army Scrot

This is a multi-call bash script for taking screenshots conveniently.

## Usage

The following commands are available:

### copy-window and copy-screen

Takes a screenshot of either the focused window or the entire screen and puts
it in your clipboard.

### save-window and save-screen

Same as above, except the screenshot is saved to $HOME.

## Setup

If you're on Arch Linux, you can install the swiss-army-scrot package from the
AUR.

There aren't any packages for other systems, but the script should work on any
Linux system that has bash, scrot and xclip installed. Here's how to install it
from Git:

```sh
git clone https://gitla.in/flisk/swiss-army-scrot.git
cd swiss-army-scrot
ln -s "$PWD/swiss-army-scrot.sh" /usr/local/bin/{copy,save}-{window,screen}
```
