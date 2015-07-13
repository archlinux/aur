# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.0
pkgrel=1
pkgdesc="Command line browser of KeePassX database files (*.kdb)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-file-keepass' 'perl-term-shellui' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-sort-naturally' 'perl-clone')
optdepends=('perl-crypt-pwsafe3: import Password Safe v3 files'
            'perl-capture-tiny'
            'perl-clipboard')
url='http://sourceforge.net/projects/kpcli/'
source=("http://downloads.sourceforge.net/project/kpcli/kpcli-$pkgver.pl"
        "http://downloads.sourceforge.net/project/kpcli/README")
sha256sums=('947b7b0485215f72e14bb8936c847abb583253c597f58234650922270259049c'
            '43878d755ea06a2fa2a5df0ee77cb81f1a55b6bba7c855b47f46e63ba9630e03')

package() {
  install -Dm755 "kpcli-${pkgver}.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

