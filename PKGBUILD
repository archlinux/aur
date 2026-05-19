# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
pkgname=antigravity-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Antigravity CLI (agy)"
arch=('x86_64' 'aarch64')
url="https://antigravity.google"
license=('custom:unknown')
provides=('antigravity-cli' 'agy')
conflicts=('antigravity-cli')
options=('!strip')

_build_id=5288553236791296
_base_url="https://storage.googleapis.com/antigravity-public/antigravity-cli/${pkgver}-${_build_id}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/linux-x64/cli_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/linux-arm/cli_linux_arm64.tar.gz")

sha512sums_x86_64=('5ccdcc01fb863c7e8e56473c6c95dba75fed4fd2a242200d80cfc4c7fab811b733f5a7fab25332130aad298e72627e1018e6911a5658f4f059ef6e019f211972')
sha512sums_aarch64=('9797c7955d0e07fc57605f81fab16dfd2f390d43b2508af3ca697b1cfa498e37e43a3a9a55ad8b26eb1353d80bbec522d108eb75a0eb0eb00e979cb579d6e277')

package() {
    install -Dm755 "${srcdir}/antigravity" "${pkgdir}/usr/bin/agy"
}
