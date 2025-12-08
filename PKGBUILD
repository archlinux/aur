# Maintainer: Samantha Poot <samantha.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=4.1.2
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
sha256sums=('86fc820bc7945cd9b577583efe4127565951268902860256ceea100795ddf23f'
            '27d00febf2df8f32a60fffb84af677150a268e8b6a394a74801d38ab29fa28cb')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

