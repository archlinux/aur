# Maintainer: Piyush Raj <piyushxcoder@gamil.com>
pkgname=folklore-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Viewer for superlore docs — desktop and web app, one codebase"
arch=('x86_64')
url="https://github.com/PiyushXCoder/folklore"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('folklore')
conflicts=('folklore')
source=("folklore_${pkgver}_amd64.deb::https://github.com/PiyushXCoder/folklore/releases/download/v${pkgver}/folklore_${pkgver}_amd64.deb")
sha256sums=('a57e26dbe7fea20b695e9f36b8f7b3d178682c8e92ca9b6f412971746318559f')

package() {
  cd "$srcdir"
  ar x "folklore_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
