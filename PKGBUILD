# Maintainer: Simon Désaulniers <rostydela@gmail.com>
pkgname='ca_multi'
pkgver='1.2'
pkgrel=4
pkgdesc="The canada multilingual keymap"
arch=('any')
groups=(system)
license=('GPL')
url='http://stellaire.ca/'
source=('ca_multi.map::https://gist.githubusercontent.com/sim590/fce9586bc9fbe6e88dcd/raw/9fe0f7d855f342e2bad1cada7240a8af7b1a741f/ca_multi.map')
sha256sums=('b739a806ca59b1f76fc42a9f9be87437a936491468a12a9f6dd722e597b2b382')

build() { cd ..; gzip ca_multi.map; }
package() {
  install -Dpv ../ca_multi.map.gz \
      ${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/ca_multi.map.gz
}
# vim: ts=2 sw=2 et:
