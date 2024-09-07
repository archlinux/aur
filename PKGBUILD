# Maintainer: Samantha Poot <samantha.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=4.1.1
pkgrel=1
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-file-kdbx' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-expect: import Keepass KDBX4 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("$pkgname-$pkgver.pl::https://sourceforge.net/projects/kpcli/files/kpcli-$pkgver.pl/download"
        "$pkgname-$pkgver-README::https://sourceforge.net/projects/kpcli/files/README.txt/download")
sha256sums=('cb218a556a33718d8eae4eb6595f5e0bdb0d63226964f89fd4beded87e0d2ff4'
            '3db4157149fc16469dea0236facd270b51b3fe4259a4066806c68b5f7e821ad7')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

