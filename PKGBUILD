pkgname=hello-world-py
pkgver=1.0
pkgrel=1
pkgdesc="Simple Hello World Python script"
arch=('any')
url=""
license=('MIT')

depends=('python')

source=("hello.py")

sha256sums=('b57ecd6b5dcc19c4d53cd9f5520c788a1d89fd2bfccef1ef6bf86b09414eb338')

package() {
	install -Dm755 hello.py "$pkgdir/usr/bin/hello-world"
}
