# triforce-oot

An Arch package of the [Triforce](https://triforceproject.com) build tools. Triforce turns your own Switch 2 dump of
*The Legend of Zelda: Ocarina of Time* into a native Linux program (a static recompilation drawn with Vulkan, no
emulator). This package is not made by the Triforce project; ask about the package here, about the game on their Discord.

**No game files are in this package.** You need your own dump: program `0400486024DEC000`, update v131072, as a `.nup`
or as `romfs` + `exefs` folders. Other versions are refused.

## Use

```sh
triforce-oot --check ~/my-dump.nup                  # is it the version Triforce supports?
triforce-oot --build ~/my-dump.nup                  # first build, into ~/Games/Triforce
triforce-oot --build ~/my-dump.nup --out ~/Games/oot --language en-GB
triforce-oot                                        # play (also "Triforce" in your applications menu)
triforce-oot --update                               # build the game folder again now
triforce-oot --help
```

A first build needs about 60 GB free while it runs. It takes from about 20 minutes on a 16-thread processor to two
hours or more on a 4-thread one, then the shaders are prepared for your graphics card. The game needs a Vulkan 1.3 card with mesh shaders and about 10 GB
of RAM.

## Updates

Update the package as usual. The next time you play, `triforce-oot` sees that your game was built with older tools and
builds the folder again from the game files it kept (a few minutes, no dump needed); it does the same when a system
update replaced a library the game links (FFmpeg).

## Where things are

| | |
|---|---|
| `/usr/lib/triforce-oot` | the tools (the Triforce source at the release tag, the parts a build reads), owned by pacman |
| your game folder | the `out=` line of `~/.config/triforce/builder.ini`; `--build` writes it |
| `~/.cache/triforce-build` | the build's work folder and compile cache (several GB; safe to delete, the next build makes it again) |
| `~/.local/share/hookshot` | your saves (written by the game) |

`pacman -R triforce-oot` removes only the tools: your game folder, saves and build cache stay until you delete them.
