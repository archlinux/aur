# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
)
source=("https://registry.npmjs.org/@openai/codex/-/codex-$pkgver.tgz")
b2sums=('ba4046764fe40d44da8a644d177e4ca5efc6ad58edd6beafb509bbba329842ca8ef118b090dbef390af7bc7de38c900ebbad5a67319cd23f112dfba8554f3805')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
