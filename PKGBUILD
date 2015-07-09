# Submitter: agnotek <agnostic[dot]sn[at]gmail[dot]com>
# Mantainer: ziu<frances[dot]albanese[at]gmail[dot]com>
pkgname=anoise-community-extension2
pkgver=0.0.3
pkgrel=2
pkgdesc="Ambient Noise Community Library. Sounds and icons from the users"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
install=
options=()
conflicts=()
depends=('anoise' 'python-distutils-extra' 'gstreamer0.10' 'gstreamer0.10-python')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('f5b33245a09b957e16029677ada5b934077c3fbc3f974b28dc69e67d6203bc53')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

