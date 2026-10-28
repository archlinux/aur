#!/usr/bin/env python3
"""离线生成固定校验版本的 UU Tailnet DNS 补丁副本，不修改运行系统。"""
import argparse
import hashlib
import json
from pathlib import Path

SOURCE_SHA256 = '28bf89e3b18aed87f7eec759bf5441143c06a0b00306a02cd5184869bf2f9668'
PATCHED_SHA256 = '3c90b655ab7fcf3f0368b0b0ff7596d9335d522e1da70ea74aaa31fd30d1c248'

# Official archive and the earlier makepkg-installed ELF (with .gnu_debuglink).
# Their .text and .rodata are identical; both profiles use the same exact edits.
OFFICIAL_SOURCE_SHA256 = '6643c6cde6ff2d38e9817c916adc7df75fa242f00f25befa7353ab041f152482'
OFFICIAL_PATCHED_SHA256 = '0e82db28ee7a29eb27e729887060fa8c508cfd1010e612e7280828d85b80c357'
SUPPORTED_PROFILES = {
    SOURCE_SHA256: PATCHED_SHA256,
    OFFICIAL_SOURCE_SHA256: OFFICIAL_PATCHED_SHA256,
}


def apply_edits(source, edits):
    """先验证全部范围，再在副本中应用定长修改。"""
    edits = sorted(edits, key=lambda edit: edit[0])
    end = 0
    for offset, original, replacement in edits:
        if offset < end or not original or len(original) != len(replacement):
            raise ValueError('Overlapping, empty or length-changing edit')
        if offset < 0 or offset + len(original) > len(source):
            raise ValueError('Edit outside source file')
        if source[offset:offset + len(original)] != original:
            raise ValueError(f'Unexpected original bytes at {offset:#x}')
        end = offset + len(original)
    output = bytearray(source)
    for offset, original, replacement in edits:
        output[offset:offset + len(original)] = replacement
    return bytes(output)


def dns_edits():
    """当前支持的上游代码布局；IPv6 指令位置由反汇编与实机验证确定。"""
    edits = []
    for offset, operation in [(0x3e0998, 'I'), (0x3e0b00, 'D')]:
        original = (f'-t nat -{operation} OUTPUT -p udp -m udp --dport %u  '
                    '-m mark ! --mark %s -j DNAT --to-destination %s:%u '
                    '> /dev/null 2>&1').encode()
        replacement = (f'-t nat -{operation} OUTPUT ! -d 100.64.0.0/10 '
                       '-p udp --dport %u -m mark ! --mark %s -j DNAT '
                       '--to-destination %s:%u').encode()
        edits.append((offset, original, replacement.ljust(len(original), b' ')))

    old_udp = b'-t filter -I OUTPUT  -p udp -m udp --dport 53 -j DROP > /dev/null 2>&1'
    old_tcp = old_udp.replace(b'udp', b'tcp')
    new_udp = b'-I OUTPUT ! -d fd7a:115c:a1e0::/48 -p udp --dport 53 -j DROP'.ljust(70, b' ')
    new_tcp = new_udp.replace(b'udp', b'tcp')
    old_delete = old_udp.replace(b'-I OUTPUT', b'-D OUTPUT')
    new_delete = new_udp.replace(b'-I OUTPUT', b'-D OUTPUT')
    # 四个构造函数共用这些 16 字节常量，同时覆盖添加和删除命令。
    edits.extend([
        (0x3e1410, old_udp[:16], new_udp[:16]),
        (0x3e1420, old_udp[16:32], new_udp[16:32]),
        (0x3e1430, old_udp[32:48], new_udp[32:48]),
        (0x3e1440, old_udp[48:64], new_udp[48:64]),
        (0x3e1450, old_tcp[16:32], new_tcp[16:32]),
        (0x3e1460, old_tcp[32:48], new_tcp[32:48]),
        (0x3e1470, old_delete[:16], new_delete[:16]),
    ])
    # 移除原 stdout/stderr 重定向的尾部字符，替换为空格，保留指令长度。
    for address in [0x5a9857, 0x5a99a7, 0x5a9af7, 0x5a9c47]:
        edits.append((address - 0x400000, bytes.fromhex('b826310000'),
                      bytes.fromhex('b820200000')))
    for address in [0x5a9878, 0x5a99c8, 0x5a9b17, 0x5a9c67]:
        edits.append((address - 0x400000, bytes.fromhex('c74424606c20323e'),
                      bytes.fromhex('c744246020202020')))
    return edits


def patch_binary(source):
    expected_output = SUPPORTED_PROFILES.get(hashlib.sha256(source).hexdigest())
    if expected_output is None:
        raise ValueError('Unsupported or modified UU binary; source SHA256 mismatch')
    result = apply_edits(source, dns_edits())
    if hashlib.sha256(result).hexdigest() != expected_output:
        raise ValueError('Patched SHA256 mismatch; no output written')
    return result


def write_patch(source, target):
    source, target = Path(source), Path(target)
    if source.resolve() == target.resolve():
        raise ValueError('Refusing to overwrite source binary')
    original = source.read_bytes()
    result = patch_binary(original)
    # xb 同时拒绝已有文件、硬链接及符号链接，不提供强制覆盖开关。
    with target.open('xb') as output:
        try:
            output.write(result)
            output.flush()
            target.chmod(0o755)
        except BaseException:
            target.unlink()
            raise
    return {'source_sha256': hashlib.sha256(original).hexdigest(),
            'patched_sha256': hashlib.sha256(result).hexdigest(),
            'size_bytes': len(result)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('target', type=Path)
    args = parser.parse_args()
    try:
        print(json.dumps(write_patch(args.source, args.target)))
    except (OSError, ValueError) as error:
        parser.exit(1, f'{error}\n')


if __name__ == '__main__':
    main()
