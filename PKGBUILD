pkgname=yauri
pkgver=1.2.5
pkgrel=1
url="https://gitlab.com/PieyIsAPie/yauri"
pkgdesc="yauri, the gayest aur helper ever, all fitting into 1 file."
arch=('any')
license=('GPL')
sha512sums=('SKIP')
source=("git+https://gitlab.com/PieyIsAPie/yauri.git")
depends=('python3' 'python-requests' 'pacman-contrib' 'git' 'python-colorama' 'sudo')

package() {
    install -Dm755 yauri/yauric "$pkgdir/usr/bin/yauri" ;
}
