# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Maintainer: Nguyen Quang Minh <minhnbnt at gmail dot com>

# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)

pkgname=templ-bin
pkgver=0.3.977 # datasource=github-releases depName=a-h/templ
pkgrel=1
pkgdesc="A language for writing HTML user interfaces in Go."
arch=('aarch64' 'i386' 'x86_64')
url='https://github.com/a-h/templ'
license=('MIT')
provides=('templ')
conflicts=('templ')

source_aarch64=("templ-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_arm64.tar.gz")
source_i386=("templ-i386-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_i386.tar.gz")
source_x86_64=("templ-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/templ_Linux_x86_64.tar.gz")

sha256sums_aarch64=('eb9f6d24221435969278b0336330ac67e0f0a0fef208fe4420121a1e7b043453')
sha256sums_i386=('a256e60443096f6351147ce52c2cd64582e4b8bf7597d905e96b61c10ea87354')
sha256sums_x86_64=('231087561d1df2001a0176fc7dda4f0fd8ad0a8ff7b36d268389e43fa3a64073')

package() {
	install -Dm755 'templ' "${pkgdir}/usr/bin/templ"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
