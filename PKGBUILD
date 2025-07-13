# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Maintainer: Nguyen Quang Minh <minhnbnt at gmail dot com>

# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)

pkgname=templ-bin
pkgver=0.3.865 # datasource=github-releases depName=a-h/templ
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

sha256sums_aarch64=('66446fd92b96ed954b6e14d59f6fd7251004248a905e4d7a81c308998dd0451a')
sha256sums_i386=('60b1936b76393d3b5430187b6922b80d6f54ad6439c22191485bf2117842e9d1')
sha256sums_x86_64=('d2f51ed1806e279037fa380af25dfe199a5196c8585ee60fa82d94be1a62bd8b')

package() {
	install -Dm755 'templ' "${pkgdir}/usr/bin/templ"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
