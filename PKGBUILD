# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=firebase-admin
_foldername='Firebase Admin'
pkgver=1.0.0
pkgrel=1
pkgdesc='Firebase Management Cross Platform Application.'
url='https://firebaseadmin.com/'
license=('GPL3')
source=('https://firebaseadmin.com/download.php?file=1.0.0/firebase-admin-linux-1.0.0.zip')
arch=('any')
md5sums=('9e28e19fe8cdbf5d3f513067eea0f9f4')

package(){
	mv "$_foldername/$_foldername" "$_foldername/$pkgname"
	install -dm755 "$pkgdir/opt/"
	cp -a --reflink=auto "$_foldername" "$pkgdir/opt/$pkgname/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
