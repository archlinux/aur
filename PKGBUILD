# Maintainer: Piyush Raj <piyushxcoder@gamil.com>
pkgname=folklore-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Viewer for superlore docs — desktop and web app, one codebase"
arch=('x86_64')
url="https://github.com/PiyushXCoder/folklore"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('folklore')
conflicts=('folklore')
source=("folklore_${pkgver}_amd64.deb::https://github.com/PiyushXCoder/folklore/releases/download/v${pkgver}/folklore_${pkgver}_amd64.deb")
sha256sums=('0aa150e6aad7083b4ef3a4d7323426f77521020dbf84973635be769b3f72b860')

package() {
  cd "$srcdir"
  ar x "folklore_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
