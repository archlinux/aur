# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.8
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

sha512sums=(305b8aa6e378df9deb52d60b424d57ef347f4a7eee4b46364ba1830fe8587a7de6cbf794ac25a09bd0221ece363b95e1c4c9f4290db12a0955a16e7cab90069a             d33a778e2213747ab9254fc888a8b8d1253dedb67e379bf0c8e8688e6c401e38805ced8461a698ea5585afa1bb3acbe84caae729e7de30761abceec9cde337e5)

