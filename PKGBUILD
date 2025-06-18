# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.84
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.84/opencode-linux-arm64.zip")
sha256sums_aarch64=('a43654177b9551bbe0f29e1157156ebd8e6c33c81e41fd1d4684903ac34eb6aa')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.84/opencode-linux-x64.zip")
sha256sums_x86_64=('a8f7b263f194be6701c60fff6d0e5e0cf11e9def45cf044e3db50ae194e47446')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
