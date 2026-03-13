# PKGBUILD
pkgname=lyse
pkgver=2.1.0
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/281550f4dbdc5bf57fbb5fcb19e61f1aaaf1b97e/lyse.py")
sha256sums=('4069e5f465d9e5da8941974d8c6c7644fd8db3f041c9a3d0682a104fe068f3a8')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}
