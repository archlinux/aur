# Maintainer: Miles McLean <mills00013@gmail.com>
# Maintainer: Refreeze5911

pkgname=snyk
pkgver=1.1297.1
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('f7c1ea2c28479136cc0ae6134a2c87bc2493473af6c3766e400fb04c01f2e3fe')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/snyk-linux"
}
