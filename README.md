# _ebPalettes

Collection of palettes in `.hexplt` format.

# Markdown galleries

If you're viewing this someplace that renders Markdown from .md files you may navigate the folders to see palettes rendered like below, where the title header links to the source `.hexplt` file, and a click on the image links to the image file:

### [`palettes/EB_Favorites_v2`](palettes/EB_Favorites_v2.hexplt)

[ ![palettes/EB_Favorites_v2.png](palettes/EB_Favorites_v2.png) ](palettes/EB_Favorites_v2.png)

# Technical details

This repository has many .hexplt palette files and .png format renders of them, organized into folders by finalization status, project, etc.

## .hexplt spec

hexplt stands for "[sRGB] hex palette," which is a text file containing sRGB colors in six-digit hex format, with any other information, such as whitespace, layout comments, and other comments. sRGB colors are expressed in hex by a `#` pound symbol (indicating hex), followed by six hex digits. For example: `#003153`. For simplicity I'm going to refer to those as "color codes."

Because the only strict requirement for the .hexplt spec is that it contains color codes, they can be in any layout, such as one per line:

    #002147
    #003153
    #333366
    #32127a
    #79443b
    #a45a52

Or columns and rows:

    #002147 #003153
    #333366 #32127a
    #79443b #a45a52

Or scattered through a text file with other text in between that functions as comments:

    #002147 darker tweak of Prussian Blue #003153 Prussian Blue
        #333366 a grape-like purple
		#32127a a more vivid grape-like purple
    #79443b #a45a52 sandy reddish-browns

I invented this format, I think, but I wouldn't be surprised if others have done the same. It is for use in creative coding, for example in writing scripts or generative art that operates on or imports lists of colors.

In a .hexplt file, any text not in the format #HHHHHH (a pound symbol and six hex digits), anywhere on the same line as an sRGB hex color code or anywhere else, is functionally a comment, which scripts and programs that handle this format should ignore.

Some of my scripts in another repository (_ebDev) at this writing also read and write layout comments and rearrange color codes in a layout that matches the columns and rows, like this, from `Cherry_Plum_Tree_in_Bloom_Impression_04.hexplt`:

```
#fffbea #fff0c7 #ffe5be #ffcfaa #ffbfa1 #ffc7ca #ffb5ca #febfe6  columns: 8 rows: 6
#ffc5f9 #e1c4fb #ffd8f6 #f69ccc #ff8ac3 #ff87a8 #ff8596 #dd829d
#c37da6 #bf949f #a196bd #5e95ac #78b6ef #806c83 #775565 #655574
#5e3b33 #562949 #5b1336 #4c1524 #341028 #380218 #311f1f #2e2438
#14112d #393439 #691013 #862a1e #912c4d #a61631 #b21044 #a44053
#a3514f #a54e70 #db5352 #f04648 #f45237 #ff775f #ff7c44 #fe4375
```

If you look at that file at this writing, it actually mixes a comment with that columns and rows comment.

You can also have color codes in any layout and use a layout comment (or columns and rows descriptor), and a render script I have will honor the intended layout of the layout comment, whatever arrangment the color codes are in.

## Automation

Every time one or more palettes are added to the production (/palettes) subfolder in this repository, before they are added, committed and pushed to git, run the `palettesMarkdownGalleries.sh` script (detailed further below). This has the effect, technically in the git repository (how it works), of updating the SHA_TREE hash of the production palettes folder, which other scripts read to get a current production state of final palettes to select from:

### Environment variables for automated retrieval of random palette
The script `setEBpalettesEnvVars.sh` updates or sets export commands in ~/.bashrc which allow:
- retrieval of the contents and file name of any production palette from a local install of this repository (or, via scripting, any random selection from it)
- retrieval of the contents and file name of a random production palette from the GitHub repository via API call

See comments in that script for details.

Retrieval of a specific palette was previously first done with createPalettesRootDirTXT.sh, which wrote to a file in the home directory, which file contained a path that scripts read. Now that path is stored in an exported variable in `~/.bashrc` (and that former script and a file it used are removed and no longer used).

## Scripts that render palettes and galleries

Some scripts I have developed that created the palettes, palette renders and markdown galleries in this repository are:
- [renderAllHexPalettes.sh](https://github.com/earthbound19/_ebDev/blob/master/scripts/imgAndVideo/renderAllHexPalettes.sh)
- [palettesMarkdownGalleries.sh](https://github.com/earthbound19/_ebDev/blob/master/scripts/imgAndVideo/palettesMarkdownGalleries.sh)

There are other scripts that handle `.hexplt` files, subject to high flux, addition and removal.

## Style and File Locations Guide

- `.hexplt` files in this repository are named in Title Case with underscores for spaces (Title_Case), and never camelCase, with exceptions.
- Palette development goes on in the `/palettes_dev` subfolder. Finalized (approved for use in art or production) palettes are migrated to `/palettes`. Reference material is in `/reference`.

There may be sub-subfolder name overlap in those folders, as things of the same topic/project are worked on or referenced.

The reason for Title Case is the intent to make palette names and contents available over the internet via API calls that reference or are derived from this repository, and that naming style is what I prefer for palette reference/display in projects that use these palettes.

## Sources of Maths

Palettes in this collection are generated randomly and/or made by me, or may be collected from elsewhere.

Where they are collected from elsewhere, I'm careful to avoid intellectual property concerns by referring only to Public Domain information (such as sources or times), without any misuse of intellectual property associated with colors etc. The Public Domain information I use includes the math of what numbers are concerned with what palettes, because you can't exert intellectual property control on numbers.

## LICENSE

As you may infer from "Sources of Maths," since these palettes are collections of numbers, and you can't copyright numbers, the palettes in this repository are outside of any possible licensing constraints: these palletes are in the Public Domain. But unique _names_ of palettes which I have given to any of them, I reserve all copyright control of. If the palette name is random characters and/or numbers and/or dates, that goes back to the name being arguably a number or something random or which has little or no unique intellectual property attributes, which makes those names also arguably Public Domain.
