# Maintainer: Ayan De <deayan252@gmail.com>
pkgname=claude-config-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Cross-platform provider manager for Claude Code"
arch=('x86_64')
url="https://github.com/ayan-de/claude-config"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('claude-config')
conflicts=('claude-config')
options=('!strip')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Claude.Config_${pkgver}_amd64.deb")
sha256sums=('566a66ebf2ee17ae8634950c811f2a55b2a377fc5929ad25800f0ab2f12d2438')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
