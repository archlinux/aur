pkgname=lianpkg-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg-${pkgver}::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('37941191dce31075f25acf797808b11f449ba9bf1d1ff7e4e8bca75c63060509')

package() {
  install -Dm755 "$srcdir/lianpkg-${pkgver}" "$pkgdir/usr/bin/lianpkg"
}

