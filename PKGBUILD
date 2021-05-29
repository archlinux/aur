# Maintainer: sodd <sodd@email.cz>

pkgname=gitlab-cli-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Gitlab command line"
arch=('x86_64')
url="https://github.com/makkes/gitlab-cli"
license=('Apache')
source=(
	"${url}/releases/download/v${pkgver}/gitlab_v${pkgver}_linux_amd64"
	"${url}/archive/v$pkgver.zip"
)
sha1sums=('c558e60e0114af04694a0f373fd6c99b8588f696'
          'f0febec34984984cf5ab1e275c2f2a2042f64890')

package() {
  cd "$srcdir"

  install -Dm755 gitlab_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/gitlab-cli"
  install -Dm644 gitlab-cli-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
