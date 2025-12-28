pkgname=lianpkg-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('688da20927ba679c4b1576e7263ea478c95e0c7e3f4148285318092a7493e6b6')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

