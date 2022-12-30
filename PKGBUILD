# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='gnunet-fuse'
pkgver='0.19.1'
pkgrel=1
pkgdesc='Read-only mounting of GNUnet directories as file systems using FUSE'
arch=('i686' 'x86_64')
url='https://gnunet.org/'
license=('GPL')
depends=('gnunet' 'fuse2' 'libextractor')
conflicts=("${pkgname}-git" "${pkgname}-bin")

# GNU mirrors
_pkg_mirrors=("ftp://ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.mirror.globo.tech/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://gnu.mirror.iweb.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.mirror.iweb.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.sergal.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.sergal.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.sergal.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.csclub.uwaterloo.ca/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.csclub.uwaterloo.ca/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.csclub.uwaterloo.ca/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.peers.community/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.peers.community/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.mirrors.hoobly.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.kernel.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.kernel.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://open-source-box.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://open-source-box.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.keystealth.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.keystealth.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.ocf.berkeley.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.ocf.berkeley.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirrors.ocf.berkeley.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.syringanetworks.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.syringanetworks.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirrors.syringanetworks.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.team-cymru.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.team-cymru.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.thecodefactory.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.askapache.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.tripadvisor.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.wayne.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.wayne.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.us-midwest-1.nexcess.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.us-midwest-1.nexcess.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.mirror.constant.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.rit.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.sorengard.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.sorengard.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://spinellicreations.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.clarkson.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.clarkson.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://reflection.oss.ou.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://reflection.oss.ou.edu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.mirrors.pair.com/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnu.c3sl.ufpr.br/ftp/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.nbtelecom.com.br/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.cedia.org.ec/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.cedia.org.ec/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://espejito.fder.edu.uy/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://espejito.fder.edu.uy/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://download.nust.na/pub/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.ufs.ac.za/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.ufs.ac.za/applications/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.ustc.edu.cn/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.ustc.edu.cn/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirrors.ustc.edu.cn/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.tuna.tsinghua.edu.cn/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://infinity.kmeacollege.ac.in/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://infinity.kmeacollege.ac.in/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.jaist.ac.jp/pub/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.jaist.ac.jp/pub/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.jre655.com/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.jre655.com/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://publicftp.p-knowledge.co.jp/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.kaist.ac.kr/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.twaren.net/Unix/GNU/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.yzu.edu.tw/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.yzu.edu.tw/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.yzu.edu.tw/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.yzu.edu.tw/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.freedif.org/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.easyname.at/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.easyname.at/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.inode.at/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.inode.at/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.kumi.systems/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.kumi.systems/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.reismil.ch/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.cyber-perikarp.eu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.sotirov-bg.net/pub/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://sotirov-bg.net/pub/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.klid.dk/ftp/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.klid.dk/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.download-by.net/gnu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.dotsrc.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.dotsrc.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirrors.dotsrc.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.funet.fi/pub/gnu/prep/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://www.nic.funet.fi/pub/gnu/ftp.gnu.org/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.ibcp.fr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.ibcp.fr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.igh.cnrs.fr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.igh.cnrs.fr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.igh.cnrs.fr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://fr.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://fr.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://fr.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.heikorichter.name/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.heikorichter.name/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.bibleonline.ru/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.bibleonline.ru/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://www.artfiles.org/gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://www.artfiles.org/gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.halifax.rwth-aachen.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.halifax.rwth-aachen.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.halifax.rwth-aachen.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.informatik.rwth-aachen.de/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.hosteurope.de/mirror/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.checkdomain.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.checkdomain.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.checkdomain.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.netcologne.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.netcologne.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.netcologne.de/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://www.gutscheinrausch.de/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://www.gutscheinrausch.de/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://www.singleboersen.com/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://www.singleboersen.com/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.wrz.de/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.wrz.de/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.wrz.de/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.cc.uoc.gr/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.cc.uoc.gr/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.cc.uoc.gr/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.ntua.gr/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.rasanegar.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror1.hostiran.ir/gnu/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.heanet.ie/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.heanet.ie/mirrors/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.heanet.ie/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.heanet.ie/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror2.mirror.garr.it/mirrors/gnuftp/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror2.mirror.garr.it/mirrors/gnuftp/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.infotronik.hu/mirrors/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.mirror.nl/pub/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.nluug.nl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.nluug.nl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://nl.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://nl.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://nl.mirror.babylon.network/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.snt.utwente.nl/pub/software/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.snt.utwente.nl/pub/software/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.koddos.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.koddos.net/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://gnuftp.uib.no/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://gnuftp.uib.no/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://gnuftp.uib.no/pub/gnuftp/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.piotrkosoft.net/pub/mirrors/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.man.poznan.pl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.task.gda.pl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.task.gda.pl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://sunsite.icm.edu.pl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://sunsite.icm.edu.pl/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirrors.up.pt/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.up.pt/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.up.pt/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.eq.uc.pt/pub/software/unix/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.eq.uc.pt/software/unix/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.eq.uc.pt/software/unix/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirrors.nav.ro/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirrors.nav.ro/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://mirror.tochlab.net/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.tochlab.net/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.tochlab.net/pub/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.sbb.rs/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.sbb.rs/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.lihnidos.org/GNU/ftp/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.rediris.es/mirror/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.rediris.es/mirror/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.rediris.es/mirror/GNU/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.acc.umu.se/mirror/gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp.acc.umu.se/mirror/gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.switch.ch/ftp/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://mirror.switch.ch/mirror/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.veriportal.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://mirror.rackdc.com/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://www.mirrorservice.org/sites/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://www.mirrorservice.org/sites/ftp.gnu.org/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://www.thunix.org/~antonm/ftp.gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp.gnu.org.ua/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp.gnu.org.ua/gnu/gnunet/${pkgname}-${pkgver}.tar.gz"
	"https://ftp-gnu-org.ip-connect.vn.ua/gnunet/${pkgname}-${pkgver}.tar.gz"
	"http://ftp-gnu-org.ip-connect.vn.ua/gnunet/${pkgname}-${pkgver}.tar.gz"
	"ftp://ftp-gnu-org.ip-connect.vn.ua/mirror/ftp.gnu.org/gnunet/${pkgname}-${pkgver}.tar.gz")

# General function for scanning a list of mirrors
_get_mirror() {
	# Author: grufo <madmurphy333 AT gmail DOT com>
	local -n url_list=$1
	local url_item
	for url_item in ${url_list[@]}; do
		if curl --output /dev/null --silent --head --fail "${url_item}"; then
			echo -n "${url_item}"
			return 0
		fi
		echo "Mirror ${url_item} not available" 1>&2;
	done
	return 1
}

source=("$(_get_mirror _pkg_mirrors)")
sha256sums=('8f1f6f4d76c108ae74c0ec849bc9c02dc8dea412e205c56236c86cb792ccc9b4')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

