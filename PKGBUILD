# Contributor: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
pkgname=ethloop
pkgver=0.01
pkgrel=2
pkgdesc="A very simple and versatile packet generator and measurer which to test qdisc classes."
arch=(i686 x86_64)
url="http://luxik.cdi.cz/~devik/qos/ethloop/"
license=('unknow')
source=('http://luxik.cdi.cz/~devik/qos/ethloop/ethloop10.tgz')
md5sums=('df0caf522fab6f7324f19cfd2a1b3ea8')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  install -Dm755 ethloop $pkgdir/usr/bin/ethloop
}
