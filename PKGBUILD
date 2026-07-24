# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=librepods-bin
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="AirPods liberated from Apple's ecosystem (prebuilt)"
arch=('x86_64')
url="https://github.com/librepods-org/librepods"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libpulse' 'openssl'
         'qt6-base' 'qt6-connectivity' 'qt6-declarative')
provides=('librepods')
conflicts=('librepods')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('69ce19414a0205d1d19fb851f6adea6c231013df6ec8a32bc8122d5fd6e9dd52')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
