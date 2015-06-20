# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
pkgname=('mime-rails')
pkgver=LATEST
pkgrel=1
pkgdesc='MIME types for Ruby on Rails'
arch=('any')
depends=('shared-mime-info')
url=('https://github.com/gmate')
source=('https://github.com/gmate/gmate/raw/master/mime/rails.xml')
install=('mime-rails.install')
sha512sums=('SKIP')

package() {
	install -m644 -D rails.xml "$pkgdir/usr/share/mime/packages/rails.xml"
}

