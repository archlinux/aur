# Maintainer: krzysiek27 <k r z y s z t o f z i o b r o 2 7 @ g m a i l . c o m>
# Maintainer: denxman111 <d e n x m a n 2 0 1 3 @ m a i l . r u> 
# Maintainer: rafalkilar <r a f a l m p 9 9 @ g m a i l . c o m>
pkgname=effective-umount
pkgver=1.0
pkgrel=1
pkgdesc="Script that forces unmount - kills processes accessing it"
arch=('any')
url="https://bitbucket.org/rafalkilar/pz-skuteczne-odmontowywanie/src/master/"
license=('unknown')
depends=('psmisc' 'util-linux')
makedepends=(git)
source=("git+https://bitbucket.org/rafalkilar/pz-skuteczne-odmontowywanie.git")
sha256sums=('SKIP')

package() {
	install -D pz-skuteczne-odmontowywanie/effective-umount.sh "$pkgdir"/usr/bin/effective-umount
	install -Dm644 pz-skuteczne-odmontowywanie/effective-umount.1 "$pkgdir"/usr/share/man/man1/effective-umount.1
}

