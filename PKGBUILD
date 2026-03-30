pkgname=ripple
pkgver=1.0
pkgrel=1
pkgdesc="Ripple habit tracker desktop app"
arch=('x86_64')
url="https://zepyx.home.kg/ripple/"
license=('MIT')
depends=('python' 'python-gobject' 'webkit2gtk' 'gtk3')
source=('ripple.py' 'ripple.desktop')
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 ripple.py "$pkgdir/usr/bin/ripple"
    install -Dm644 ripple.desktop "$pkgdir/usr/share/applications/ripple.desktop"
}
