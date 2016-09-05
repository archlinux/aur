# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher
pkgver=1.0
pkgrel=0
pkgdesc="Update a list of git repos"
arch=('any')
url=""
license=('MIT')
groups=()
depends=('git')
install="$pkgname.install"
source=("fetcher.sh"
        "fetcher.service")
noextract=()
md5sums=('de164dec82476dcfc15efad1b9617792'
         'ac026457052512cfdb9ae12e100ea696')

package() {
    install -Dm644 $srcdir/fetcher.service $pkgdir/usr/lib/systemd/system/fetcher@$USER.service
    install -Dm755 $srcdir/fetcher.sh $pkgdir/usr/bin/fetcher
}

# vim:set ft=sh:
