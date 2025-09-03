# Package maintainer: Julia van der Kris <juliavdkris@proton.me>

pkgname=syncbops-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A tool to easily maintain a smaller-size copy of your music library, and keep it in sync with your main library"
url="https://github.com/Aidavdw/syncbops"
provides=('syncbops')
arch=('x86_64')
license=('GPL-3.0')

source_x86_64=("$url/releases/download/v$pkgver/syncbops_linux_x86_64")

sha256sums_x86_64=('9a29c65d7278d4880cd09d48ade79c8983df1911bab85d1cd9111c3489ada775')

package() {
	install -Dm755 "$srcdir/syncbops_linux_x86_64" "$pkgdir/usr/bin/syncbops"
}
