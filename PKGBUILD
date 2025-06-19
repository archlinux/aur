# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.99
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.99/opencode-linux-arm64.zip")
sha256sums_aarch64=('d41376563a6f87fbf3651e1364f28de76b62c5eb0981ba658eead112d11a01e5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.99/opencode-linux-x64.zip")
sha256sums_x86_64=('f3296b3238fed3dda6f0264e36143202f25fbc020d30aee437102a3ba2656588')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
