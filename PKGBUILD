# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=pdtm-bin
_pkgname=pdtm
pkgver=0.0.3
pkgrel=1
pkgdesc='pdtm is a simple and easy-to-use golang based tool for managing open source projects from ProjectDiscovery'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/pdtm'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("https://github.com/projectdiscovery/pdtm/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
md5sums=('afe73ee850288f19892a791287406f4d')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
