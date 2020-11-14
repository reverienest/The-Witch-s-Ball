
//{{BLOCK(losescn)

//======================================================================
//
//	losescn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 7 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 224 + 2048 = 2784
//
//	Time-stamp: 2020-11-04, 23:53:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCN_H
#define GRIT_LOSESCN_H

#define losescnTilesLen 224
extern const unsigned short losescnTiles[112];

#define losescnMapLen 2048
extern const unsigned short losescnMap[1024];

#define losescnPalLen 512
extern const unsigned short losescnPal[256];

#endif // GRIT_LOSESCN_H

//}}BLOCK(losescn)
