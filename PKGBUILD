# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=goss-bin
pkgver=0.3.20
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
sha1sums=('eef874df64a2a689f6120ebad1300d268708a909'
          '669a1e53b9dd9df3474300d3d959bb85bad75945')
sha1sums_i686=('1e41ab48143d6caad24cd518b4b1c726068a0a9b')
sha1sums_x86_64=('87047ba1ddb4e22c4cd58d206abb2ebcd9638e93')
sha1sums_arm=('03f15b9d1fee2bbd9eca638f194264740c4e2e59')

package() {
	install -D -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 0755 goss-linux-*-${pkgver} "${pkgdir}/usr/bin/goss"
	install -Dm 0755 dgoss-${pkgver} "${pkgdir}/usr/bin/dgoss"
}

# vim:set ts=2 sw=2 et:
