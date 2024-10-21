# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shiori-bin
pkgver=1.7.1
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
sha256sums_x86_64=('47190d66daeab7ed3a3813320b47effdd68cbc234663fcc16605e8dfcc173fc8')
sha256sums_armv7h=('9adfcb9ae510e195bbc264d94ad00568308e597ba7740e84ea065f1224e12ec7')
sha256sums_aarch64=('c3d9cd50bd85173edb713ec2b48ac5b92e80bcc8a0398a53eafe712ebd0c3531')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
