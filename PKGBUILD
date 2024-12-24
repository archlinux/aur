# Maintainer: coolpuppykid <neduos67@gmail.com>
# Maintainer: luvth <raphonlinux@gmail.com>

pkgname="pyrfetch-git"
pkgver=1.1
pkgrel=1.1
pkgdesc="Pyrfetch is a simple and lightweight version of Neofetch Written in Python"
arch=($CARCH)
url="https://github.com/luvth/pyrfetch"
license=("GPL-3.0")
provides=(pyrfetch-git)
conflicts=(pyrfetch-git)
depends=(python3 python-psutil)
source=("git+https://github.com/luvth/pyrfetch.git#branch=main")
sha256sums=("SKIP")

package() {
  install -Dm755 "$srcdir/pyrfetch/pyrfetch" "$pkgdir/usr/bin/pyrfetch"
  install -Dm644 "$srcdir/pyrfetch/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
