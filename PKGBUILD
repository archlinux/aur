# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=lite-xl-jit-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="A lightweight text editor written in Lua (LuaJIT version)"
arch=('x86_64')
url="https://lite-xl.com"
license=('MIT')
source=("lite-xl-luajit-$pkgver.tar.gz::https://github.com/lite-xl/lite-xl/releases/download/v$pkgver/lite-xl-luajit-linux-$CARCH.tar.gz")
md5sums=("f97b95b46d8c95af61b148a3a9019045")
conflicts=('lite' 'lite-xl')
provides=('lite')

package() {
  cd lite-xl
  mkdir "${pkgdir}/usr"
  cp -R bin share "${pkgdir}/usr"
}
