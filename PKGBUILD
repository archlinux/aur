# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-oneapi-deep-neural-network-library
pkgver=2026.0.0
pkgrel=1
pkgdesc="Intel® Deep Neural Network Library (oneDNN)"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onednn-download.html"
license=('custom')
source=('intel-onednn-2026.0.0.689_offline.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/964163c0-9651-4e14-8ebf-3cc27e2519e4/intel-onednn-2026.0.0.689_offline.sh')
noextract=('intel-onednn-2026.0.0.689_offline.sh')
sha384sums=('29cd895492bdde32b83611f21e85b06085b15604cd26eb45aa4692c0e1d8a57d34cf2c447d3a07559d46f14c3afc27bf')

package() {
    sh "${srcdir}/intel-onednn-2026.0.0.689_offline.sh" -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi"
}
