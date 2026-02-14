pkgname=lianpkg-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg-${pkgver}::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('7ea12a5407c31e588cc4d62b495fd7301562dd1d37fe3c880d2496ebebba8bea')

package() {
  install -Dm755 "$srcdir/lianpkg-${pkgver}" "$pkgdir/usr/bin/lianpkg"
}

