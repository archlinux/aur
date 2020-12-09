# Maintainer: Gustavo Costa <gusbemacbe@gmail.com>

pkgname=yaru-plus-git
pkgver=4.1
pkgrel=7
pkgdesc="Yaru++ – Elegant and modern third-party icons theme, based on Canonical’s Yaru"
arch=('any')
url="https://github.com/Bonandry/${pkgname/-git/}"
license=('GPL3')
changelog=CHANGELOG.sh
depends=('yaru-icon-theme')
makedepends=('git')
conflicts=(${pkgname/-git/})
provides=(${pkgname/-git/})
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() 
{
    make -C ${pkgname/-git/} DESTDIR="$pkgdir/" install
}
