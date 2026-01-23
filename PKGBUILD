# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.33
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('4832f9ebfab41ed2112c0c8de87eed41135ddf4ab518bbd827c8e1f4e072303a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4b20b70b9775469997df5a9fcdea5c151428e057b41efc24ea0acfcc5ab24e00')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
