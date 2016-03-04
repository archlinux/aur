# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: mrbit <giacomogiorgianni@gmail.com>

pkgname=curlew
pkgver=0.2.1
pkgrel=2
pkgdesc='Easy to use, Free and Open-Source Multimedia converter for Linux in Python'
arch=('i686' 'x86_64')
license=('Waqf GPL')
url="http://sourceforge.net/projects/curlew/"
depends=('python>=3.3' 'ffmpeg>=0.8' 'ffmpeg-compat' 'python-gobject>=3.10' 'hicolor-icon-theme' 'gobject-introspection' 'xdg-utils' 'python-xdg' 'python-dbus' 'mediainfo')
makedepends=('intltool' 'librsvg')
optdepends=('curl: Aurploader support')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a6c7adc06686a72379ba21d9500d3277796cc295315d9c427727212a67c05abd')
install="${pkgname}.install"

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
}
