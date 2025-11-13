# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-bin
pkgver=0.8.2
_qtcreatorver=18.0.0
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
sha256sums=('f24b26350398ceace016fe75a632fcf6e786d3536426fddd5af6d8eb6b798a96')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libQodeAssist.so" "${pkgdir}/usr/lib/qtcreator/plugins/libQodeAssist.so"
}
