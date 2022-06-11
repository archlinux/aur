# Maintainer: Xiao Pan <gky44px1999@gmail.com>
# Contributor: lisongmin <lisongmin9@gmail.com>
# Contributor: 謝致邦 <Yeking@Red54.com>

pkgname=stardict-langdao-ec-gb
pkgver=2.4.2
pkgrel=5
pkgdesc='LangDao English-Chinese Dictionary for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('GPL')
depends=('stardict')
source=("http://download.huzheng.org/zh_CN/$pkgname-$pkgver.tar.bz2")
b2sums=('1c2b0857e8022560ebca3513dfdb9de32bbac185ed5871d7cedd9b133364cfc484425101c9298b981f1a2991800ff1ba478e9fcf66394f3b18425203145b4df3')

package()
{
	install -Dm644 "$pkgname-$pkgver/"* -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
