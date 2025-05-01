# Maintainer: demir
# Maintainer: vcalv

pkgname=mergiraf-bin
pkgver=0.7.0
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
sha512sums=('51568a9a6fc28d57dd89739213d47b4d016044b4b75527eeec9cbe0497d683f65401f8ab57749fb82473832091165eec10f0c2760cfeb867ed648d37f9902403'
            '900ef9b1d0e1435fb3aad32f035edf8890538292ebb3104af2feb386fb25df134ed0172a0ec542b2c25ff69a39ae62b34ad17e01b3522067a7328abb25aa4fff'
            '489ba698e7507e38c60c4bcb902000a04a0988e6a22084ce5229c23294f78cf0d39d27e3fcfd9fe2e352d1ba835ae9cfc86308b4e3c87f657c4115fe5a39f03c'
            '763410b7d192c424563dcaef2e97ffaa4038536001ca68cec98f836d2ae247f587ce7fb204bdfcf13332e7f573f19b8bacf7edd0c011304a00d4e668710bb3c0')

package() {
  install -Dm555 "mergiraf" "${pkgdir}/usr/bin/mergiraf"
  install -Dm444 "LICENSE" "${pkgdir}/usr/share/licenses/mergiraf/LICENSE"
  install -Dm444 "README" "${pkgdir}/usr/share/doc/mergiraf/README.md"
  install -Dm444 "GOVERNANCE" "${pkgdir}/usr/share/doc/mergiraf/GOVERNANCE.md"
}
