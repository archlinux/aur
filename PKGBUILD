# Maintainer: Karol Babioch <karol@babioch.de

pkgname=check_systemd_status
pkgver=2
pkgrel=1
pkgdesc="Script to check current system state as perceived by systemd"
arch=('any')
url="https://github.com/kbabioch/check_systemd_status"
license=('GPL3')
depends=('python')
makedepends=('git')
source=("git+https://github.com/kbabioch/check_systemd_status.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
