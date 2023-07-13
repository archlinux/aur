# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>

pkgname=stardict-ecdict
pkgver=1.0.28
pkgrel=1
pkgdesc="Free English to Chinese Dictionary Database"
arch=(any)
url=https://github.com/skywind3000/ECDICT
license=(GPL3)
source=("$url/releases/download/$pkgver/ecdict-stardict-28.zip")
sha256sums=(c707d0f3ded6ec79b96466da4a1574e074703da5af9c120fbad97f9cb08c6f2c)

package() {
	install -D ./* -t "$pkgdir/usr/share/stardict/dic"
}
