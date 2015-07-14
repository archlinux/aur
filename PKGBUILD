# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=stardict-sma-nob  
pkgver=2.4.2
pkgrel=1 
pkgdesc="Åarjelsaemien-daaroen digibaakoeh, a StarDict dictionary for Southern Sámi to Norwegian Bokmål and Swedish"
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
source=(http://www.divvun.no/static_files/smanob-stardict.dictionary.zip)
md5sums=('91781ae459ad82b95371a30d0f447075')
build() {
  cd $startdir/src
  mkdir -p usr/share/stardict/dic
  mv stardict-smanob_sd-2.4.2 usr/share/stardict/dic
  cp -r usr $startdir/pkg
}