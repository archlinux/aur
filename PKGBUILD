# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.8
pkgdesc="An image viewer with vim-like keybindings"
install="vimiv.install"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
makedepends=('python-setuptools')
optdepends=('jhead: for much better autorotation depending on EXIF data')
conflicts=('vimiv')
backup=('etc/vimiv/vimivrc' 'etc/vimiv/keys.conf')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7e4b66eefc202db55b45449d1eb48fc18e1e220de9f2dea45a25df1b07b41603')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
