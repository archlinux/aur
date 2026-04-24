pkgname=multica-bin
pkgver=0.2.16
pkgrel=1
pkgdesc="Multi-agent AI coding framework"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=()
options=(!strip !debug)
conflicts=("multica")
provides=(multica)

source=("https://github.com/multica-ai/multica/releases/download/v0.2.16/multica-cli-0.2.16-linux-amd64.tar.gz")
sha256sums=('ff96d00c3727c7da5160af6bf124aea05584e5d82eaf0541461875efc9c8cde7')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "multica" "${pkgdir}/usr/bin/multica"
}