# Maintainer: luzea <me at luzea dot ovh>

pkgname=smartversion
pkgver=3.82
_pkgver=382
pkgrel=1
pkgdesc='A tool for storing multiple versions of your files inside SVF files (Shareware)'
arch=('x86_64')
url='https://www.smartversion.com'
license=("custom:${pkgname}")
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://www.smartversion.com/smartvs${_pkgver}_linux_x64.zip")
sha256sums=('a34e70f8415edc3729810fcb8baa11036b36cc6beb0e47e8f37a9e071972e2e3')

package() {
  install -Dm755 smv -t "${pkgdir}/usr/bin"
  echo "SmartVersion is a shareware product. You may copy, distribute, and try it for free, but if you use for longer than the evaluation period, you must register. You will receive a valid license, a registration code and the latest release.
  If you register SmartVersion, I will send you a registration number. When you choose Registering in the Option menu, and enter this registration number, you will be able to hide the opening screen in the Preference (Option menu). 
  Contact me by email (info@winimage.com) for site license pricing. Site license pricing entails lucrative discounts for multiple licenses." > LICENSE
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
