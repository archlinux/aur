# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: mrbit <giacomogiorgianni@gmail.com>
#
pkgname="curlew"
pkgver=0.2.4
pkgrel=1
pkgdesc="Easy to use, Free and Open-Source Multimedia converter for Linux in Python"
url="https://curlew.sourceforge.io/"
arch=('i686' 'x86_64')
license=('Waqf GPL')
depends=('python' 'ffmpeg' 'python-gobject' 'hicolor-icon-theme' \
    'gobject-introspection' 'xdg-utils' 'python-xdg' 'python-dbus' \
    'mediainfo'
)
makedepends=('intltool' 'librsvg')
optdepends=('curl: Aurploader support')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f1d6a4125bda816224d691b2623dd5e3c1f4af7f69b637bf113ecddb125d3987')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"/ --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et
