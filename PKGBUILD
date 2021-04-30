# Maintainer: GuiltyCat <guiltycat.icloud AT icloud DOT com
pkgname=salt-viewer
pkgver=0.1.2
pkgrel=1
arch=("any")
url="https://github.com/GuiltyCat/SaltViewer"
license=("GPL")
depends=("python" "unrar" "poppler" "python-send2trash" "python-pillow"  "python-send2trash" "python-cairosvg" "python-natsort" "python-py7zr" "python-pdf2image" "python-rarfile")
makedepends=("python-setuptools")
md5sums=('SKIP')

optdepends=("unarchiver: unrar alternative" "libarchive: unar alternative")

source=("https://github.com/GuiltyCat/SaltViewer/archive/refs/tags/v${pkgver}.tar.gz")
package(){
	cd SaltViewer-"${pkgver}"
	python setup.py install --verbose --root="${pkgdir}/" --optimize=1 
}
