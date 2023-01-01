# _ebPalettes

Collection of palettes in `.hexplt` format.

## .hexplt spec

hexplt stands for "[sRGB] hex palette," which is a text containing sRGB colors in hex format, separated by any other information (such as text or white space). sRGB colors are a # pound symbol (indicating hex), followed by six hex digits, such as #003153. For simplicity I'm going to refer to those as "color codes."

Because the only strict requirement for the spec is that it contains color codes, they can be in any layout, such as one per line:

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

Any text not in the format #HHHHHH (a pound symbol and six hex digits), on the same line as an sRGB hex color code, are functionally comments which scripts and programs that handle this format should ignore.

Some of my scripts in another repository (_ebDev) at this writing also read and write layout comments and rearrange color codes to match the description, like this, `from cherry_plum_tree_bloom_reduced_03_impression.hexplt`:

#FFFBEA #FFF0C7 #FFD8F6 #FFC5F9 #FEBFE6 #FFB5CA #FFC7CA #FFBFA1  columns: 8 rows: 8
#F69CCC #E8A0D1 #EC8CBD #FF8AC3 #FF8596 #DD829D #E17183 #EB5D90
#FE4375 #F04648 #F45237 #DB5352 #E43C51 #D54621 #BE2F13 #A61631
#B21044 #A44053 #A3514F #A54E70 #BA3F73 #C74269 #912C4D #8F0C1C
#862A1E #6F3933 #5E3B33 #6D2722 #691013 #5B1336 #4C1524 #451808
#311F1F #2E2438 #341028 #380218 #42002D #562949 #393439 #674A73
#655574 #775565 #62637C #806C83 #5E95AC #A196BD #BE88B2 #C37DA6
#BF949F #FF775F #FF7C44 #E1681D #944623 #14112D #78B6EF #E1C4FB

If you look at that file at this writing, it actually mixes a comment with that columns and rows descriptor.

You can also have color codes in any layout and use a layout comment (or columns and rows descriptor), and a render script I have will honor the intended layout of the layout comment, whatever arrangment the color codes are in.

## Markdown galleries

If you're viewing this repository at a web site such as GitHub or other context that renders HTML from the README.md, you may navigate the folders to see previews of palettes (rendered as .png images) via that README. You'll find palettes displayed like the below:

### [`palettes/eb_favorites_v2`](palettes/eb_favorites_v2.hexplt)

[ ![palettes/eb_favorites_v2.png](palettes/eb_favorites_v2.png) ](palettes/eb_favorites_v2.png)

-- where the title over the image links to the source `.hexplt` file, and the rendered image links to the image file.

## Scripts that render palettes and galleries

Some scripts I have developed that created the palettes, palette renders and markdown galleries in this repository are [renderAllHexPalettes.sh]( https://github.com/earthbound19/_ebDev/blob/master/scripts/imgAndVideo/renderAllHexPalettes.sh) and [palettesMarkdownGalleries.sh](https://github.com/earthbound19/_ebDev/blob/master/scripts/imgAndVideo/palettesMarkdownGalleries.sh).

## Sources of Maths

Palettes in this collection are generated randomly and/or made by me, or may be collected from elsewhere.

Where they are collected from elsewhere, I'm careful to avoid intellectual property concerns by referring only to public domain information (such as sources or times), without using any copyrightable or trademarkeable etc. information. The public domain information I use includes the math of what numbers are concerned with what palettes. You can't exert intellectual property control on numbers.

## LICENSE

As you may infer from "Sources of Maths," since these palettes are collections of numbers, and you can't copyright numbers, the palettes in this repository are outside of any possible licensing constraints: these palletes are in the Public Domain. But unique _names_ of palettes which I have given to any of them, I reserve all copyright control of. If the palette name is random characters and/or numbers and/or dates, that goes back to the name being arguably a number or something random or which has little or no unique intellectual property attributes, which makes those names also arguably Public Domain.