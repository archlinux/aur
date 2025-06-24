# Maintainer: Miles McLean <mills00013@gmail.com>
# Maintainer: Refreeze5911

pkgname=snyk
pkgver=1.1297.3
pkgrel=1
pkgdesc='CLI and build-time tool to find & fix known vulnerabilities in open-source dependencies'
arch=('i686' 'x86_64')
url='https://github.com/snyk/snyk'
license=('apache')
source=("${pkgname}-${pkgver}"::"https://github.com/snyk/snyk/releases/download/v${pkgver}/snyk-linux")
sha256sums=('3dbb4d4a92ab2e27630e2fcd1abb5f52a2332eba098fda0c8f35164e45ce87c9')
noextract=("${pkgname}-${pkgver}")
options=("!strip")

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/snyk-linux"
}
