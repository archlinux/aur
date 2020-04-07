# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.12
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

sha512sums=(4e1b9aae00c08a2f4d93c4d1e3d5aadb3da19469db50bf5a075bd49ef0b1877c80c5babcf61f08388a9d18ca1b114d20d7b63efd016dfb5617b2997d429f99e3             a207ce3d032ccff2080f66ffac0c911991726efb761e97cba9ec62fe80c006d335c4aeec00406c98ab86869a566e660a38c25bf0d587ae4ae82cf8e479fbf9c4)

