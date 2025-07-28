# Maintainer: super <x6ji7ar9 at anonaddy dot me>

pkgname=open-webui-dinit
pkgver=4
pkgrel=1
pkgdesc='Dinit service scripts for Open WebUI (venv)'
arch=('any')
license=('GPL-3.0')
depends=('open-webui' 'dinit')
source=('open-webui')
sha256sums=('b4cf7095dfbde4f1c64ae05b93dc7de27b9b977861d3b156e828537e745a112f')

package() {
    install -Dm644 open-webui "$pkgdir/etc/dinit.d/open-webui"
}

