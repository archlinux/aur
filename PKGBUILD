# Maintainer: super <x6ji7ar9 at anonaddy dot me>

pkgname=open-webui-dinit
pkgver=3
pkgrel=1
pkgdesc='Dinit service scripts for Open WebUI (venv)'
arch=('any')
license=('GPL-3.0')
depends=('open-webui' 'dinit')
source=('open-webui')
sha256sums=('bb0bda7ab4bba0bb591e6302e7d1ebc906c992c6c87dd330989298dce0dacb05')

package() {
    install -Dm644 open-webui "$pkgdir/etc/dinit.d/open-webui"
}

