# Maintainer: Jan Martin Reckel <jm dot reckel at t-online dot de>
pkgname=subtitld-git
pkgver=2022
pkgrel=1
epoch=
pkgdesc="An open source software to create, edit and transcribe subtitles. It is able to work with SRT, SSA, TTML, SBV, DFXP, VTT, XML, SCC and SAMI file formats"
arch=('x86_64')
url="https://gitlab.com/jonata/subtitld/-/tree/master/"
license=('GPL3')
groups=()
depends=('mpv' 'pyside6' 'python-opengl' 'python-docx' 'python-pycaption' 'python-pysubs2' 'python-pyffms2' 'python-mpv' 'python-libretranslate-git' 'python-translate' 'python-speechrecognition' 'python-pysrt')
makedepends=('git' 'python')
provides=("subtitld")
source=("git+https://gitlab.com/jonata/subtitld.git")
md5sums=('SKIP')

prepare() {
    cd "subtitld"
}

build() {
	echo "No build required."
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
