# Maintainer: David Adler <d dot adler aet posteo dot de>
pkgname=yass  
pkgver=0.0.2
pkgrel=1
pkgdesc="Yet Another Scrolling Scope"
url="http://www.kokkinizita.net/linuxaudio/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clthreads' 'clxclient' 'jack')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b41db22c93d9510c396b99e3301df394')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
