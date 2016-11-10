pkgname=netctl-eduroam-unicamp
pkgver=1
pkgrel=2
pkgdesc='Example configuration for eduroam at Unicamp using netctl'
arch=(any)
url='http://www.ccuec.unicamp.br/ccuec/rede_sem_fio_eduroam'
license=('GPL')
depends=(ca-certificates netctl)
install=install
source=('eduroam-unicamp'
			  'http://www.ccuec.unicamp.br/ccuec/sites/default/files/tutoriais/ac-raiz-icpedu.crt')
sha256sums=('4e83ee2878976d69a5fbe284842583e7e86c730ad8fa9c9955bc5e870e1b4287'
						'43b5bdd82b45cda9991e2f32af0f82060559d4afae0ad27cf9a56a7f9cef3143')
					  
package() {
	install -Dm644 eduroam-unicamp "$pkgdir/etc/netctl/examples/eduroam-unicamp"
  install -Dm644 ac-raiz-icpedu.crt "$pkgdir/etc/ca-certificates/trust-source/anchors/ac-raiz-icpedu.crt"
}
