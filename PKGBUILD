# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=lbt
pkgver=4.0.1
pkgrel=1
pkgdesc='Command-line tools for interacting with the LBRY network'
arch=('any')
url='https://gitlab.com/gardenappl/lbt'
license=('GPL-3.0-or-later')
optdepends=('lbrynet: install this unless you connect to a LBRY daemon on a separate machine')
depends=('jq' 'curl')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

package() {
   # The gettext localization is barely functional, so not bothering to install it

   install -Dm755 "${srcdir}/$pkgname-v$pkgver"/lbt -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/$pkgname-v$pkgver"/lbt-open.desktop -t "${pkgdir}/usr/share/applications/"
}
b2sums=('3b7efabf75d3eeff422632ca1a5e9e060709c7909ea2f75bed2c61810c8350512c541ba9aeaaa3f5cdd7ed5aa090db98d139db9ed0d9d8fafdd806334653bf17')
