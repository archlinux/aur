u=https://www.cgm-online.com/cgi-bin/rc_sim_downloadcount.pl?name=next_linux_onedrive
id=$(curl -Ls -o /dev/null $u -w %{url_effective} | cut -d '/' -f5)

sed -E "s#(_download_id=).*#\1'$id'#" -i PKGBUILD

target="https://www.magentacloud.de/api/sharelink/download?id=${id}"
echo "Generated download url: $target"
#curl -fLC - --retry 3 --retry-delay 3 -OJ $target
