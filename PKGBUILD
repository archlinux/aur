pkgname=lianpkg-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('490f35b8ebfd626d30ee99456c9e9723cdc62315a4b9a2bc86746bc1f85f96b3')

package() {
  install -Dm755 "$srcdir/lianpkg" "$pkgdir/usr/bin/lianpkg"
}

