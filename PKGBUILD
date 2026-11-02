# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=jankk-bin
_pkgname=jankk
pkgver=0.1.2
pkgrel=1
pkgdesc="A GBA game launcher and emulator frontend built with Qt and mGBA (prebuilt)"
arch=('x86_64')
url="https://github.com/Happilli/_jankk"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia-ffmpeg' 'qt6-svg' 'qt6-shadertools' 'libmgba' 'lua')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/Happilli/_jankk/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('4abfe9db751d235a06db16cf18d11e5d3feb331f1cf02e9df18e27be5567a23c')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
