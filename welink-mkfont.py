#!/usr/bin/env python3
"""在 wine 容器里生成 WeLink 需要的中文字体别名（本机生成，不随包分发）。

  msyh.otf   —— 挂上 ALIASES['msyh'] 里的全部家族名（Microsoft YaHei/MicrosoftYaHei/PingFangSC…），
                来自 Noto Sans CJK SC，垂直度量按真雅黑
  simsun.otf —— 挂上 SimSun/宋体/NSimSun/新宋体，来自 Noto Serif CJK SC（无则用 Sans），度量按真宋体

为什么需要：
  * WeLink 页面给所有文字（含输入框）指定 font-family "Microsoft Yahei"。容器里没有该
    家族名时，Chromium(DirectWrite) 逐字符回退拿到的字体会让输入框布局失败、caret 无法
    建立 → 键盘/粘贴全部失灵。让该家族名真实存在即可按名命中。
  * 页面/wine 自身还会引用 SimSun/宋体；wine 的 GDI 对话框字体也靠替换表指到这些别名。

垂直度量必须改成与原字体一致：Noto CJK 的行高(约 1.45em)比雅黑(约 1.32em)、宋体(1.0em)
大得多，页面按原字体度量给固定高度的小字留位置，换成 Noto 度量后文字会被顶下去切掉半截。
"""
import glob, os, sys, tempfile

# (ascent, descent, lineGap, typoAsc, typoDesc, winAsc, winDesc) 以 em 为单位，取自原字体
# 页面 CSS 里实际引用的家族名（从 7.60.2 的 app.asar 统计得来）。DirectWrite 按家族名精确匹配，
# 少一个就整段落到回退字体（行高 1.45em → 固定高度容器里的小字被切掉半截）。
# 一个字体文件可以通过不同 langID 的 name 记录挂多个家族名，wine 的 DirectWrite 会全部收录。
ALIASES = {
    'msyh': ['Microsoft YaHei', '微软雅黑', 'MicrosoftYaHei', 'MicrosoftYaHei-Regular', 'MicrosoftYaHei-Bold',
             'MicrosoftYaHeiSemibold', 'Microsoft YaHei UI', 'PingFang SC', 'PingFangSC', 'PingFangSC-Regular',
             'PingFangSC-Medium', 'HarmonyOS Sans SC'],
    'simsun': ['SimSun', '宋体', 'NSimSun', '新宋体'],
}
# 可用的 Windows 平台 langID 槽位（每个家族名占一个；第一个用 0x0409，中文名用 0x0804）
LANG_SLOTS = [0x0409, 0x0804, 0x0C04, 0x0404, 0x1004, 0x1404, 0x0809, 0x0C09, 0x1009, 0x1409, 0x1809, 0x1C09,
              0x2009, 0x2409, 0x2809, 0x2C09, 0x3009, 0x3409]
STAMP = '.welink-fonts-v2'

METRICS = {
    'msyh':   (1.058, 0.262, 0.0, 0.800, 0.200, 1.058, 0.262),   # Microsoft YaHei
    'simsun': (0.859, 0.141, 0.0, 0.859, 0.141, 0.859, 0.141),   # SimSun
}

def find(patterns):
    for pat in patterns:
        hits = sorted(glob.glob(pat, recursive=True))
        if hits:
            return hits[0]
    return None

def load_sc(path, TTFont, TTCollection):
    if path.endswith('.ttc'):
        n = len(TTCollection(path, lazy=True).fonts)
        for i in range(n):
            f = TTFont(path, fontNumber=i, lazy=False)
            fam = f['name'].getDebugName(1) or ''
            if 'SC' in fam and 'Mono' not in fam:
                return f
            f.close()
        return TTFont(path, fontNumber=0, lazy=False)
    return TTFont(path)

def rename(font, key, ps_name):
    names = ALIASES[key]
    name = font['name']
    # 清掉原有的家族/子家族全名/PS 名记录
    name.names = [r for r in name.names if r.nameID not in (1, 3, 4, 6, 16)]
    name.setName(ps_name, 6, 3, 1, 0x0409)
    name.setName(names[0] + ';welink-wine alias', 3, 3, 1, 0x0409)
    for fam, lid in zip(names, LANG_SLOTS):
        for nid in (1, 4, 16):
            name.setName(fam, nid, 3, 1, lid)

def set_metrics(font, key):
    asc, desc, gap, tasc, tdesc, wasc, wdesc = METRICS[key]
    upm = font['head'].unitsPerEm
    r = lambda v: int(round(v * upm))
    hhea = font['hhea']; os2 = font['OS/2']
    hhea.ascent, hhea.descent, hhea.lineGap = r(asc), -r(desc), r(gap)
    os2.sTypoAscender, os2.sTypoDescender, os2.sTypoLineGap = r(tasc), -r(tdesc), r(gap)
    os2.usWinAscent, os2.usWinDescent = r(wasc), r(wdesc)
    os2.fsSelection &= ~(1 << 7)          # 清掉 USE_TYPO_METRICS，统一按 hhea/win 度量排版
    if 'vhea' in font:
        pass

def main():
    if len(sys.argv) != 2:
        print("用法: welink-mkfont.py <目标目录>", file=sys.stderr); return 2
    outdir = sys.argv[1]
    try:
        from fontTools.ttLib import TTFont, TTCollection
    except ImportError:
        print("缺少 python-fonttools", file=sys.stderr); return 3
    os.makedirs(outdir, exist_ok=True)

    sans = find(['/usr/share/fonts/**/NotoSansCJK-Regular.ttc',
                 '/usr/share/fonts/**/NotoSansCJKsc-Regular.otf',
                 '/usr/share/fonts/**/NotoSansSC-Regular.otf'])
    serif = find(['/usr/share/fonts/**/NotoSerifCJK-Regular.ttc',
                  '/usr/share/fonts/**/NotoSerifCJKsc-Regular.otf',
                  '/usr/share/fonts/**/NotoSerifSC-Regular.otf'])
    if not sans:
        print("找不到 Noto Sans CJK 字体（需要 noto-fonts-cjk）", file=sys.stderr); return 4

    jobs = [
        ('msyh',   sans,          'MicrosoftYaHei'),
        ('simsun', serif or sans, 'SimSun'),
    ]
    rc = 0
    for base, src, ps in jobs:
        try:
            font = load_sc(src, TTFont, TTCollection)
            rename(font, base, ps)
            set_metrics(font, base)
            ext = '.otf' if 'CFF ' in font else '.ttf'
            out = os.path.join(outdir, base + ext)
            # 先写临时文件再原子替换：正在运行的 wine 进程可能映射着旧文件
            fd, tmp = tempfile.mkstemp(prefix=base + '.', suffix=ext, dir=outdir)
            os.close(fd)
            font.save(tmp)
            os.chmod(tmp, 0o644)
            os.replace(tmp, out)
            print("已生成 %s  (%d 个家族名 ← %s; 行高 %.2fem)" % (
                out, len(ALIASES[base]), os.path.basename(src), sum(METRICS[base][:3])))
        except Exception as e:
            print("生成 %s 失败: %s" % (base, e), file=sys.stderr); rc = 5
    if rc == 0:
        open(os.path.join(outdir, STAMP), 'w').close()
    return rc

if __name__ == '__main__':
    sys.exit(main())
