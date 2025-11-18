# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.0.10
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
sha256sums_aarch64=('2c4db2b98beca54b57dc2661613b5e8e99f7947dde3b55aa952136c7477d49d5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('0d6d472d7b2e11b81d2c7f8f57c3674108cc494be0f45dc185e9b838f1b83fe9')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
