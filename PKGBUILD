# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.177
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.177/opencode-linux-arm64.zip")
sha256sums_aarch64=('534800bdebec8a3e1ed654aaff783cc0d26c63cfe598bd03c7ec2df1fbee5005')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.177/opencode-linux-x64.zip")
sha256sums_x86_64=('ed4016c2a11348112e9dbc7f01653db994d86552fdb76a32dff263d5c39d70a1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
