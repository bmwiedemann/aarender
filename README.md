A tool to create the highest possible quality
of an ASCII-Art rendering of a monochrome logo
such as the [Slowroll logo](https://en.opensuse.org/File:Slowroll_logo_by_pprmint.svg).

For this, we collect images of all available characters (from 32 to 127)
and check which one matches best.

## Sample output

    $ GAMMA=-0.15 SIZE=413 ./renderlogo.pl | tee Slowroll-logo.txt
                   ,.yyyyyy,_
              ,gMMMMMMMMMMMMMMMgy
           jgMMM~             ~9MM@g
         j@M@~                    9MMg
        gM@                         ~MMg
      jMMF         _jgggggy,          @Mk
      MMF        gMMM@~~~MMMMg,        @Mk
     gMF       jMMP         "@Mg        MML
    jMM       jMM             VMg       ]M&
    jMB       #MF              MM       jMM
    ]M&       MML              MML      jMM
    ]MM       `MM,            jMM       jM@
     MMk       `@M@gy.        @MF       MMF
     `MMg         ~MMM       @MF       jMV
      ]MMMg                gMM"       gM@
       `MMMMgy_        ,yMMM~       j@MP
         MMMMMMMMMMMMMMMMP~       jgMM`
           9MMgy~~~~~~         ,gMMM~
             ~MMMMMgyyy,,yyggMMMM~
                 ~~~MMMMMMMP~~


    $ GAMMA=-0.25 SIZE=210 ./renderlogo.pl
         ,ymmmmmy,
      ,mP~       ~*m_
     jP     _,_     \g
    jF    mP~~~~m    ]k
    M    M       M    M
    M    &       #L   M
    @L   `Mmp   j@    @
     @g,      ,dP   ,@
      ~M@MmmMP~   ,mP
        ~*@myygm#P~
