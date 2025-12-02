# libpng.a

From the LIBPNG 1.8.0 to /opt/cross-mint/m68k-atari-mint/lib/

Targets: 68000, 68020-060, ColdFire

# installation for makefiles

- /opt/cross-mint/m68k-atari-mint already installed 

- in an empty folder,  

- get [libpng 1.8.0](https://github.com/pnggroup/libpng), you'll need only to unpack  
   ```./*.h``` and  
   ```./*.c``` to the current folder.  

- get /libpng.a/ from [pngdec_r1_src.zip](https://ptonthat.fr/files/gifdec/pngdec_r1_src.zip) and unpack the contents to ./  
   ```./README.md```  
   ```./pnglibconf.h``` (from pnglibconf.h.prebuilt, with PNG_TARGET_SPECIFIC_CODE_SUPPORTED disabled = define commented)  
   ```./Makefile```  
   ```./libpng.xcodeproj```  

- libpng.xcodeproj is for Xcode 26.1, you may not need it if you use something else.
