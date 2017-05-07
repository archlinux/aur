# Maintainer: Edgar Fournival <contact at edgar-fournival dot fr>

pkgname=brename
pkgver=2.2.0
pkgrel=1
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'
arch=('i686' 'x86_64')
url='https://github.com/shenwei356/brename'
license=('MIT')
depends=('glibc')
source=('LICENSE')
source_i686=('https://github.com/shenwei356/brename/releases/download/v2.2.0/brename_linux_386.tar.gz')
source_x86_64=('https://github.com/shenwei356/brename/releases/download/v2.2.0/brename_linux_amd64.tar.gz')
md5sums=('SKIP')
md5sums_i686=('d2cee6bd06225b6955d11cd212c24502')
md5sums_x86_64=('49078f76e0425b42cea4d43f0fd49be4')

package() {
	install -Dm755 brename "$pkgdir/usr/bin/brename"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
