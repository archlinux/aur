# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=alsi
pkgver=0.4.7
pkgrel=1
pkgdesc="ALSI: a configurable system information tool for Arch Linux. [Inspired by Archey]"
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')
depends=(
    'perl>=5.14.2'
    'perl-data-dump'
    )
optdepends=(
    'scrot: for taking screenshots.'
    )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('043efcda81e3173e5ef960d6660b4fc533fc42aadc4faebb484ff9109d71f077')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
