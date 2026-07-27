#!/usr/bin/env python3
"""
Flatpak Bundle Unpacker
=======================
从 .flatpak bundle 文件中提取可执行程序及附属资源。

Flatpak bundle 格式：
    1. Header (10 bytes): magic "flatpak\0" + uint16 version
    2. GVariant metadata: ref 路径、应用 metadata、OSTree 配置
    3. XZ 压缩的 OSTree static delta: 实际文件内容

用法:
    python flatpak_unpack.py <input.flatpak> [output_dir]

示例:
    python flatpak_unpack.py RedisViewer_3.2.2_linux_amd64.flatpak
    python flatpak_unpack.py RedisViewer_3.2.2_linux_amd64.flatpak ./output

依赖: 仅需 Python 3.6+ 标准库 (lzma, struct, os, sys, json)
"""

import lzma
import struct
import os
import sys
import re


def find_xz_streams(data):
    """在二进制数据中查找所有 XZ 流的起始位置。"""
    xz_magic = b"\xfd7zXZ\x00"
    positions = []
    pos = 0
    while True:
        idx = data.find(xz_magic, pos)
        if idx == -1:
            break
        positions.append(idx)
        pos = idx + 1
    return positions


def try_decompress_xz(data, xz_start):
    """尝试从指定位置解压 XZ 数据，返回解压后的字节。"""
    xz_data = data[xz_start:]
    try:
        decompressed = lzma.decompress(xz_data)
        return decompressed
    except Exception:
        # 尝试逐步截断，找到有效的 XZ 流结尾
        dec = lzma.LZMADecompressor()
        chunk_size = 65536
        result = b""
        offset = 0
        try:
            while offset < len(xz_data):
                chunk = xz_data[offset : offset + chunk_size]
                if not chunk:
                    break
                part = dec.decompress(chunk)
                result += part
                if dec.eof:
                    break
                offset += chunk_size
        except Exception:
            pass
        return result if result else None


def find_elf_binaries(data):
    """在数据中查找所有 ELF 二进制文件的偏移。"""
    elf_magic = b"\x7fELF"
    positions = []
    pos = 0
    while True:
        idx = data.find(elf_magic, pos)
        if idx == -1:
            break
        positions.append(idx)
        pos = idx + 1
    return positions


def calculate_elf_size(data, elf_offset):
    """
    解析 ELF header，计算文件实际大小。
    ELF 文件大小 = 最后一个 section 的 (sh_offset + sh_size)
    对于 NOBITS 段，使用 sh_offset 而非 sh_offset + sh_size。
    """
    if elf_offset + 64 > len(data):
        return None

    header = data[elf_offset : elf_offset + 64]
    ei_class = header[4]

    if ei_class == 2:  # 64-bit
        e_shoff = struct.unpack_from("<Q", header, 40)[0]
        e_shentsize = struct.unpack_from("<H", header, 58)[0]
        e_shnum = struct.unpack_from("<H", header, 60)[0]
        e_shstrndx = struct.unpack_from("<H", header, 62)[0]
    elif ei_class == 1:  # 32-bit
        e_shoff = struct.unpack_from("<I", header, 32)[0]
        e_shentsize = struct.unpack_from("<H", header, 46)[0]
        e_shnum = struct.unpack_from("<H", header, 48)[0]
        e_shstrndx = struct.unpack_from("<H", header, 50)[0]
    else:
        return None

    if e_shoff == 0 or e_shnum == 0 or e_shentsize == 0:
        return None

    max_end = 0
    shstrtab_offset = None

    for i in range(e_shnum):
        sh_off_abs = elf_offset + e_shoff + i * e_shentsize
        if sh_off_abs + (64 if ei_class == 2 else 40) > len(data):
            break

        if ei_class == 2:
            sh_type = struct.unpack_from("<I", data, sh_off_abs + 4)[0]
            sh_offset = struct.unpack_from("<Q", data, sh_off_abs + 24)[0]
            sh_size = struct.unpack_from("<Q", data, sh_off_abs + 32)[0]
        else:
            sh_type = struct.unpack_from("<I", data, sh_off_abs + 4)[0]
            sh_offset = struct.unpack_from("<I", data, sh_off_abs + 16)[0]
            sh_size = struct.unpack_from("<I", data, sh_off_abs + 20)[0]

        if sh_type == 8:  # SHT_NOBITS - 不占文件空间
            section_end = sh_offset
        else:
            section_end = sh_offset + sh_size

        if section_end > max_end:
            max_end = section_end

        # 记录字符串表
        if i == e_shstrndx:
            shstrtab_offset = sh_offset

    return max_end if max_end > 0 else None


def get_elf_info(data, elf_offset):
    """获取 ELF 二进制的基本信息。"""
    if elf_offset + 64 > len(data):
        return {}

    header = data[elf_offset : elf_offset + 64]
    ei_class = header[4]
    ei_data = header[5]

    info = {
        "class": "64-bit" if ei_class == 2 else "32-bit",
        "endian": "Little endian" if ei_data == 1 else "Big endian",
    }

    if ei_class == 2:
        e_type = struct.unpack_from("<H", header, 16)[0]
        e_machine = struct.unpack_from("<H", header, 18)[0]
        info["type"] = {1: "REL", 2: "EXEC", 3: "DYN (shared lib)"}.get(e_type, f"Unknown({e_type})")
        info["machine"] = {0x3E: "x86-64", 0x03: "x86", 0xB7: "AArch64"}.get(
            e_machine, f"Unknown(0x{e_machine:X})"
        )
    else:
        e_type = struct.unpack_from("<H", header, 16)[0]
        e_machine = struct.unpack_from("<H", header, 18)[0]
        info["type"] = {1: "REL", 2: "EXEC", 3: "DYN (shared lib)"}.get(e_type, f"Unknown({e_type})")
        info["machine"] = {0x03: "x86", 0x28: "ARM"}.get(e_machine, f"Unknown(0x{e_machine:X})")

    return info


def find_string(data, offset, max_len=256):
    """从指定位置读取一个以 null 结尾的字符串。"""
    end = data.find(b"\x00", offset)
    if end == -1 or end - offset > max_len:
        return None
    try:
        return data[offset:end].decode("utf-8")
    except UnicodeDecodeError:
        return None


def extract_metadata_fields(data):
    """从 flatpak 元数据中提取应用名等信息。"""
    fields = {}
    # 查找 [Application] 段
    app_marker = b"[Application]"
    idx = data.find(app_marker)
    if idx == -1:
        return fields

    # 读取该段后的文本
    text_start = idx
    text_end = min(idx + 2048, len(data))
    text = data[text_start:text_end]

    # 查找 name= 行
    for pattern in [b"\nname=", b"\nicon=", b"\ndesktop=", b"\ncommand="]:
        pos = text.find(pattern)
        if pos != -1:
            val_start = pos + len(pattern)
            val_end = text.find(b"\n", val_start)
            if val_end == -1:
                val_end = val_start + 100
            key = pattern.strip().decode().lstrip("\n")
            try:
                val = text[val_start:val_end].decode("utf-8").strip()
                fields[key] = val
            except UnicodeDecodeError:
                pass

    return fields


def extract_text_section(data, start_marker, end_markers=None, max_len=4096):
    """
    从二进制数据中提取文本段。
    start_marker: 段起始标记 (如 b"[Desktop Entry]")
    end_markers: 段结束标记列表 (如 [b"[Application]", b"\x89PNG"])
    遇到非打印字符（除 \n\r\t 外）也视为结束。
    """
    idx = data.find(start_marker)
    if idx == -1:
        return None

    end = min(idx + max_len, len(data))
    if end_markers:
        for marker in end_markers:
            m_idx = data.find(marker, idx + len(start_marker))
            if m_idx != -1 and m_idx < end:
                end = m_idx

    # 逐字节扫描，遇到非打印字符截断
    for i in range(idx, end):
        b = data[i]
        if b == 0 or (b < 0x20 and b not in (0x0A, 0x0D, 0x09)):
            end = i
            break

    try:
        text = data[idx:end].decode("utf-8")
        return text.rstrip("\x00").strip() + "\n"
    except UnicodeDecodeError:
        return None


def extract_desktop_file(data):
    """提取 .desktop 文件内容。"""
    return extract_text_section(
        data,
        b"[Desktop Entry]",
        end_markers=[b"[Application]", b"\x89PNG"],
        max_len=2048,
    )


def extract_metadata_text(data):
    """提取 [Application] metadata 文本。"""
    return extract_text_section(
        data,
        b"[Application]",
        end_markers=[b"\x89PNG", b"\x7fELF", b"[Desktop Entry]"],
        max_len=2048,
    )


def extract_png_icon(data, search_start=0):
    """
    提取 PNG 图标。
    search_start: 从此位置开始搜索 (避免提取到 ELF 内嵌的 PNG 资源)
    """
    png_magic = b"\x89PNG\r\n\x1a\n"
    idx = data.find(png_magic, search_start)
    if idx == -1:
        return None

    # PNG 文件以 IEND chunk 结束
    # IEND chunk 结构: 4B length(=0) + 4B "IEND" + 0B data + 4B CRC
    # 找到 "IEND" 后，文件结束于 iend + 4(type) + 4(CRC) = iend + 8
    iend = data.find(b"IEND", idx)
    if iend == -1:
        return None

    return data[idx : iend + 8]


def find_executable_name(data):
    """尝试从数据中推断可执行程序名。"""
    # 方法1: 从 desktop 文件中找 Exec= 行
    marker = b"[Desktop Entry]"
    idx = data.find(marker)
    if idx != -1:
        text = data[idx : min(idx + 4096, len(data))]
        exec_match = re.search(rb"Exec=(\S+)", text)
        if exec_match:
            try:
                return exec_match.group(1).decode("utf-8")
            except UnicodeDecodeError:
                pass

    # 方法2: 从 metadata command= 字段找
    for pattern in [b"command=", b"\nname="]:
        idx = data.find(pattern)
        if idx != -1:
            val_start = idx + len(pattern)
            val_end = data.find(b"\n", val_start)
            if val_end == -1:
                val_end = val_start + 100
            try:
                val = data[val_start:val_end].decode("utf-8").strip()
                if val and "/" not in val:
                    return val
            except UnicodeDecodeError:
                pass

    # 方法3: 从 ref 路径找
    ref_patterns = [b"app/", b"/x86_64/stable"]
    idx = data.find(b"app/")
    if idx != -1:
        # app/<app-id>/...
        parts = data[idx + 4 : idx + 200].split(b"/")
        if parts:
            try:
                app_id = parts[0].decode("utf-8")
                return app_id
            except UnicodeDecodeError:
                pass

    return None


def main():
    if len(sys.argv) < 2:
        print("用法: python flatpak_unpack.py <input.flatpak> [output_dir]")
        print("示例: python flatpak_unpack.py RedisViewer_3.2.2_linux_amd64.flatpak")
        sys.exit(1)

    flatpak_path = sys.argv[1]
    if not os.path.isabs(flatpak_path):
        flatpak_path = os.path.abspath(flatpak_path)

    if not os.path.isfile(flatpak_path):
        print(f"错误: 文件不存在: {flatpak_path}")
        sys.exit(1)

    output_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.dirname(flatpak_path)
    if not os.path.isabs(output_dir):
        output_dir = os.path.abspath(output_dir)
    output_dir = os.path.join(output_dir, "flatpak_unpacked")
    os.makedirs(output_dir, exist_ok=True)

    print(f"{'=' * 60}")
    print(f"Flatpak Bundle Unpacker")
    print(f"{'=' * 60}")
    print(f"输入文件: {flatpak_path}")
    print(f"输出目录: {output_dir}")
    print(f"文件大小: {os.path.getsize(flatpak_path) / 1024 / 1024:.2f} MB")
    print()

    # Step 1: 读取文件
    print("[1/6] 读取文件...")
    with open(flatpak_path, "rb") as f:
        data = f.read()

    # 验证 Flatpak magic
    magic = data[0:8]
    if magic == b"flatpak\x00":
        version = struct.unpack_from("<H", data, 8)[0]
        print(f"  ✓ Flatpak 格式确认, version={version}")
    else:
        print(f"  ⚠ 警告: 文件头不是 'flatpak' magic ({magic}), 继续尝试...")

    # Step 2: 查找并解压 XZ 数据
    print()
    print("[2/6] 查找 XZ 压缩流...")
    xz_positions = find_xz_streams(data)
    if not xz_positions:
        print("  ✗ 未找到 XZ 压缩流!")
        sys.exit(1)

    print(f"  找到 {len(xz_positions)} 个 XZ 流: {[hex(p) for p in xz_positions]}")

    decompressed = None
    for i, xz_pos in enumerate(xz_positions):
        print(f"  尝试解压 XZ 流 #{i + 1} (offset 0x{xz_pos:X})...")
        result = try_decompress_xz(data, xz_pos)
        if result and len(result) > 1000:
            decompressed = result
            print(f"  ✓ 解压成功: {len(decompressed)} bytes ({len(decompressed) / 1024 / 1024:.2f} MB)")
            break
        else:
            print(f"  ✗ 解压失败或数据太小")

    if not decompressed:
        print("  ✗ 所有 XZ 流解压失败!")
        sys.exit(1)

    # Step 3: 查找 ELF 二进制
    print()
    print("[3/6] 查找 ELF 可执行文件...")
    elf_positions = find_elf_binaries(decompressed)
    if not elf_positions:
        print("  ✗ 未找到 ELF 二进制!")
        sys.exit(1)

    print(f"  找到 {len(elf_positions)} 个 ELF 二进制: {[hex(p) for p in elf_positions[:10]]}")

    # 优先选择 64-bit EXEC 类型的大文件
    best_elf = None
    best_elf_size = 0
    for pos in elf_positions:
        info = get_elf_info(decompressed, pos)
        elf_size = calculate_elf_size(decompressed, pos)
        if elf_size is None:
            continue
        # 优先选择 64-bit EXEC 类型
        if info.get("class") == "64-bit" and info.get("type") == "EXEC":
            if elf_size > best_elf_size:
                best_elf = pos
                best_elf_size = elf_size
        elif best_elf is None and elf_size > 100000:
            best_elf = pos
            best_elf_size = elf_size

    if best_elf is None:
        # fallback: 取最大的
        for pos in elf_positions:
            elf_size = calculate_elf_size(decompressed, pos)
            if elf_size and elf_size > best_elf_size:
                best_elf = pos
                best_elf_size = elf_size

    if best_elf is None:
        print("  ✗ 无法确定主可执行文件!")
        sys.exit(1)

    elf_info = get_elf_info(decompressed, best_elf)
    print(f"  ✓ 选定主程序: offset=0x{best_elf:X}, size={best_elf_size} bytes ({best_elf_size / 1024 / 1024:.2f} MB)")
    print(f"    架构: {elf_info.get('machine', '?')}, 类型: {elf_info.get('type', '?')}, {elf_info.get('class', '?')}")

    # Step 4: 提取可执行文件
    print()
    print("[4/6] 提取可执行文件...")
    elf_data = decompressed[best_elf : best_elf + best_elf_size]

    # 推断可执行文件名
    exec_name = find_executable_name(decompressed)
    if not exec_name:
        exec_name = os.path.splitext(os.path.basename(flatpak_path))[0]
        # 去掉版本号和平台后缀
        exec_name = re.sub(r"_\d+\.\d+\.\d+.*", "", exec_name)

    # 去掉路径前缀
    exec_name = os.path.basename(exec_name)

    exec_path = os.path.join(output_dir, exec_name)
    with open(exec_path, "wb") as f:
        f.write(elf_data)
    print(f"  ✓ 已保存: {exec_path} ({len(elf_data)} bytes)")

    # Step 5: 提取附属资源
    print()
    print("[5/6] 提取附属资源...")

    extracted_files = [exec_path]

    # 提取 metadata (优先从 flatpak 头部提取，更干净)
    meta_text = extract_metadata_text(data)
    if not meta_text:
        meta_text = extract_metadata_text(decompressed)
    if meta_text:
        meta_path = os.path.join(output_dir, "metadata")
        with open(meta_path, "w", encoding="utf-8") as f:
            f.write(meta_text)
        print(f"  ✓ 元数据文件: {meta_path}")
        extracted_files.append(meta_path)

    # 提取 .desktop 文件
    desktop_text = extract_desktop_file(decompressed)
    if desktop_text:
        desktop_name = f"{exec_name}.desktop" if exec_name else "app.desktop"
        desktop_path = os.path.join(output_dir, desktop_name)
        with open(desktop_path, "w", encoding="utf-8") as f:
            f.write(desktop_text)
        print(f"  ✓ .desktop 文件: {desktop_path}")
        extracted_files.append(desktop_path)

    # 提取 PNG 图标 (从 metadata 位置之后搜索，避免提取 ELF 内嵌的 PNG)
    meta_pos = decompressed.find(b"[Application]")
    png_search_start = meta_pos if meta_pos != -1 else 0
    # 如果找不到 metadata，从 ELF 之后搜索
    if png_search_start == 0 and best_elf:
        png_search_start = best_elf + best_elf_size

    png_data = extract_png_icon(decompressed, png_search_start)
    if png_data:
        icon_name = f"{exec_name}.png" if exec_name else "icon.png"
        icon_path = os.path.join(output_dir, icon_name)
        with open(icon_path, "wb") as f:
            f.write(png_data)
        print(f"  ✓ 图标文件: {icon_path} ({len(png_data)} bytes)")
        extracted_files.append(icon_path)

    # Step 6: 汇总
    print()
    print("[6/6] 解包完成!")
    print(f"{'=' * 60}")
    print(f"输出文件:")
    for fp in extracted_files:
        size = os.path.getsize(fp)
        print(f"  - {fp} ({size:,} bytes)")
    print(f"{'=' * 60}")

    # 如果是 ELF 可执行，提示依赖
    if elf_info.get("type") == "EXEC" and elf_info.get("machine") == "x86-64":
        print()
        print("提示: 该可执行文件是 64-bit x86-64 ELF 动态链接程序。")
        print("运行前需安装依赖库 (以 Ubuntu/Debian 为例):")
        print("  sudo apt install libwebkit2gtk-4.1-dev libgtk-3-dev libglib2.0-dev")
        print()
        print("赋予执行权限并运行:")
        print(f"  chmod +x {exec_name}")
        print(f"  ./{exec_name}")


if __name__ == "__main__":
    main()