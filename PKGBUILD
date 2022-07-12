# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.10.8
pkgrel=1
pkgdesc="Selenium Hub successor running browsers within containers"
arch=('x86_64')
url="https://aerokube.com/${_base}"
license=(Apache)
provides=("${_base}")
# depends=('glibc')
source=("${_base}-${pkgver}::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_amd64")
sha512sums=('7783317767ed78a0399c197e7cf5df32f1750e409c452cadae1a7cb70c4c30c1f7481959248c85f90c2aff14b00089f096daf2bdc1342a78ce5f481edc8cc4f2')

package() {
  install -Dm755 ${_base}-${pkgver} "${pkgdir}/usr/bin/${_base}"
}
