#!/usr/bin/env python

# Flag analysis logic inspired by dartraiden/NVIDIA-patcher

import re, sys

blackdict = { 0x15c2 : 'GP100 [CMP 100-100]' ,
              0x1b07 : 'GP102 [P102-100]'    ,
              0x1b87 : 'GP104 [P104-100]'    ,
              0x1bc7 : 'GP104 [P104-101]'    ,
              0x1c07 : 'GP106 [P106-100]'    ,
              0x1c09 : 'GP106 [P106-090]'    ,
              0x1d83 : 'GV100 [CMP 100-200]' ,
              0x1d84 : 'GV100 [CMP 100-210]' ,
              0x1dc1 : 'GV100 [CMP 100-200]' ,
              0x1e09 : 'TU102 [CMP 50HX]'    ,
              0x1e49 : 'unknown'             ,
              0x1ebc : 'unknown'             ,
              0x1efc : 'unknown'             ,
              0x1f0b : 'TU106 [CMP 40HX]'    ,
              0x2081 : 'GA100'               ,
              0x2082 : 'GA100 [CMP 170HX]'   ,
              0x2083 : 'unknown'             ,
              0x20c2 : 'GA100 [CMP 170HX]'   ,
              0x2189 : 'TU116 [CMP 30HX]'    ,
              0x220d : 'GA102 [CMP 90HX]'    ,
              0x224d : 'unknown'             ,
              0x248a : 'GA104 [CMP 70HX]'    ,
              0x24ca : 'unknown'             ,
              0x250a : 'unknown'             , }

pattern_sandbag_v1 = re.compile( b'(?:%s)+(%s)+(?:%s)+' % (

    b'.[^\x00]\x00{10}\x07\x00{3}'

,   b'|'.join( map( lambda x : x.to_bytes( 2, 'little' ) + b'\x00{10}\x07\x00{3}', blackdict.keys() ) )

,   b'.[^\x00]\x00{10}\x07\x00{3}' ) )

pattern_sandbag_v2 = re.compile( b'(?:%s)+(%s)+(?:%s)+' % (

    b'.[^\x00]\x07\x00'

,   b'|'.join( map( lambda x : x.to_bytes( 2, 'little' ) + b'\x07\x00', blackdict.keys() ) )

,   b'.[^\x00]\x07\x00' ) )

def scan_and_patch( pattern, pattern_name, flag_width, binary ) :

    modified = None

    for match in pattern.finditer( binary ) :

        print( pattern_name, 'start:%08X' % match.start()
                           ,   'end:%08X' % match.end()
                           ,   'len:%d\n' % ( match.end() - match.start() ) )

        for i in range( match.start(), match.end(), flag_width ) :

            dev_id = int.from_bytes( binary[ i : i + 2 ], 'little' )

            print( 'pos:%08X dev:%04X' % ( i, dev_id ), blackdict.get( dev_id ) )

        if input( '\nPatch these ? ( Y / N ) : ' ).upper() != 'Y' : continue

        for i in range( match.start(), match.end(), flag_width ) :

            binary[ i ] = binary[ i + 1 ] = 0xff

        modified = True

    return modified

if __name__ == '__main__' :

    nv_filename = sys.argv[1]

    nv_binary = bytearray( open( nv_filename, 'rb' ).read() )

    if scan_and_patch( pattern_sandbag_v1, 'sandbag_v1', 16, nv_binary ) :

        with open( nv_filename, 'wb' ) as f : f.write( nv_binary )

    if scan_and_patch( pattern_sandbag_v2, 'sandbag_v2',  4, nv_binary ) :

        with open( nv_filename, 'wb' ) as f : f.write( nv_binary )
