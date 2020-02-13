# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.10
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/T4cC0re/gitlab-cli"
license=('GPLv3')
source=("${pkgname}::https://gitlab.com/api/v4/projects/13375720/jobs/artifacts/${pkgver}/raw/bin/${pkgname}?job=build" "${pkgname}.1::https://gitlab.com/api/v4/projects/13375720/jobs/artifacts/${pkgver}/raw/share/man/man1/${pkgname}.1?job=build")
noextract=("${pkgname}")

package() {
  install -Dm755 ${pkgname}	"${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.1	"${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

sha512sums=(5d9a02aa2d6d6c54704748152574cbdf3090d3aaa5a9157ed0625b5a8421c349957b1ecd69784d6efde3856a6726fb0c200280ff1d020583bcd4f038989f6786             310fc5869dd4ab9add5edaf165775030f535265e0ec06d125f7d481e1320789e68d63ba63aa68effecadddb8ac7e0b8df3403f40a09b5a568de9303042357e7c)

