# Maintainer:  Tony Fettes <tonyfettes@tonyfettes.tk>

pkgname=tunasync-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
arch=('x86_64')
url="https://github.com/tuna/tunasync/releases"
license=('GPL3')
source=("tunasync-bin.tar.bz2::https://github.com/tuna/tunasync/releases/download/v${pkgver}/tunasync-linux-bin.tar.bz2")
md5sums=('cecf5d6a299548247d644da499d24f32')

package() {
  install -Dm755 "${srcdir}"/tunasync "${pkgdir}"/usr/bin/tunasync
  install -Dm755 "${srcdir}"/tunasynctl "${pkgdir}"/usr/bin/tunasynctl
}
