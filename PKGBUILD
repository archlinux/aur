# Maintainer: Thomas Poot <thomas.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.6
pkgrel=1
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-crypt-pwsafe3: import Password Safe v3 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("$pkgname-$pkgver.pl::https://iweb.dl.sourceforge.net/project/kpcli/kpcli-$pkgver.pl"
        "$pkgname-$pkgver-README::https://iweb.dl.sourceforge.net/project/kpcli/README.txt")
sha256sums=('01f23882d458dfffc176fe5f268ced13c667de22b7fbf60d488eca87f3362deb'
            '25b84d0cc9c2ac58b59faaf49aa7206648388638c268547c30b80d9ee09e8c03')

package() {
  install -Dm755 "$pkgname-$pkgver.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 "$pkgname-$pkgver-README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

