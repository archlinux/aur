# Maintainer: demir <iron-actress-music@duck.com>

pkgname=mergiraf-bin
pkgver=0.3.1
pkgrel=2
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats."
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
  "https://codeberg.org/mergiraf/mergiraf/raw/tag/v${pkgver}/GOVERNANCE.md"
  "https://codeberg.org/mergiraf/mergiraf/raw/tag/v${pkgver}/README.md"
)
sha512sums=('b0ddd4cdc4fe489b1910cbf2d7373bb7e70f3cdb58b4236b817eeefd2bdd4efdde4e811ec37c8ef18fff6b4514331b3299045f26bf23610548355d89c6c41d87'
            '900ef9b1d0e1435fb3aad32f035edf8890538292ebb3104af2feb386fb25df134ed0172a0ec542b2c25ff69a39ae62b34ad17e01b3522067a7328abb25aa4fff'
            '489ba698e7507e38c60c4bcb902000a04a0988e6a22084ce5229c23294f78cf0d39d27e3fcfd9fe2e352d1ba835ae9cfc86308b4e3c87f657c4115fe5a39f03c'
            '8570c3fea612914dd3b59b27055ffcdb7c1a3270f7e39f2dd8d04362f59c3d8b8de9fbc5d8853d73c1dc1ac985af1863ae6ff7f103710d18282b554f024561ff')

package() {
  install -Dm555 mergiraf "${pkgdir}/usr/bin/mergiraf"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/mergiraf/LICENSE"
  install -Dm444 README.md "${pkgdir}/usr/share/doc/mergiraf/README.md"
  install -Dm444 GOVERNANCE.md "${pkgdir}/usr/share/doc/mergiraf/GOVERNANCE.md"
}
