# orad-bin

AUR package for **orad**, the Illumina DRAGEN ORA decompression tool. It converts
`*.fastq.ora` files back to `*.fastq.gz`. This is a repackaging of Illumina's
official prebuilt Linux binary (closed source) plus the bundled default human
reference genome.

## What gets installed

| Path | Contents |
| --- | --- |
| `/opt/orad/orad` | the `orad` executable |
| `/opt/orad/refbin` | bundled default **human** reference |
| `/usr/bin/orad` | symlink onto `PATH` |
| `/usr/share/licenses/orad-bin/` | Illumina EULA |
| `/usr/share/doc/orad-bin/` | upstream readme + release notes |

### Why `/opt` and not a split `/usr/lib` + `/usr/share` layout

`orad` locates its reference genome at runtime by reading `/proc/self/exe` and
searching that *real* directory for a `refbin` file. It does **not** look inside
an `oradata/` subdirectory for this exec-dir lookup (that is only auto-appended
for `$HOME/oradata`). So the reference must sit directly beside the binary, and
the two are kept together under `/opt/orad`. The `/usr/bin/orad` symlink is
resolved via `/proc/self/exe`, so running `orad` from `PATH` still finds the
bundled reference with **zero configuration**.

## Using other species / non-default references

Only the default human reference is bundled. To decompress files compressed
against another reference, download it from Illumina's
[ORA decompression reference files](https://support.illumina.com/downloads/ora-decompression-reference-files.html)
page, extract it, and point `ORA_REF_PATH` at the directory that directly
contains the `refbin` file(s):

```sh
export ORA_REF_PATH=~/oradata   # dir holding the downloaded refbin(s)
orad sample.fastq.ora
```

`orad` searches, in order: the current directory, `$ORA_REF_PATH`,
`$HOME/oradata`, `$HOME/lenadata`, and finally the executable's own directory.
The bundled human reference under `/opt/orad` therefore remains available as a
fallback even when `ORA_REF_PATH` is set for a different species.

## Building

```sh
makepkg -si          # build and install
updpkgsums           # refresh sha256sums after a version bump
makepkg --printsrcinfo > .SRCINFO   # regenerate before pushing to AUR
```

The package is large (~660 MB) because it embeds the ~785 MB human reference.
