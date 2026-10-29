#!/usr/bin/env bash
# 一键把 AUR 包 motty-bin 更新到上游 t8y2/motty 的最新 release。
#
# 流程：查上游最新 tag → 下载对应架构的预编译包并用上游 SHA256SUMS 校验
#      → 回写 PKGBUILD（pkgver / pkgrel / sha256sums）→ 重新生成 .SRCINFO
#      → makepkg 构建验证 → 提交并推送 AUR。
#
# 国内网络不稳时可带代理运行：HTTPS_PROXY=http://127.0.0.1:7890 ./update.sh

set -euo pipefail

UPSTREAM_REPO="t8y2/motty"
AUR_REMOTE="ssh://aur@aur.archlinux.org/motty-bin.git"
AUR_BRANCH="master"
declare -A ARCH_ASSET=([x86_64]="amd64" [aarch64]="arm64")
CACHE_DIR="${CACHE_DIR:-.cache}"

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
ok() { printf '\033[1;32m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*" >&2; }
die() {
	printf '\033[1;31m==>\033[0m %s\n' "$*" >&2
	exit 1
}

usage() {
	cat <<'EOF'
用法: ./update.sh [选项]

默认行为：上游有新版本就发布到 AUR；没有新版本则直接退出。

选项:
  -c, --check        只检查是否有更新（只拉 SHA256SUMS，不下载安装包、不修改、不推送）
  -n, --dry-run      走完全部校验流程，打印 PKGBUILD 改动后回滚，不构建不提交不推送
      --no-build     跳过 makepkg 构建验证
      --no-push      只提交到本地 git，不推送到 AUR
  -f, --force        上游版本没变也强制重新生成校验值并发布（pkgrel 自动 +1）
      --tag TAG      指定上游 tag，例如 --tag v0.1.9（默认取 releases/latest）
  -h, --help         显示本帮助

环境变量:
  HTTPS_PROXY        下载走代理，例如 http://127.0.0.1:7890
  CACHE_DIR          源码缓存目录，默认 .cache（已缓存的文件不会重复下载）
EOF
}

check=false
dry_run=false
do_build=true
do_push=true
force=false
target_tag=""

while (($#)); do
	case $1 in
	-c | --check) check=true ;;
	-n | --dry-run) dry_run=true ;;
	--no-build) do_build=false ;;
	--no-push) do_push=false ;;
	-f | --force) force=true ;;
	--tag)
		[[ $# -ge 2 ]] || die "--tag 需要一个参数"
		target_tag=$2
		shift
		;;
	--tag=*) target_tag=${1#--tag=} ;;
	-h | --help)
		usage
		exit 0
		;;
	*) die "未知选项: $1（-h 查看帮助）" ;;
	esac
	shift
done

cd -- "$(dirname -- "$(readlink -f -- "$0")")"
CACHE_DIR=$(readlink -m -- "$CACHE_DIR")

for cmd in curl sha256sum tar git makepkg awk sed; do
	command -v "$cmd" >/dev/null 2>&1 || die "缺少命令: $cmd"
done
[[ -f PKGBUILD ]] || die "当前目录没有 PKGBUILD: $PWD"

# ---------------------------------------------------------------- 读取本地状态

pkgbuild_var() { # 变量名 → 值（数组取其第一个元素）
	(
		# shellcheck disable=SC1091
		source ./PKGBUILD
		eval "printf '%s' \"\${$1}\""
	)
}

current_ver=$(pkgbuild_var pkgver)
current_rel=$(pkgbuild_var pkgrel)
cur_sums_x86=$(pkgbuild_var sha256sums_x86_64)
cur_sums_arm=$(pkgbuild_var sha256sums_aarch64)

# ---------------------------------------------------------------- 查询上游版本

latest_tag() {
	local url tag
	if [[ -n $target_tag ]]; then
		tag=$target_tag
		[[ $tag == v* ]] || tag="v${tag}"
		printf '%s\n' "$tag"
		return 0
	fi
	# 先读 releases/latest 的跳转地址，不消耗 API 配额
	if url=$(curl -fsSL --retry 6 --retry-delay 3 --retry-all-errors --connect-timeout 20 \
		-o /dev/null -w '%{url_effective}' \
		"https://github.com/${UPSTREAM_REPO}/releases/latest" 2>/dev/null); then
		tag=${url##*/}
		if [[ $tag =~ ^v?[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
			printf '%s\n' "$tag"
			return 0
		fi
	fi
	# 兜底走 API（可能被限流）
	tag=$(curl -fsSL --retry 6 --retry-delay 3 --retry-all-errors --connect-timeout 20 \
		"https://api.github.com/repos/${UPSTREAM_REPO}/releases/latest" |
		awk -F'"' '/"tag_name"/ {print $4; exit}')
	[[ $tag =~ ^v?[0-9]+\.[0-9]+\.[0-9]+$ ]] || die "无法获取上游最新版本号（可加 HTTPS_PROXY 或 --tag 指定）"
	printf '%s\n' "$tag"
}

log "本地版本: ${current_ver}-${current_rel}"
tag=$(latest_tag) || die "查询上游版本失败"
ver=${tag#v}
[[ $ver =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || die "无法识别的上游版本: $tag"
log "上游版本: ${ver}   (${tag})"

if [[ $ver != "$current_ver" ]] &&
	[[ $(printf '%s\n%s\n' "$current_ver" "$ver" | sort -V | tail -n1) == "$current_ver" ]]; then
	die "上游版本 ${ver} 比本地 ${current_ver} 更旧，拒绝降级（确需操作请手工处理）"
fi

# ---------------------------------------------------------------- 拉校验清单

mkdir -p "$CACHE_DIR"
release_url="https://github.com/${UPSTREAM_REPO}/releases/download/${tag}"
sums_file="${CACHE_DIR}/SHA256SUMS.${ver}"

fetch() { # url dest [--optional]
	local url=$1 dest=$2 optional=${3:-}
	if [[ -s $dest ]]; then
		log "已缓存: ${dest##*/}"
		return 0
	fi
	if ! curl -fL --retry 6 --retry-delay 3 --retry-all-errors --connect-timeout 20 \
		--progress-bar -o "${dest}.part" "$url"; then
		rm -f "${dest}.part"
		if [[ -n $optional ]]; then
			warn "可选文件下载失败: $url"
			return 1
		fi
		die "下载失败: $url（网络问题可重试或设置 HTTPS_PROXY）"
	fi
	mv -f "${dest}.part" "$dest"
}

# 校验清单每次尝试拉最新；网络失败时退回本地缓存（同一版本的清单不变）
if curl -fL --retry 6 --retry-delay 3 --retry-all-errors --connect-timeout 20 \
	--silent --show-error -o "${sums_file}.part" "${release_url}/SHA256SUMS"; then
	mv -f "${sums_file}.part" "$sums_file"
	ok "已获取上游 SHA256SUMS"
elif [[ -s $sums_file ]]; then
	rm -f "${sums_file}.part"
	warn "拉取 SHA256SUMS 失败，改用本地缓存 ${sums_file}"
else
	rm -f "${sums_file}.part"
	die "无法获取 SHA256SUMS：${release_url}/SHA256SUMS（网络问题可重试或设置 HTTPS_PROXY）"
fi

declare -A want_hash
for arch in "${!ARCH_ASSET[@]}"; do
	asset="motty-${ver}-linux-${ARCH_ASSET[$arch]}.tar.gz"
	want_hash[$arch]=$(awk -v f="$asset" '$2 == f {print $1}' "$sums_file")
	[[ ${want_hash[$arch]} =~ ^[0-9a-f]{64}$ ]] || die "上游 SHA256SUMS 里没有 ${asset}"
done

up_to_date=false
if [[ $ver == "$current_ver" && ${want_hash[x86_64]} == "$cur_sums_x86" &&
	${want_hash[aarch64]} == "$cur_sums_arm" ]]; then
	up_to_date=true
fi

if $up_to_date && ! $force; then
	ok "已是最新：motty-bin ${current_ver}-${current_rel}（上游无新版本，校验值一致）"
	exit 0
fi

if $check; then
	if $up_to_date; then
		ok "上游版本相同（${ver}），但发布包校验值有变化，发布需加 --force"
	else
		ok "上游有更新: ${current_ver} → ${ver}"
	fi
	exit 0
fi

# ---------------------------------------------------------------- 下载并校验安装包

declare -A hash
for arch in "${!ARCH_ASSET[@]}"; do
	asset="motty-${ver}-linux-${ARCH_ASSET[$arch]}.tar.gz"
	file="${CACHE_DIR}/${asset}"
	log "下载 ${asset}"
	fetch "${release_url}/${asset}" "$file"

	got=$(sha256sum "$file" | awk '{print $1}')
	[[ $got == "${want_hash[$arch]}" ]] ||
		die "${asset} 校验失败：期望 ${want_hash[$arch]}，实际 $got"
	ok "${asset} 校验通过"

	# 确认包内布局没变，否则 package() 会失效
	listing=$(tar -tzf "$file")
	grep -qx "motty-${ver}-linux-${ARCH_ASSET[$arch]}/motty" <<<"$listing" ||
		die "${asset} 内找不到 motty 可执行文件，上游打包结构可能变了，请检查 PKGBUILD"
	hash[$arch]=$got
done

# LICENSE 从 tag 拉取；拉不到就沿用仓库里的副本（Apache-2.0 文本稳定）
license_hash=$(pkgbuild_var sha256sums)
license_file="${CACHE_DIR}/LICENSE.${ver}"
if fetch "https://raw.githubusercontent.com/${UPSTREAM_REPO}/${tag}/LICENSE" "$license_file" --optional; then
	got=$(sha256sum "$license_file" | awk '{print $1}')
	if [[ $got != "$license_hash" ]] || ! cmp -s "$license_file" LICENSE; then
		cp -f "$license_file" LICENSE
		log "LICENSE 已更新"
	fi
	license_hash=$got
else
	warn "获取上游 LICENSE 失败，继续使用本地 LICENSE"
	[[ -f LICENSE ]] || die "本地缺少 LICENSE"
	license_hash=$(sha256sum LICENSE | awk '{print $1}')
fi

new_rel=1
[[ $ver == "$current_ver" ]] && new_rel=$((current_rel + 1))

# ---------------------------------------------------------------- 回写 PKGBUILD

backup_dir=$(mktemp -d)
trap 'rm -rf "$backup_dir"' EXIT
cp -f PKGBUILD LICENSE -t "$backup_dir"
[[ -f .SRCINFO ]] && cp -f .SRCINFO "$backup_dir"

sed -i -E "s#^pkgver=.*#pkgver=${ver}#" PKGBUILD
sed -i -E "s#^pkgrel=.*#pkgrel=${new_rel}#" PKGBUILD
sed -i -E "s#^sha256sums=.*#sha256sums=('${license_hash}')#" PKGBUILD
sed -i -E "s#^sha256sums_x86_64=.*#sha256sums_x86_64=('${hash[x86_64]}')#" PKGBUILD
sed -i -E "s#^sha256sums_aarch64=.*#sha256sums_aarch64=('${hash[aarch64]}')#" PKGBUILD

# 回读校验，确认 sed 真的改对了
(
	# shellcheck disable=SC1091
	source ./PKGBUILD
	[[ $pkgver == "$ver" && $pkgrel == "$new_rel" ]] || exit 1
	[[ ${sha256sums[0]} == "$license_hash" ]] || exit 1
	[[ ${sha256sums_x86_64[0]} == "${hash[x86_64]}" ]] || exit 1
	[[ ${sha256sums_aarch64[0]} == "${hash[aarch64]}" ]] || exit 1
) || die "PKGBUILD 回写校验失败"

makepkg --printsrcinfo >.SRCINFO || die "生成 .SRCINFO 失败"
ok ".SRCINFO 已重新生成"

if $dry_run; then
	log "改动预览（dry-run，随后回滚）"
	git --no-pager diff -- PKGBUILD .SRCINFO LICENSE 2>/dev/null ||
		diff -u "$backup_dir/PKGBUILD" PKGBUILD || true
	cp -f "$backup_dir"/PKGBUILD "$backup_dir"/LICENSE .
	[[ -f $backup_dir/.SRCINFO ]] && cp -f "$backup_dir/.SRCINFO" .
	log "已回滚，未提交任何改动"
	exit 0
fi

# ---------------------------------------------------------------- 构建验证

if $do_build; then
	log "构建验证: SRCDEST=${CACHE_DIR} makepkg -f"
	SRCDEST="$CACHE_DIR" makepkg -f || die "构建失败，改动保留在本地，未提交"
	ok "构建通过"
else
	warn "已跳过构建验证（--no-build）"
fi

# ---------------------------------------------------------------- 提交并推送

if ! git rev-parse --git-dir >/dev/null 2>&1; then
	log "初始化 git 仓库"
	git init -q -b "$AUR_BRANCH"
fi
if ! git remote get-url origin >/dev/null 2>&1; then
	git remote add origin "$AUR_REMOTE"
fi

git add -A PKGBUILD .SRCINFO LICENSE
if git diff --cached --quiet; then
	warn "没有可提交的改动"
else
	subject="feat: 升级 motty-bin 到 ${ver}"
	[[ $ver == "$current_ver" ]] && subject="fix: 更新 motty-bin ${ver} 的发布包校验值"
	git commit -q -m "$subject"
	ok "已提交: $subject"
fi

if ! $do_push; then
	warn "已按 --no-push 跳过推送，可手动 git push"
	exit 0
fi

git fetch -q origin "$AUR_BRANCH" 2>/dev/null || true
if git rev-parse --verify -q "origin/${AUR_BRANCH}" >/dev/null; then
	if ! git merge-base --is-ancestor "origin/${AUR_BRANCH}" HEAD; then
		log "远端有新提交，先 rebase"
		git rebase "origin/${AUR_BRANCH}" || die "rebase 失败，请手工处理"
	fi
fi

git push origin "HEAD:${AUR_BRANCH}" || die "推送到 AUR 失败（检查 ssh 密钥 / 网络）"

ok "已发布: motty-bin ${ver}-${new_rel}"
echo "    https://aur.archlinux.org/packages/motty-bin"
echo "    （AUR 页面与 RPC 索引需数秒到数分钟生效）"
