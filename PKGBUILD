# Maintainer: Borhaneddine GUEMIDI <guemidiborhane at gmail.com>

_pkgname="tufw"
pkgname="$_pkgname-bin"
pkgver=0.2.6
pkgrel=1
pkgdesc='Terminal UI for ufw'
url='https://github.com/peltho/tufw'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('ufw')

source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('54ab86bf3d42161b31423ca045fd60bd7b266b6f5006ef30fd40c54ecb0bd5fd')

source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('57d94e88673496b772f854e4f93eea2b8186de0238dd3d653f0c583b92996a43')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('582e6ddf11438e6e351809b387265d724827702dcb0717e27cc7877e5e71c8b6')

package() {
  install -Dm755 tufw "${pkgdir}/usr/bin/tufw"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/"
}
