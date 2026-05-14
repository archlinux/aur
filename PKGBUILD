pkgname=servebox
pkgver=1.2
pkgrel=1
url="https://gitlab.com/PieyIsAPie/servebox"
pkgdesc="Certainly the web server of all time. Simple, easy to set up and independent of external libraries"
arch=('any')
license=('GPL')
sha512sums=('SKIP')
source=("git+https://gitlab.com/PieyIsAPie/servebox.git")
depends=('python3')
makedepends=('git')

package() {
    install -Dm755 servebox/servebox "$pkgdir/usr/bin/servebox" ;
    install -Dm755 servebox/servebox.service "$pkgdir/usr/lib/systemd/system/servebox.service" ;
}
