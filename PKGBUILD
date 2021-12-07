# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.3.6
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('008d5660a0332d77b9e31658d07467f86f730c05eb9e50b348d844f8c26f48e8')
sha256sums_aarch64=('30ecc3c163981ab444e81a4430798a371800638c34d8acfd270a093639aa7f0c')

package() {
	cd "$srcdir"
	install -Dm755 kubectl-minio* "$pkgdir/usr/bin/kubectl-minio"
}
