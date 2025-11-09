# Maintainer: brenno <dev@brenno.codes>

pkgname=rogauracore-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/Syndelis/rogauracore"
license=('MIT')
depends=('glibc' 'libusb' 'udev')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndelis/rogauracore/releases/download/${pkgver}/rogauracore_amd64.tar.gz")
conflicts=('rogauracore')
provides=('rogauracore')
sha256sums_x86_64=('e8ebd6b5d5009a492e83d34d27cc9ad1130448a306ff048a96297878f4e28393')

package() {
	cp -r "$srcdir"/rogauracore_amd64/* "$pkgdir"
}

