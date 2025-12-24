pkgname=lianpkg-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')

source=("lianpkg::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_0.3.0_linux_x86_64")
sha256sums=('7e475643a46b0339ea2b417a2589db7af0fb8064ed9ade2e355c2af98a9bd384')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

