# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.1.4161210
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
b2sums=('966aed8382772496bebeee3a09d11ae0c922d64a11d787442833657716d2ca4eb34f30c890a8c5bd84e73a62a17612a7d7ae8eca4f3560467e53ed5e280192e5')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
