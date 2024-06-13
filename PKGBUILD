# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
pkgver=1.1.0
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
sha256sums=('a1df33598747a28eb229cd91be87d9059ba1c4fc851f7dfc2171f681597f31a2')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
