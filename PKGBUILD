# Maintainer: Barnabe di Kartola <barnabedikartola@gmail.com>
pkgname=pipewire-config
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
pkgdesc="simples interface de configuração de sample rate e frame period"
arch=('any')
url="https://github.com/xivastudio/pipewire-config"
license=('GPL')
depends=('zenity')
source=("git+${url}.git")
md5sums=(SKIP)

package() {
 cp -r "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
