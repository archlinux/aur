# Maintainer: Ayan De <deayan252@gmail.com>
pkgname=claude-config-bin
pkgver=0.9.0
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
sha256sums=('3849d70657a6263805dbcd00feacfd2c327fea2a5b97438f64da7e480e0c3271')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
