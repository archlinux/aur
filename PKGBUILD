# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=blisp-bin
_pkgname=blisp
pkgver=0.0.3
pkgrel=1
pkgdesc="ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs "
url="https://github.com/pine64/blisp"
license=("MIT")
arch=('x86_64') 
conflicts=('blisp')
source=(https://github.com/pine64/blisp/releases/download/v${pkgver}/blisp-linux64-v${pkgver}.zip)
sha256sums=('c2230d68f24fbe4fa04969811de5e42c02e4b4c61e99063522442c383066ed4f')
sha512sums=('ce76efdcdd42831007dcf89245dd666ca65fb3b208ce517b429f40fd6410d48fc7e86d5dc408094be80f0f696bdddcb35c35dc943e10908a5d7c0faebc863b98')

package() {
  install -D -v -m755 "${srcdir}"/blisp "${pkgdir}/usr/bin/blisp"
}
