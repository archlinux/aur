# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.38
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
sha256sums_aarch64=('1a4eae16c40ad9d425a1a7f2999329dba78238a01fa44a50fe813fe2c2c1ce93')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('59c3783a1ee0286e4f4096ad4c1d1f2fe0ed707020366280e473fa2009debdbd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
