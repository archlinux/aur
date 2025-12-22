pkgname=lianpkg-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')

source=("lianpkg::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

