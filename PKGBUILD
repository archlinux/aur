# Maintainer: Michael A. Sinclair <squattingmonk@gmail.com>
# Contributor: Dan Beste <drb@wishalloy.com>

pkgname='choosenim'
pkgdesc='choosenim installs the Nim programming language from official
downloads and sources, enabling you to easily switch between stable and
development compilers.'
url='https://github.com/dom96/choosenim'
license=('BSD')
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
source=(
  "${pkgname}::https://github.com/dom96/choosenim/releases/download/v${pkgver}/choosenim-${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/dom96/choosenim/v${pkgver}/LICENSE"
)
md5sums=('1f9c7f59393d80ce79a1c38394b39c78'
         '78123baa634a7ebc9f65c1429e18dbb6')
provides=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')
conflicts=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')
package() {
  install -Dm 755 choosenim -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/choosenim"
}

# vim: sw=2 ts=2 et:
