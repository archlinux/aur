# Maintainer: Juan Perez gatitofeliz at protonmail at com

# ALERT: These profiles are taken from github and couldn't work 
# ALERTA: Estos perfiles son inestbles y pueden fallar.

pkgname=firejail-extras
pkgver=0.9.40
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firejail-extras.7z"
        )
sha256sums=('9dd7a8ad02e800dd27228f02ec80d94f39e0bf1065796b7b8d3795cd0b18c227'
)
sha512sums=('8d0c4ecce1e466b61cc0c6eaf8250ff78b37828e27bf53e818590c74a3daf368b65fd238570dd7db889d3facd37da78bf1be67dd9cc24bb78ab546891d67b9df'
)
sha1sums=('953b4e7455badf1fab43c0e9ea938281ec5bbc18'
)

sha224sums=('a99e8e38c2daad1c2957deb8c85e2c29049c7a7f0449a5123e70bafb'
)

sha384sums=('d1417ac48db95ed387629f8002b3ffac855dd0cb52cea160293474b2ccb171a956207e2c24f8dc32ba8ccdf38f6fe305'
)

md5sums=('3724fdcd1ba5a5f7b16220810fac1c3d'
)








package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
