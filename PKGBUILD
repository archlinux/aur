pkgname=lrzip-fe
pkgver=1.0.0
pkgrel=1
pkgdesc="A front-end program for lrzip and lrzip-next"
arch=('x86_64')
url="https://github.com/pete4abw/lrzip-fe"
license=('custom')
depends=('dialog' 'lrzip-next')
source=("https://github.com/pete4abw/${pkgname}/raw/refs/heads/master/${pkgname}.sh")

package() {
	install -D -m755 lrzip-fe.sh $pkgdir/usr/bin/lrzip-fe
}

sha256sums=('348472bbafd4f626277304cdef07ecb9dd37e219e8828d1a0d2df3094a43bb1f')
