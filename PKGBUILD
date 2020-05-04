# Maintainer: Thomas Poot <thomas.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.4
pkgrel=1
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-crypt-pwsafe3: import Password Safe v3 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("https://iweb.dl.sourceforge.net/project/kpcli/kpcli-$pkgver.pl"
        "https://iweb.dl.sourceforge.net/project/kpcli/README")
sha256sums=('403e5d73cc4685722a5e4207c5fcbdad8e30475434cfba151c095e13a2658668'
            '485fb583303eef2e625d6b56ed913b63840f902f15f8ae94cc366e2c71366a81')

package() {
  install -Dm755 "kpcli-${pkgver}.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

