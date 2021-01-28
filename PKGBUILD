# Maintainer: sodd <sodd@email.cz>

pkgname=gitlab-cli-bin
pkgver=3.7.3
pkgrel=1
pkgdesc="Gitlab command line"
arch=('x86_64')
url="https://github.com/makkes/gitlab-cli"
license=('Apache')
source=(
	"${url}/releases/download/v${pkgver}/gitlab_v${pkgver}_linux_amd64"
	"${url}/archive/v$pkgver.zip"
)
sha1sums=('9637c5d098ad3336a6673d92561e43df16562230'
          'c93138165c6a4ff441474cf597a4cdb2f7427066')

package() {
  cd "$srcdir"

  install -Dm755 gitlab_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/gitlab-cli"
  install -Dm644 gitlab-cli-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
