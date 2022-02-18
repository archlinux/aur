# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=BeowulfOT-font
pkgbase=${_project,,}
pkgname=(otf-${pkgbase%-font})
pkgver=2.000
_sha='fbe23e16bc31246f66738b5d6e471c590bcf10df'
pkgrel=2
pkgdesc='an updated version of the widely-used BeowulfOne font'
arch=('any')
url="https://github.com/psb1558/$_project"
license=('OFL')
_archive="$_project-$_sha"
source=("$url/archive/$_sha/$_archive.tar.gz")
sha256sums=('ec250918117941cf1543199a8d93fb7960d6dac622ccacb5bb4a6920296cabd9')

package_otf-beowulfot() {
    provides=("$pkgbase")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" font/*.otf
}
