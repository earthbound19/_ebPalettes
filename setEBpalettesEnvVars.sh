# DESCRIPTION
# For usage with `printContentsOfRandomPalette_GitHubAPI.sh` (in _ebDev repository). Replaces or writes a user environment variable `EBPALETTES_PLT_DIR_SHA_TREE` in `~/.bashrc`, which variable has a value that is the SHA_TREE hash of the `/palettes` subdirectory, for use in retrieving palette file names and contents via the GitHub API (e.g. via `printContentsOfRandomPalette_GitHubAPI.sh`)

# USAGE
# Run from the same directory this script is in as locally invoked (via ./ and not by finding it in any PATH), without any parameters:
#    ./setEBpalettesEnvVars.sh
# The reason for that recommendation to invoke it with ./ is that if you don't and you have this folder set up as a junction on Windows, it writes the absolute junction path, which in my setup can cause access/permission problems; but if you call this with ./ it uses the junction source path, not destination, with no access problems.

# CODE
# BEGIN SET / UPDATE EBPALETTES_PLT_DIR_SHA_TREE
FOUND_TREE_SHA=$(git rev-parse master:palettes)
if [ "$EBPALETTES_PLT_DIR_SHA_TREE" == "$FOUND_TREE_SHA" ]
then
	echo "Environment variable EBPALETTES_PLT_DIR_SHA_TREE already set with a value matching current output of command \`git rev-parse master:palettes\`:"
	echo ""
	echo "$FOUND_TREE_SHA"
	echo ""
	echo "No need to set variable. If this is an error, perhaps exit and re-enter the terminal and try again (in case that variable was somehow set other than by ~/.bashrc). Skip."
else
	cat ~/.bashrc | grep "export EBPALETTES_PLT_DIR_SHA_TREE=" &>/dev/null
	if [ $? == 0 ]
	then
		# In the case that it was found, update it (which will happen even if it's the same) :
		sed -i "s/^export EBPALETTES_PLT_DIR_SHA_TREE.*/export EBPALETTES_PLT_DIR_SHA_TREE=$FOUND_TREE_SHA/g" ~/.bashrc
		echo ""
		echo "UPDATED the ~/.bashrc file with:"
		echo "export EBPALETTES_PLT_DIR_SHA_TREE=$FOUND_TREE_SHA"
	else
		# In the case that it was not found, create it:
		printf "\n\nexport EBPALETTES_PLT_DIR_SHA_TREE=$FOUND_TREE_SHA" >> ~/.bashrc
		echo ""
		echo "WROTE the following to the ~/.bashrc file:"
		printf "export EBPALETTES_PLT_DIR_SHA_TREE=$FOUND_TREE_SHA\n"
	fi
fi
# END SET / UPDATE EBPALETTES_PLT_DIR_SHA_TREE

# BEGIN SET / UPDATE EB_PALETTES_ROOT_DIR
# for finding this path from anywhere if it is in the PATH; get full path to script minus file name:
# instead of $0 (formerly used), use the following to get the path, which will work for my purposes whether I call this script with ./ or if it's in my path and I call it just by script name; re: https://stackoverflow.com/a/179231 ;
# HOWEVER, with junction links in my setup that can lead to problems if I don't call this script with ./setBASHRC_palettesTreeHash.sh ; I don't know a workaround for that!
FOUND_EB_PALETTES_ROOT_DIR=$(dirname $(readlink -f $0))
FOUND_EB_PALETTES_ROOT_DIR="$FOUND_EB_PALETTES_ROOT_DIR"/palettes
if [ "$FOUND_EB_PALETTES_ROOT_DIR" == "$EB_PALETTES_ROOT_DIR" ]
then
	echo ""
	echo ""
	echo "Environment variable FOUND_EB_PALETTES_ROOT_DIR already set with a current value:"
	echo ""
	echo "$FOUND_EB_PALETTES_ROOT_DIR"
	echo ""
	echo "No need to set variable. If this is an error, perhaps exit and re-enter the terminal and try again (in case that variable was somehow set other than by ~/.bashrc). Skip."
else
	cat ~/.bashrc | grep "export EB_PALETTES_ROOT_DIR=" &>/dev/null
	if [ $? == 0 ]
	then
		# In the case that it was found, update it (which will happen even if it's the same) :
		# this is so rong; escape forward slashes in the path with backslashes, via bash string search/replace;	re https://stackoverflow.com/a/27369375 -- else sed thinks they are command segment separator thingies:
		ESC_FOUND_EB_PALETTES_ROOT_DIR=${FOUND_EB_PALETTES_ROOT_DIR//\//\\\/}
		sed -i "s/^export EB_PALETTES_ROOT_DIR.*/export EB_PALETTES_ROOT_DIR=$ESC_FOUND_EB_PALETTES_ROOT_DIR/g" ~/.bashrc
		echo ""
		echo "UPDATED the ~/.bashrc file with:"
		echo "export EB_PALETTES_ROOT_DIR=$FOUND_EB_PALETTES_ROOT_DIR"
	else
		# In the case that it was not found, create it:
		printf "\n\nexport EB_PALETTES_ROOT_DIR=$FOUND_EB_PALETTES_ROOT_DIR" >> ~/.bashrc
		echo ""
		echo "WROTE the following to the ~/.bashrc file:"
		printf "export EB_PALETTES_ROOT_DIR=$FOUND_EB_PALETTES_ROOT_DIR\n"
	fi
fi
# END SET / UPDATE EB_PALETTES_ROOT_DIR

echo
echo "Done checking and/or writing and/or updating environment variables in ~/.bashrc :"
echo "    EBPALETTES_PLT_DIR_SHA_TREE"
echo "    EB_PALETTES_ROOT_DIR"
echo "If they were updated or changed, restart your terminal with:"
echo "    source ~/.bashrc"
echo "--for the change to take effect."