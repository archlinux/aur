# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.30
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.30/opencode-linux-arm64.zip")
sha256sums_aarch64=('8c7a4aaffbfe3f453041626f8cdc3ba0159c312aa7eac8c0b9254083b2039fe5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.30/opencode-linux-x64.zip")
sha256sums_x86_64=('b84c5b91b1fe8b220b3acd52fed9fa325bfc76c08f94e2650ab063ebdfc347ab')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
