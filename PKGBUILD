# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.62
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('062d820f569d324d8045c127dc5a49202121eef4f00796cd9d9de4f1efe675bf')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('559da8e1ba6345c4ebca99b5eab0de743509df58b3ad4034236371f586d8030c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
