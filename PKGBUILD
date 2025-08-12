# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.28
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.28/opencode-linux-arm64.zip")
sha256sums_aarch64=('d935abb3452f545139ccefa795c7e897ab36c9dff4403414456c8b703cd35507')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.28/opencode-linux-x64.zip")
sha256sums_x86_64=('740a69237d345c58e2fc6486583c54d59da6ec80326f1891d4719d1c01fc9537')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
