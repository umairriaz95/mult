simSetSimulator "-vcssv" -exec "./simv" -args " " -uvmDebug on
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
srcTBInvokeSim
srcHBSelect "tb.u0" -win $_nTrace1
srcHBSelect "tb.u0" -win $_nTrace1
wvCreateWindow
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave3
verdiDockWidgetMaximize -dock windowDock_nWave_3
wvSelectGroup -win $_nWave3 {G2}
srcTBRunSim
srcTBSimQuit
wvZoomAll -win $_nWave3
wvSelectAll -win $_nWave3
wvSelectSignal -win $_nWave3 {( "u0" 3 )} 
wvSelectSignal -win $_nWave3 {( "u0" 3 4 )} 
wvSelectSignal -win $_nWave3 {( "u0" 3 4 5 )} 
wvSelectSignal -win $_nWave3 {( "u0" 3 4 5 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetCursor -win $_nWave3 43379.534565 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 71377.481177 -snap {("u0" 5)}
verdiDockWidgetRestore -dock windowDock_nWave_3
srcHBSelect "tb.u0" -win $_nTrace1
srcSetScope "tb.u0" -delim "." -win $_nTrace1
srcHBSelect "tb.u0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "valid" -line 33 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave3
verdiDockWidgetMaximize -dock windowDock_nWave_3
wvSetCursor -win $_nWave3 85549.281314 -snap {("G2" 0)}
wvSelectGroup -win $_nWave3 {G2}
debExit
