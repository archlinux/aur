# Maintainer: syntheit <daniel@matv.io>

pkgname=ogre-pagedgeometry-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass (binary release)"
arch=('x86_64')
url="https://github.com/RigsOfRods/ogre-pagedgeometry"
license=('MIT')
conflicts=('ogre-pagedgeometry-git')
provides=('ogrepagedgeometry')
source=("https://github.com/RigsOfRods/ogre-pagedgeometry/releases/download/v1.2.0/pagedgeometry-1.2.0-x86_64.deb")
sha512sums=('1c5025df6201e73e281807c7870bb1da6a2f2c082f9650d54cce5b0c318c9fdde64e859fb3e43d769980fc84e3b2cbd708f416b1373137f31cabf36ae969ffec')

package() {
    tar xf data.tar.gz
    mkdir usr/doc/ogre-pagedgeometry/
    rsync -arv --exclude=usr/doc/ogre-pagedgeometry usr/doc/* usr/doc/ogre-pagedgeometry/
    cp -R usr "${pkgdir}"
}