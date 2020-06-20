# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=selenoid-bin
_pkgname=selenoid
pkgver=1.10.0
pkgrel=1
pkgdesc="Selenium Hub successor running browsers within containers. Scalable, immutable, self hosted Selenium-Grid on any platform with single binary"
arch=('x86_64')
url='https://aerokube.com/selenoid'
license=('Apache')
provides=('selenoid')
depends=('glibc')
source=("${_pkgname}-${pkgver}::https://github.com/aerokube/selenoid/releases/download/${pkgver}/selenoid_linux_amd64")
sha256sums=('1464e0a2c3aea0adc364269f2eac8b8f89b10a25db4b82fecfc822e973dd2d18')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/selenoid"
}