# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.100
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.100/opencode-linux-arm64.zip")
sha256sums_aarch64=('31a1ae0010c81c98b2ca4debb59f072ac5b04317e3579059eabdb66484d8d6c5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.100/opencode-linux-x64.zip")
sha256sums_x86_64=('04c5ad05e97abb05b28802b7d0c8465cee1371bf906dba1aceaf90adfd49d120')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
