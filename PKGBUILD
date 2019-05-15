# Maintainer: Thomas Poot <thomas.poot@protonmail.com>
# Contributor: Hannes Eichblatt <aur@hanneseichblatt.de>
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
source=("https://iweb.dl.sourceforge.net/project/kpcli/kpcli-$pkgver.pl"
        "https://iweb.dl.sourceforge.net/project/kpcli/README")
sha256sums=('615a1bae19ed0c132076a809b162a66ea0dc22c1d992a8c6e1f2e1aaedfae687'
            '8d81478c10a5c364e015429aed16cb8618ab04277162a687d7ca970e9e2b34c6')

package() {
  install -Dm755 "kpcli-${pkgver}.pl" "${pkgdir}/usr/bin/kpcli"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

