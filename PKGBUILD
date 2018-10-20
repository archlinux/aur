# Maintainer: Jakub Podeszwik <jakubpodeszwik@gmail.com>
pkgname=razer-naga-2014-key-remap-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Remaps razer naga 2014 keys in linux operating system."
arch=('x86_64')
url="https://github.com/jpodeszwik/razer-naga-2014-key-remap"
license=('MIT')
provides=('razer-naga-2014-key-remap')
source=("https://github.com/jpodeszwik/razer-naga-2014-key-remap/releases/download/v${pkgver}/razer-naga-2014-key-remap"
        "https://github.com/jpodeszwik/razer-naga-2014-key-remap/archive/v${pkgver}.tar.gz")
md5sums=('82b4b93c49dcb0e95da3819597491a6c'
         '8618a8e4e26e77ec7bef0fbf3eabf811')

package() {
    install -Dm 644 "razer-naga-2014-key-remap-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "razer-naga-2014-key-remap-${pkgver}/systemd/razer-naga-2014-key-remap.service" "${pkgdir}/usr/lib/systemd/system/razer-naga-2014-key-remap.service"
    install -Dm 644 "razer-naga-2014-key-remap-${pkgver}/config/razer-naga-2014-key-remap.toml" "${pkgdir}/etc/razer-naga-2014-key-remap.toml"
    install -Dm 755 "razer-naga-2014-key-remap" "${pkgdir}/usr/bin/razer-naga-2014-key-remap"
}
