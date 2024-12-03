class IUnitySupport(object):
    """ bypass unity support """
    def __init__(self, parent): pass
    def set_progress(self, progress): pass
    def show_progress(self, show=True): pass

UnitySupport = IUnitySupport
