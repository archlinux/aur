# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
pkgver=0.8.1
pkgrel=1
pkgdesc="Tool to help you update your Ollama models"
arch=('any')
url="https://github.com/thatonecalculator/ollamamodelupdater"
license=('MIT')
optdepends=(
    'ollama: Ollama'
)
source=("$_pkgname::$url/releases/download/v"$pkgver"/$_pkgname")
noextract=()
options=(!strip)
sha256sums=('17141cf187c0b0711a05ee4891a37873c0eb224fa314f778dd5dfff0c0a675bd')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
