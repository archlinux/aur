# Maintainer: Samantha Poot <samantha.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.8.1
pkgrel=2
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
            'aa3f607576efa3bb3f2742e80fae0d66509fe1bdfa9f969b265d2050be7984c3')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

