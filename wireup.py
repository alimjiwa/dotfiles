#!/usr/bin/env python
#
# This hook is invoked when a git checkout is run after having updated the
# worktree. The hook is given three parameters: the ref of the previous HEAD, the
# ref of the new HEAD (which may or may not have changed), and a flag indicating
# whether the checkout was a branch checkout (changing branches, flag=1) or a
# file checkout (retrieving a file from the index, flag=0). This hook cannot
# affect the outcome of git checkout.

# It is also run after git clone, unless the --no-checkout (-n) option is used.
# The first parameter given to the hook is the null-ref, the second the ref of
# the new HEAD and the flag is always 1.

# This hook can be used to perform repository validity checks, auto-display
# differences from the previous HEAD if different, or set working dir metadata
# properties.
from __future__ import print_function
from glob import glob
from os.path import join, abspath, dirname, basename, expanduser
from os import system
from sys import stderr

repo = dirname(__file__)

linkable = [abspath(filename) for filename in glob(join(repo, '*'))
            if basename(filename) not in ('wireup', 'gitignore')]

for filename in linkable:
    link = expanduser(join('~', '.' + basename(filename)))
    print('creating link from %s to %s' % (link, filename), file=stderr)
    try:
        proceed = raw_input('Press any key to confirm, or type "n" to skip.\n')
        if proceed in ('n', 'N'):
            print('skipping')
            continue
    except:
        break

    system('ln -sf %(filename)s %(link)s' % locals())

    


