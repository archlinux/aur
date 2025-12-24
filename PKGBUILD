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
sha256sums=('d2a33a626cedcc1ff0821219eeaf211417f5617d2d72671e370d7b44ef5d53cb')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

