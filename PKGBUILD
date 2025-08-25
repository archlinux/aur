# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.27
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.27/opencode-linux-arm64.zip")
sha256sums_aarch64=('f5bdabcb954b39a437b5efb167d97038d7bab755fdd584dc051b97b01c64a89b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.27/opencode-linux-x64.zip")
sha256sums_x86_64=('1a7ff193ad0bcd4909702766da7adb9148af4777d93f522ca0ad04af49980258')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
