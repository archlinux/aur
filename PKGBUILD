# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.126
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.126/opencode-linux-arm64.zip")
sha256sums_aarch64=('3e2845e54d897ce38658aed4495a33850c909df089feb96263444282ef3b7640')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.126/opencode-linux-x64.zip")
sha256sums_x86_64=('7595cf611f82f8c1c197a094a884d5f7a4d46c3d0c3cc5b140e87f4ba189c316')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
