# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shiori-bin
pkgver=1.7.2
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
sha256sums_x86_64=('c0ff19289f0d33aea7d1660714e862cd78ef6f278ed5ea9899f06a774799663b')
sha256sums_armv7h=('7b263dcf13da28be53c5eb2bd94ce830b288b6f86e66d4fb73c6085ada7faf7c')
sha256sums_aarch64=('33759385b29b87b337d880939152f3f8d0e500844ed8b0bc695d74cf0a76befa')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
