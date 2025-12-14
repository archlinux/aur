# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.5
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/terramind-com/terramind-cli'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('terramind')

depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-arm64.zip")
sha256sums_aarch64=('4c21f827d6743f1d648b07073d7efd7eb3130101910f6d713a7fb01d7d7dcfd0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('50b7986097ee51f475c7713a4f037e94c363e0b9608ecfc9291cacba8e89318c')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
