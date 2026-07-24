# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=protonplus-bin
pkgver=0.5.22
pkgrel=1
pkgdesc="Modern compatibility tools manager (prebuilt)"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL-3.0-or-later')
depends=('gtk4' 'json-glib' 'libadwaita' 'libarchive' 'libgee' 'libsoup3'
         'hicolor-icon-theme')
provides=('protonplus')
conflicts=('protonplus')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('b5e0d6966c62f624017f0672688c3d57b2fda637ecbe47cc50dd043a92c52770')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
