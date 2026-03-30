pkgname=ripple
pkgver=1.0
pkgrel=1
pkgdesc="A simple, usable habit tracker"
arch=('x86_64')
url="https://zepyx.home.kg/ripple/"
license=('MIT')
depends=('python' 'python-gobject' 'webkit2gtk' 'gtk3')
source=('ripple.py' 'ripple.desktop' 'ripple.png')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 ripple.py "$pkgdir/usr/bin/ripple"
    install -Dm644 ripple.desktop "$pkgdir/usr/share/applications/ripple.desktop"
    install -Dm644 ripple.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ripple.png"
}
