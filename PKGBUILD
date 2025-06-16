# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.57
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.57/opencode-linux-arm64.zip")
sha256sums_aarch64=('51dc051797ede203a05ad1b7d8766eb377966cca385f32618bf12f2263e24e54')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.57/opencode-linux-x64.zip")
sha256sums_x86_64=('705ae985733aea09504208e8c7099bc93901b9f560894fa0790514cdca927968')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
