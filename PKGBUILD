# Maintainer: Andrej Marolt <andrej.marolt@gmail.com>
pkgname=openshift-source-to-image
_release=v1.1.1
_commit=724c0dd
pkgver=1.1.1
pkgrel=1
pkgdesc="A tool for building/building artifacts from source and injecting into docker images"
arch=('i686' 'x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache')
install=${pkgname}.install
source=("https://github.com/openshift/source-to-image/releases/download/${_release}/source-to-image-${_release}-${_commit}-linux-amd64.tar.gz")
md5sums=('95c968dc6d00d09bb85b397443758478')

build() {
    echo "Installing source-to-image"
}

package() {
    install -D -m755 $srcdir/s2i        $pkgdir/usr/bin/s2i
}
