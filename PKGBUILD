# Maintainer: alcxyz <alcxyz@users.noreply.github.com>
pkgname=grove-tui-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Terminal UI for monitoring GitHub repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/alcxyz/grove"
license=('MIT')
provides=('grove')
conflicts=('grove')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/grove_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/grove_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
	install -Dm755 "./grove" "${pkgdir}/usr/bin/grove"
	install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/grove/README.md"
	install -Dm644 "./config.example.yaml" "${pkgdir}/usr/share/doc/grove/config.example.yaml"
}
