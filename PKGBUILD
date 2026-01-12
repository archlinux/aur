# Maintainer: Your Name <your.email@example.com>
pkgname=plasma-wechat-toggle
pkgver=1.0.0
pkgrel=1
pkgdesc="Toggle WeChat window on KDE Plasma Wayland"
arch=('any')
url="https://github.com/flobit/plasma-wechat-toggle"
license=('MIT')
depends=('bash' 'qt6-tools')  # qt6-tools 提供 qdbus6
optdepends=('wechat-universal-bwrap: WeChat for Linux')
install=plasma-wechat-toggle.install
source=("toggle-wechat.sh")
sha256sums=('296cb7ce7f24fc05654e997ac09b4fd17d80c0be63b7e7ab38c23f7477eb548f')

package() {
    install -Dm755 "$srcdir/toggle-wechat.sh" "$pkgdir/usr/bin/plasma-wechat-toggle"
}
