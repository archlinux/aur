# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: DavidDGTNT at KygekTeam <daviddgtntpersonal@gmail.com>
pkgname=kygekteampmmp4
pkgver=4.0.0
pkgrel=2
pkgdesc="PocketMine-MP 4 as an Arch/AUR package!"
arch=(x86_64)
url="https://kygekteam.org/pm4"
license=('GPL')
source=("https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PMMP-4-PHP-Binary/lastSuccessfulBuild/artifact/Linux/PHP_Linux-x86_64.tar.gz"
	"https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PocketMine-MP-4/lastSuccessfulBuild/artifact/PocketMine-MP.phar"
	"https://jenkins.kygekteam.org/view/PocketMine-MP%204/job/PocketMine-MP-4/lastSuccessfulBuild/artifact/start.sh"
)
sha256sums=('0ad82a11eb37ae6caddbf5d6a09a6d2e257cce3cbf5ff55e4a7465c5cf38e348'
            'd599a10338e44310f83fbcf82de961b2f9ddb62d6abc74f01dffe74da7b689c6'
            '601551a70f27acbf4214570532ede9eed011e0382a142e30b883ac7847b3cf51')

package() {
	mkdir $pkgdir/kygekteampmmp4
	cd $pkgdir/kygekteampmmp4
	rm $srcdir/PHP_Linux-x86_64.tar.gz
	cp -R $srcdir/* .
	chmod +x start.sh	
}
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
