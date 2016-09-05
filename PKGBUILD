# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher
pkgver=1.0
pkgrel=1
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
md5sums=('5df683b5b96f5e83331ab071b0979613'
         'ac026457052512cfdb9ae12e100ea696')

package() {
    install -Dm644 $srcdir/fetcher.service $pkgdir/usr/lib/systemd/system/fetcher@$USER.service
    install -Dm755 $srcdir/fetcher.sh $pkgdir/usr/bin/fetcher
}

# vim:set ft=sh:
