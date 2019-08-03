# Maintainer: Ange Kevin Amlaman (charveey) <amlamanangekevin at gmail dot com>

pkgname=bootsplash-systemd
pkgbase=bootsplash-systemd
pkgver=0.1.2
pkgrel=2
pkgdesc="Systemd service files for kernel bootsplash"
url=https://github.com/charveey/bootsplash-systemd
arch=("any")
license=("GPL")
depends=('systemd')
source=(
    bootsplash-ask-password-console.path     
    bootsplash-hide-when-booted.service
    bootsplash-ask-password-console.service  
    bootsplash-show-on-shutdown.service
)

package() {
    install -Dm644 "${srcdir}/bootsplash-hide-when-booted.service" "${pkgdir}/usr/lib/systemd/system/bootsplash-hide-when-booted.service"
    install -Dm644 "${srcdir}/bootsplash-ask-password-console.service" "${pkgdir}/usr/lib/systemd/system/bootsplash-ask-password-console.service"
    install -Dm644 "${srcdir}/bootsplash-show-on-shutdown.service" "${pkgdir}/usr/lib/systemd/system/bootsplash-show-on-shutdown.service"
    install -Dm644 "${srcdir}/bootsplash-ask-password-console.path" "${pkgdir}/usr/lib/systemd/system/bootsplash-ask-password-console.path"
}
md5sums=('d2642756f4425b2f87457ae31c094d13'
         'c038935769f00458f8ebd828229fe3ba'
         '0c877b79b06b5253a2f74a993a6dd576'
         '9f7471869b28a82ed08c813daf7e15a8')
