# Maintainer: gardenapple <gardenapple at posteo dot net>

pkgname=lbt
_author=gardenappl
pkgver=2.1.2
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
b2sums=('86a59743c8f105ef2d4216d0185bd138ee522942d50d5ab22e010c6a17de4bbbdf09d9823e1a2fb323ff619072cb360792b33547fbd38427ae8fb29b26dd1b8d')
