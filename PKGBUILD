# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Simon Doppler <dopsi@dopsi.ch>

pkgname="radicale-dovecot-auth"
pkgver=0.4.1
pkgrel=1
pkgdesc="Dovecot auth for radicale"
arch=("any")
url="https://github.com/Arvedui/radicale-dovecot-auth"
license=("GPL3")
conflicts=("radicale-dovecot-auth-git")
depends=("python" "radicale")
makedepends=("git" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("9aebb8ce78c9ecf86f84c7888cc74bbdf2b3ed6cd931c90f535e5a049ddafdc7")

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
