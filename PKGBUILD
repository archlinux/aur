# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
pkgver=0.7.0
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
sha256sums=('43fc580b54a0a9bf8c59d7fa6cd0d81c6f977f5f774fc57e4a8de38e5b098cf1')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
