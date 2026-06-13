# Maintainer: SummerBreeze630 <xzwf2003@163.com>

pkgname=knowledge-base
pkgver=1.14.0
pkgrel=1
pkgdesc="本地知识库桌面应用 - 全文搜索、双向链接、知识图谱"
arch=('x86_64')
url="https://kb.ruoyi.plus/"
license=(custom)
depends=('gtk3' 'webkit2gtk-4.1')
provides=()
options=('!strip')
_git_url="https://github.com/bkywksj/knowledge-base/blob"
_download_url="https://pub-9d9e6c0cb6934fb0a0c505e3c64f39b2.r2.dev/knowledge-base"
source=("${_download_url}/v${pkgver}/Knowledge.Base_${pkgver//_/-}_amd64.deb"
        "https://raw.githubusercontent.com/bkywksj/knowledge-base/master/LICENSE"
)

sha256sums=('c572a4ff896a49027c19d0c798d34fd96932946182e9479bc366cb61243d664d'
            'c7e6053c950190960d461e086b82bf804a9727d6281c39bc2ff3acdb7ef175ac')

package() {
	tar -axvf data.tar.gz -C ${pkgdir}

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
