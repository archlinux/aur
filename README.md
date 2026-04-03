# noted
i guess i should write some docs for this thing. it's called noted. it takes notes. i was bored so i used libsodium for encryption because why not.

## how to build it
whatever, just run `make`. if you want it everywhere, `sudo make install`. it goes to `/usr/local/bin` because i didn't feel like putting it anywhere else.

## how to use it
i guess you have two main things. `write` and `read`.
- `noted write`: make a note. it'll ask for a password. just type something and remember it.
- `noted read`: look at your notes. you need the same password or it won't work. arrow keys move you around.

## flags i added
- `-v, --version`: tells you it's version 1.0.0. big deal.
- `-h, --help`: if you forget these commands.
- `-l, --list`: just lists the titles. fast.
- `-c, --clear`: wipe the whole database. i was bored of my old notes so i made this.
- `-e, --export`: dump it all to `noted_dump.txt`. 
- `-logo`: if you really want to see that ascii art over and over.

## where the data goes
it lives in `~/.local/share/noted/notes.db`. if it's not there, it'll make it. if you delete it, it's gone for good. i was too bored to make a backup command. maybe next time. probably not.

## license
mit or something. don't sue me, i'm just bored. i guess take the code as it is.
