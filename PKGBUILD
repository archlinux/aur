# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-bin
pkgver=0.9.16
_qtcreatorver=19.0.2
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
sha256sums=('e5e4cc27c570de8512fd533a39197cb42649fc8528d50cb15353e10d4da26b22')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libQodeAssist.so" "${pkgdir}/usr/lib/qtcreator/plugins/libQodeAssist.so"
}
