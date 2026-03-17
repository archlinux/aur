# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-bin
pkgver=0.9.11
_qtcreatorver=19.0.0
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
sha256sums=('41ef6bba29c8563a9c92d617d7df8d2ae778dc68b0b472149831f993e74b0a8e')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libQodeAssist.so" "${pkgdir}/usr/lib/qtcreator/plugins/libQodeAssist.so"
}
