pkgname=irexec-systemd
pkgver=1
pkgrel=1
pgkdesc='Service files for running irexec as systemd user service'
arch=('any')
url='https://github.com/muesli4/archlinux-packages'
depends=('lirc')
source=('irexec.service')

md5sums=('0af6a4c94719b8fadff5e9a9d90ebd46')

package() {
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    cp 'irexec.service' "$pkgdir/usr/lib/systemd/user/"
}

