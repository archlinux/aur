pkgname=eml2mbox
pkgver=0.14
pkgrel=1
pkgdesc="Converts a bunch of eml files into one mbox file"
arch=('any')
url="https://github.com/yardenac/eml2mbox"
license=('LGPL2.1')
depends=('ruby>=2.0.0_p0-1')
source=('https://raw.github.com/yardenac/eml2mbox/master/eml2mbox.rb')
md5sums=('0449ec5a9a6be1459a98354c64c2f9d8')

package() {
	 install -Dm 755 eml2mbox.rb "${pkgdir}/usr/bin/eml2mbox"
}
