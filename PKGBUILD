# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=jankk-bin
_pkgname=jankk
pkgver=0.1.4
pkgrel=1
pkgdesc="A GBA game launcher and emulator frontend built with Qt and mGBA (prebuilt)"
arch=('x86_64')
url="https://github.com/Happilli/_jankk"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia-ffmpeg' 'qt6-svg' 'qt6-shadertools' 'libmgba' 'lua')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/Happilli/_jankk/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('d19d139611c7ba46b0e99e75a26fe2e77fdc6776d6d535e6e34b4c3fe9f50ba1')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
