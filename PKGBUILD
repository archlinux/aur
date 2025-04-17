# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-subtitle
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple and lightweight app for downloading subtitles for videos"
arch=('any')
url="https://github.com/Faugus/faugus-subtitle"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3')
provides=('faugus-subtitle')
conflicts=('faugus-subtitle')
source=("https://github.com/Faugus/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 faugus-subtitle.py "$pkgdir/usr/bin/faugus-subtitle"
    install -Dm644 faugus-subtitle.desktop "$pkgdir/usr/share/applications/faugus-subtitle.desktop"
    install -Dm644 faugus-subtitle.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-subtitle.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
