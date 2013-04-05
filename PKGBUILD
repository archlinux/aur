pkgname=eml2mbox
pkgver=0.13
pkgrel=1
pkgdesc="Converts a bunch of eml files into one mbox file"
arch=('any')
url="https://github.com/yardenac/eml2mbox"
license=('LGPL2.1')
depends=('ruby>=2.0.0_p0-1')
source=('https://raw.github.com/yardenac/eml2mbox/master/eml2mbox.rb')
md5sums=('8a95589e25211453282b0b94ea738407')

package() {
	 install -Dm 755 eml2mbox.rb "${pkgdir}/usr/bin/eml2mbox"
}
