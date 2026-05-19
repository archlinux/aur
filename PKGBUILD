pkgname=susshi-bin
pkgver=0.15.5
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-amd64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-amd64")
b2sums=(dcbd2ac57f952c478c60a3d6b302653f42abb810b90f186eb3e9065c80823af81af254ff6319ee720d10afd1acc29ac4cc2c93537fae4a5b9fa4e6ce4d93ee92)
b2sums_x86_64=(5984085db8ca08a30232b661d42811ff27e8c2650caaecd8f0de462c50ec313f86d623935b5748100d319de2350d5d79290367ace54dc2db8a65ba19238c9820)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
