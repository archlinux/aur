# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('62525781f45ff8218ad7ecc028f02cf215fcdbfedee0db81acc52df84559b6b1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.5/opencode-linux-x64.zip")
sha256sums_x86_64=('8d19303eefcc03d82a8bec0204c06007b43d2ee3b4800f9a7cef857ab534b44f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
