# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.174
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.174/opencode-linux-arm64.zip")
sha256sums_aarch64=('a55ae69079a1bb41a41f42e0ec12b99f7b48aa4f44d2acf80baa9de91ec3cefb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.174/opencode-linux-x64.zip")
sha256sums_x86_64=('faa69cad6dc0822427f0c90783296c7942e54b1450aa8e2861241304ef22d25a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
