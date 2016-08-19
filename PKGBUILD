# Maintainer: Hannes Eichblatt <aur@hanneseichblatt.de>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <oscar a erroneousthoughts org>

pkgname=kpcli
pkgver=3.1
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
sha256sums=('f1f07704a30d0eae126717d5dae0d24ccced43c316454e4a7b868fe0a239a21a'
            '30e0e44651bf0dcb08a53c974450acae82857b462dab1b02a5911217a6b936a1')

package() {
  install -Dm755 "kpcli-${pkgver}.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

