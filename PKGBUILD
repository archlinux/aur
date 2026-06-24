# Maintainer: Miles McLean <mills00013@gmail.com>
# Maintainer: Refreeze5911

pkgname=snyk
pkgver=1.1305.2
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('60e7cb5538a8cf024344cde041a1aa2bf8bc0e54a59c041a4114ec84a7e966ed')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/snyk-linux"
}
