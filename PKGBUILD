# PKGBUILD
pkgname=lyse
pkgver=2.2.1
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/efe764e05fe23eef4798a4d895594bcc296cddf3/lyse.py")
sha256sums=('23180938a8d1c158909bc63651a983e688e3aab161dddf5035a5fe12668cd812')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}
