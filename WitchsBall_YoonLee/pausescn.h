
//{{BLOCK(pausescn)

//======================================================================
//
//	pausescn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 6 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 192 + 2048 = 2752
//
//	Time-stamp: 2020-11-04, 22:38:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCN_H
#define GRIT_PAUSESCN_H

#define pausescnTilesLen 192
extern const unsigned short pausescnTiles[96];

#define pausescnMapLen 2048
extern const unsigned short pausescnMap[1024];

#define pausescnPalLen 512
extern const unsigned short pausescnPal[256];

#endif // GRIT_PAUSESCN_H

//}}BLOCK(pausescn)
