# DESCRIPTION
# overwrites ~/palettesRootDir.txt with the absolute path to the /palettes directory of this repository. (Creates that file if it does not exist, and overwrites it if it does exist.) The path in that file is read by and used by various scripts in the _ebDev if not other repositories.

# USAGE
# From the directory with this script, run it locally:
#    ./createPalettesRootDirTXT.sh
# Or you may also run this script by letting the system locate and run it if it is in you PATH:
#    createPalettesRootDirTXT.sh


# CODE
# for calling this script from anywhere if it is in the PATH; get full path to script minus file name:
# instead of $0 (formerly used), use the following to get the path to this script, which will work for my purposes whether I call this script with ./ or if it's in my path and I call it just by script name; re: https://stackoverflow.com/a/179231 :

palettesRepoBasePath=$(dirname $(readlink -f $0))
printf "$palettesRepoBasePath"/palettes > ~/palettesRootDir.txt


