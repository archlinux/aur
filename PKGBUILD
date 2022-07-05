# Maintainer: Randal <three-dim-sky@foxmail.com>
pkgname=dagtoc
pkgver=3.0.0
pkgrel=1
pkgdesc="A cli-tool for operating contents of pdf"
arch=('x86_64')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
depends=('python-pymupdf')
source=("$pkgname-$pkgver.tar.zst::https://github.com/TD-Sky/dagtoc/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
sha256sums=('daac852e649ab682a1599176907d0d2020d9124409dc23c7a6ce4aa0e8030945')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dagtoc.py" -T "${pkgdir}/usr/bin/dagtoc"
}
