# Maintainer: kylon  < klnix [at] tuta [dt] io >
pkgname=opencl-1.2-man-doc
pkgver=1.0~svn33624
pkgrel=4
pkgdesc="OpenCL 1.2 man pages"
arch=('any')
url="http://www.khronos.org/registry/cl/sdk/1.2/docs/man/xhtml/"
license=('custom')
source=("http://ftp.ubuntu.com/ubuntu/ubuntu/pool/universe/k/khronos-opencl-man/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('8363acad5450f60a568af71ed09ae20ff88319cd2087c275393e438012583155')

package() {
	ar x "${srcdir}/${pkgname}_${pkgver}-${pkgrel}_all.deb"
	tar xJf "${srcdir}/data.tar.xz"

	cp -rf "${srcdir}/usr" "${pkgdir}"
}

