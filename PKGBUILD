# Maintainer: Piyush Raj <piyushxcoder@gamil.com>
pkgname=folklore-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Viewer for superlore docs — desktop and web app, one codebase"
arch=('x86_64')
url="https://github.com/PiyushXCoder/folklore"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('folklore')
conflicts=('folklore')
source=("folklore_${pkgver}_amd64.deb::https://github.com/PiyushXCoder/folklore/releases/download/v${pkgver}/folklore_${pkgver}_amd64.deb")
sha256sums=('c4f85e7396f5c624517fde6b163f4a7f734af05e9a915833ff4676b1259ed0b4')

package() {
  cd "$srcdir"
  ar x "folklore_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
