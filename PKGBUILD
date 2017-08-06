# Maintainer: Edgar Fournival <contact at edgar-fournival dot fr>

pkgname=brename
pkgver=2.3.0
pkgrel=1
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'
arch=('i686' 'x86_64')
url='https://github.com/shenwei356/brename'
license=('MIT')
depends=('glibc')
source=('LICENSE')
source_i686=('https://github.com/shenwei356/brename/releases/download/v2.3.0/brename_linux_386.tar.gz')
source_x86_64=('https://github.com/shenwei356/brename/releases/download/v2.3.0/brename_linux_amd64.tar.gz')
md5sums=('7b154f12b0ed68bac7ead79434b6d929')
md5sums_i686=('4e96be8ed13895659309b1e5af063077')
md5sums_x86_64=('1df4c84ce027191bed4bf5eb915d7bde')

package() {
	install -Dm755 brename "$pkgdir/usr/bin/brename"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
