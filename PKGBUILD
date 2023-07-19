pkgname=nya
pkgver=1
pkgrel=1
pkgdesc="Generate a very nya sentence"
arch=('any')
url="http://github.com/JessSystemV/nya"
source=("https://github.com/JessSystemV/nya/archive/refs/heads/main.zip")
sha256sums=('3a6e8aa2c5e8e8064009f94a990b6fb3cb8d2b085c84aadaa0c2cd81a6193cf4')

build()	{
	cd nya-main
        cc nya.c -O3 -o nya
}

package() {
	cd nya-main
        install -Dm755 nya -t "${pkgdir}/usr/bin/"
}
