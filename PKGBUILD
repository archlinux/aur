# Maintainer: Donald Carr<sirspudd at gmail dot com>

_grotesque_file_name="download_file.php?path=L2t1bmRlbi9wb2x5Zm9ybXMuY29tL2R5bmFwZGZfdmVyc2lvbnMvNC4wLjMuOS9saW51eC02NC56aXA="
pkgname=dynapdf
pkgver=4.0.3.9
pkgrel=1
pkgdesc='PDF library'
arch=('x86_64')
url='https://www.dynaforms.com'
license=('custom')
source=("https://www.dynaforms.com/bin/${_grotesque_file_name}")
sha256sums=('015fd95798555d403d18a95f7875d1b5454d6c10169062738387262431c7778e')

package() {
  local _incdir=${pkgdir}/usr/include/dynapdf
  local _libdir=${pkgdir}/usr/lib

  cd ${startdir}
  install -D -m644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"

  cd "$srcdir/$pkgname/$pkgname"

  install -D -m644 drv_conf.h ${_incdir}/drv_conf.h
  install -D -m644 dynapdf.h ${_incdir}/dynapdf.h
  install -D -m644 libdynapdf.a ${_libdir}/libdynapdf.h
  install -D -m644 libdynapdf.so ${_libdir}/libdynapdf.so
}

