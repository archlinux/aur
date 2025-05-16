# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.1.2505160811
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('any')
url="https://github.com/openai/codex"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
)
source=("https://registry.npmjs.org/@openai/codex/-/codex-$pkgver.tgz")
b2sums=('5b8fcf7c6f9c67936348c0f293daaeb6cb96a568b40f231f1f11c1a4e89e5ac00a26ce6676e6b70f6f01012c9cbc212a4b64440c467d1e42d0c018b70a97fa94')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
