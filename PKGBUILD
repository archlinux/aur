# Maintainer: somepaulo <fino@duck.com>
# Packager: somepaulo <fino@duck.com>
# Contributor: Erik Nijenhuis <erik@xerdi.com>

pkgname=ginvoice
pkgver=1.0.3
pkgrel=1
pkgdesc="Creating LaTeX invoices with a GTK GUI"
arch=('x86_64')
url="https://gitlab.gnome.org/MacLotsen/ginvoice"
license=('GPL3')
depends=('python-gobject' 'python-distutils-extra' 'python-xdg' 'texlive-bin')
optdepends=('ttf-ms-win11-auto: Microsoft Windows 11 TrueType fonts')

install=${pkgname}.install

sha256sums=('f85c2162d376cfbbed7615caa9ad809bbbe5e5c2da2aedeb55733a664b3d7db7')

source=("https://gitlab.gnome.org/MacLotsen/ginvoice/uploads/34210bc004de7ea0b1899a3b6848e890/ginvoice_1.0.3_all.deb")

package() {
      echo "Installing GinVoice..."
      tar xvf data.tar.zst -C "${pkgdir}"/
}
