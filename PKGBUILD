# Maintainer: super <x6ji7ar9 at anonaddy dot me>

pkgname=open-webui-dinit
pkgver=1
pkgrel=1
pkgdesc='Dinit service scripts for Open WebUI'
arch=('any')
license=('GPL-3.0')
depends=('dinit')
source=('open-webui')
sha256sums=('7e20258c19d290fda1da9205bdf81909889f473047be960dd223bea1dd6ba2a8')

package() {
    install -Dm644 open-webui "$pkgdir/etc/dinit.d/user/open-webui"
}

