import anki.sync, anki.hooks, aqt

addr = "http://0.0.0.0:27701/" # put your server address here
anki.sync.SYNC_BASE = "%s" + addr
def resetHostNum():
        aqt.mw.pm.profile['hostNum'] = None
        anki.hooks.addHook("profileLoaded", resetHostNum)
