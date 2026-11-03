# Maintainer: kregonia <jiangchenglu2004@gmail.com>

pkgname=babry-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Smart boundary-aware screenshot tool for Linux Wayland"
arch=('x86_64')
url="https://github.com/kregonia/babry"
license=('Apache-2.0')
depends=('fontconfig' 'libxkbcommon' 'wayland' 'wl-clipboard')
optdepends=('libnotify: desktop notifications'
            'libsystemd: KDE/systemd integration')
provides=('babry')
conflicts=('babry')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/kregonia/babry/releases/download/v${pkgver}/babry-amd64-linux-v${pkgver}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kregonia/babry/v${pkgver}/LICENSE")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('48f9db4f468c76a45a6bfea947a37718ab22beab6c20dbbff9ab5afd76aabab8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/babry"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
