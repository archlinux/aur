# Maintainer: Thomas Poot <thomas.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.8.1
pkgrel=1
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-expect: import Keepass KDBX4 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("$pkgname-$pkgver.pl::https://sourceforge.net/projects/kpcli/files/kpcli-$pkgver.pl/download"
        "$pkgname-$pkgver-README::https://sourceforge.net/projects/kpcli/files/README.txt/download")
sha256sums=('6c84f8639245799bf9b2d5ce297c41b5d4ec0789f7f5fa9e8767556816ea472c'
            '9e0d52c5e212c069d23c537b35fda6f37e0d6f6011519e6ae12042196d5ebe66')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

