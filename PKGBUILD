# Maintainer: slava.ganzin <slava.ganzin@gmail.com>
pkgname=deepdetect-git
pkgver=r.
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Open Source + Deep Learning + API + Server"
url="http://www.deepdetect.com/"
license=('GPL')
depends=(
'gcc'
'eigen'
'google-glog'
'gflags'
'opencv'
'cpp-netlib'
'boost'
'curl'
'libcurlpp'
'utf8cpp'
'openblas-lapack'
'protobuf'
'hdf5'
'leveldb'
'snappy'
'lmdb'
)
makedepends=()
optdepends=()
provides=()
replaces=()
source=('git+https://github.com/beniz/deepdetect.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  mkdir $pkgdir/usr/lib -p
  install -Dm755  $srcdir/main/dede $pkgdir/usr/bin/dede
  install -Dm755 $srcdir/caffe_dd/src/caffe_dd/.build_release/lib/* $pkgdir/usr/lib
}
