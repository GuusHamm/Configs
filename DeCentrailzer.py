from os.path import expanduser

import shutil

ConfigFolder = "~/Config"

# These files and destiantions should be in the same order else things will go bad
Files = [expanduser(ConfigFolder+"/config"),expanduser(ConfigFolder+"/rc.conf")]
Destinations = [expanduser("~/.i3/config"), expanduser("~/.config/ranger/rc.conf")]

for i in range(0,Files.__len__()):
    print("Copying " + Files[i] + " to " + Destinations[i])
    shutil.copy2(Files[i], Destinations[0])
