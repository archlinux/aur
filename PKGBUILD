# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=protonplus-bin
pkgver=0.5.21
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
sha256sums=('144992c7ad6a614cb05742ba2106cdc6a03329631fd64905932e11dd3636d7f2')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
