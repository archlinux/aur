# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.1.4161352
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('any')
url="https://github.com/openai/codex"
license=('Apache-2.0')
depends=()
makedepends=('npm')
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
)
source=("https://registry.npmjs.org/@openai/codex/-/codex-$pkgver.tgz")
b2sums=('8fbc251bd564ad01f5482a9a6df808f8b13d93b6b001e044da1fedeee9ef89d3dd19eaf38076950ddc97e00d5cdf4c5224bf30e14caafcc46396f2c636e37c54')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
