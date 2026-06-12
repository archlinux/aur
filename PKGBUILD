# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=hyphen-pt-br
pkgver=320
pkgrel=1
pkgdesc="Portuguese (Brazil) hyphenation rules"
arch=('any')
url="https://extensions.libreoffice.org/en/extensions/show/vero-verificador-ortografico-e-hifenizador-em-portugues"

license=('LGPL-2.1')
depends=('hyphen')

source=('https://extensions.libreoffice.org/assets/downloads/z/veroptbrv320aoc.oxt')

md5sums=('9a9ac174c401406604bfcf101de2a7ba')

package() {
  cd ${srcdir}
  install -D -m644 hyph_pt_BR.dic $pkgdir/usr/share/hyphen/hyph_pt_BR.dic
  mkdir -p $pkgdir/usr/share/myspell/dicts/
  cd $pkgdir/usr/share/myspell/dicts/
  ln -s /usr/share/hyphen/hyph_pt_BR.dic hyph_pt_BR.dic
}

# vim:set ts=2 sw=2 et:
