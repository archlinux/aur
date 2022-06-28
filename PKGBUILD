# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=bzr
pkgver=2.7.0.rip
pkgrel=666
pkgdesc='DEPRECATED, replaced by breezy'
arch=('any')
url='https://bazaar.canonical.com/'
license=('GPL')
depends=('sh')
source=('bzr.sh')
b2sums=('1413a5ffe3c03d0c2eee5717b0f8846137e7d42ccf14a617b2e6fb437db1ce1afe2e7866484767dd078db52cb669779bc8aa85252d9dbea6d001c294cc9f2418')

package() {
  install -Dm 755 'bzr.sh' "${pkgdir}/usr/bin/bzr"
}
