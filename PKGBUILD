# Maintainer: Thomas Poot <thomas.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.7
pkgrel=2
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-crypt-pwsafe3: import Password Safe v3 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("$pkgname-$pkgver.pl::https://sourceforge.net/projects/kpcli/files/kpcli-$pkgver.pl/download"
        "$pkgname-$pkgver-README::https://sourceforge.net/projects/kpcli/files/README.txt/download")
sha256sums=('8c12566c292650451590ba42aba48f117eb60d786aed4309cca19febd4d2d673'
            '92a0b6508e5e6ec66f0890dfd9ef925917e108388e50a2aba0ba542ed6fad0f1')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

