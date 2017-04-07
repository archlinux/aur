# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=systemd-denotify
pkgver=1.2
pkgrel=1
pkgdesc='A set of python classes that provide desktop notification upon a user login and when a systemd service fails.'
arch=(any)
url='https://github.com/gkarakou/systemd-denotify'
license=('GPL')
depends=('python2' 'python2-dbus' 'python2-gobject' 'python2-pyinotify' 'python2-systemd' 'python2-notify' 'libnotify')
makedepends=('git' 'python2-setuptools')
backup=('etc/systemd-denotify.conf')
install=systemd-denotify.install
source=("https://github.com/gkarakou/systemd-denotify/archive/v${pkgver}.tar.gz")
md5sums=('c1c7603bbb19a4705721a21f4c0fdb5a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
