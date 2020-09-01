# Maintainer: Naoya Yamashita <conao3/at/gmail.com>
# Contributor: Chris Mullins <christopher.r.mullins gmail>

pkgname=bashcaster
pkgver=0.1
pkgrel=1
pkgdesc="Simple script that uses ffmpeg to record screencasts to videos or GIFs."
url="https://github.com/alphapapa/bashcaster"
arch=("any")
license=("GPL3")
depends=("ffmpeg" "xorg-xprop" "xorg-xwininfo" "yad")
optdepends=("gifsicle")

source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("e277c8773505f90f1462422cdf8c87340e5e4fafeaf7853761cbff891d0847724699b21a5d599aaccfed445d0d2435e398256e3b685a98955399cb3fa855342d")

conflicts=("${pkgname}-git")

package() {
    cd "${pkgname}-${pkgver}"

    install -m755 -D "bashcaster.sh" "$pkgdir/usr/bin/bashcaster"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
