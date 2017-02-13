# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher
pkgver=1.3
pkgrel=0
pkgdesc="Automatic adding, commiting, pushing or pulling of git repos via a systemd service unit."
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
md5sums=('e3b582bb52147414f3cf69bd1de26ec3'
         'dab6b2be6bfbd3f2b77b000814e1e9fd')
