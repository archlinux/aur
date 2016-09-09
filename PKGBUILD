# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher
pkgver=1.2
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
md5sums=('c8caa52bf3ac2c3b2f0a82330c1ab5b0'
         'dab6b2be6bfbd3f2b77b000814e1e9fd')

package() {
    install -Dm644 $srcdir/fetcher.service $pkgdir/usr/lib/systemd/user/fetcher.service
    install -Dm755 $srcdir/fetcher.sh $pkgdir/usr/bin/fetcher
}

# vim:set ft=sh:
