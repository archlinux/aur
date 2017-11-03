# Maintainer: Andrej Marolt <andrej.marolt@gmail.com>
pkgname=openshift-source-to-image
_release=v1.1.7
_commit=226afa1
pkgver=1.1.7
pkgrel=2
pkgdesc="A tool for building/building artifacts from source and injecting into docker images"
arch=('i686' 'x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache')
source=("https://github.com/openshift/source-to-image/releases/download/${_release}/source-to-image-${_release}-${_commit}-linux-amd64.tar.gz")
md5sums=('e23e47bdef21a82e091512cc83080d4e')

build() {
    echo "Installing source-to-image"
    s2i
}

package() {
    install -D -m755 $srcdir/s2i        $pkgdir/usr/bin/s2i
    install -D -m755 $srcdir/sti        $pkgdir/usr/bin/sti
}
