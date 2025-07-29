# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.81
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.81/opencode-linux-arm64.zip")
sha256sums_aarch64=('d48e99cf1cdd31e1125a2e3750f1a47e2df0b47de5982c37b473861171824af3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.81/opencode-linux-x64.zip")
sha256sums_x86_64=('be6e5f248e7103f3556d54fba4133e7be367f1b5a6d62aaf31865277ad09c74c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
