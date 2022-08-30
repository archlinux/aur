#Contributor: zh99998 <zh99998@gmail.com>
#Contributor: bilibili_xiaok <the_xiaok@qq.com>
#Maintainer: bilibili_xiaok <the_xiaok@qq.com>
pkgname=tcpping
pkgver=2.4
pkgrel=1
pkgdesc='test response times using TCP SYN packets'
arch=('any')
url='https://github.com/deajan/tcpping'
depends=('traceroute')
source=('https://raw.githubusercontent.com/deajan/tcpping/master/tcpping')
noextract=('tcpping')
sha256sums=('cf4a9c9360fe5a7174600dcb877ccbb1d3858bfbd48cee055b57caebbc3fed79')

package() {
	install -Dm755 "$srcdir/tcpping" "$pkgdir/usr/bin/tcpping"
	setcap cap_net_raw+ep /usr/bin/tcpping
}

