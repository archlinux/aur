# Maintainer: Xiao Pan <gky44px1999@gmail.com>
# Contributor: lisongmin <lisongmin9@gmail.com>
# Contributor: 謝致邦 <Yeking@Red54.com>

pkgname=stardict-langdao-ce-gb
pkgver=2.4.2
pkgrel=5
pkgdesc='LangDao Chinese-English dictionary for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('GPL')
depends=('stardict')
source=("http://download.huzheng.org/zh_CN/$pkgname-$pkgver.tar.bz2")
b2sums=('6ba9ee32c580bf57f16821b999535d8bf2d5fe12e1a48d7d11b31f9aedce75d732aae1181957ced5ee212e43f7e2f1d766908bffed1369c4f1c925f40c6d8fb3')

package()
{
	install -Dm644 "$pkgname-$pkgver/"* -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
