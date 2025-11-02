# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-bin
pkgver=0.7.1
_qtcreatorver=17.0.2
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator v$_qtcreatorver"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
depends=("qtcreator>=${_qtcreatorver}")
provides=("$_pkgname" 'qodeassist' 'QodeAssist')
conflicts=("$_pkgname" 'qodeassist' 'QodeAssist')
source=("${_pkgname}-$pkgver.7z::${url}/releases/download/v${pkgver}/QodeAssist-v${pkgver}-QtC$_qtcreatorver-Linux-x64.7z")
sha256sums=('a538f1b61924a50e527dd710d746600c080fd380db08f5838221b989bc130338')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libQodeAssist.so" "${pkgdir}/usr/lib/qtcreator/plugins/libQodeAssist.so"
}
