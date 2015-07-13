# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: mrbit <giacomogiorgianni@gmail.com>

pkgname=curlew
pkgver=0.2.0_beta
pkgrel=1
pkgdesc='Easy to use, Free and Open-Source Multimedia converter for Linux in Python'
arch=('i686' 'x86_64')
license=('Waqf GPL')
url=("http://sourceforge.net/projects/curlew/")
depends=('python>=3.3' 'ffmpeg>=0.8' 'ffmpeg-compat' 'python-gobject>=3.10' 'hicolor-icon-theme' 'mencoder' 'gobject-introspection' 'xdg-utils' 'python-xdg' 'python-dbus' 'mediainfo')
makedepends=('intltool' 'librsvg')
optdepends=('curl: Aurploader support')
source=("http://sourceforge.net/projects/curlew/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha256sums=('5f18e94e0ce2e5df89acc057fb8cd6a035b795566c79353cc29d7668c2af97a1')
install="${pkgname}.install"

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
}
