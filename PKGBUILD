# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver='1.9.8'
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/Evidlo/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-pynput" "python-pykeepass" "python-pykeepass_cache" "python-colorama" "python-future" "python-pyotp" )
source=("https://github.com/Evidlo/passhole/archive/v$pkgver.tar.gz")
sha512sums=('69af37addc902b024e2dc343ca779dcc3884c0c6bdf06740a9dfb76d13205611e43c6b775fc2103ebe9c5dc89bbec98b719bf0df7461618a258c6536923533c0')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
