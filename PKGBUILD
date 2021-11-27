# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.10.7
pkgrel=1
pkgdesc="Selenium Hub successor running browsers within containers"
arch=('x86_64')
url="https://aerokube.com/${_base}"
license=(Apache)
provides=("${_base}")
# depends=('glibc')
source=("${_base}-${pkgver}::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_amd64")
sha512sums=('399b9d253a1fa1b624eb8494faa0a2ffcf63333ffcf1f3b3b5efcbc1d4e86838d37fb97ec65647e8c447692b4226cab70fabd783d2fe37875a3836099fdf7154')

package() {
  install -Dm755 ${_base}-${pkgver} "${pkgdir}/usr/bin/${_base}"
}
