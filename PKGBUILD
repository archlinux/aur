pkgname=cigtft
pkgver=1.1
pkgrel=1
url="https://gitlab.com/PieyIsAPie/cigtft"
pkgdesc="A small streaming file transfer tool for the CLI."
arch=('any')
license=('GPL')
sha512sums=('SKIP')
source=("git+https://gitlab.com/PieyIsAPie/cigtft.git")
depends=('python3' 'python-tqdm')
makedepends=('git')

package() {
    install -Dm755 cigtft/cigtft "$pkgdir/usr/bin/cigtft" ;
}
