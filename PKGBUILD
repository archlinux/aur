# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.131
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.131/opencode-linux-arm64.zip")
sha256sums_aarch64=('fe81d6c86bdcc21a75f277365600dbd82a2a5dc776f3050718afa788e811f631')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.131/opencode-linux-x64.zip")
sha256sums_x86_64=('5de83827510a528715246ae1983cc738eb83cb7b83ae544e39db911f8eaa0511')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
