# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.184
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('a3d6cc8213390aa64465bc113279487a738c02eeafaaf8b60ebdb3f35159f65d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6b54e230624edb48bc27c5cc94dbfef42309f7455bff781be0cec73e92d7ba81')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
