# Maintainer:
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maciej Sitarz <macieks@freesco.pl>

pkgname=hyphen-pl
pkgver=20081206
pkgrel=3
pkgdesc='Polish hyphenation rules'
arch=('any')
url='http://extensions.services.openoffice.org/en/project/pl-dict'
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=('https://downloads.sourceforge.net/project/aoo-extensions/806/4/pl-dict.oxt')
md5sums=('a69f9221864b1360e38ff3f0b0cc9222')
sha1sums=('d5704efc735f5492284e8b9cd2ea717a700033c3')

package() {
  install -Dm644 hyph_pl_PL.dic "$pkgdir"/usr/share/hyphen/hyph_pl_PL.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hyphen/hyph_pl_PL.dic -t "$pkgdir"/usr/share/myspell/dicts
}
