# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.3.7
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('b33e0ddbd2fa849097099394f9b71975e652a3f70528c829ff11c86de041694f')
sha256sums_aarch64=('ab59fa924e080886571ae1a8a0bfcd562380956f3ab2ad89d8fcc6cea8bc3f59')

package() {
	cd "$srcdir"
	install -Dm755 kubectl-minio* "$pkgdir/usr/bin/kubectl-minio"
}
