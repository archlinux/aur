# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.132
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.132/opencode-linux-arm64.zip")
sha256sums_aarch64=('9d36c07519d11eb22713eed82d2bd6491dca50886f7d08bb76be99b5f7bb9fc5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.132/opencode-linux-x64.zip")
sha256sums_x86_64=('9ae3ac9cfff1b79266cf862c098b9429c9c567c8ea64414ae42153116c058252')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
