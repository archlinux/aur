# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Maintainer: Nguyen Quang Minh <minhnbnt at gmail dot com>

# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)

pkgname=templ-bin
pkgver=0.3.1118 # datasource=github-releases depName=a-h/templ
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

sha256sums_aarch64=('a49ac8da8b158677a4908f9a13253bd35f6ede96a43cdef81a867cb12dc2b418')
sha256sums_i386=('19a05a5da912137309df25fa89b4125e4c1052113fe5211eaaad32be717a59c2')
sha256sums_x86_64=('9dbe3b1d44c96eb4261c39c30b03efc2388c5c328b3fb3759ec3eebf96e5bc8a')

package() {
	install -Dm755 'templ' "${pkgdir}/usr/bin/templ"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
