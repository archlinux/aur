# Maintainer: dax
# Maintainer: adam

pkgname='terramind'
pkgver=0.1.1
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
sha256sums_aarch64=('26dcb95946d4b62714de04cf56f3bbee1dc34ebfc5c46fdae93902d2e8339fe9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/terramind-com/terramind-cli-releases/releases/download/v${pkgver}${_subver}/terramind-linux-x64.zip")
sha256sums_x86_64=('b734aa8ac9b256605a6d9499f1e94a6ffe2800f888af1d088c0f8e84332b285b')

package() {
  install -Dm755 ./terramind "${pkgdir}/usr/bin/terramind"
}
