# Maintainer: Mahmoud Al Nagar <mnwhisperer@gmail.com>

pkgname=nectarlink-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A cross-platform client for Nectar"
arch=('x86_64')
url="https://github.com/thtbee/nectarlink"
license=('MIT') # (تقدر تعدلها لو رخصة المشروع مختلفة)
depends=('gtk3' 'nss' 'alsa-lib')
provides=('nectarlink')
conflicts=('nectarlink')

source=("nectarlink_${pkgver}_amd64.deb::https://github.com/thtbee/nectarlink/releases/download/v${pkgver}/nectarlink_${pkgver}_amd64.deb")
sha256sums=('c516907e76e61fa5ad18048e93836a289974a46e7f2a8ff6fade79234ea9be6d')

package() {
    # فك ضغط مجلد الداتا من ملف الـ deb ونقله لمسار التثبيت مباشرة
    tar xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
