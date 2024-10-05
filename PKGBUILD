# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="Quick and Easy server testing/validation"
arch=('i686' 'x86_64' 'arm')
provides=('goss' 'dgoss')
url="https://goss.rocks"
license=('Apache')
source=("dgoss-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/dgoss"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/aelsabbahy/goss/v${pkgver}/LICENSE")
source_i686=("goss-linux-386-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-386")
source_x86_64=("goss-linux-amd64-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-amd64")
source_arm=("goss-linux-arm-${pkgver}::https://github.com/aelsabbahy/goss/releases/download/v${pkgver}/goss-linux-arm")
sha256sums=('7ee35d6ccbe1440eb2a08984a43e8b3742f2e849abdc0d7384ac08de55682d7c'
          '59a262acdcecff55593580225e165c9fe36c85d8800f00ede90e2d3b9577911b')
sha256sums_i686=('d6c7e40c5a9ce68e0108f56f9c9bfbab4a2ed33ca5ebfdad88aeccd3277ee752')
sha256sums_x86_64=('87dd36cfa1b8b50554e6e2ca29168272e26755b19ba5438341f7c66b36decc19')
sha256sums_arm=('4efab403ebc84244052ab1da3cb156fab3278be3c5f2650499cccb9a15c2f0cf')

package() {
	install -D -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 0755 goss-linux-*-${pkgver} "${pkgdir}/usr/bin/goss"
	install -Dm 0755 dgoss-${pkgver} "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:
