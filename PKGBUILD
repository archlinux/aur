# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.29
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.29/opencode-linux-arm64.zip")
sha256sums_aarch64=('b8a5e0e844b973b81aeed29609800ea086ff92116eb7346588321cb8663ecbb4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.29/opencode-linux-x64.zip")
sha256sums_x86_64=('e4c43862a723982ee8f904b0e7fc7cbd9fb1b580ed14bd55c4ce5f6a9f3cdbac')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
