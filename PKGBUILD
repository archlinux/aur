# maintainer: soren <hnpf>
pkgname=sysdupd
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple libadwaita system update checker and notifier"
arch=('any')
url="https://github.com/hnpf/sysdupd"
license=('MIT')
depends=('python' 'python-gobject' 'libadwaita' 'libportal-gtk4' 'libayatana-appindicator')
makedepends=('python-setuptools')
# use the link to the tarball you just created!
source=("https://github.com/hnpf/sysdupd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8209dad2b7a6cac0661e5bab8c8476764825f0c55117e48f1e92607e5fbf004a')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
