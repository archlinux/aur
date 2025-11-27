# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.119
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
sha256sums_aarch64=('523e225a617a719e9be8834d4e147529e6a53e6fc9bad83a99e7df5d3533bd7c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6b90dc35b9068918a9cae691981056adc677f7108aee395ac24ffbd4564ad5b3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
