from os.path import expanduser

import shutil

files = [expanduser("~/.i3/config"), expanduser("~/.config/ranger/rc.conf")]
destination = expanduser("~/Config")

for file in files:
    print("Copying file: " + file)
    shutil.copy2(file, destination)
