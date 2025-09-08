# Maintainer: Surajit Sen <sensurajit@proton.me>
pkgname=pacguard
pkgver=1.0.0
pkgrel=2
pkgdesc="Check installed packages against Arch Security Tracker for known vulnerabilities"
arch=('any')
url="https://github.com/blackXploit-404/pacguard"
license=('MIT')
depends=('python' 'python-requests' 'pyalpm')
source=("pacguard")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/pacguard" "$pkgdir/usr/bin/pacguard"
}
