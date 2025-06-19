# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.100
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.100/opencode-linux-arm64.zip")
sha256sums_aarch64=('3217942448da615c215cf6e86674b1c37a66c267c77bbde2fa629eef9462f1be')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.100/opencode-linux-x64.zip")
sha256sums_x86_64=('b793ce73be679b341bf658dfa56013906e60c106e9578825d72910cd39cb0917')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
