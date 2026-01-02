# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=codegrab
pkgname=$_projectname-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI and TUI for selecting and bundling code into a single, LLM-ready output file"
arch=("x86_64")
url="https://github.com/epilande/codegrab"
license=("MIT")
provides=("codegrab")
conflicts=("codegrab")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_projectname}_${pkgver}_Linux_x86_64.tar.gz")
b2sums=('9e16d2930fcb2e6cfc46638017bae560e14976b41faa8a6619dd0bcf4902c5b9e4ea9696e85739c93689d48dea558dc4306fd42d5d66e036fe4aa681c3d073e1')

package() {
    install -Dm 755 grab "$pkgdir/usr/bin/grab"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
