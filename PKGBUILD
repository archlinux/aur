# Maintainer: Jorengarenar

pkgname=quiterss-backup
pkgver=0.7.0
pkgrel=2
pkgdesc='Simple script, which provides more convenient backup options for QuiteRSS'
arch=('any')
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5e7e1e7901f4d69820fee3ed641ce2f355c839f3fd50220fc7f140a1635ea809ea074a343d5e6963ff465c9227a21c1f82b4056b287460b86fb6e29e8727ebb8')

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
