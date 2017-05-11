# Maintainer:  Joey Pabalinas <alyptik@protonmail.com>
# Contributor:  Joey Pabalinas <alyptik@protonmail.com>

pkgname=fhs-manpages
pkgver=2.2
pkgrel=1.2
pkgdesc="A manpage for the Filesystem Hierarchy Standard."
arch=('any')
url="https://github.com/alyptik/fhs-manpages"
license=('GPL')
options=('zipman')
source=("https://github.com/alyptik/${pkgname}/raw/master/${pkgname%%-*}.5")
#source=("https://github.com/alyptik/${pkgname}/raw/master/fhs.mm")
sha256sums=('8efaf26cb09e258cafc7b9554bddf3b70c8e4be601509abbd7193863572314e2')
#sha256sums=('')
package() {
	## Move old fhs.mm source file
	#[ ! -f "$srcdir/fhs.mm" ] || mv "$srcdir/fhs.mm" "$srcdir/fhs.5"
	install -d "$pkgdir/usr/share/man/man5/"
	install -m 644 "$srcdir/fhs.5" "$pkgdir/usr/share/man/man5/"
}
