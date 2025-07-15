pkgname=m-tools
pkgver=2.1
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool'
arch=('any')
url="https://github.com/kayemaye/m"
license=('MIT')
depends=()

source=("https://raw.githubusercontent.com/aysunwhatsup/aysunwhatsup.github.io/refs/heads/main/m")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
# sorry envolution. first time on the AUR, didnt know to do this stuff. thanks.
# BUT, my package is useful tho? like read the pkgdesc dude???

package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

