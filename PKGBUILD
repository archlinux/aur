# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.38.5"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("Proprietary")
provides=('coder' 'coder-client')
conflicts=('coder' 'coder-client' 'coder-oss' 'coder-oss-client')

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
sha256sums_x86_64=('f8e16e9d64258fa9b4d640e1f3899f8a76c064326f3ee495b798d7c2361b7ee7')
sha256sums_aarch64=('53aa17fab391751cfbf32f1165dd1828240bc3c5c23eb6cd62625b4e46fec4c2')
sha256sums_armv7h=('962c5af5e0319a330d1e29cd2f7268adcfe989bf9e586d6a3126b5760986ae98')
