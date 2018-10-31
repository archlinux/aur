pkgname=schemalex-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Generate difference sql of two mysql schema"
arch=('x86_64')
license=('MIT')
source=("https://github.com/schemalex/schemalex/releases/download/v0.0.9/schemalex_linux_amd64.tar.gz")
md5sums=('cb3072413d3abb61da30367b855e11c8')

package() {
  	install -D -m755 "${srcdir}/schemalex_linux_amd64/schemalex" "${pkgdir}/usr/bin/schemalex"
  	install -D -m755 "${srcdir}/schemalex_linux_amd64/schemalint" "${pkgdir}/usr/bin/schemalint"
  	install -D -m755 "${srcdir}/schemalex_linux_amd64/schemadiff" "${pkgdir}/usr/bin/schemadiff"
}
