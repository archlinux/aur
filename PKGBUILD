# Maintainer: devome <evinedeng@hotmail.com>

pkgname=flexget-webui-v1
pkgver=1
pkgrel=1
pkgdesc="The FlexGet Web UI (v1)"
arch=("any")
url="https://github.com/Flexget/Flexget"
license=("MIT")
source=("${pkgname}.zip::${url}/releases/download/v3.0.6/webui_v1.zip")
sha256sums=('c9416e2e3f28bb222ec6da5aa67f0ad34bdd0418647de0c3dcdeb1dd5ea29533')
options=("!strip")

package() {
    find app -type f | xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/flexget-webui/v${pkgver%%.*}/"{}
}
