# Maintainer: Miles McLean <mills00013@gmail.com>
# Maintainer: Refreeze5911

pkgname=snyk
pkgver=1.1278.0
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('dccf03d1d893cededb5e11f1fbbb08d83c9eed4b00f5767c0d0fa29a6bd4ac3e')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
