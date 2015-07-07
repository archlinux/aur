# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python2-caldavclientlibrary-svn
_basename="caldavclientlibrary"
pkgver=r14927
pkgrel=2
pkgdesc="A Python2 library and tool for CalDAV"
license=('Apache')
url="http://calendarserver.org/wiki/CalDAVClientLibrary"
depends=('python2')
source=("${_basename}::svn+http://svn.calendarserver.org/repository/calendarserver/CalDAVClientLibrary/trunk")
md5sums=('SKIP')
sha1sums=('SKIP')
provides=('python2-caldavclientlibrary')
arch=('any')

pkgver() {
  cd "$srcdir/${_basename}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build(){
  cd "$srcdir"
}

package() {
  cd "$srcdir/${_basename}"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin"
  install -Dm 644 ${_basename}/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/"
  install -Dm 644 ${_basename}/admin/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/xmlaccounts/commands"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/xmlaccounts/tests"
  install -Dm 644 ${_basename}/admin/xmlaccounts/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/xmlaccounts"
  install -Dm 644 ${_basename}/admin/xmlaccounts/commands/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/xmlaccounts/commands"
  install -Dm 644 ${_basename}/admin/xmlaccounts/commands/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/admin/xmlaccounts/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/browser/commands"
  install -Dm 644 ${_basename}/browser/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/browser/"
  install -Dm 644 ${_basename}/browser/commands/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/browser/commands"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/client"
  install -Dm 644 ${_basename}/client/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/client/"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav/definitions"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/calendarserver"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav/definitions"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/authentication"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/authentication/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/data"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/definitions"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/tests"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/utils"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav/definitions"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav/tests"
  install -Dm 644 ${_basename}/protocol/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/"
  install -Dm 644 ${_basename}/protocol/caldav/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav/"
  install -Dm 644 ${_basename}/protocol/caldav/definitions/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav/definitions"
  install -Dm 644 ${_basename}/protocol/caldav/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/caldav/tests"
  install -Dm 644 ${_basename}/protocol/calendarserver/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/calendarserver/"
  install -Dm 644 ${_basename}/protocol/carddav/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav/"
  install -Dm 644 ${_basename}/protocol/carddav/definitions/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav/definitions/"
  install -Dm 644 ${_basename}/protocol/carddav/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/carddav/tests/"
  install -Dm 644 ${_basename}/protocol/http/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/"
  install -Dm 644 ${_basename}/protocol/http/authentication/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/authentication/"
  install -Dm 644 ${_basename}/protocol/http/authentication/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/authentication/tests/"
  install -Dm 644 ${_basename}/protocol/http/data/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/data/"
  install -Dm 644 ${_basename}/protocol/http/definitions/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/definitions/"
  install -Dm 644 ${_basename}/protocol/http/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/http/tests/"
  install -Dm 644 ${_basename}/protocol/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/tests/"
  install -Dm 644 ${_basename}/protocol/utils/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/utils/"
  install -Dm 644 ${_basename}/protocol/webdav/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav/"
  install -Dm 644 ${_basename}/protocol/webdav/definitions/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav/definitions/"
  install -Dm 644 ${_basename}/protocol/webdav/tests/*.py "${pkgdir}/usr/lib/python2.7/site-packages/${_basename}/protocol/webdav/tests/"
}
