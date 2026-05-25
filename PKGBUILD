# Maintainer: up-the-hill <hello@avijya.sh>

pkgname=inklecate-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A command-line compiler for ink: : inkle's narrative scripting language"
arch=('x86_64')
url=https://github.com/inkle/ink
license=('MIT')
provides=('inklecate')
conflicts=('inklecate-bin' 'inklecate-git' 'inklecate')
makedepends=('unzip')
options=('!strip')
source=(
  "https://github.com/inkle/ink/releases/download/v$pkgver/inklecate_linux.zip"
  "LICENSE.txt::https://raw.githubusercontent.com/inkle/ink/master/LICENSE.txt"
)
sha256sums=(
  '1997ff5bca618c90003ecd5fecb286e7468abb955005a2a185042949642f8fb5'
  'SKIP'
)

package() {
  install -Dm755 "inklecate" "${pkgdir}/usr/bin/inklecate"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
