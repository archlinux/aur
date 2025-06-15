# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.51
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.51/opencode-linux-arm64.zip")
sha256sums_aarch64=('5dc2278dee68963fe9cffcf3fca5806f9e3670a070539ec286a1cdfe66b4a667')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.51/opencode-linux-x64.zip")
sha256sums_x86_64=('bc4669db2790c8ea08b66ad3e44e7fd37243364b8bc1807c62b6d7c572ba9c7e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
