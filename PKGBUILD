# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.1.2505172129
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
b2sums=('aac632224c540f8750bd47d42bdfd870dccb1e71363c09513856f1db3d974eee2f4c0219c681f68536ad2c952ab71a5fbacb1379e8bb7b0619ec6f674e753ddf')
noextract=("codex-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/codex-${pkgver}.tgz"
}
