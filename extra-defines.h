// Extracted from
// https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2165538.html
/*
 * GPU paravirtualization global DXGK channel
 * {DDE9CBC0-5060-4436-9448-EA1254A5D177}
 */
#define HV_GPUP_DXGK_GLOBAL_GUID                                               \
  .guid = GUID_INIT(0xdde9cbc0, 0x5060, 0x4436, 0x94, 0x48, 0xea, 0x12, 0x54,  \
                    0xa5, 0xd1, 0x77)

/*
 * GPU paravirtualization per virtual GPU DXGK channel
 * {6E382D18-3336-4F4B-ACC4-2B7703D4DF4A}
 */
#define HV_GPUP_DXGK_VGPU_GUID                                                 \
  .guid = GUID_INIT(0x6e382d18, 0x3336, 0x4f4b, 0xac, 0xc4, 0x2b, 0x77, 0x3,   \
                    0xd4, 0xdf, 0x4a)
