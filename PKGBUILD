pkgname=smyte
pkgver=1.0.0
pkgrel=1
pkgdesc="A ricer-style bandwidth/network monitor. Run it using 'sy'."
arch=('any')
url="https://aur.archlinux.org/packages/smyte"
license=('MIT')
depends=('python' 'python-rich' 'python-psutil')
source=("smyte.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/smyte.py" "$pkgdir/usr/bin/sy"
}
