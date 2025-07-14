pkgname=m-tools
pkgver=2.1
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool'
arch=('any')
url="https://aur.archlinux.org/packages/m"
license=('MIT')
depends=()
source=("https://raw.githubusercontent.com/kayemaye/m/refs/heads/main/m")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')
# sorry envolution. first time on the AUR, didnt know to do this stuff. thanks.
# BUT, my package is useful tho? like read the pkgdesc dude???
 
package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

