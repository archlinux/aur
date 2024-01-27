pkgname='liteloader-qqnt-plugin-llapi-bin'
_pkgname='LiteLoaderQQNT-Plugin-LLAPI'
pkgver='1.3.0'
pkgrel=1
pkgdesc='A LiteLoaderQQNT plugin that can provide some APIs for other plugins'
arch=('any')
url="https://github.com/Night-stars-1/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt-bin")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("256e50031c3af45d3135fe4235df3a846a5daa9d60bf2f4f39d4fb6da299652b")
b2sums=("7157e2863ed8b32ab71b2691c6f1902a5dded29064859ddbe591e31d58889cfe58a14e91f11de88494fcca745f26ddb8f2321e6fe1a59a919c8b53270955552d")

package() {
    install -dm777 "${pkgdir}/opt/LiteLoader"
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins"
    bsdtar -xf "v${pkgver}.tar.gz" -C "${pkgdir}/opt/LiteLoader/plugins"
    mv "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}-1.3.0" "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}" 
}

