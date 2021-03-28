# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=defrag
pkgver=0.08
pkgrel=1
pkgdesc="A braindead simple and filesystem agnostic defragmentation script"
url="http://ck.kolivas.org/apps/defrag/"
license=()
depends=('bash')
arch=('any')
source=("http://ck.kolivas.org/apps/defrag/$pkgname-$pkgver/defrag")
sha512sums=('fa1c9c3a58ec43020a6a1da66bcbf8304e9b2ad1afbd25c0aab0962410e977412954669be2ae2aaaf8b14b2294cad91bbb0143f589688aa684080dff1b2c5316')

package() {
    cd "${srcdir}"

    install -D -m755 defrag "${pkgdir}/usr/bin/defrag"
}

