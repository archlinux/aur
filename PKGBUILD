# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.78
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.78/opencode-linux-arm64.zip")
sha256sums_aarch64=('ec819c07c1b778209f8edcc6f2dc17095a51787d55ce2eea93316059c8e3380c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.78/opencode-linux-x64.zip")
sha256sums_x86_64=('dcf1f8202f01fc419684cd03ff5019bb1add39cb3e52ef7e8ae6f60f4ec9d8dc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
