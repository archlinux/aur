# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shiori-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Simple bookmark manager built with Go (only the pre-compiled binary)."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/go-shiori/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_x86_64_$pkgver.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_arm_$pkgver.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_aarch64_$pkgver.tar.gz")
sha256sums_x86_64=('20552c4d91c720dc9786d73a7f5b68abd9ed32addb177861f89ea5d4e5937d3f')
sha256sums_armv7h=('a886e6b3e7171075c03e8ed880d9a035f21712d277a18ba497b1cce9e5ca5106')
sha256sums_aarch64=('ebfb94cc5ab955f379ec3af0b7194191f3989096ad37e7cb59e9ef3c12528fba')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
