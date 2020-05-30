# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=fraunces
pkgbase=${_project}-font
pkgname=("ttf-$_project-variable") # "ttf-$_project" "otf-$_project"
pkgver=0.001
_sha=611c698e29de78d133beac7534a0ac7b914682cb
pkgrel=1
pkgdesc='A display, “Old Style” soft-serif typeface inspired by early 20th century typefaces'
arch=('any')
url="https://github.com/undercasetype/${_project^}"
license=('OFL')
source=("$url/archive/$_sha/$pkgname-$pkgver.zip")
sha256sums=('44b6f52536b8fdabae2e938344befbe2bacbc7800909c086401f4a28197fad7e')

package_otf-fraunces () {
    :
}

package_ttf-fraunces () {
    :
}

package_ttf-fraunces-variable () {
    pkgdesc+=" (variable)"
    cd "${_project^}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/*\[*\].ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
