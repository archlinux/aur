# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.26
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.26/opencode-linux-arm64.zip")
sha256sums_aarch64=('a4dd836515d1efc3b8df3d63332aeae8be03445155923b27c847a52578c89f8e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.26/opencode-linux-x64.zip")
sha256sums_x86_64=('92cc4d48dcd79c559a86d535cd9ee9aa1c3e548f9bff45c4216ec9ae96ad28d0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
