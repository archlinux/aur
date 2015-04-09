pkgname=eml2mbox
pkgver=0.14
pkgrel=1
pkgdesc="Converts a bunch of eml files into one mbox file"
arch=('any')
url="https://github.com/yardenac/eml2mbox"
license=('LGPL2.1')
depends=('ruby>=2.0.0_p0-1')
source=('https://raw.github.com/yardenac/eml2mbox/master/eml2mbox.rb')
sha512sums=('21687b7c099346627819c1ce9ad28ee0ca62abfc288b7553f4d59e45067deedfedeabbcfba58ac5b4619542632e0f01b42d54cab732fe83c9787c9b15473bea2')

package() {
	 install -Dm 755 eml2mbox.rb "${pkgdir}/usr/bin/eml2mbox"
}
