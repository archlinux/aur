# Maintainer: Ori <ori@proton.me>
# Contributor: Ori <ori@proton.me>

pkgname=rustick
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimalist productivity timer with system tray support"
arch=('x86_64')
url="https://github.com/rottioris/rustick"
license=('MIT')
depends=('libappindicator3-1' 'libwebkit2gtk-4.1-0' 'libgtk-3-0')
source=("https://github.com/rottioris/rustick/releases/download/v${pkgver}/Rustick_${pkgver}_amd64.deb")
sha256sums=('5f4c36c4219494d013989df5d9c5542cb8682570d9717ecdc8938d6807ce8be7')

package() {
  dpkg -x "${srcdir}/Rustick_${pkgver}_amd64.deb" "${pkgdir}/usr"
}