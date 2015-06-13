# Maintainer : Denis Gonsiorovsky <dns.gnsr@gmail.com>

pkgname=asus-n551-hda-fix
pkgver=0.1
pkgrel=1
pkgdesc='Intel HDA driver fix for the ASUS N551JM/N551JK laptop'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/gonsiorovsky/asus-n551-hda-fix'
depends=('linux')
makedepends=()
source=("asus-n551-hda-fix.conf" "asus-n551-hda-fix.fw")
sha256sums=('1f4ae514a878cb8befee906aff894d72f7328c7571c77846e59c752f2a1f8b93'
            'abc41837034ea231b70324147df502414d29e485039cc3772d8e98817af87c59')
 
package() {
  install -Dm644 "${srcdir}/asus-n551-hda-fix.conf" "${pkgdir}/etc/modprobe.d/asus-n551-hda-fix.conf"
  install -Dm644 "${srcdir}/asus-n551-hda-fix.fw" "${pkgdir}/usr/lib/firmware/asus-n551-hda-fix.fw"
}
