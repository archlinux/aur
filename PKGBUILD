# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=usql-bin
pkgver=0.19.3
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=(amd64 arm arm64 x86_64)
url="https://github.com/xo/usql/"
license=('MIT')
provides=(usql)
conflicts=(usql)
source=("https://github.com/xo/usql/releases/download/v$pkgver/usql-$pkgver-linux-$arch.tar.bz2")
b2sums=('efdc7bbb7b5b25554230da9a79fa06aa356f82ccb232c7cb424bf16214913f9cea861f4017d454f1b10f3550c087748e19f987b427811cf6a0dc2d073c06a321')

package() {
    install -Dm0755 usql -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
