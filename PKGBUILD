# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher
pkgver=2.0
pkgrel=1
pkgdesc="Automatic update of git repositories via a systemd service."
arch=('any')
url="https://github.com/mbrunnen/fetcher"
license=('MIT')
groups=()
depends=('git')
install="$pkgname.install"
source=("fetcher.sh"
        "fetcher.service")
noextract=()

package() {
    install -Dm644 $srcdir/fetcher.service $pkgdir/usr/lib/systemd/user/fetcher.service
    install -Dm755 $srcdir/fetcher.sh $pkgdir/usr/bin/fetcher
}

# vim:set ft=sh:
md5sums=('7850769db5609291b9aef320b87d9f15'
         'dab6b2be6bfbd3f2b77b000814e1e9fd')
