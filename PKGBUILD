# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=hyphen-pt-br
pkgver=213
pkgrel=3
pkgdesc="Portuguese (Brazil) hyphenation rules"
arch=('any')
url="http://pt-br.libreoffice.org/projetos/projeto-vero-verificador-ortografico/"
license=('LGPL-2.1')
depends=('hyphen')
source=(http://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/hyphptBR-${pkgver}.zip)
md5sums=('498a4ec7976a814f7411f5540cbedece')

package() {
  cd ${srcdir}
  install -D -m644 hyph_pt_BR.dic $pkgdir/usr/share/hyphen/hyph_pt_BR.dic
  mkdir -p $pkgdir/usr/share/myspell/dicts/
  cd $pkgdir/usr/share/myspell/dicts/
  ln -s /usr/share/hyphen/hyph_pt_BR.dic hyph_pt_BR.dic
}

# vim:set ts=2 sw=2 et:
