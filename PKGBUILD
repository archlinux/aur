# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=python-tkfilebrowser
pkgver=1.0.0
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://pypi.python.org/pypi/tkFileBrowser"
arch=('any')
license=('GPL3')
depends=('python-psutil' 'tk')
source=("tkFileBrowser-$pkgver.tar.gz::https://pypi.python.org/packages/1d/24/bc34a92d9883f490dc17b3e55073df088a58794be0fc0b66e42d305a25b1/tkFileBrowser-$pkgver.tar.gz")
sha512sums=('b5d495667a7d4f035507bd287e0d026cbbb6163f9be2be5c7a93b8095a4e992be50e242717affff34e3cf96702ef33a8e950c8556f989a27962f8663f8ee6b81')
package() {
 cd "$srcdir/tkFileBrowser-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
