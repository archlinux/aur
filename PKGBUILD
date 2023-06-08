# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=lbt
_author=gardenappl
pkgver=2.3.3
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
b2sums=('e1af1bc815eecc0a5b3ce2b2706b4db0d3bd43309cbbb3ddeb1c90b2177ddffff375365e9c165fae9836fee6fc5255f38515d27301e4507fb9c49c2695fc1051')
