# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=stardict-fkv-nob  
pkgver=2.4.2
pkgrel=1 
pkgdesc="Kvääni-norja sanakirja, a StarDict dictionary for Kven to Norwegian Bokmål and back again"
url="http://giellatekno.uit.no/words/dicts/index.eng.html"
arch=('i686', 'x86_64')
license=('unknown')
depends=()
optdepends=("stardict: a Gtk2 applicaton for looking up words in $pkgname"
            "qstardict: a Qt4 applicaton for looking up words in $pkgname")
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.divvun.no/static_files/fkvnobfkv-stardict.dictionary.zip)
md5sums=('34152e5f0079937ed383c0b86fdd5edb')
build() {
  cd $startdir/src
  mkdir -p usr/share/stardict/dic
  mv stardict-fnf_sd-2.4.2 usr/share/stardict/dic
  cp -r usr $startdir/pkg
}