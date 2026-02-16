# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.22
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('466e2b1609aa81d2ae42e46de72cef6f162845ad11cb4e544a3f0453b1eab74d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('38a2df9e987809199cd6d36c3f074fb37a3642562f687e37ea2bba97977d9fac')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
