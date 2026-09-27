# Maintainer: mengh04 <mengh04@users.noreply.github.com>
pkgname=shotori
pkgver=0.12.0
pkgrel=1
pkgdesc="Wayland-first screenshot tool with built-in OCR, self-drawn UI via gpui-kit"
arch=('x86_64')
url="https://github.com/mengh04/shotori"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libxau' 'libxdmcp' 'libxkbcommon')
source=("shotori-${pkgver}-x86_64.tar.gz::https://github.com/mengh04/shotori/releases/download/v${pkgver}/shotori-v${pkgver}-x86_64.tar.gz")
sha256sums=('2d7267f2c09bcdcf985b9a5306ef2bdb15d16a8c96177cf1150f62fdd3d97559')

package() {
    install -Dm0755 shotori -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
