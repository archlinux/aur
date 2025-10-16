# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Maintainer: Nguyen Quang Minh <minhnbnt at gmail dot com>

# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)

pkgname=templ-bin
pkgver=0.3.960 # datasource=github-releases depName=a-h/templ
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

sha256sums_aarch64=('97b727203a2681729e2b219ae09c3ca8a5bb287a486238e85d506ec9cca70a32')
sha256sums_i386=('ce57b54ae3f547950ba4005db243eb82d1f0601ea5f5d2b08aa7b9767be0161c')
sha256sums_x86_64=('354705b095164480d1e2ed0b5c83c7914b3156319a855dadb28cbf9d97dbd92f')

package() {
	install -Dm755 'templ' "${pkgdir}/usr/bin/templ"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
