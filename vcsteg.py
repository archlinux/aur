#!/usr/bin/env python2
"""
vcsteg2 -- VeraCrypt real steganography tool
version 2.0 (2012-02-18)
by Vladimir Ivanov <vladimirivanov815@gmail.com>
and Martin J. Fiedler <martin.fiedler@gmx.net>

see: http://keyj.emphy.de/real-steganography-with-truecrypt

This software is published under the terms of KeyJ's Research License,
version 0.2. Usage of this software is subject to the following conditions:
0. There's no warranty whatsoever. The author(s) of this software can not
   be held liable for any damages that occur when using this software.
1. This software may be used freely for both non-commercial and commercial
   purposes.
2. This software may be redistributed freely as long as no fees are charged
   for the distribution and this license information is included.
3. This software may be modified freely except for this license information,
   which must not be changed in any way.
4. If anything other than configuration, indentation or comments have been
   altered in the code, the original author(s) must receive a copy of the
   modified code.

Version history
===============

2.0 (Vladimir Ivanov, speed optimizations by Martin Fiedler)
- now supports files over 4 GiB
- erases duplicate encoder signature
- auto-renames VeraCrypt container
- supports 3gp videos
- function allowing post-embed password change

1.0 (Martin Fiedler)
- initial release
"""
import sys, os, struct

MAX_BUFFER_SIZE = 67108864   # 64 MiB
TC_HEADER_SIZE = 65536       # 64 KiB
MAX_INT32 = 4294967295
MAX_INT64 = 18446744073709551615L

class ProcessingError(RuntimeError):
    pass

################################################################################

class Atom(object):
    def __init__(self, f_src, name, start, header_size, size, mother):
        self.f_src = f_src
        self.name = name
        self.start = start
        self.size = size
        self.header_size = header_size
        self.mother = mother
        self.childs = []
        self.contents = None

    def setBodySize(self, bodySize):    
        oldBodySize = self.size - self.header_size
        bodyDiff = bodySize - oldBodySize
        hDiff = 0       
        if bodySize <= MAX_INT32:
            if self.header_size != 8:
                self.header_size = 8
                hDiff = -8
        else:
            if self.header_size != 16:
                self.header_size = 16
                hDiff = 8
        self.size = self.header_size + bodySize
        if self.mother:
            oldParentBodySize = self.mother.size - self.mother.header_size
            self.mother.setBodySize(oldParentBodySize + hDiff + bodyDiff)
    def writeHeader(self, f_dest):
        if self.size >= MAX_INT32 and self.header_size == 8:
            raise ProcessingError("Atom size too large for compact header")     
        # compact
        if self.size <= MAX_INT32 and self.header_size == 8:
            f_dest.write(struct.pack(">I4s", self.size, self.name))
        # extended
        else:
            f_dest.write(struct.pack(">I4sQ", 1, self.name, self.size))
        return self.size - self.header_size

    def writePayload(self, f_dest):
        if self.childs:
            for atom in self.childs:
                atom.write(f_dest)
        else:
            dataBuffer = None
            bodySize = self.size - self.header_size
            if self.f_src:
                self.f_src.seek(self.start + self.header_size)
                percent_i = 0
                percent_f = 0.0
                if bodySize > MAX_BUFFER_SIZE:
                    percent_incr = 100.0 * MAX_BUFFER_SIZE / bodySize
                else:
                    percent_incr = 0.0
                while bodySize > 0:
                    if bodySize > MAX_BUFFER_SIZE:
                        dataBuffer = self.f_src.read(MAX_BUFFER_SIZE)
                    else:
                        dataBuffer = self.f_src.read(bodySize)
                    f_dest.write(dataBuffer)
                    bodySize -= MAX_BUFFER_SIZE
                    percent_f += percent_incr
                    percent_i_new = min(100, int(percent_f))
                    if percent_i_new > percent_i:
                        percent_i = percent_i_new
                        sys.stderr.write("%3d%% done\r" % percent_i)
                        sys.stderr.flush()
            elif self.contents:
                if bodySize == len(self.contents):
                    f_dest.write(self.contents)
                else:
                    raise ProcessingError("Atom content size does not equal body size")
            else:
                if bodySize > 0:
                    f_dest.seek(bodySize - 1, 1)
                    byte = f_dest.read(1)
                    if not byte:
                        f_dest.write("\0")
                    else:
                        f_dest.seek(-1, 1)
                        f_dest.write(byte)

    def write(self, f_dest):
        self.writeHeader(f_dest)
        self.writePayload(f_dest)

################################################################################

def AnalyseFile(f):
    atoms = None
    try:
        atoms = parseAtoms(f, 0, os.fstat(f.fileno()).st_size, None)
    except Exception, e:
        raise ProcessingError("Parse Error: " + str(e))
    return atoms

def parseAtoms(f, start, end, mother):
    offset = start
    atomSize = None
    atomHeaderSize = None
    comrades = []
    try:
        while offset < end:
            f.seek(offset)      
            atomSize = struct.unpack(">I", f.read(4))[0]
            atomType = struct.unpack(">4s", f.read(4))[0]
            if atomSize == 1:
                atomSize = struct.unpack(">Q", f.read(8))[0]
                atomHeaderSize = 16 # Extended
            else:
                atomHeaderSize = 8  # Compact
                if atomSize == 0:
                    atomSize = end - offset
            if start + atomSize > end:
                raise ProcessingError("Invalid size for atom '" + atomType + "' @ " + hex(offset))
            atom = Atom(f, atomType, offset, atomHeaderSize, atomSize, mother)
            if mother:
                mother.childs.append(atom)
            comrades.append(atom)
            if atomType in ["moov","trak","mdia","minf","stbl"]:
                atom.childs = parseAtoms(f, offset + atomHeaderSize, offset + atomSize, atom)
            offset = offset + atomSize
    except struct.error, e:
        raise ProcessingError("Atom header must be multiples 4 or 8 near " + hex(offset))
    except Exception, e:
        raise ProcessingError(str(e))
    return comrades

def findAtom(atoms, name):
    aList = []
    for a in atoms:
        if a.name == name:
            aList.append(a)
        aList = aList + findAtom(a.childs, name)
    return aList

def printAtoms(atoms, l=0):
    for a in atoms:
        print "%s %s %ld @ 0x%lx" % ("   "*l, a.name, a.size, a.start)
        printAtoms(a.childs,l+1)

def adjustSampleOffsets(atoms, offset):
    sampleAtoms = findAtom(atoms, "stco") + findAtom(atoms, "co64")
    if len(sampleAtoms) == 0:
        raise ProcessingError("Could not find any 'stco' or 'co64' atoms")
    for sAtom in sampleAtoms:
        sAtom.f_src.seek(sAtom.start + sAtom.header_size)
        verFlags, count = struct.unpack(">II", sAtom.f_src.read(8))
        if sAtom.name == "stco":
            sampleOffsets = struct.unpack('>' + 'I' * count, sAtom.f_src.read(count * 4))
        elif sAtom.name == "co64":
            sampleOffsets = struct.unpack('>' + 'Q' * count, sAtom.f_src.read(count * 8))
        sampleOffsets = [x + offset for x in sampleOffsets]
        # Does the atom need to support 64-bit values?
        if max(sampleOffsets) > MAX_INT32 and sAtom.name == "stco":
            sAtom.name = "co64"
        sAtom.contents = struct.pack(">II", verFlags, count)
        if sAtom.name == "stco":
            sAtom.contents += struct.pack('>' + 'I' * count, *sampleOffsets)
        elif sAtom.name == "co64":
            sAtom.contents += struct.pack('>' + 'Q' * count, *sampleOffsets)
        if (sAtom.size - sAtom.header_size) != len(sAtom.contents):
            sAtom.setBodySize(len(sAtom.contents))      
        sAtom.f_src = None
    return min(sampleOffsets)

def TCSteg_Embed(atoms, tcFile):
    ftyp = findAtom(atoms, "ftyp")
    mdat = findAtom(atoms, "mdat")
    moov = findAtom(atoms, "moov")
    if len(ftyp) != 1 or len(mdat) != 1 or len(moov) != 1:
        printAtoms(atoms)
        raise ProcessingError("One of each type required to embed: ['ftyp','mdat','moov']\nWe do not support this.")
    ftyp = ftyp[0]
    mdat = mdat[0]
    moov = moov[0]
    tcFileSize = os.fstat(tcFile.fileno()).st_size
    tcPreservedSize = tcFileSize - (TC_HEADER_SIZE * 3)
    tcStartHeaderVolBackup = tcFileSize - (TC_HEADER_SIZE * 2)
    mdatRealBodySize = mdat.size - mdat.header_size
    mdatEndMarker = tcFileSize - (TC_HEADER_SIZE * 2) + (mdatRealBodySize)
    mdatNewSize = mdatEndMarker - ftyp.size
    tcFile.seek(0)
    if ftyp.size + 16 > TC_HEADER_SIZE:
        raise ProcessingError("'ftyp' atom + 'mdat' headers too long")
    ftyp.write(tcFile)
    tempH = mdat.header_size
    tempL = mdat.size
    if mdatNewSize <= MAX_INT32:
        Atom(None, "free", None, 8, 8, None).write(tcFile)
        mdatNewSize = mdatNewSize - 8
        mdat.size = mdatNewSize
        mdat.header_size = 8
        mdat.writeHeader(tcFile)
    else:
        mdat.size = mdatNewSize
        mdat.header_size = 16
        mdat.writeHeader(tcFile)
    mdat.header_size = tempH
    mdat.size = tempL

    # re-generate first 64 KiB
    voidRegionSize = TC_HEADER_SIZE - tcFile.tell()
    mdat.f_src.seek(mdat.start + mdat.header_size)
    tcFile.write(mdat.f_src.read(voidRegionSize)) 
    
    # start header volume backups. Last 128 KiB of tc_file
    tcFile.seek(tcStartHeaderVolBackup)

    # Mark the position of the real mdat sample start
    mdatOffset = tcFile.tell() - (mdat.start + mdat.header_size)
    mdat.writePayload(tcFile)
    if tcFile.tell() != mdatEndMarker:
        raise ProcessingError("Wrote more mdat than we should have")

    # fix mdat shift by offsetting to each sample chunk
    print "Fixing up hybrid file ..."
    firstSample = adjustSampleOffsets(atoms, mdatOffset)

    # Destory duplicate encoder signature before first sample.
    tcFile.seek(tcStartHeaderVolBackup)
    tcFile.write(os.urandom(min(firstSample - tcStartHeaderVolBackup, TC_HEADER_SIZE)))
    tcFile.seek(mdatEndMarker) 
    moov.write(tcFile)
    
def Pass_Helper(video_path):
    f = None
    try:
        f = open(video_path, "rb+")
        last = AnalyseFile(f)[-1]
        if last.name == "skip":
            print "Removing padding 'skip' atom"
            f.truncate(last.start)
            print "Removal completed successfully"
        else:
            print "Preparing hybrid file for password change ... "
            f.seek(0, 2)
            Atom(None, "skip", None, 8, 8 + TC_HEADER_SIZE * 2, None).write(f)
            print "Complete.  Now change the VeraCrypt password"
    except IndexError:
        pass
    except IOError:
        print >>sys.stderr, "Error opening file '"+video_path+"'"
    except Exception, e:
        print >>sys.stderr, str(e)
    if f:
        f.close()

################################################################################

if __name__ == "__main__":
    supported_formats = ["mov","qt","mp4","m4v","m4a","3gp"]
    if len(sys.argv) < 3:
        pname = sys.argv[0].split(os.sep)[-1]
        print "too few arguments"
        print "Usage (1):", pname, "<MP4 Video> <VeraCrypt Container>"
        print "Embeds a file into a VeraCrypt container so that both are still readable."
        print
        print "<MP4 Video> is a file in one of the following formats:"
        print "   QuickTime / ISO MPEG-4  (%s)" % (", ".join(["*." + fmt for fmt in supported_formats]))
        print
        print "<VeraCrypt Container> is a VeraCrypt hidden volume. The file will be"
        print "modified in-place so that it seems like a copy of the input file that can be"
        print "opened in an appropriate viewer/player. However, the hidden VeraCrypt volume"
        print "will also be preserved and can be used."
        print
        print
        print "Usage (2):", pname, "-p <Hybrid File>"
        print "<Hybrid File> is a file that is both VeraCrypt container and a video."
        print "This file will be modified in-place to make it possible to change the VeraCrypt"
        print "password. After changing the password, this command should be run again to"
        print "remove that (detectable and hence insecure) modification!"
        print
        print
        sys.exit(2)

    if sys.argv[1] == "-p":
        Pass_Helper(sys.argv[2])
        sys.exit(0) 
    video_path = sys.argv[1]
    tc_path = sys.argv[2]
    video_file = None
    tc_file = None
    tcSize = 0
    try:
        video_file = open(video_path, "rb")
    except IOError, e:
        print >>sys.stderr, "Error opening file '"+video_path+"'"
        sys.exit(1)
    try:
        tc_file = open(tc_path, "rb+")
        tcSize = os.path.getsize(tc_path)
    except IOError, e:
        print >>sys.stderr, "Error opening file '"+tc_path+"'"
        sys.exit(1)
    try:
        video_ext = os.path.splitext(video_path)[1].lstrip(".")
        if video_ext in supported_formats:  
            print "Parsing video ..."
            atoms = AnalyseFile(video_file)
            print "Embedding ... be patient"
            TCSteg_Embed(atoms, tc_file)
            tc_file.close()
            if not tc_path.endswith("." + video_ext):
                if not os.path.exists(tc_path + "." + video_ext):
                    new_tc_path = tc_path + "." + video_ext
                    os.rename(tc_path, new_tc_path)
                    tc_path = new_tc_path
            print "Hybrid file '%s' was created successfully." % tc_path
            print
            print "Everything OK. Try mounting the file in VeraCrypt and playing the video."
        else:
            print >>sys.stderr, "Error: input video format is not supported"
    except (ProcessingError, IOError), e:
        print >>sys.stderr, "ERROR:", e
        tc_file.truncate(tcSize)
    finally:
        video_file.close()
        tc_file.close()


