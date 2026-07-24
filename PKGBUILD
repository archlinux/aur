# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=snapx-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Screenshot tool that handles images, text, and video - ShareX fork, Avalonia UI (upstream binary)"
arch=('x86_64')
url="https://github.com/SnapXL/SnapX"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('snapx-ui')
conflicts=('snapx-ui')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('d2098cac542bca82e68be0a4fa98db22f2d84d35c683d18582382dc9206eb5ee')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  cp -a "$srcdir/opt" "$pkgdir/"
}
