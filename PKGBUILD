# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=1.1.1
pkgrel=1
pkgdesc='Command-line tools for interacting with the LBRY network'
arch=('any')
url='https://gitlab.com/gardenappl/lbt'
license=('GPL3')
depends=('jq' 'curl' 'lbrynet')
source=("https://gitlab.com/$_author/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

package() {
   # The gettext localization is barely functional, so not bothering to install it

   install -Dm755 "${srcdir}/$pkgname-v$pkgver"/lbt -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/$pkgname-v$pkgver"/lbt-open.desktop -t "${pkgdir}/usr/share/applications/"
}
b2sums=('6f50cc3cc03402c07ddf9522b7a6b0be425621e5f5f9aba72163dfcd47710fc5d4d0e5ea79fb7c567dc3b56d6051fcd418a557444ba11c437ec50ec4884c6130')
