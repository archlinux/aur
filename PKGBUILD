# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
pkgver=1.0.0
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
sha256sums=('f6eb9710da1d17c5a23fd6fc667f87a1d0ff41a400ebd62ccb94328410d5058d')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
