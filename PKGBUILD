# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=shiori-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Simple bookmark manager built with Go (only the pre-compiled binary)."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/go-shiori/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_x86_64.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_arm.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_Linux_aarch64.tar.gz")
sha256sums_x86_64=('c5bd6d70d246a26eb242235b7dc172084100e673c777616eb7e15803e1ab23b5')
sha256sums_armv7h=('c175c9f44389f628045a06277434c7272817e76737b26063767714db38b0e7aa')
sha256sums_aarch64=('6c0045df8c9dd3e711b6702c078fc3aa49072bf53014f6c9375899d111e1dd56')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
