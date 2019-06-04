# Maintainer: Karol Babioch <karol@babioch.de

pkgname=check_systemd_failed
pkgver=1
pkgrel=1
pkgdesc="Simple script that will check for failed systemd units by parsing the output of systemctl(1)"
arch=('any')
url="https://github.com/kbabioch/check_systemd_failed"
license=('GPL3')
depends=('python')
makedepends=('git')
source=("git+https://github.com/kbabioch/check_systemd_failed.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
