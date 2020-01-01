# Maintainer: miwinning <miwinning@miwcloud.me>
pkgname=ttf-camingocode
pkgver=1.0
pkgrel=1
pkgdesc="A modern monospaced typeface designed for code editors"
arch=(any)
url="http://www.janfromm.de/typefaces/camingomono/overview/"
license=('CC-BY-ND 3.0')
depends=()
makedepends=()
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.zip::http://janfromm.de/_data/downloads/CamingoCode-v1.0.zip")

package() {
    cd "$srcdir"
    files=(CamingoCode-BoldItalic.ttf CamingoCode-Bold.ttf CamingoCode-Italic.ttf CamingoCode-Regular.ttf)
    for f in "${files[@]}"; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/TTF/"
    done
}

sha256sums=('13b188ca8d1b5fe2c3ba880771f20a6faac550405ae98d12edd46240f8896714')
