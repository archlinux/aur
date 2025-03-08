# Maintainer: jlvihv <imvihv@gmail.com>

pkgname=r2uploader
_pkgname=R2Uploader
pkgver=1.0.4
pkgrel=1
pkgdesc="易用的文件上传工具，专为多文件和大文件处理而优化，可以将文件轻松上传到 Cloudflare R2 存储。"
arch=('x86_64')
url="https://github.com/jlvihv/R2Uploader"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
options=(!strip)

source_x86_64=("${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/${pkgname}-v${pkgver}/R2Uploader_${pkgver}_amd64.deb")

sha512sums_x86_64=('16895bbb46850f4c9c06360ae9613e8ec674c62b02878e3ee74e994b92ddc9001b053380378b9d27a1ed7e7b6189857d2723401ed0d75cba0ecb22f677015155')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
