# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=lbt
_author=gardenappl
pkgver=3.0.1
pkgrel=1
pkgdesc='Command-line tools for interacting with the LBRY network'
arch=('any')
url='https://gitlab.com/gardenappl/lbt'
license=('GPL3')
optdepends=('lbrynet: install this unless you connect to a LBRY daemon on a separate machine')
depends=('jq' 'curl')
source=("https://gitlab.com/$_author/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

package() {
   # The gettext localization is barely functional, so not bothering to install it

   install -Dm755 "${srcdir}/$pkgname-v$pkgver"/lbt -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/$pkgname-v$pkgver"/lbt-open.desktop -t "${pkgdir}/usr/share/applications/"
}
b2sums=('722b2d76ed3a7b88a4b3d7a2d2dfb43f162aee714ca9ae1c155e266289b864592d30f803e0025ae1a684f33a2ff2b024039fe80efe5026dfa615edf176bdb5ed')
