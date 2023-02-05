# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.15.2"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('3a72a0024b2d5498e4d3b4e0322b4f0c6e476205db033a268c5df9388fc6604e')
sha256sums_aarch64=('ec953ec7a7930d0ca5a15c6bbc02075bbff9b84f9294934cff1d46c790840dcc')
sha256sums_armv7h=('048dfa290a0ff2e0af608fbfeda4c085cc4977d07a0565e274ffddb6e7ab322e')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
