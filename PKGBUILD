# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=aurman-zsh-completion
pkgver=2.16.10
pkgrel=1
pkgdesc="ZSH completion for aurman"
arch=('any')
url="https://github.com/steven-omaha/aurman-zsh-completion"
license=('MIT')
depends=('zsh' 'aurman')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/steven-omaha/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cf6ce90ca6b1cf5b552983ace5673201433ed5ce5374faedaab53569e414db59')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 _aurman "$pkgdir/usr/share/zsh/site-functions/_aurman"
}
