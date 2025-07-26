# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.78
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.78/opencode-linux-arm64.zip")
sha256sums_aarch64=('874f282e687fe67d02b2d9b415f0e799e3783d8f0288220b85ce824fbcea35ee')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.78/opencode-linux-x64.zip")
sha256sums_x86_64=('3adf1aef25417d93075cdbb32d217267e950fce0cf6cb5f65b4edc9e09f50507')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
