# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=1.0
pkgrel=2
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
b2sums=('0a86ec1f5c33b0f59729161b7fb0830255a14a1f7cd9bf4be3783f3a4cdbf4a93feec2ea26b7afa877d77514db3a0f8f385c1e3370c3dac259f96c480adc40b3')
