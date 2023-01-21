# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=shiori-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="Simple bookmark manager built with Go (only the pre-compiled binary)."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/go-shiori/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('e7d4ca6d92b0c90a0ff3a54f3b124db6409eff6c43c153cc955d3dc42111bada')
sha256sums_armv7h=('193b0c999a23cd63c09731b9e3f3363e71e4ceaafa9172723060b5516e920409')
sha256sums_aarch64=('a0285089d20dee0e5860a6d134df88c61a7240eef233cd706e6217400f9c5121')
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_armv7.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_aarch64.tar.gz")

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
