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
  "https://github.com/dom96/choosenim/blob/v${pkgver}/LICENSE"
)
sha256sums=(
  '451b081a717388ec50a198ba4bd601580efec53acb808e592926e89e04599ff4'
  '97cec2f19a271a6ec9d54912eaa75188d97494ce366d5548068dfc97bcc3b982'
)
provides=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')
conflicts=('nim' 'nimble' 'nimgrep' 'nimpretty' 'nimsuggest')

package() {
  install -Dm 755 choosenim -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/choosenim"
}

# vim: sw=2 ts=2 et:
