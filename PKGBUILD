pkgname=ultravnc-viewer-securevnc-plugin
_uvnc_pkgname=ultravnc-viewer
pkgver=2.3
pkgrel=1
pkgdesc="A plugin that provides simple, effective and securely encrypted VNC sessions for UltraVNC"
arch=('any')
url="http://adamwalling.com/SecureVNC/"
license=('LGPL')
depends=('ultravnc-viewer>=1.0.9')
source=("http://adamwalling.com/SecureVNC/SecureVNCPlugin.dsm"
        "http://adamwalling.com/SecureVNC/SecureVNCPlugin64.dsm")
sha256sums=('fba301f819f4adf6439ce99d7114ab80614c14564cd859450916752399b56f91'
            '0c1553ef40308c454fe7c93eff4948be5b9fde7bdafccc37761ceeb616a268d0')

package() {
  # Install files
  install -m 644 -D "${srcdir}/SecureVNCPlugin.dsm" "${pkgdir}/usr/lib/${_uvnc_pkgname}/SecureVNCPlugin.dsm"
  install -m 644 -D "${srcdir}/SecureVNCPlugin64.dsm" "${pkgdir}/usr/lib/${_uvnc_pkgname}/SecureVNCPlugin64.dsm"
}
