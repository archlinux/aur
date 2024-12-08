
pkgname=swaf
pkgver=1.0
pkgrel=1
pkgdesc="Instagram information gathering tool. I am not responsible for misuse!!"
arch=('any')
url="https://github.com/ailppsspp/swaf.git"
license=('MIT')
depends=('python' 'python-instaloader' 'python-colorama' 'python-requests' 'python-translate')
source=("swaf.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/swaf.py" "$pkgdir/usr/bin/swaf"
}
