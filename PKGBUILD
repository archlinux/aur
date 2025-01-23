# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>
# Maintainer: tee < teeaur at duck dot com >

pkgname=shiori-bin
pkgver=1.7.3
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
sha256sums_x86_64=('0ec64e361b4dfddfb414a061ab89a9223578a3437730d76018997e1312941890')
sha256sums_armv7h=('92175193684f3c4114f56e9299e3375c6bced7c0922d4858afb938d21f8190f9')
sha256sums_aarch64=('556f0d70524280568ae8fc10310e9787e4ab4a15cc2abcbb3f2dd3afe034f3f1')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
