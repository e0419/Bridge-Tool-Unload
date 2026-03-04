%
O1007 (TAKUMI H16 TOOL UNLOAD)

(CYCLE THROUGH TOOLS FOR SEQUENTIAL UNLOADING)
(LAST UPDATE 3/4/26 - SN)

#30 = 26    (TOOL COUNT - DO NOT INCLUDE PROBE)
#31 = 1     (STARTING TOOL)

(SPINDLE AT OP WINDOW COORDINATES)
(USE MACHINE COORDINATES ONLY)
#10 = 0.0       (MACHINE POS X)
#11 = -47.5     (MACHINE POS Y)
#12 = -11.75    (MACHINE POS Z)


(---------------------------)
(DO NOT EDIT BELOW THIS LINE)
(---------------------------)

(SAFE BLOCK START)
G90 G94 G17 G49 G40 G80
G20
G28 G91 Z0.
G90

N100
    T[#31] M6                   (SELECT TOOL)
    T[#31+1]                    (PRE-CALL NEXT TOOL)
    G0 G53 Z0.
    G0 G53 X[#10] Y[#11]               
    G0 G53 Z[#12]               (SPINDLE TO WINDOW)
    M00                         (PAUSE FOR TOOL UNLOAD)
    
    #[13000+#31] = 0.           (CLEAR RADIUS)
    #[12000+#31] = 0.           (CLEAR RADIUS WEAR)
    #[11000+#31] = 0.           (CLEAR LENGTH)
    #[10000+#31] = 0.           (CLEAR LENGTH WEAR)

    IF [#31 GE #30] GOTO 200    (CHECK IF LAST TOOL)
    #31 = #31 + 1               (INCREMENT TOOL NUMBER)
    GOTO 100                    (REPEAT FOR NEXT TOOL)


N200
    (SAFE BLOCK EXIT)
    M09
    G28 G91 Z0.
    G90
    G49
    G28 G91 X0. Y0.
    G90
    M30

    %


