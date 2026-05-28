# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-bin
pkgver=0.9.17
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
sha256sums=('219241bb10334015702b5c8dabed877e9d3bf4f41e6d23651a0f3e84d43dc00c')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libQodeAssist.so" "${pkgdir}/usr/lib/qtcreator/plugins/libQodeAssist.so"
}
