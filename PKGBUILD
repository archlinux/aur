# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Benjamin Goodger <ben at goodger dot nl>
# Contributor: Marcos Heredia <chelqo at gmail dot com>

_pkgname=Encode-Sans
pkgname=ttf-impallari-${_pkgname,,}
pkgver=2.000
pkgrel=4
pkgdesc='Professional font optimized for web use'
arch=('any')
url="https://github.com/impallari/$_pkgname"
license=('OFL')
_sha=370cdccdb22daf862c6fca0636aad64b6835decd
source=("$pkgname-$pkgver-$pkgrel.zip::$url/archive/$_sha.zip")
sha256sums=('70638ff0992812a96526024b23d6869fe16762670d62a43e03a6da8e71c2e375')

package() {
    cd "$_pkgname-$_sha"
    install -Dpm644 -t "$pkgdir/usr/share/fonts/TTF/$pkgname/" fonts/*.ttf
    install -Dpm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt CONTRIBUTORS.txt
    # install -Dpm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
