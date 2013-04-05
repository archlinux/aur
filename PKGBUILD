pkgname=eml2mbox
pkgver=0.08
pkgrel=1
pkgdesc="Converts a bunch of eml files into one mbox file"
arch=('any')
url="https://github.com/yardenac/eml2mbox"
license=('LGPL2.1')
depends=('ruby')
source=('https://github.com/yardenac/eml2mbox/blob/master/eml2mbox.rb')
md5sums=('b1b532cdef73e3c52ef4b861a6bcbfe5')

package() {
	 install -Dm 755 eml2mbox.rb "${pkgdir}/usr/bin/eml2mbox"
}
