#removedirtvs.py

import vapoursynth as vs

def RemoveDirt(input, repmode=16):
    core = vs.get_core()
    cleansed = core.rgvs.Clense(input)
    sbegin = core.rgvs.ForwardClense(input)
    send = core.rgvs.BackwardClense(input)
    scenechange = core.rdvs.SCSelect(input, sbegin, send, cleansed)
    alt = core.rgvs.Repair(scenechange, input, mode=[repmode,repmode,1])
    restore = core.rgvs.Repair(cleansed, input, mode=[repmode,repmode,1])
    corrected = core.rdvs.RestoreMotionBlocks(cleansed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, noise=10, noisy=12, grey=0)
    return core.rgvs.RemoveGrain(corrected, mode=[17,17,1])