# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.1.2504221401
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
b2sums=('8f64bef45197017d7e360b20e564decf54cfcadfea1fcd983f3046dee008d2231041aaee0eacc559b500e23c70c5391c5ac0a2d041e3df05b64080ba2754fcb2')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
