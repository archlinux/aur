# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.74
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('2fe2a27e1792a27e0691df22e4cdcea56895341fb94d14453cc7aa525675258b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('60100228677e7879dae804a6de60013886a60ab5ee5e58b56f1818ef81ec475b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
