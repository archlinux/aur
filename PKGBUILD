# Maintainer: Immae <ismael.bouya@normalesup.org>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Soehartono Hadibowo <kutkinnaku@googlemail.com>

pkgname=pytagsfs
pkgver=0.9.2
pkgrel=3
pkgdesc="FUSE filesystem that arranges media files in a virtual directory structure that's based on the file tags"
arch=("any")
url="http://www.pytagsfs.org/"
license=("GPL")
depends=("inotifyx" "mutagen" "sclapp" "python2-fuse")
makedepends=("docbook-xsl")
source=(http://www.alittletooquiet.net/media/release/${pkgname}-${pkgver}.tar.gz)

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha1sums=('4fc54d655c3d5f6fccad45a31447b8c37d90c7fe')
