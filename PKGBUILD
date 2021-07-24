# Maintainer: GuiltyCat <guiltycat.icloud AT icloud DOT com>
pkgname=salt-viewer
pkgver=0.1.11
pkgdesc="Very simple (archived) image viewer"
pkgrel=1
arch=("any")
url="https://github.com/GuiltyCat/SaltViewer"
license=("GPL")
depends=("python" "unrar" "poppler" "python-pillow"  "python-send2trash" "python-cairosvg" "python-natsort" "python-py7zr" "python-pdf2image" "python-rarfile" "python-pypdf3")
makedepends=("python-setuptools")
md5sums=('SKIP')

optdepends=("unarchiver: unrar alternative" "libarchive: unar alternative")

source=("https://github.com/GuiltyCat/SaltViewer/archive/refs/tags/v${pkgver}.tar.gz")
package(){
	cd SaltViewer-"${pkgver}"
	python setup.py install --verbose --root="${pkgdir}/" --optimize=1 
}
