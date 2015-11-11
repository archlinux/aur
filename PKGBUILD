# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
pkgname=('mime-haml')
pkgver=LATEST
pkgrel=1
pkgdesc='MIME types for HAML'
arch=('any')
depends=('shared-mime-info')
source=('x-haml.xml')
install=('mime-haml.install')
sha512sums=('dbfa00a364a42e27eb6f0e099b35785dfff1844dfb5821fac41cc8f25388167be497413fb981da787217af630e03bae6bb4e4c88ee236ad06d05511d75f6149b')

package() {
	install -m644 -D x-haml.xml "$pkgdir/usr/share/mime/packages/x-haml.xml"
}
