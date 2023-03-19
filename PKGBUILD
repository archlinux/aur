# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=coredns-openrc
pkgver=20230319
pkgrel=1
pkgdesc="A DNS server that chains plugins - OpenRC init script"
arch=('any')
groups=()
depends=('coredns' 'openrc')
makedepends=()
optdepends=()
provides=('init-coredns')
conflicts=('init-coredns')
replaces=()
backup=('etc/Corefile')
options=()
install=
changelog=
source=('coredns')
noextract=()
md5sums=('df5427f11ee2e3053b63f11cc13eddcd')

package() {
    install -Dm755 "coredns" "$pkgdir/etc/init.d/coredns"
}
