pkgname=lianpkg-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')

source=("lianpkg::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg")
sha256sums=('bc8c1ee7325ba369fa7b561623103a0bf767580efed78d5977c99e0867e52674')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

