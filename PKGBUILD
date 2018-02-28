# Maintainer: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.2
pkgrel=2
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone' 'perl-xml-parser')
optdepends=('perl-crypt-pwsafe3: import Password Safe v3 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("http://downloads.sourceforge.net/project/kpcli/kpcli-$pkgver.pl"
        "http://downloads.sourceforge.net/project/kpcli/README")
sha256sums=('615a1bae19ed0c132076a809b162a66ea0dc22c1d992a8c6e1f2e1aaedfae687'
            '30e0e44651bf0dcb08a53c974450acae82857b462dab1b02a5911217a6b936a1')

package() {
  install -Dm755 "kpcli-${pkgver}.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

