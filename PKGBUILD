# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.135
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.135/opencode-linux-arm64.zip")
sha256sums_aarch64=('85314e25f63b1e853347f87f55b9e1e4248f5351b3dc22f468e12da74f729aa9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.135/opencode-linux-x64.zip")
sha256sums_x86_64=('7f3304172545eb92ca41712cde1a5286981da5c2ef73e62f397fc7232a23dda3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
