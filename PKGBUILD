# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pixivutil2-git
pkgver=1.0
pkgrel=1
pkgdesc="A utility for the image hosting website Pixiv, once downloaded you can use the pixiv command to run it"
arch=('any')
url="https://github.com/Nandaka/PixivUtil2"
license=('BSD 2-Clause')
makedepends=('git' 'python' 'python-pip')
provides=('pixiv')
source=('git+https://github.com/Nandaka/PixivUtil2.git'
        'pixiv')
sha256sums=('SKIP'
            '7306c2b7b160a098f79dec5f76389b1ab3e1de6b03c9d45f54ce57e1b916ccfa')

package() {
        mkdir -p $pkgdir/usr/bin
	cp "$srcdir/pixiv" -T "$pkgdir/usr/bin/pixiv"
        chmod +x "$pkgdir/usr/bin/pixiv"
}
