# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pixivutil2-git
pkgver=1.1
pkgrel=2
pkgdesc="A utility for the image hosting website Pixiv, once downloaded you can use the pixiv command to run it"
arch=('any')
url="https://github.com/Nandaka/PixivUtil2"
license=('BSD 2-Clause')
makedepends=('git' 'python' 'python-pip')
provides=('pixiv')
source=('git+https://github.com/Nandaka/PixivUtil2.git'
        'pixiv')
sha256sums=('SKIP'
            'aca6fdc4c6a1b05fecc4d67f82b6bc40f45b813b7d326bc2f81c3a08ea0e9969')

package() {
        mkdir -p $pkgdir/usr/bin
	cp "$srcdir/pixiv" -T "$pkgdir/usr/bin/pixiv"
        chmod +x "$pkgdir/usr/bin/pixiv"
}
