# maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=tracy-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Basecalling, alignment, assembly and deconvolution of Sanger Chromatogram trace files"
arch=('x86_64')
url="https://github.com/gear-genomics/tracy"
license=('BSDv3')
provides=('tracy')
source=("https://github.com/gear-genomics/tracy/releases/download/v${pkgver}/tracy_v${pkgver}_linux_x86_64bit")
sha256sums=('SKIP')

package(){
	cd "$srcdir"
	install -Dm755 tracy_v${pkgver}_linux_x86_64bit $pkgdir/usr/bin/tracy
	chmod +x $pkgdir/usr/bin/tracy
}
