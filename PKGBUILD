# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Meow Meow <sdfsdfaasdfdcf@gmail.com>
pkgname=pixivutil2-git
pkgver=1.3
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
            '4b49dc94fa19c7a650101a83d19e4670dc4df6bf195cd0257215524eee7074ac')

package() {
        mkdir -p $pkgdir/usr/bin
	cp "$srcdir/pixiv" -T "$pkgdir/usr/bin/pixiv"
        chmod +x "$pkgdir/usr/bin/pixiv"
}
