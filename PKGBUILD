# Maintainer:
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=openbox-themes
pkgver=1.0.2
pkgrel=4
pkgdesc='Various themes for the Openbox window manager.'
arch=('any')
url='http://www.debian.org'
license=('GPL')
depends=('openbox')
source=("http://ftp.debian.org/debian/pool/main/o/openbox-themes/openbox-themes_${pkgver}.tar.gz")
sha512sums=('b2c4af1f590cfc59da9135f974dd0e0ffebfe3427152b33fdd1ea209231fb5fd3d4c3207290f41b17c623cc0be93a0b5af614c9a74e1561262d5d7e66f9e2283')
source=("openbox-themes_${pkgver}.tar.gz::https://github.com/dbb/openbox-themes-deb/archive/v${pkgver}.tar.gz")
sha512sums=('705f4d0c33a83dc69b75ba1c5deaa5f38834f2cfe089550e15ef51df40eb7fffa272cbd2724c13245fcd4097afb302dcfca2483a95a0ff2f3616c8b2d5dff6ea')

package() {
  cd "${srcdir}/${pkgname}-deb-${pkgver}"

  install -d "${pkgdir}/usr/share/themes"
  rm -rf debian/
  cp -R * "${pkgdir}/usr/share/themes/"
}
