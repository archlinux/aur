# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fnt_name=kanit
_user=cadsondemak
pkgbase=$_fnt_name-font
pkgname=(otf-$_fnt_name ttf-$_fnt_name)
pkgver=2.000
_sha=467dfe842185681d8042cd608b8291199dd37cda
pkgrel=1
pkgdesc='a Thai + Latin formal sans serif font family with 18 styles'
arch=(any)
url="https://$_user.github.io/$_fnt_name"
license=(OFL)
provides=("$pkgbase")
source=("$pkgname-$pkgver.zip::https://github.com/$_user/$_fnt_name/archive/$_sha.zip")
sha256sums=('e3e3969ec48502b8769e1b2b60ecd2e7fcd81cdb6ba7fde11ebee61c88498aa6')

package_otf-kanit() {
    cd "$_fnt_name-$_sha"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-kanit() {
    cd "$_fnt_name-$_sha"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/ttf/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
