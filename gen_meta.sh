#!/usr/bin/env bash
# 生成 python-py-key-value-aio 的后端 meta 包。
#
# 上游把每个存储后端声明为 [project.optional-dependencies] 里的一个 extra，
# 本脚本把每个 extra 变成一个 Arch meta 包，并重写 PKGBUILD 的三个标记块：
#
#   # >>>META-BEGIN:pkgname>>>   ...  # >>>META-END:pkgname>>>
#   # >>>META-BEGIN:deps>>>      ...  # >>>META-END:deps>>>
#   # >>>META-BEGIN:packages>>>  ...  # >>>META-END:packages>>>
set -euo pipefail

cd "$(dirname "$0")"

pkgbase=$(awk -F= '/^pkgbase=/{print $2}' PKGBUILD)
pkgver=$(awk -F= '/^pkgver=/{print $2}' PKGBUILD)
_name=${pkgbase#python-}
_name=${_name//-/_}

echo "[gen_meta] pkgbase = ${pkgbase}" >&2
echo "[gen_meta] version = ${pkgver}" >&2

# 取源码并解压：
#   -d 跳过依赖检查   —— pre-build 阶段运行时依赖(如 python-beartype)尚未安装，
#                        不加 -d 会因 "无法解决所有的依赖关系" 以 exit 8 失败
#   -o 只下载并解压   —— 不构建
# 注意不能只用 updpkgsums：它是 makepkg -g，下载完就退出、从不解压
# (见 /usr/bin/makepkg:1307)，git 源只会留下一个 bare mirror，没有工作树。
makepkg -do >&2

pyproject="src/${_name}/pyproject.toml"
if [[ ! -f ${pyproject} ]]; then
    echo "[gen_meta] error: ${pyproject} 不存在" >&2
    exit 1
fi
echo "[gen_meta] pyproject = ${pyproject}" >&2

tmp_pkgname=$(mktemp)
tmp_deps=$(mktemp)
tmp_packages=$(mktemp)
trap "rm -f '${tmp_pkgname}' '${tmp_deps}' '${tmp_packages}'" EXIT

python3 - "${pyproject}" "${pkgbase}" "${tmp_pkgname}" "${tmp_deps}" "${tmp_packages}" <<'PY'
# -*- coding: utf-8 -*-
"""从 pyproject.toml 生成三个标记块的内容。"""
import sys
import tomllib

pyproject, pkgbase, f_pkgname, f_deps, f_packages = sys.argv[1:6]

# PyPI 名 -> Arch 包后缀（少数不遵循 python-<名字> 规则的）
ARCH_SUFFIX = {
    "dbus-python": "dbus",              # Arch: python-dbus
    "opensearch-py": "opensearch",      # Arch: python-opensearch
    # typing_extensions 是极少数保留上游下划线的 Arch python 包
    "typing-extensions": "typing_extensions",
    "typing_extensions": "typing_extensions",
}
# 不生成 meta 包的 extra（只是构建文档用的）
EXCLUDE = {"docs"}


def req_name(req):
    """从 PEP 508 需求串里取出包名。"""
    req = req.split(";", 1)[0]          # 去掉环境标记
    req = req.split("[", 1)[0]          # 去掉 extras
    for sep in (">", "<", "=", "~", "!"):
        req = req.split(sep, 1)[0]
    return req.strip().lower()


def arch(name):
    return "python-" + ARCH_SUFFIX.get(name, name)


with open(pyproject, "rb") as f:
    data = tomllib.load(f)

project = data.get("project", {})

# 主包的核心运行时依赖（不额外加 python- 前缀，PKGBUILD 里用
# ${_py_deps[@]/#/python-} 统一加）
core = sorted({
    ARCH_SUFFIX.get(n, n)
    for n in (req_name(d) for d in project.get("dependencies", []))
    if n
})

# 每个 extra -> 依赖列表
extras = {}
for extra, deps in (project.get("optional-dependencies") or {}).items():
    if extra.lower() in EXCLUDE:
        continue
    names = sorted({
        arch(n) for n in (req_name(d) for d in deps) if n
    })
    if not names:
        continue
    extras[extra.lower()] = names

# 安全阀：读不到内容就绝不能往下写，否则会把 PKGBUILD 的标记块清空
if not core:
    print(f"[gen_meta] error: 未从 {pyproject} 解析到核心依赖", file=sys.stderr)
    sys.exit(1)
if not extras:
    print(f"[gen_meta] error: 未从 {pyproject} 解析到任何 extra", file=sys.stderr)
    sys.exit(1)

# ---- pkgname
with open(f_pkgname, "w") as f:
    # 注意：块内的每一行（含 "pkgname=(" 这一行）都被替换掉，所以这里要重新输出
    f.write("pkgname=(\n")
    f.write("  ${pkgbase}\n")
    for e in sorted(extras):
        f.write(f"  ${{pkgbase}}-{e}\n")
    f.write(")\n")

# ---- deps
with open(f_deps, "w") as f:
    f.write("_py_deps=(\n")
    for c in core:
        f.write(f"  {c}\n")
    f.write(")\n")
    f.write("depends=(\n")
    f.write("  python\n")
    f.write('  "${_py_deps[@]/#/python-}"\n')
    f.write(")\n")
    f.write("optdepends=(\n")
    for e in sorted(extras):
        # 必须用双引号：单引号不会展开 ${pkgbase}，残留的 ${} 会被 makepkg 拒绝
        f.write(f'  "${{pkgbase}}-{e}: {e} backend ({" ".join(extras[e])})"\n')
    f.write(")\n")

# ---- packages
with open(f_packages, "w") as f:
    for i, e in enumerate(sorted(extras)):
        if i:
            f.write("\n")
        # bash 函数名不能含 $，所以把真实包名写出来（由 pkgbase 推导）
        f.write(f"package_{pkgbase}-{e}() {{\n")
        f.write(f'  pkgdesc+=" - {e} backend"\n')
        f.write("  depends=(\n")
        # 不加版本锁：=ver-rel 会给本地仓库安装带来麻烦
        f.write('    "${pkgbase}"\n')
        for n in extras[e]:
            f.write(f"    {n}\n")
        f.write("  )\n")
        f.write("}\n")

print(f"[gen_meta] core deps    : {', '.join(core)}", file=sys.stderr)
print(f"[gen_meta] meta packages: {len(extras)}", file=sys.stderr)
PY

# 替换三个标记块：先清掉块内旧内容（保留标记行），再把新内容插到 BEGIN 之后
for pair in "pkgname:${tmp_pkgname}" "deps:${tmp_deps}" "packages:${tmp_packages}"; do
    name=${pair%%:*}
    file=${pair#*:}
    sed -i "/^# >>>META-BEGIN:${name}>>>/,/^# >>>META-END:${name}>>>/{//!d}" PKGBUILD
    sed -i "/^# >>>META-BEGIN:${name}>>>/r ${file}" PKGBUILD
done

echo "[gen_meta] updated PKGBUILD" >&2
