# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.2.3'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("ccff07355b2468d92256c01798619a8796c1008a0b6d6c2114ee84b491ab503d")
b2sums=("f4a225ff658eed27000631fb359c3e0bbb3d37f80df695cc7433040ee61d90db74831236ce35b398808df76c2eb427cc4626990e20011c7dc0ff5b773a8a2d08")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

