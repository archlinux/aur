# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.56.0 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('i686' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

_repourl="https://github.com/facebook/pyrefly"

source=("LICENSE-${pkgver}::${_repourl}/raw/refs/tags/${pkgver}/LICENSE")
source_i686=("pyrefly-${pkgver}-i686.tar.gz::${_repourl}/releases/download/${pkgver}/pyrefly-linux-i686.tar.gz")
source_x86_64=("pyrefly-${pkgver}-x86_64.tar.gz::${_repourl}/releases/download/${pkgver}/pyrefly-linux-x86_64.tar.gz")

sha256sums=('da6d3703ed11cbe42bd212c725957c98da23cbff1998c05fa4b3d976d1a58e93')
sha256sums_i686=('b2461436d52a86bc8b3e23fb6009baee826d8e67229fc1db49498af178dfdceb')
sha256sums_x86_64=('b2461436d52a86bc8b3e23fb6009baee826d8e67229fc1db49498af178dfdceb')

package() {
	install -Dm755 "pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
