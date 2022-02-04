pkgname=ultravnc-viewer-securevnc-plugin
_uvnc_pkgname=ultravnc-viewer
pkgver=2.4
pkgrel=2
pkgdesc="A plugin that provides simple, effective and securely encrypted VNC sessions for UltraVNC"
arch=('any')
url="https://uvnc.com/downloads/encryption-plugins/87-encryption-plugins.html"
license=('LGPL')
depends=('ultravnc-viewer>=1.0.9')
source=("https://uvnc.com/download/encryptionplugins.zip")
sha256sums=('14024a825fe7c6b6924f21506ccf9be175c9594d44672cb7697dbe9e0be16405')

package() {
  # Install files
  install -m 644 -D "${srcdir}/encryptionplugins/All/32/SecureVNCPlugin.dsm" "${pkgdir}/usr/lib/${_uvnc_pkgname}/SecureVNCPlugin.dsm"
  install -m 644 -D "${srcdir}/encryptionplugins/All/64/SecureVNCPlugin64.dsm" "${pkgdir}/usr/lib/${_uvnc_pkgname}/SecureVNCPlugin64.dsm"
}
