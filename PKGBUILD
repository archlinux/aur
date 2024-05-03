# Maintainer: Miles McLean <mills00013@gmail.com>
# Maintainer: Refreeze5911

pkgname=snyk
pkgver=1.1291.0
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('8f0469b01ef00d0fad6ce6f16d6e3e502311b1bfa5bd2b058f5ec5a83e6668cd')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/snyk-linux"
}
