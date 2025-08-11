# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.14
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.14/opencode-linux-arm64.zip")
sha256sums_aarch64=('2344b864091a99d0ef5d4ad60c3c70ee552569563dbd5445fd1f20419334841d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.14/opencode-linux-x64.zip")
sha256sums_x86_64=('f29e556c552dd155fce8fb1a9f1f6020d47dacc70e87c83d980b94bbef04ff44')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
