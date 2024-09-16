# Maintainer: Ms. Haze <ms-haze@riseup.net>
pkgname=pacupdate-git
pkgver=r1.a84a9af1
pkgrel=2
pkgdesc="Update all packages using Paru - automatically avoids some common issues when updating normally."
url="https://gitlab.com/MayESchaefer/pacupdate"
license=("GPL-3.0-or-later")
source=("git+$url")
md5sums=("SKIP")
arch=('any')
depends=("paru" "bash")
makedepends=("git")

package() {
    cd "$srcdir/pacupdate"
    install -Dm755 --no-target-directory "pacupdate.sh" "${pkgdir}/usr/bin/pacupdate"
}
