# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=1.1.3
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
b2sums=('1abdd71b19eacf2a50fa06ccb06dad688467993e4e5f228cc9dbe8b37a7f2965976ecb3a5994d46f79ae612d2540457710a6d89628bd17d6d25713e527913f97')
