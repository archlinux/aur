# Maintainer: Jakub Szczerbowski <jakub.szczerbowski@wpia.uni.lodz.pl>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maciej Sitarz <macieks@freesco.pl>

pkgname=hyphen-pl
pkgver=20081206
pkgrel=6
pkgdesc='Polish hyphenation rules'
arch=('any')
url='https://wiki.documentfoundation.org/Development/Dictionaries'
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=("https://raw.githubusercontent.com/LibreOffice/dictionaries/master/pl_PL/hyph_pl_PL.dic")
md5sums=('a9ec853d1bf09f7989826500064384e1')

package() {
  install -Dm644 hyph_pl_PL.dic "$pkgdir"/usr/share/hyphen/hyph_pl_PL.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hyphen/hyph_pl_PL.dic -t "$pkgdir"/usr/share/myspell/dicts
}
