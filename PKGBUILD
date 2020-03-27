# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=wikimedia-midi-files
pkgdesc="All MIDI files in the Wikimedia Commons collection."
pkgver=0.1.20200327
pkgrel=1
epoch=
arch=(x86_64)
url="https://commons.wikimedia.org/wiki/Category:MIDI_files"
license=(FDL)
groups=(midi-files)
depends=(commons-category-downloader)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

build() {
  pwd
  commons_category_downloader.sh "MIDI files"
}

package() {
  pwd
  mkdir -p "$pkgdir"/usr/share/midi/wikimedia-midi-files
  cp "*.mid" "$pkgdir"/usr/share/midi/wikimedia-midi-files
}
