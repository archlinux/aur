# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=mrswatson-bin
pkgver=0.9.8
pkgrel=1
pkgdesc="Convert MIDI files to WAV using VST plugins from the command-line"
arch=('i686' 'x86_64')
url="https://github.com/teragonaudio/MrsWatson"
license=('BSD')
optdepends=('wine: render windows vst plugins')

source_i686=(
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Linux/mrswatson
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Windows/mrswatson.exe
)
sha256sums_i686=(
ccc6635b652e3ab005e6cb47c4c732e5d34f2fc404129d18d26909437bd623e2
fdbbe8b8a5109a2b9beaec567799e4da5bd48fe7c2e37f250606a801364af726
)

source_x86_64=(
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Linux/mrswatson
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Linux/mrswatson64
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Windows/mrswatson64.exe
https://raw.githubusercontent.com/teragonaudio/MrsWatson/0.9.8/bin/Windows/mrswatson.exe
)
sha256sums_x86_64=(
ccc6635b652e3ab005e6cb47c4c732e5d34f2fc404129d18d26909437bd623e2
c88259c8c8b40f660f9ee9d29600649d44c2f604e0dc2339e8ac3f47606b1b53
dd5dd0b57cef935dd31d75d719c0078556a3b21278bd3bf2727ad4008f09c3c4
fdbbe8b8a5109a2b9beaec567799e4da5bd48fe7c2e37f250606a801364af726
)

package(){
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 $srcdir/* $pkgdir/usr/local/bin/
}
