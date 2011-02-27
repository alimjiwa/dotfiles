import atexit
import os
import readline
import rlcompleter

def complete(self, text, state):
    """return the next possible completion for text, using the current frame's
       local namespace

       This is called successively with state == 0, 1, 2, ... until it
       returns None.  The completion should begin with 'text'.
    """
    # keep a completer class, and make sure that it uses the current local scope 
    if not hasattr(self, 'completer'):
        self.completer = rlcompleter.Completer(self.curframe.f_locals)
    else:
        self.completer.namespace = self.curframe.f_locals
    return self.completer.complete(text, state)

# Save and load history file
try:
    historyPath = os.path.expanduser("~/.pdbhist")

    def save_history(historyPath=historyPath):
        import readline
        readline.write_history_file(historyPath)

    if os.path.exists(historyPath):
        readline.read_history_file(historyPath)
    atexit.register(save_history)
except:
    pass

