#!/usr/bin/env python
#
# Installs vim plugins and connects all dotfiles to their version-controlled
# counterparts with symlinks.
#
from __future__ import print_function
from glob import glob
from os.path import join, abspath, dirname, basename, expanduser
from os import system, chdir
from sys import stderr

repo = dirname(__file__)
chdir(repo)

linkable = [abspath(filename) for filename in glob(join(repo, '*'))
            if basename(filename) not in ('wireup', 'gitignore')]

# Install Vundle and plugins
system('git submodule update --init')
system('vim -c "echo \'Installing bundles...\'" -c "BundleInstall" -c "quit"')
    
# Link dotfiles in ~ to filenames in this folder
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



