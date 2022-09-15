# Maintainer: Miles McLean <mills00013@gmail.com>

pkgname=snyk
pkgver=1.1006.0
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('49d17838b1c069200f1519bbc7ec3fb5e793f9c67bfad9ca2db8504dc659bafa')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
