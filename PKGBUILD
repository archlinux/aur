# Contributor: Luis Miguel García-Cuevas González <luismiguelgcg@gmail.com>
pkgname=rtve-mediateca-dl
pkgver=4.0.3
pkgrel=1
pkgdesc='Download a video file from the "mediateca" and "TVE A la Carta" of RTVE.'
arch=('any')
url="http://sgcg.es/articulos/2010/02/20/bajar-videos-de-la-mediateca-de-rtve/"
license=('GPL3')
depends=('wget')
source=("http://www.sgcg.es/software/rtve-mediateca-dl/$pkgname-$pkgver.tar.gz")
changelog=ChangeLog
md5sums=('556f4ad732aa9285702c1f20635eb489')
sha256sums=('443f82c53c331e24a633ae4e699e76f73201062eccfbb1548b8e1cbde0250edc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix="usr" install || return 1
}

# vim:set ts=2 sw=2 et:
