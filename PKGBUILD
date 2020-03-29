# Maintainer:  Tony Fettes <tonyfettes@tonyfettes.tk>

pkgname=tunasync-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
arch=('x86_64')
url="https://github.com/tuna/tunasync/releases"
license=('GPL3')
source=("tunasync-bin.tar.bz2::https://github.com/tuna/tunasync/releases/download/v${pkgver}/tunasync-linux-bin.tar.bz2")
md5sums=('6b9a031b32f7a7efc1307f5b6c6ef920')

package() {
  install -Dm755 "${srcdir}"/tunasync "${pkgdir}"/usr/bin/tunasync
  install -Dm755 "${srcdir}"/tunasynctl "${pkgdir}"/usr/bin/tunasynctl
}
