"""验证补丁的语义、版本拒绝和输出不覆盖行为，不需要专有程序。"""
import importlib.util
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('uu_patch', ROOT / 'patch_uuplugin_tailnet.py')
patcher = importlib.util.module_from_spec(spec)
spec.loader.exec_module(patcher)


class UuPatchTests(unittest.TestCase):
    def test_each_profile_requires_its_own_output_digest(self):
        import hashlib
        source = b'ABCDE'
        expected = b'XYZDE'
        profiles = {hashlib.sha256(source).hexdigest(): hashlib.sha256(expected).hexdigest()}
        with patch.dict(patcher.SUPPORTED_PROFILES, profiles, clear=True), patch.object(
                patcher, 'dns_edits', return_value=[(0, b'ABC', b'XYZ')]):
            self.assertEqual(patcher.patch_binary(source), expected)
            profiles[hashlib.sha256(source).hexdigest()] = '0' * 64
            with patch.dict(patcher.SUPPORTED_PROFILES, profiles, clear=True):
                with self.assertRaisesRegex(ValueError, 'Patched SHA256 mismatch'):
                    patcher.patch_binary(source)

    def test_only_explicit_ranges_are_changed(self):
        result = patcher.apply_edits(b'ABCDE12345', [(0, b'ABC', b'xyz'), (7, b'345', b'foo')])
        self.assertEqual(result, b'xyzDE12foo')

    def test_bad_edits_are_rejected(self):
        for edits in [[(0, b'ZZ', b'xx')], [(0, b'AB', b'x')],
                      [(-1, b'A', b'x')], [(9, b'55', b'xx')],
                      [(1, b'BC', b'xx'), (2, b'CD', b'yy')]]:
            with self.subTest(edits=edits), self.assertRaises(ValueError):
                patcher.apply_edits(b'ABCDE12345', edits)

    def test_unknown_binary_cannot_create_output(self):
        with tempfile.TemporaryDirectory() as folder:
            source, target = Path(folder) / 'source', Path(folder) / 'target'
            source.write_bytes(b'unsupported UU version')
            with self.assertRaises(ValueError):
                patcher.write_patch(source, target)
            self.assertFalse(target.exists())
            self.assertEqual(source.read_bytes(), b'unsupported UU version')

    def test_existing_output_and_source_are_not_overwritten(self):
        with tempfile.TemporaryDirectory() as folder:
            source, target = Path(folder) / 'source', Path(folder) / 'target'
            source.write_bytes(b'source')
            target.write_bytes(b'keep output')
            # 仅隔离已单独验证的纯二进制转换，真正执行文件创建边界。
            with patch.object(patcher, 'patch_binary', return_value=b'patched'):
                with self.assertRaises(FileExistsError):
                    patcher.write_patch(source, target)
                with self.assertRaises(ValueError):
                    patcher.write_patch(source, source)
                symlink, hardlink = Path(folder) / 'symlink', Path(folder) / 'hardlink'
                symlink.symlink_to(target)
                hardlink.hardlink_to(target)
                for alias in [symlink, hardlink]:
                    with self.subTest(alias=alias), self.assertRaises(FileExistsError):
                        patcher.write_patch(source, alias)
            self.assertEqual(source.read_bytes(), b'source')
            self.assertEqual(target.read_bytes(), b'keep output')

    def test_new_output_contains_only_patched_copy(self):
        with tempfile.TemporaryDirectory() as folder:
            source, target = Path(folder) / 'source', Path(folder) / 'target'
            source.write_bytes(b'source')
            with patch.object(patcher, 'patch_binary', return_value=b'patched'):
                patcher.write_patch(source, target)
            self.assertEqual(source.read_bytes(), b'source')
            self.assertEqual(target.read_bytes(), b'patched')
            self.assertEqual(target.stat().st_mode & 0o777, 0o755)

    def test_generated_rules_preserve_printf_arguments_and_ipv6_cleanup(self):
        # 用公开的命令常量/指令片段构造稀疏夹具；预期来自已验证的规则语义。
        edits = patcher.dns_edits()
        self.assertTrue(edits)
        source = bytearray(0x4f8000)
        for offset, original, _ in edits:
            source[offset:offset + len(original)] = original
        result = patcher.apply_edits(bytes(source), edits)
        for offset, op in [(0x3e0998, 'I'), (0x3e0b00, 'D')]:
            command = result[offset:offset + 110].decode().strip() % (53, '0x164', '172.19.163.1', 53)
            self.assertEqual(command, f'-t nat -{op} OUTPUT ! -d 100.64.0.0/10 -p udp --dport 53 -m mark ! --mark 0x164 -j DNAT --to-destination 172.19.163.1:53')
        cases = [
            ('I', 0x3e1410, 'udp', 0x3e1420, 0x3e1430, 0x1a9857, 0x1a9878),
            ('I', 0x3e1410, 'tcp', 0x3e1450, 0x3e1460, 0x1a99a7, 0x1a99c8),
            ('D', 0x3e1470, 'udp', 0x3e1420, 0x3e1430, 0x1a9af7, 0x1a9b17),
            ('D', 0x3e1470, 'tcp', 0x3e1450, 0x3e1460, 0x1a9c47, 0x1a9c67),
        ]
        for op, prefix, proto, chunk1, chunk2, tail2, tail4 in cases:
            command = (result[prefix:prefix + 16] + result[chunk1:chunk1 + 16]
                       + result[chunk2:chunk2 + 16] + result[0x3e1440:0x3e1450]
                       + result[tail4 + 4:tail4 + 8] + result[tail2 + 1:tail2 + 3])
            self.assertEqual(command.decode().strip(), f'-{op} OUTPUT ! -d fd7a:115c:a1e0::/48 -p {proto} --dport 53 -j DROP')
