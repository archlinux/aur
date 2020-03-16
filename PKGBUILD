# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gobetween-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Modern & minimalistic load balancer for the Сloud era'
arch=('x86_64')
url="http://gobetween.io"
license=('MIT')
provides=('gobetween')
source=("https://github.com/yyyar/gobetween/releases/download/${pkgver}/gobetween_${pkgver}_linux_amd64.tar.gz")
md5sums=('07fc24c6e4046daae6f04553e9127646')

package() {
  cd "${srcdir}"
  install -Dm755 gobetween -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/gobetween"
  install -Dm644 config/gobetween.toml -t "${pkgdir}/etc/conf.d"
}
# vim:set ts=2 sw=2 et: