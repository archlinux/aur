# This build the fork of cavapify with spottify support

playerctl metadata mpris:artUrl points to an incorrect url.

I used sed to change the url to the correct one.

old url: open.spotify.com new url: i.scdn.co

About how I get the new url, I used inspect element on spotify web player to find it.

Currently upstream is not able to work and the source was changed to my temporary fork.

