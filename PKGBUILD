#Maintainer: Abhinav Kuruvila abhinav.kuruvila.joseph@gmail.com
_pkgname=abfetch
pkgname=abfetch-git
pkgver=r6.60147a0
pkgrel=1
pkgdesc="A Simple hardware info fetching program"
arch=("any")
url="https://github.com/abhinav3967/$_pkgname.git"
license=('GPL3')
depends=('bash')
makedepends=('sudo' 'git')
provides=($_pkgname)
backup=('etc/abfetch')
conflicts=('abfetch')
source=("git+https://github.com/abhinav3967/$_pkgname.git")
md5sums=('SKIP')
package() {
	install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname/$_pkgname"
	install -Dm644 -t "$pkgdir/etc/$_pkgname" "$srcdir/$_pkgname/logo.sf"
}
