# Maintainer: BrainDamage
pkgname='sopds'
pkgver=0.47
pkgrel=1
pkgdesc='Simple opds catalog'
arch=(any)
url='http://www.sopds.ru/'
license=('GPL3')
depends=('python' 'python-django' 'python-pillow' 'python-apscheduler' 'python-django-picklefield' 'python-lxml' 'python-telegram-bot')
sha256sums=('7a1f7785999ddc098eb23e9ffa8bf08f1a95c92afe6d37faa2d19562510f1e84')
source=("https://github.com/mitshel/$pkgname/archive/v$pkgver.tar.gz")

package() {
	mkdir -p "$pkgdir/opt"
	cp -R "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/sopds"
	chmod +x "$pkgdir/opt/sopds/manage.py"
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "$pkgdir/opt/sopds/manage.py" "$pkgdir/usr/bin/sopds"

}
