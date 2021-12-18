#
# Script to extract the download url and current version from the magentacloud mirror
#

u='https://www.cgm-online.com/cgi-bin/rc_sim_downloadcount.pl?name=next_linux_mirror'

page=$(curl -Ls $u -w %{url_effective})
# A bit nasty to use head
url=$(echo $page | grep -Eoih value\=\"[^\"]*\" | grep download | head -n1 | sed 's~\(value=\)\|\("\)~~g')

id=$(echo $url | cut -d '/' -f5)
file=$(basename $url)
basever=$(echo $file | grep -Eo '[0-9]+')
ver=$(echo $basever | sed 's/...$/.&/')

sed -E "s#(_download_url=).*#\1'$url'#" -i PKGBUILD
sed -E "s#(_download_id=).*#\1'$id'#" -i PKGBUILD
sed -E "s#(_download_file=).*#\1'$file'#" -i PKGBUILD
sed -E "s#(_pkgver=).*#\1'$ver'#" -i PKGBUILD

target="https://magentacloud.de/s/${id}/download/${file}"
echo "Generated download url: $target"
#curl -fLC - --retry 3 --retry-delay 3 -OJ $target
