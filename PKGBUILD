# Maintainer: demir
# Maintainer: vcalv

pkgname=mergiraf-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats"
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPL-3.0-or-later')
provides=('mergiraf')
conflicts=('mergiraf' 'mergiraf-git')
depends=(
  'glibc'
  'gcc-libs'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/mergiraf/mergiraf/releases/download/v${pkgver}/mergiraf_${arch}-unknown-linux-gnu.tar.gz"
  "LICENSE::https://codeberg.org/mergiraf/mergiraf/raw/tag/v${pkgver}/LICENSE.txt"
  "GOVERNANCE::https://codeberg.org/mergiraf/mergiraf/raw/tag/v${pkgver}/GOVERNANCE.md"
  "README::https://codeberg.org/mergiraf/mergiraf/raw/tag/v${pkgver}/README.md"
)
sha512sums=('fcd6bf6a463050076872d8338ba8bf85deb0fe810908dfcf714730ecb2b4e906946706954b479a49c5894810c7bc063193bd6a3dc794e658f1769f5e36294d6f'
            '900ef9b1d0e1435fb3aad32f035edf8890538292ebb3104af2feb386fb25df134ed0172a0ec542b2c25ff69a39ae62b34ad17e01b3522067a7328abb25aa4fff'
            '489ba698e7507e38c60c4bcb902000a04a0988e6a22084ce5229c23294f78cf0d39d27e3fcfd9fe2e352d1ba835ae9cfc86308b4e3c87f657c4115fe5a39f03c'
            '568ae9706612fdd998b6d6d48dd963379b606cc858f816c0686801aaf581a8c21d4b0f94ebd02340bbbd190dc2a14d87181c3a590a87fd8fb970f0f57cf838d9')

package() {
  install -Dm555 "mergiraf" "${pkgdir}/usr/bin/mergiraf"
  install -Dm444 "LICENSE" "${pkgdir}/usr/share/licenses/mergiraf/LICENSE"
  install -Dm444 "README" "${pkgdir}/usr/share/doc/mergiraf/README.md"
  install -Dm444 "GOVERNANCE" "${pkgdir}/usr/share/doc/mergiraf/GOVERNANCE.md"
}
