# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.193
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.193/opencode-linux-arm64.zip")
sha256sums_aarch64=('01708343432fcbb7f3a63334af8c41db3cfe4b7d3c11fa9d3b545a3a5046dba5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.193/opencode-linux-x64.zip")
sha256sums_x86_64=('38bf921b46a3a82cd7cbe548dc637a8045b7831d406d7f25b6145adb1a50a197')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
