pkgname=m-tools
pkgver=2.1
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool'
arch=('any')
url="https://github.com/kayemaye/m"
license=('MIT')
depends=()
source=("https://github.com/kayemaye/m/releases/download/v2.0/m")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
# sorry envolution. first time on the AUR, didnt know to do this stuff. thanks.
# BUT, my package is useful tho? like read the pkgdesc dude???

package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

