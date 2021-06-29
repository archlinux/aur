# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=drjava-svetovid
pkgver=20140826
pkgrel=1
pkgdesc="A lightweight development environment for writing Java programs including Svetovid"
arch=('any')
url="https://svetovid.org/lib/drjava.html"
license=('BSD')
depends=('bash' 'java-environment')
source=('https://svetovid.org/lib/drjava-with-svetovid-lib.jar'
        'drjava-svetovid.sh'
        'drjava-svetovid.desktop'
        'LICENSE')
sha512sums=('f8be92a41159ccb4417726f6b4896628927cd9e51fda54335b5006bf8d921081ab9fd09c1677e0e870e048471778012059326b749f3b0318c3d46b8fd504a39a'
            '619e77fbb1970f68c4de5f0d2d719220f9fb5c0fd15ec746b1c1b181bc757ffe466d09d6deb394c806bb4cc82f091d3e21950e7f82bb8ff9c2a69073d5537663'
            '553614cf30355c09cce2f5d4892486c0687336a1077c5df45ad476fcd6bbb0c98fc0932ebd7699fa236f826c7503d719b0bdd7cd37a4358002573096cee0cfeb'
            '8beb6de3b073857d0eba23c28fcfa7bee669b6caaf8eeb5022f9a78c48d2c8c726bd2448993edcdd8db8e56b3e816d64e21fdfaf392e0440122db67446fada8f')

package() {
	cd ${srcdir}

	install -Dm644 drjava-with-svetovid-lib.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm755 drjava-svetovid.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
	install -Dm644 edu/rice/cs/drjava/ui/icons/drjava64.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm644 drjava-svetovid.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
