pkgname=nya
pkgver=1
pkgrel=1
pkgdesc="Generate a very nya sentence"
arch=('any')
url="http://github.com/JessSystemV/nya"
source=("https://github.com/JessSystemV/nya/archive/refs/heads/main.zip")
sha256sums=('de62338c4d9b563b285453b3b091f535704cf815f3d62ffe19a574209187f54e')

build()	{
	cd nya-main
        cc nya.c -O3 -o nya
}

package() {
	cd nya-main
        install -Dm755 nya -t "${pkgdir}/usr/bin/"
}
