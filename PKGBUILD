# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shiori-bin
pkgver=1.7.4
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
sha256sums_x86_64=('58c4588fc81ef7b80b7f5676a94771c1106d3941c8204d78cee0e8fa9047e396')
sha256sums_armv7h=('f95ab286d38f52c326f93f21eced1340aa52fad296cc44050e64a63940ef21ad')
sha256sums_aarch64=('dae73ee916769bfd7a7c8539226771f235f4a0215cd24e4efc56ca0f6765ad1f')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
