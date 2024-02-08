# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
pkgver=1.0.1
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
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
