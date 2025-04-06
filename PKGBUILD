# Maintainer: danihek

pkgname='themecord'
pkgver=1.1.0
pkgrel=1
pkgdesc="Discord theme will always match your wallpaper!"
arch=('any')
url="https://github.com/danihek/themecord"
license=('MIT')
depends=('hellwal')
optdepends=(
    'pywal: An alternative color palette generator'
    'wallust: An alternative color palette generator'
)
source=("${pkgname}::https://github.com/danihek/Themecord/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd Themecord-${pkgver}
	install -Dm755 "themecord" "$pkgdir/usr/bin/themecord"

    echo "[INFO] !Make sure that you read README on github: https://github.com/danihek/themecord"
}

