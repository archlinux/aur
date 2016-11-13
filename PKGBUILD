# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=apk-signer
pkgver=1.8.5
pkgrel=2
pkgdesc="apk-signer is a convenient tool to sign APK files"
arch=('any')
url="https://code.google.com/p/apk-signer/"
license=('MIT')
depends=('java-environment>=6')

source=("${pkgname}-${pkgver}.jar::https://dl.dropboxusercontent.com/u/237978006/android/apk-signer/apk-signer-${pkgver}.jar"
'https://gist.githubusercontent.com/shibumi/11086621/raw/2660ac92b59d6c30943cc326a792cca13f5fcffa/apk-signer')

sha512sums=('db899096028fc1e5de788ccbfa42e369f52ce4098b0698c778eafac2a8d74a657ce9d4dc8380af86b38793dd9b3d965ca8843ef4fcd8c9e0587d6ea3e0b1b0dc'
            '8ec9967e9b082f8977d1313173db08fcf2bcca46fc7de8469fec8b381136fd8dcb144ee9e0ee9f6e8eecc75747649def9cd5761732719539347d632f97cdcf94')


package() {
  install -D -m644 "${srcdir}/apk-signer-${pkgver}.jar" \
    "${pkgdir}/usr/bin/apk-signer.jar"
  install -D -m755 "${srcdir}/apk-signer" \
    "${pkgdir}/usr/bin/apk-signer"
  
}


# vim:set ts=2 sts=2 sw=2 et
