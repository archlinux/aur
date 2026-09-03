# Maintainer: pineappletoad

pkgname=cloudcompare-bin
pkgver=2.13.2
_pkgrel_src=4
pkgrel=1
pkgdesc="A 3D point cloud (and triangular mesh) processing software (precompiled)"
arch=('x86_64')
url="https://www.cloudcompare.org"
license=('GPL2')
options=('!debug')
provides=('cloudcompare')
conflicts=('cloudcompare')
depends=(
    'cgal'
    'fbx-sdk'
    'ffmpeg4.4'
    'glew'
    'glu'
    'mesa'
    'mpir'
    'pdal'
    'laszip'
    'qt5-base'
    'qt5-tools'
    'qt5-svg'
    'qt5-websockets'
    'shapelib'
    'tbb'
    'opencv'
    'gdal'
)

source=("https://github.com/tubbywrestler/cloudcompare-bin/releases/download/${pkgver}-${_pkgrel_src}/cloudcompare-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('98b8f912279cadf649af30228a5ccea136765526473b14601ba5d88046c89d45')

package() {
    bsdtar -xf "${srcdir}/cloudcompare-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
