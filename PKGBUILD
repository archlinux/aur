# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=2.0.1
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
b2sums=('ce4ea6c275528a17446f9495ea1e89fb30c1b6c723154d0c6fb12792f0f79bbacce5013ae53303a0069c8956e017c77466d2b557be646cf1f22fd3c991e083ae')
