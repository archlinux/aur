# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Evan Buss <evan.buss28@gmail.com>

pkgname=openbooks-bin
binaryname=openbooks
pkgver=4.3.0
pkgrel=1
pkgdesc="Openbooks allows you to download ebooks from irc.irchighway.net quickly and easily."
provides=('openbooks')
arch=('aarch64' 'x86_64')
url="https://github.com/evan-buss/openbooks"
source=("https://raw.githubusercontent.com/evan-buss/openbooks/master/README.md")
source_aarch64=("$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux_arm")
source_x86_64=("$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux")

sha256sums=('e3f01a7b7210b404d75ab12101eea2dbaafdf859f51a89e98fe3a2ca957f4b99')
sha256sums_aarch64=('ac617ed45fc644a66398747531f7840c68b825ac60ca326f9306193f937231c8')
sha256sums_x86_64=('accc03c211dba75be461dc45713a5eb98bf3218371224398d388770dc1398644')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./openbooks
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
