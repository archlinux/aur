pkgname=nya
pkgver=1
pkgrel=1
pkgdesc="Generate a very nya sentence"
arch=('any')
url="http://github.com/JessSystemV/nya"
source=("https://github.com/JessSystemV/nya/archive/refs/heads/main.zip")
sha256sums=('48e7ec144ef5549321de6badc27058064e112aad2d4b4ae29ef22583f51f6384')

build()	{
	cd nya-main
        cc nya.c -O3 -o nya
}

package() {
	cd nya-main
        install -Dm755 nya -t "${pkgdir}/usr/bin/"
}
