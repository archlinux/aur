# Maintainer: Jakub Podeszwik <jakubpodeszwik@gmail.com>
pkgname=razer-naga-2014-key-remap-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Remaps razer naga 2014 keys into F1..F12 keys in linux operating system."
arch=('x86_64')
url="https://github.com/jpodeszwik/razer-naga-2014-key-remap"
license=('MIT')
provides=('razer-naga-2014-key-remap')
source=("https://github.com/jpodeszwik/razer-naga-2014-key-remap/releases/download/v${pkgver}/razer-naga-2014-key-remap"
        "https://github.com/jpodeszwik/razer-naga-2014-key-remap/archive/v${pkgver}.tar.gz")
md5sums=('87cc77475b98d1e099f3b43343612948'
         '604ee241dc35c550ea9eec59c693d6fc')

package() {
    install -Dm 644 "razer-naga-2014-key-remap-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "razer-naga-2014-key-remap-${pkgver}/systemd/razer-naga-2014-key-remap.service" "${pkgdir}/usr/lib/systemd/system/razer-naga-2014-key-remap.service"
    install -Dm 755 "razer-naga-2014-key-remap" "${pkgdir}/usr/bin/razer-naga-2014-key-remap"
}
