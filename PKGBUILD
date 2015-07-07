# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname='flavoured'
pkgver='20090507'
pkgrel='1'
pkgdesc='Flavoured, a wallpaper by Digitalshiva'
arch=('any')
url='http://digitalshiva.deviantart.com/art/Flavoured-121784194'
license=('unknown')
source=('http://fc00.deviantart.net/fs42/f/2009/127/7/6/Flavoured_by_Digitalshiva.zip')
md5sums=('a18f350158136070b04ab9e20351b986')

build() {
    cd "$srcdir/Flavoured by Tkui"
	mogrify -crop 2560x1440+0+80 +repage Flavoured*.png
}

package() { 
    cd "$srcdir/Flavoured by Tkui"
	install -Dm644 'Flavoured blue.png' "$pkgdir/usr/share/$pkgname/blue.png"
	install -Dm644 'Flavoured green tea.png' "$pkgdir/usr/share/$pkgname/green tea.png"
	install -Dm644 'Flavoured love.png' "$pkgdir/usr/share/$pkgname/love.png"
	install -Dm644 'Flavoured original.png' "$pkgdir/usr/share/$pkgname/original.png"
	install -Dm644 'Flavoured purple.png' "$pkgdir/usr/share/$pkgname/purple.png"
	install -Dm644 'Flavoured retro.png' "$pkgdir/usr/share/$pkgname/retro.png"

	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" 'info.rtf' 'Preview.png'
}
