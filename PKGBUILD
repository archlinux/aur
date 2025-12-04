# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins
pkgver=25.0902
pkgrel=1
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events')
makedepends=('git')
conflicts=('rvgl-skins')
replaces=('rvgl-skins')
groups=('rvgl-online')
source=("rvgl_io_skins"::git+https://gitlab.com/re-volt/rvio/skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins"

    # Fix filenames
    mv cars/gtc_tizzoni/carFZG_a.bmp cars/gtc_tizzoni/carfzg_a.bmp
    mv cars/gtc_tizzoni/carFZG_b.bmp cars/gtc_tizzoni/carfzg_b.bmp
    mv cars/gtc_tizzoni/carFZG_c.bmp cars/gtc_tizzoni/carfzg_c.bmp
    mv cars/gtc_tizzoni/carFZG_d.bmp cars/gtc_tizzoni/carfzg_d.bmp
    mv cars/gtc_tizzoni/carFZG_e.bmp cars/gtc_tizzoni/carfzg_e.bmp
    mv cars/gtc_tizzoni/carFZG_f.bmp cars/gtc_tizzoni/carfzg_f.bmp
    mv cars/gtc_tizzoni/carFZG_g.bmp cars/gtc_tizzoni/carfzg_g.bmp
    mv cars/gtc_tizzoni/carFZG_h.bmp cars/gtc_tizzoni/carfzg_h.bmp
    mv cars/gtc_tizzoni/carFZG_i.bmp cars/gtc_tizzoni/carfzg_i.bmp
    mv cars/gtc_tizzoni/carFZG_j.bmp cars/gtc_tizzoni/carfzg_j.bmp
    mv cars/gtc_tizzoni/carFZG_k.bmp cars/gtc_tizzoni/carfzg_k.bmp
    mv cars/gtc_tizzoni/carFZG_l.bmp cars/gtc_tizzoni/carfzg_l.bmp
    mv cars/gtc_tizzoni/carFZG_m.bmp cars/gtc_tizzoni/carfzg_m.bmp
    mv cars/gtc_tizzoni/carFZG_n.bmp cars/gtc_tizzoni/carfzg_n.bmp
    mv cars/gtc_tizzoni/carFZG_o.bmp cars/gtc_tizzoni/carfzg_o.bmp
    mv cars/gtc_tizzoni/carFZG_p.bmp cars/gtc_tizzoni/carfzg_p.bmp
    mv cars/gtc_tizzoni/carFZG_q.bmp cars/gtc_tizzoni/carfzg_q.bmp
    mv cars/gtc_tizzoni/carFZG_r.bmp cars/gtc_tizzoni/carfzg_r.bmp
    mv cars/gtc_tizzoni/carFZG_s.bmp cars/gtc_tizzoni/carfzg_s.bmp
    mv cars/hoshino/carKUL.bmp cars/hoshino/carkul.bmp
    mv cars/phat/CarSlug2.BMP cars/phat/carslug2.bmp
    mv cars/phat/carERZU.bmp cars/phat/carerzu.bmp
    mv cars/phat/carFLOKI.bmp cars/phat/carfloki.bmp
    mv cars/phat/carJON2.bmp cars/phat/carjon2.bmp
    mv cars/phat/carLWG.bmp cars/phat/carlwg.bmp
    mv cars/phat/carTRS.bmp cars/phat/cartrs.bmp
    mv cars/phat/carTT.bmp cars/phat/cartt.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
