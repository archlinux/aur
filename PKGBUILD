# Maintainer: Alva <https://aur.archlinux.org/account/Alva>
pkgname=lntrn
pkgver=1.0
pkgrel=1
pkgdesc="A neofetch-style system info tool for Lantern DE — renders a lantern icon as ANSI half-block art alongside system info"
arch=('any')
url="https://github.com/Jca56/lntrn"
license=('custom')
depends=('bash' 'python' 'python-pillow')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jca56/lntrn/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82a656338635b082d5ebd445cad45e2ebb4cd03015e6a2e1d60d6c02ab068d82')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lntrn            "$pkgdir/usr/bin/lntrn"
    install -Dm644 assets/lntrn.png "$pkgdir/usr/share/lntrn/lntrn.png"
}
