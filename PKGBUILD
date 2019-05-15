# Maintainer: Dan Beste <drb@wishalloy.com>

pkgname='choosenim'
pkgdesc='choosenim installs the Nim programming language from official
downloads and sources, enabling you to easily switch between stable and
development compilers.'
url='https://github.com/dom96/choosenim'
license=('BSD')
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
source=(
  "${pkgname}::https://github.com/dom96/choosenim/releases/download/v${pkgver}/choosenim-${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/dom96/choosenim/v${pkgver}/LICENSE"
)
sha256sums=(
  '451b081a717388ec50a198ba4bd601580efec53acb808e592926e89e04599ff4'
  '5cb6b77a8a0f2f60ed5b9ceeb633fc79331a012c209fc05617f47bc528724d87'
)
provides=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')
conflicts=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')

package() {
  install -Dm 755 choosenim -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/choosenim"
}

# vim: sw=2 ts=2 et:
