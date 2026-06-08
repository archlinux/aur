# Maintainer: tardanoir <tardanoir@gmail.com>
pkgname=seshat-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight TUI SQL client for PostgreSQL"
arch=('x86_64' 'aarch64')
url="https://github.com/tardanoir/seshat"
license=('MIT')
provides=('seshat')
conflicts=('seshat')
source_x86_64=("seshat_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/seshat_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("seshat_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/seshat_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('795c0396474a91a1944fb277afdfafed71174b089152c6464309231dc14cae47')
sha256sums_aarch64=('6fd8ff81b4b7829121ed24ef2ab74dd33f5fc1b232b45f0e4411262026965f12')

package() {
	install -Dm755 "${srcdir}/seshat" "${pkgdir}/usr/bin/seshat"
}
