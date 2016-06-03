# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=unix-privesc-check
pkgver=1.4
pkgrel=1
pkgdesc="A script to find misconfigurations that could allow user 
privilege escalation in UNIX systems"
arch=('any')
url="http://pentestmonkey.net/tools/audit/unix-privesc-check"
license=('GPLv2')
provides=('unix-privesc-check')
install=.install
source=("http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz")
md5sums=(SKIP)

package() {
	cd "$pkgname-$pkgver"
	sudo mv -v $pkgname /usr/bin/$pkgname 
}
