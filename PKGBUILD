# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.69
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.69/opencode-linux-arm64.zip")
sha256sums_aarch64=('b72c8e4e3cee8f2d4b8bb808654ee58a5f69e940d65d11d69f798c9d4d85489e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.69/opencode-linux-x64.zip")
sha256sums_x86_64=('f6088afea6bacdb43e1f058871750bca8b9b1994fd3fa268052f1cd8a5ba733e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
