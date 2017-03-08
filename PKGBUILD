# Maintainer: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=audacity-extras
pkgver=1.0.01
pkgrel=1
pkgdesc="All nyquist plugins for audacity"
arch=('any')
depends=('audacity')
url="localhost:43110"
license=('GPL2')
source=("https://u.teknik.io/DqH7n.zip"
)


sha384sums=('3267bb20628bbb69aaca2399687f7ce2902486d240cf06a93fe90dbe5c5df24d0b407aafc0d316c45bbb57254c251da6')
sha512sums=('aee7f211712365c9db0e2589543ca8b04ecf64384a08fecdf30c147c52774dc0c53ef8bd8f3bd51c146bce0ea889c96785cd76619665a084105efbd7ce2898a8')









package() {

	cd "${srcdir}"
rm notch.ny

        msg2 create package
       
	mkdir -p "${pkgdir}/usr/share/audacity/plug-ins"


	for file in ${srcdir}/*.ny
	do
		install -D -m644 "${file}" "${pkgdir}/usr/share/audacity/plug-ins/"
	done
               
}
