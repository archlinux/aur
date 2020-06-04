# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fnt_name=kanit
_user=cadsondemak
pkgbase=$_fnt_name-font
pkgname=(otf-$_fnt_name ttf-$_fnt_name)
pkgver=0
_sha=f0c99c2461674524d19fe0922604325955caffec
pkgrel=1
pkgdesc='a Thai + Latin formal sans serif font family with 18 styles'
arch=('any')
url="https://$_user.github.io/$_fnt_name"
license=('OFL')
provides=("$pkgbase")
source=("$pkgname-$pkgver.zip::https://github.com//$_fnt_name/archive/$_sha.zip")
sha256sums=('aba494422a553db35fc42b30be7a10e0c95b9aef3e6e9d0910ebd6742573fc8c')

package_otf-kanit() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" font/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-kanit() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" font/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
