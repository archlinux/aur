# Contributor: Hao Long <aur@esd.cc>

pkgname=ksubdomain-bin
pkgver=1.9.9
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64")
url="https://github.com/boy-hack/ksubdomain"
license=("MIT")
depends=(glibc)
install=.install
provides=(ksubdomain)
conflicts=(ksubdomain)
source=("https://github.com/boy-hack/ksubdomain/releases/download/v$pkgver/KSubdomain-v$pkgver-linux-amd64.tar"
	https://raw.githubusercontent.com/boy-hack/ksubdomain/504cb1b053bb131dc890ddbe7be3296df6930d97/LICENSE)
b2sums=('553bf2c8cd28c5761713af57763952f6f18422644bb505ca28a2d58c564814972700122d800f3deaef400f1b7261f87bbf1f1b3027c0d426d8446a5f6981611b'
        '773295e0bf7dacf24b0a1750b10acb1c82d1bf7cfa40289b3c5f4e3a0969e3c15106cd04b8b16c536d5ff2d7949ef861df408ed9b8a937ae1e189a70f21b5304')

package() {
	install -vDm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
	install -vDm755 ksubdomain -t ${pkgdir}/usr/bin/
}
