# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.21
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
sha256sums_aarch64=('2a3b527dc9b3869ae3df5467f6d07b1464ba5dc1dc67e730e0623b475273dee6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('018cec9daff9371a63d4b98a6d46be852a97b2fd4eabe928a44147fd5e5bda87')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
