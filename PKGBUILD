# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.106
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('69330798109e6d251909406b6d8887c1d97936f848c0f54107cfb1556e347c76')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2cb6409272cf24667db1f23399bc0b0db1dcb8e97b74f5d6d2d61b43f82ec2ec')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
