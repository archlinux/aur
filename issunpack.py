#!/usr/bin/env python3
# InstallShield ISSetupStream extractor
# (c) 2019 Mantas Mikulėnas <grawity@gmail.com>
#
# Based on code from <https://github.com/lifenjoiner/ISx>
# (c) 2017 lifenjoiner
#
# Released under the MIT License
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import struct
import sys
import zlib

class BinaryReader():
    def __init__(self, fh):
        self.fh = fh

    def _debug(self, typ, data):
        if os.environ.get("DEBUG"):
            c_on = "\033[33m" if sys.stderr.isatty() else ""
            c_off = "\033[m" if sys.stderr.isatty() else ""
            print(c_on, "#", typ, repr(data)[:1024], c_off, file=sys.stderr)
        return data

    def read(self, length):
        buf = self.fh.read(length)
        if len(buf) < length:
            if len(buf) == 0:
                raise EOFError("Hit EOF after 0/%d bytes" % length)
            else:
                raise IOError("Hit EOF after %d/%d bytes" % (len(buf), length))
        return self._debug("raw[%d]" % length, buf)

    def _read_fmt(self, length, fmt, typ):
        buf = self.fh.read(length)
        if len(buf) < length:
            if len(buf) == 0:
                raise EOFError("Hit EOF after 0/%d bytes" % length)
            else:
                raise IOError("Hit EOF after %d/%d bytes" % (len(buf), length))
        data, = struct.unpack(fmt, buf)
        return self._debug(typ, data)

    def read_u8(self):
        return self._read_fmt(1, "B", "byte")

    def read_u16_le(self):
        return self._read_fmt(2, "<H", "short")

    def read_u16_be(self):
        return self._read_fmt(2, ">H", "short")

    def read_u32_le(self):
        return self._read_fmt(4, "<L", "long")

    def read_u32_be(self):
        return self._read_fmt(4, ">L", "long")

    def read_u64_le(self):
        return self._read_fmt(8, "<Q", "quad")

    def read_u64_be(self):
        return self._read_fmt(8, ">Q", "quad")

class ISSetupStreamReader(BinaryReader):
    def read_iss_header(self):
        magic = self.read(14)
        assert(magic == b'ISSetupStream\x00')
        num_files = self.read_u16_le()
        _ = self.read_u32_le()
        _ = self.read(8)
        _ = self.read_u16_le()
        _ = self.read(16)
        return (num_files,)

    def read_file_header(self):
        name_len = self.read_u32_le()
        enc_flags = self.read_u32_le()
        _ = self.read(2)
        file_len = self.read_u32_le()
        _ = self.read(8)
        is_unicode = self.read_u16_le()
        time1 = self.read_u64_le()
        time2 = self.read_u64_le()
        time3 = self.read_u64_le()
        file_name = self.read(name_len).decode("utf-16le")
        return (file_name, file_len, enc_flags, is_unicode, time1, time2, time3)

    def read_file(self):
        (file_name, file_len, enc_flags, is_unicode, time1, time2, time3) = self.read_file_header()
        print("file %r" % file_name)
        file_data = self.read(file_len)

        def gen_key(seed):
            magic = [0x13, 0x35, 0x86, 0x07]
            return bytes([seed[i] ^ magic[i % len(magic)] for i in range(len(seed))])

        def decode_byte(b, k):
            return (~(k ^ (b << 4 | b >> 4))) & 0xFF

        def decode_chunk(buf, key):
            return bytes([decode_byte(buf[i], key[i % len(key)]) for i in range(len(buf))])

        seed = file_name.encode("utf-8")
        key = gen_key(seed)

        is_type_4 = bool(enc_flags & 4)
        if is_type_4:
            # Decode in chunks of 1024, i.e. restarting at key[0] every time
            # Just round the key to exactly 1024 bytes and it'll work automatically
            key += key * (1024 // len(key))
            key = key[:1024]
            data = decode_chunk(file_data, key)
        else:
            data = decode_chunk(file_data, key)

        if is_unicode:
            assert(data[0:2] == b'\x78\x9c')
            data = zlib.decompress(data)

        return (file_name, data)

    def extract_all(self, dir="."):
        (num_files,) = self.read_iss_header()
        for i in range(num_files):
            (file_name, file_data) = self.read_file()
            file_name = file_name.replace("/", "\x01")
            with open(os.path.join(dir, file_name), "wb") as fh:
                fh.write(file_data)

in_file = sys.argv[1]
out_dir = sys.argv[2]

with open(in_file, "rb") as fh:
    ISSetupStreamReader(fh).extract_all(out_dir)
