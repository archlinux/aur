# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.20
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.20/opencode-linux-arm64.zip")
sha256sums_aarch64=('a91308950d1f93555aa12735285b536759f490cf47eeac9d5352c7a9631061a4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.20/opencode-linux-x64.zip")
sha256sums_x86_64=('e09d792e022ce876e03ee58ddb8b3fbd29dc31764334a4eeadfe5de816dadc7f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
