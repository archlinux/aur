# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.214
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('56b8f4c00a064e8514c88cb2623b4beffe28e7cb0656b0e7c895218a53ff21db')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7c63813dd24d4c3e12fb150cb606fa06dcf0b9bab37e0d24e688279de69964d4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
