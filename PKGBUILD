#Maintainer : Robin -ChinaskiJr- Colombier <robin dot colombier at protonmail dot com>
#The program is a fork from a script wrote by Kory Becker <http://www.primaryobjects.com/kory-becker/>
pkgname=vpndemon-cli
pkgver=1.01
pkgrel=1
pkgdesc="Monitor a VPN connection on Linux Network Manager and kill a process upon disconnect, command line interface (CLI) version"
arch=('any')
url='https://github.com/chinaskijr/vpndemon-cli'
license=('MIT')
depends=('networkmanager')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c47000c2fb010b37329e39ddb57a892b2b10523aa8bdda77431a2ed8c8d9df82016aad9c2ef705f75caafa80b3b90ce86f45307b0b8073cce7940f762148403e')

package() {
	install -D -m755 "$srcdir/$pkgname-$pkgver/vpndemon-cli.sh" "$pkgdir/usr/bin/vpndemon-cli"
	install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
