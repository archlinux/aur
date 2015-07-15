import sys
import os
import struct
import itertools
import array

# class PKStream is based on information from Ben Rudiak-Gould:
#   http://groups.google.com/group/comp.compression/msg/48ea9de6d71a575b
# and implementation of Douglas Kane:
#   http://groups.google.com/group/comp.compression/msg/aa014556d706c525
# Archive extraction code was highly influenced by Gavin Claytons
# Daggerfall Jukebox:
#   http://www.dfworkshop.net/?page_id=61


def file_bytestream(f):
    while True:
        temp = f.read(1)
        if not temp:
            raise StopIteration
        yield struct.unpack('B', temp)[0]


class PKStream(object):
    def __init__(self, source):
        if hasattr(source, "read"):
            self.bytestream = file_bytestream(source)
        elif hasattr(source, "next"):
            self.bytestream = source
        elif hasattr(source, "__iter__"):
            self.bytestream = source.__iter__()
        else:
            raise TypeError("Expected file or iterable object, got %s" %
                            type(source))
        self.bits_read = 0
        self.prefixed_literals = self.read(8)
        assert(self.prefixed_literals == 0 or self.prefixed_literals == 1)
        self.dict_bytes = self.read(8)
        assert(self.dict_bytes == 4 or
               self.dict_bytes == 5 or self.dict_bytes == 6)
        self.dict_size = 2**(self.dict_bytes + 6)
        self.dictionary = array.array('B', itertools.repeat(0, self.dict_size))
        self.current_key = 0

    def read_byte(self):
        self.bits_read = 8
        self.last_byte = next(self.bytestream)

    def read(self, n):
        if self.bits_read == 0:
            self.read_byte()
        if n <= self.bits_read:
            temp = (self.last_byte >> (8-self.bits_read)) & (0xff >> (8-n))
            self.bits_read -= n
            return temp
        else:
            shift = 8-self.bits_read
            res = [self.last_byte >> shift]
            n -= self.bits_read
            self.read_byte()
            while n > 8:
                res[-1] = res[-1] | ((self.last_byte << (8-shift)) & 0xff)
                res.append(self.last_byte >> shift)
                self.read_byte()
                n -= 8
            self.bits_read = (8-n)
            if n > shift:
                res[-1] = res[-1] | ((self.last_byte << (8-shift)) & 0xff)
                res.append((self.last_byte >> shift) & (0xff >> (8-n+shift)))
            else:
                res[-1] = res[-1] | (self.last_byte <<
                                     (8-shift)) & (0xff >> (shift-n))
            temp = 0
            for i, v in enumerate(res):
                temp += v << (i*8)
            return temp

    def read_rev(self, bits):
        value = self.read(bits)
        temp = 0
        for i in range(bits):
            temp = temp << 1
            temp = temp | value & 0x0001
            value = value >> 1
        return temp

    def decode_literal(self):
        if self.prefixed_literals:
            temp = self.read_rev(4)
            if temp == 0xf:  # 1111
                return 0x20
            if temp == 0xe:  # 1110
                if self.read(1):  # 11101
                    return 0x45
                # 11100
                return 0x61
            if temp == 0xd:  # 1101
                if self.read(1):  # 11011
                    return 0x65
                # 11010
                return 0x69
            if temp == 0xc:  # 1100
                if self.read(1):  # 11001
                    return 0x6c
                # 11000
                return 0x6e
            if temp == 0xb:  # 1011
                if self.read(1):  # 10111
                    return 0x6f
                # 10110
                return 0x72
            if temp == 0xa:  # 1010x
                return 0x74-self.read(1)
            if temp == 0x9:  # 1001
                if self.read(1):  # 10011
                    return 0x75
                if self.read(1):  # 100101
                    return 0x2d
                # 100100
                return 0x31
            if temp == 0x8:  # 1000
                temp = self.read_rev(2)
                if temp == 0x3:  # 100011
                    return 0x41
                if temp == 0x2:  # 100010
                    return 0x43
                if temp == 0x1:  # 100001
                    return 0x44
                # 100000
                return 0x49
            if temp == 0x7:  # 0111
                temp = self.read_rev(2)
                if temp == 0x3:  # 011111
                    return 0x4c
                if temp == 0x2:  # 011110
                    return 0x4e
                if temp == 0x1:  # 011101
                    return 0x4f
                # 011100
                return 0x52
            if temp == 0x6:  # 0110
                if self.read(1):  # 01101x
                    return 0x54-self.read(1)
                # 01100x
                return 0x63-self.read(1)
            if temp == 0x5:  # 0101
                temp = self.read_rev(2)
                if temp == 0x3:  # 010111
                    return 0x64
                # 0101xx
                return 0x68-temp
            if temp == 0x4:  # 0100
                if self.read(1):  # 01001
                    if self.read(1):  # 010011
                        return 0x6d
                    # 010010
                    return 0x70
                # 01000
                if self.read(1):  # 010001
                    if self.read(1):  # 0100011
                        return 0x0a
                    # 0100010
                    return 0x0d
                # 010000x
                return 0x29-self.read(1)
            if temp == 0x3:  # 0011
                temp = self.read_rev(3)
                if temp == 0x7:  # 0011111
                    return 0x2c
                if temp == 0x6:  # 0011110
                    return 0x2e
                if temp == 0x5:  # 0011101
                    return 0x30
                if temp == 0x0:  # 0011000
                    return 0x37
                # 0011xxx
                return 0x36-temp
            if temp == 0x2:  # 0010
                temp = self.read_rev(3)
                if temp == 0x7:  # 0010111
                    return 0x38
                if temp == 0x6:  # 0010110
                    return 0x3d
                if temp == 0x5:  # 0010101
                    return 0x42
                if temp == 0x4:  # 0010100
                    return 0x46
                if temp == 0x3:  # 0010011
                    return 0x4d
                if temp == 0x2:  # 0010010
                    return 0x50
                if temp == 0x1:  # 0010001
                    return 0x55
                # 0010000
                return 0x6b
            if temp == 0x1:  # 0001
                temp = self.read_rev(3)
                if temp == 0x7:  # 0001111
                    return 0x77
                if temp == 0x6:  # 0001110
                    if self.read(1):  # 00011100
                        return 0x09
                    # 00011101
                    return 0x22
                if temp == 0x5:  # 0001101
                    if self.read(1):  # 00011011
                        return 0x27
                    # 00011010
                    return 0x2a
                if temp == 0x4:  # 0001100
                    if self.read(1):  # 00011001
                        return 0x2f
                    # 00011000
                    return 0x36
                if temp == 0x3:  # 0001011x
                    return 0x3a-self.read(1)
                if temp == 0x2:  # 0001010x
                    return 0x48-self.read(1)
                if temp == 0x1:  # 0001001
                    if self.read(1):  # 00010011
                        return 0x57
                    # 00010010
                    return 0x5b
                if self.read(1):  # 00010001
                    return 0x5f
                # 00010000
                return 0x76
            # 0000
            temp = self.read_rev(3)
            if temp == 0x7:  # 0000111x
                return 0x79-self.read(1)
            if temp == 0x6:  # 0000110
                temp = self.read_rev(2)
                if temp == 0x3:  # 000011011
                    return 0x2b
                if temp == 0x2:  # 000011010
                    return 0x3e
                if temp == 0x1:  # 000011001
                    return 0x4b
                # 000011000
                return 0x56
            if temp == 0x5:  # 0000101
                temp = self.read_rev(2)
                if temp == 0x3:  # 000010111
                    return 0x58
                if temp == 0x2:  # 000010110
                    return 0x59
                if temp == 0x1:  # 000010101
                    return 0x5d
                if self.read(1):  # 0000101001
                    return 0x21
                # 0000101000
                return 0x24
            if temp == 0x4:  # 0000100
                if self.read(1):  # 00001001
                    temp = self.read_rev(2)
                    if temp == 0x3:  # 0000100111
                        return 0x26
                    if temp == 0x2:  # 0000100110
                        return 0x71
                    if temp == 0x1:  # 0000100101
                        return 0x7a
                    if self.read(1):  # 00001001001
                        return 0x00
                    # 00001001000
                    return 0x3c
                temp = self.read_rev(3)
                if temp == 0x7:  # 00001000111
                    return 0x3f
                if temp == 0x6:  # 00001000110
                    return 0x4a
                if temp == 0x5:  # 00001000101
                    return 0x51
                if temp == 0x4:  # 00001000100
                    return 0x5a
                if temp == 0x3:  # 00001000011
                    return 0x5c
                if temp == 0x2:  # 00001000010
                    return 0x6a
                if temp == 0x1:  # 00001000001
                    return 0x7b
                # 00001000000
                return 0x7c
            if temp == 0x3:  # 0000011
                temp = self.read_rev(5)
                if temp >= 0x18:
                    return 0x20-temp
                if temp >= 0x16:
                    return 0x22-temp
                if temp >= 0x0a:
                    return 0x23-temp
                if temp >= 0x05:
                    return 0x24-temp
                if temp == 0x04:
                    return 0x23
                if temp == 0x03:
                    return 0x25
                if temp == 0x02:
                    return 0x3b
                if temp == 0x01:
                    return 0x40
                return 0x5e
            if temp == 0x2:  # 0000010
                temp = self.read_rev(5)
                if temp == 0x1f:
                    return 0x60
                if temp >= 0x1c:
                    return 0x9b-temp
                return 0xcb-temp
            if temp == 0x1:  # 0000001
                temp = self.read_rev(5)
                if temp >= 0x0c:
                    return 0xeb-temp
                if temp == 0x0b:
                    return 0xe1
                if temp == 0x0a:
                    return 0xe5
                if temp == 0x09:
                    return 0xe9
                if temp == 0x08:
                    return 0xee
                if temp >= 0x05:
                    return 0xf9-temp
                if temp == 0x04:
                    if self.read(1):
                        return 0x1a
                    return 0x80
                if temp == 0x03:
                    return 0x82-self.read(1)
                if temp == 0x02:
                    return 0x84-self.read(1)
                if temp == 0x01:
                    return 0x86-self.read(1)
                return 0x88-self.read(1)
            # 0000000
            temp = self.read_rev(6)
            if temp >= 0x19:
                return 0xc8-temp
            if temp == 0x18:
                return 0xe0
            if temp >= 0x15:
                return 0xf9-temp
            if temp >= 0x12:
                return 0xfa-temp
            if temp >= 0x0e:
                return 0xfb-temp
            if temp >= 0x0b:
                return 0xfc-temp
            return 0xff-temp
        return self.read(8)

    def decode_copy_length(self):
        temp = self.read_rev(2)
        if temp == 0x1:  # 01
            if self.read(1):  # 011
                return 5
            # 010
            if self.read(1):  # 0101
                return 6
            # 0100
            return 7
        if temp == 0x2:  # 10
            if self.read(1):  # 101
                return 2
            # 100
            return 4
        if temp == 0x3:  # 11
            return 3
        # 00
        if self.read(1):  # 001
            if self.read(1):  # 0011
                return 8
            # 0010
            if self.read(1):  # 00101
                return 9
            # 00100x
            return 10 + self.read(1)
        # 000
        if self.read(1):  # 0001
            if self.read(1):  # 00011xx
                return 12+self.read(2)
            # 00010xxx
            return 16+self.read(3)
        # 0000
        temp = self.read_rev(2)
        if temp == 0x3:  # 000011xxxx
            return 24+self.read(4)
        if temp == 0x2:  # 000010xxxxx
            return 40+self.read(5)
        if temp == 0x1:  # 000001xxxxxx
            return 72+self.read(6)
        # 000000
        if self.read(1):  # 0000001xxxxxxx
            return 136+self.read(7)
        # 0000000
        return 264+self.read(8)

    def calc_offset(self, high, low):
        return (high << low) | self.read(low)

    def decode_copy_offset(self, low):
        temp = self.read(2)
        if temp == 0x3:  # 11
            return self.calc_offset(0x00, low)
        if temp == 0x1:  # 10
            if self.read(1):  # 101
                if self.read(1):  # 1011
                    return self.calc_offset(0x01, low)
                # 1010
                return self.calc_offset(0x02, low)
            # 100
            return self.calc_offset(0x06-self.read_rev(2), low)
        if temp == 0x2:  # 01
            temp = self.read_rev(4)
            if temp:  # 01xxxx
                return self.calc_offset(0x16-temp, low)
            # 010000
            return self.calc_offset(0x17-self.read(1), low)
        # 00
        if self.read(1):
            return self.calc_offset(0x27-self.read_rev(4), low)
        # 000
        if self.read(1):
            return self.calc_offset(0x2f-self.read_rev(3), low)
        # 0000
        return self.calc_offset(0x3f-self.read_rev(4), low)

    def get_next_token(self):
        temp = self.read(1)
        if temp == 0:
            return (0, self.decode_literal(), 0, 0)
        length = self.decode_copy_length()
        if length == 519:  # end of stream
            return (-1, 0, 0, 0)
        if length == 2:
            low = 2
        else:
            low = self.dict_bytes
        return (1, 0, length, self.decode_copy_offset(low))

    def decode(self):
        tktype = 0
        apBuffer = array.array('B')
        while tktype >= 0:
            (tktype, literal, length, offset) = self.get_next_token()
            if tktype == 0:
                apBuffer.append(literal)
                self.dictionary[self.current_key] = literal
                self.current_key += 1
                if self.current_key == self.dict_size:
                    self.current_key = 0
            elif tktype == 1:
                start = (self.current_key-1-offset) % self.dict_size
                ind = start
                nexti = self.current_key
                copies = 0
                while copies < length:
                    copies += 1
                    apBuffer.append(self.dictionary[ind])
                    self.dictionary[nexti] = self.dictionary[ind]
                    nexti += 1
                    ind += 1
                    if ind == self.current_key:
                        ind = start
                    if ind == self.dict_size:
                        ind = 0
                    if nexti == self.dict_size:
                        nexti = 0
                self.current_key = nexti
        return apBuffer


def unpack_file(f, out, length):
    g = open(out, "wb")
    lenout = 0
    while lenout < length:
        f.seek(36, 1)
        stream = PKStream(f).decode()
        lenout += len(stream)
        print("%0d%%" % (lenout*100//length))
        stream.tofile(g)
    g.close()


def unpack_header(f, at, names, offset):
    f.seek(offset+at)
    length, = struct.unpack('I', f.read(4))
    to = names[struct.unpack('I', f.read(4))[0]]
    name = f.read(13).decode("ascii").strip('\x00')
    start, = struct.unpack('I', f.read(4))
    out = os.path.join(to, name)
    f.seek(offset+start)
    print("  (\"%s\", length: %d bytes)" % (out, length))
    unpack_file(f, out, length)
    print("File \"%s\" unpacked\n" % out)


def unpack_archive(archive, directory, offset=0):
    f = open(archive, "rb")
    f.seek(offset)
    start, end = struct.unpack('II', f.read(8))
    nfiles = (end-start)//25
    if not os.path.exists(directory):
        os.mkdir(directory)
    ndirs = 0  # can also be found due to zero at end of file (easier!)
    f.seek(offset+start+4)  # skip length, straight to dir number
    for i in range(nfiles):
        ndirs = max(ndirs, struct.unpack('I', f.read(4))[0])
        f.seek(21, 1)
    names = []
    f.seek(offset+end)
    for i in range(ndirs+1):
        name = f.read(60).decode("ascii")
        name = name.strip('\x00').replace("\\", os.path.sep)
        if name != ".":
            to = os.path.join(directory, name)
        else:
            to = directory
        if not os.path.exists(to):
            os.mkdir(to)
        names.append(to)
    print("Found %s files in archive %s at offset %s.\n" %
          (nfiles, archive, offset))
    for i in range(nfiles):
        print("Extracting file %s of %s:" % (i+1, nfiles))
        unpack_header(f, start+i*25, names, offset)
    f.close()


if __name__ == "__main__":
    if len(sys.argv) == 3:
        unpack_archive(*list(map(os.path.expandvars,
                                 list(map(os.path.expanduser, sys.argv[1:])))))
    elif len(sys.argv) == 4:
        unpack_archive(*list(map(os.path.expandvars,
                                 list(map(os.path.expanduser,
                                          sys.argv[1:3])))),
                       offset=int(sys.argv[3]))
    else:
        print("usage: python unpk.py <archive> <target directory> [offset]")
