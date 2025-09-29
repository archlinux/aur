# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('0d4def5bfc9a504eec39696984d430ded3c2204c761f71a27cc88128ad1eea5a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.4/opencode-linux-x64.zip")
sha256sums_x86_64=('fb4e2505191771e8387bcbe7aa6661453d132a48727b2a3217d533a7ae6f6ef3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
