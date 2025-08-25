# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.26
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.26/opencode-linux-arm64.zip")
sha256sums_aarch64=('ada31da5193684752e82c7303db4a6a32fc514aca7f4a385cf596f47e32e638b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.26/opencode-linux-x64.zip")
sha256sums_x86_64=('198a5bcdde0b7d82959333fea568931ad32060e4b849cb859b22f9d294bdd3ce')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
