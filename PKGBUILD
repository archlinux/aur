# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.3.8
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('bf0ac4ce4b6008b16d65aafe3e12ef627ef0906486e2c92fcb6a776bf9e6040f')
sha256sums_aarch64=('37d2809e1724907e01d98b978779e2dbe38712a944e39deccece7741da477a4d')

package_x86_64() {
	cd "$srcdir"
	install -Dm755 "kubectl-minio_$pkgver_linux_amd64" "$pkgdir/usr/bin/kubectl-minio"
}

package_aarch64() {
	cd "$srcdir"
	install -Dm755 "kubectl-minio_$pkgver_linux_arm64" "$pkgdir/usr/bin/kubectl-minio"
}
