# Maintainer: GrassBlock <i [at] gb0 [dot] dev>
pkgname=manboster-bin
_name=manboster
pkgver=0.2.0
pkgrel=1
pkgdesc="Manboster: Your personal AI agent manbo lobster!"
arch=("x86_64" "aarch64")
url="https://manboster.dev/"
_giturl="https://github.com/manboster/manboster"
license=('Apache-2.0')
optdepends=('llama.cpp: for running local safety gatekeeper model')
provides=("manboster")
conflicts=("manboster")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::$_giturl/releases/download/v${pkgver}-rc/${_name}_${pkgver}-rc_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::$_giturl/releases/download/v${pkgver}-rc/${_name}_${pkgver}-rc_linux_arm64.tar.gz")

sha256sums_x86_64=('ff40627f0ebc9ffa00b74e7229b2e39ce2eab32e194b2b3fec73cbed4dc70513')
sha256sums_aarch64=('30201d1d3fb685170ff0aba07a6f73f43fd8cc3f6bf49f0ad7d5cde0cd33870d')

package() {
	install -Dm 755 manboster -t ${pkgdir}/usr/bin
}
