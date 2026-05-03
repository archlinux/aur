file(GLOB ROR_LIBS FOLLOW_SYMLINKS LIST_DIRECTORIES false "${srcdir}/*.so")
file(GLOB OGRE_LIBS FOLLOW_SYMLINKS LIST_DIRECTORIES false "${srcdir}/OGRE/*.so")

foreach (lib ${ROR_LIBS})
    file(INSTALL ${lib} DESTINATION "${pkgdir}/opt/rigsofrods/lib/" FOLLOW_SYMLINK_CHAIN)
endforeach ()
foreach (lib ${OGRE_LIBS})
    file(INSTALL ${lib} DESTINATION "${pkgdir}/opt/rigsofrods/lib/OGRE/" FOLLOW_SYMLINK_CHAIN)
endforeach ()