# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=0.6
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=(any)
url="https://github.com/leveson/bat"
license=('MIT')
makedepends=('go')
provides=('bat')
source=("https://github.com/leveson/bat/releases/download/${pkgver}/bat")
sha256sums=('1756a983776cf4f6bd92f7a6a813890f8348006411affa54437e4fe976683570')

package() {
  install -Dvm755 "${srcdir}/bat" -t "${pkgdir}/usr/bin"
}
