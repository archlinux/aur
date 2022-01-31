# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=2.1.1
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
b2sums=('d9db218f5919470135fa83a989aa3c2b65d78ffe379c1c41bcd6012bf8809a7850739c825488855cc14877699dfe8181a24c913df2daebd320fc75002bd3e7c0')
