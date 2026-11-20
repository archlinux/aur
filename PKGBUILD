pkgname=lianpkg-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg-${pkgver}::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('19ac0693c58db1ef34d49abb0150580a84662d9f5045b002ce7bee06d06bc8fc')

package() {
  install -Dm755 "$srcdir/lianpkg-${pkgver}" "$pkgdir/usr/bin/lianpkg"
}

