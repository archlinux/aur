pkgname=netctl-eduroam-unicamp
pkgver=1
pkgrel=0
pkgdesc='Example configuration for eduroam at Unicamp using netctl'
arch=(any)
url='http://www.ccuec.unicamp.br/ccuec/rede_sem_fio_eduroam'
license=('GPL')
depends=(ca-certificates netctl)
install=install
source=('eduroam-unicamp'
			  'http://www.ccuec.unicamp.br/ccuec/sites/default/files/tutoriais/ac-raiz-icpedu.crt')
sha256sums=('5e6bf563162bd424afd2ca05aba899de781463c04986553f4f5aa6b30bc8ab3c'
						'43b5bdd82b45cda9991e2f32af0f82060559d4afae0ad27cf9a56a7f9cef3143')
					  
package() {
	install -Dm644 eduroam-unicamp "$pkgdir/etc/netctl/examples/eduroam-unicamp"
  install -Dm644 ac-raiz-icpedu.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors/ac-raiz-icpedu.crt"
}
