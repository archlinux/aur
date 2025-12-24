# Maintainer: Ghassan Alduraibi <ghassanalduraibi@gmail.com>

pkgname=ttf-six-caps
_commit='47a6c224b3e0287b2e48e3ffef8c9ce2ca4931f4'
pkgver=1.0
pkgrel=1
pkgdesc='A highly condensed and tight display font by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Six+Caps'
license=('custom:SIL Open Font License v1.1')
conflicts=()
source=("Six-Caps-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/sixcaps/SixCaps.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/${_commit}/ofl/sixcaps/OFL.txt")
sha256sums=('7b54a46671722fb670647c9c3951e6e618b6a9d876fc5d9ae34dfd311628ae5a'
            '29cca754098468057880970c604e55c4e2bcb8479742e4130c94f2ddc0363f9c')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Six-Caps-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Six-Caps-Regular.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

