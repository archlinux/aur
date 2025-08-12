# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.27
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.27/opencode-linux-arm64.zip")
sha256sums_aarch64=('eee4759a7a597b26b10398d7cc83a87d05f508dd822e9949a1f25374421e9668')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.27/opencode-linux-x64.zip")
sha256sums_x86_64=('ee83ce1a8c9579f93548f286130ffdc27c724049b7e0109b716436f33e61a99f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
