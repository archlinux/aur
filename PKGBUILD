# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>
pkgname=plaso
pkgver=20180630
pkgrel=1
pkgdesc="super timeline tool"
arch=('any')
url="https://github.com/log2timeline/plaso"
license=('GPL')
groups=()
depends=( 'python2'
          'hachoir-core'
          'hachoir-metadata'
          'hachoir-parser'
          'libfvde-git'
          'python2-artifacts'
          'python2-backports.lzma'
          'python2-bencode'
          'python2-biplist'
          'python2-certifi'
          'python2-chardet'
          'python2-construct'
          'python2-crypto'
          'python2-dateutil'
          'python2-dfdatetime'
          'python2-dfvfs'
          'python2-dfwinreg'
          'python2-dpkt'
          'python2-dtfabric'
          'python2-efilter'
          'python2-elasticsearch'
          'python2-future'
          'python2-idna'
          'python2-libbde'
          'python2-libesedb'
          'python2-libevt'
          'python2-libevtx'
          'python2-libewf'
          'python2-libfsntfs'
          'python2-libfwnt'
          'python2-libfwsi'
          'python2-liblnk'
          'python2-libmsiecf'
          'python2-libolecf'
          'python2-libqcow'
          'python2-libregf'
          'python2-libscca'
          'python2-libsigscan'
          'python2-libsmdev'
          'python2-libsmraw'
          'python2-libvhdi'
          'python2-libvmdk'
          'python2-libvshadow'
          'python2-libvslvm'
          'python2-pefile'
          'python2-psutil'
          'python2-pyparsing'
          'python2-pysqlite'
          'python2-pytsk3'
          'python2-pytz'
          'python2-pyzmq'
          'python2-requests'
          'python2-six'
          'python2-urllib3'
          'python2-xlsxwriter'
          'python2-yaml'
          'python2-yara')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/log2timeline/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('8a29a328d767eeb046bce801b5497d50')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
