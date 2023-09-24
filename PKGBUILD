# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=rcedit-bin
pkgver=1.1.1
pkgrel=2
pkgdesc='Command line tool to edit resources of exe files.'
arch=('any')
url='https://github.com/electron/rcedit/'
license=('MIT')
depends=('wine')
source=("https://github.com/electron/rcedit/releases/download/v${pkgver}/rcedit-x64.exe"
	'rcedit')
sha256sums=('02e8e8c5d430d8b768980f517b62d7792d690982b9ba0f7e04163cbc1a6e7915'
            '147cf514f855475edba9cd9267700b091c75ce424a8aae4bf24c339d72752766')

package() {
    install -Dm755 "${srcdir}/rcedit-x64.exe" "${pkgdir}/opt/rcedit/rcedit-x64.exe"
    install -Dm755 "${srcdir}/rcedit" "${pkgdir}/usr/bin//rcedit"
}
