# Package maintainer: Julia van der Kris <juliavdkris@proton.me>

pkgname=syncbops-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to easily maintain a smaller-size copy of your music library, and keep it in sync with your main library"
url="https://github.com/Aidavdw/syncbops"
provides=('syncbops')
arch=('x86_64')
license=('GPL-3.0')

# source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/syncbops_linux_x86_64")

# sha256sums=('7e7f050fc99497b09ef6cfd33a742411eea67a86b3020d3167d2d8383f8b8021')
sha256sums_x86_64=('9a29c65d7278d4880cd09d48ade79c8983df1911bab85d1cd9111c3489ada775')

package() {
	install -Dm755 "$srcdir/syncbops_linux_x86_64" "$pkgdir/usr/bin/syncbops"
}
