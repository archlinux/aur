# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.11
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

sha512sums=(7435f8ccc11f6304d6a0975b60f40317911ab28f4a591dc89e930151989734194c667943decd204111ce43477af7fd8f848115f895db62915336ed84c55d5a43             8eaffe4f6f66c96c7a0363faa32be42cc271fbe61969e4e04db0ce44dd930414523d07c36c65e75d9999a7ff1b906212e977d3b928d27695a126e4fb17b79e9f)

