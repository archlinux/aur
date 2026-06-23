# Maintainer: GrassBlock <i [at] gb0 [dot] dev>
pkgname=manboster-bin
_name=manboster
pkgver=0.2.3
pkgrel=1
pkgdesc="Manboster: Your personal AI agent manbo lobster! (prebuilt binary)"
arch=("x86_64" "aarch64")
url="https://manboster.dev/"
_giturl="https://github.com/manboster/manboster"
license=('Apache-2.0')
optdepends=('llama.cpp: for running local safety gatekeeper model')
provides=("manboster")
conflicts=("manboster" "manboster-git")
source_x86_64=("${_name}-${pkgver}-x86_64.tar.gz::$_giturl/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}-${pkgver}-aarch64.tar.gz::$_giturl/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1e77f73f00c9eaf13d506fe4aba5e4b48abfe6cbf6a6a3fc76a063f796281fc0')
sha256sums_aarch64=('7dfbc71f0ee62a5c52c6ebf337c0dc473fa537d3aa1447c72deb0742ea9a99b3')

package() {
	install -Dm 755 manboster -t ${pkgdir}/usr/bin
}
