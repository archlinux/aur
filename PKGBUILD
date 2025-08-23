# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=murat-cileli
_pkgname=clyp
pkgname=${_pkgname}-bin
pkgver=0.9.5
_pkgvername=${pkgver}
pkgrel=1
pkgdesc="Clipboard manager for Linux"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-only')

depends=('glibc' 'glib2' 'gtk4' 'libgirepository' 'cairo' 'vulkan-icd-loader' 'graphene' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${pkgrel}-${arch[0]}.pkg.tar.zst")
sha256sums_x86_64=('7fd223072907c516fa4f5f8796a49abd19e7f0adc3b3e797f4a080d939f3608e')


package() {
	mv "${srcdir}/usr" "${pkgdir}/"
}
