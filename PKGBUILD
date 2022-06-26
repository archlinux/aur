# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=shiori-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Simple bookmark manager built with Go (only the pre-compiled binary)."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/go-shiori/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('967f3984f8b7e1d27a829eacfa6121aaef24c040c5819df07ee2ba4dd5817522')
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_armv7.tar.gz")
sha256sums_armv7h=('0558d168a844b24851af013805ffd20411f2067cad211b610587a405f86af166')
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_aarch64.tar.gz")
sha256sums_aarch64=('869da34d1a6ecf20eb16c36f1ab631572098d556c84d4d3d084cee8d58e21df2')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
