# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=stardict-sme-nob  
pkgver=2.4.2
pkgrel=2 
pkgdesc="Vuosttaš Digisánit 1.0, a StarDict dictionary for Northern Sámi to Norwegian Bokmål"
url="http://giellatekno.uit.no/words/dicts/index.eng.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=()
optdepends=("stardict: a Gtk2 applicaton for looking up words in $pkgname"
            "qstardict: a Qt4 applicaton for looking up words in $pkgname")
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.divvun.no/static_files/smenob-stardict.dictionary.zip)
md5sums=('d1f4d71ee8d94140056273cb5ce732bf')
build() {
  cd $startdir/src
  mkdir -p usr/share/stardict/dic
  mv smenob-stardic.dictionary usr/share/stardict/dic
  cp -r usr $startdir/pkg
}
