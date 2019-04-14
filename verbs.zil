"VERBS for
			A MIND FOREVER VOYAGING
	(c) Copyright 1985 Infocom, Inc.  All Rights Reserved."

;"subtitle game commands"

<GLOBAL VERBOSITY 1> ;"0 = superbrief, 1 = brief, 2 = verbose"

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSITY 2>
	 <SETG ELAPSED-TIME 0>
	 <TELL "Maximum verbosity." CR CR>
	 <V-LOOK>>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSITY 1>
	 <SETG ELAPSED-TIME 0>
	 <TELL "Brief descriptions." CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG ELAPSED-TIME 0>
	 <SETG VERBOSITY 0>
	 <TELL "Super-brief descriptions." CR>>

<ROUTINE V-DIAGNOSE ()
	 <COND (<G? ,AIR-CONDITIONING-COUNTER 34>
		<CRLF>
		<COND (,SIMULATING
		       <TELL
"You feel as if you're burning up with fever: weak, hot, and sweaty." CR>)
		      (T
		       <TELL
"You detect a throbbing feeling, almost like a dull pain or a wave of heat,
which is severely impairing your functioning." CR>)>)
	       (<G? ,AIR-CONDITIONING-COUNTER 19>
		<CRLF>
		<COND (,SIMULATING
		       <TELL
"Despite the coolness of the air, you feel hot and flushed, almost as
though you were running a slight fever." CR>)
		      (T
		       <TELL
"You feel a strange sensation, a physical disturbance, which you
cannot seem to pin down." CR>)>)
	       (<NOT ,SIMULATING>
		<TELL "All your systems seem to be functioning properly." CR>)
	       (,BRUISED
		<TELL
"You have some tender bruises from the beating you received.">
		<COND (,MUGGED
		       <TELL " Also, y" ,HEAD-THROBS>)>
		<CRLF>)
	       (,MUGGED
		<TELL "Y" ,HEAD-THROBS CR>)
	       (<EQUAL? ,SYEAR 2081>
		<SCORE 40> ;"2 points"
		<TELL
"You are weak from hunger, a dangerous condition at your age. Your last meal
was... you can't even remember. You remember picking at the remains of a
squirrel, but that might have been weeks ago. Your memories are jumbled.">
		<COND (<FSET? ,CEMETERY ,ONBIT>
		       <TELL
" In addition, your jaw is throbbing from that attack in the cemetery.">)>
		<CRLF>)
	       (T
		<TELL "You are in good health." CR>)>>

<ROUTINE V-INVENTORY ("AUX" SPARE-KLUDGE)
	 <COND (<NOT ,SIMULATING>
		<SETG YES-NO-FLAG 1>
		<QUEUE I-YES-NO 2>
		<TELL "You have no appendages, remember?" CR>)
	       (<NOT <FIRST? ,PLAYER>>
		<TELL "You are empty-handed." CR>)
	       (T
		<TELL "You are carrying:" CR>
		<PRINT-CONT ,PLAYER>)>>

<ROUTINE V-QUIT ()
	 ;<V-SCORE>
	 <TELL "Do you really want to quit?">
	 <COND (<YES?>
		<QUIT>)
	       (T
		<SETG ELAPSED-TIME 0>
		<TELL "Ok." CR>)>>

<ROUTINE V-RESTART ()
	 ;<V-SCORE T>
	 <SETG ELAPSED-TIME 0>
	 <TELL "Do you wish to restart?">
	 <COND (<YES?>
		<TELL "Restarting." CR>
		<RESTART>
		<TELL "Failed." CR>)
	       (T
		<TELL "Ok." CR>)>>

<ROUTINE FINISH ()
	 <PUTB ,P-INBUF 0 20> ;"so you can't input too many characters"
	 <TELL CR
"Would you like to start over, restore a saved position, or end this session?|
(Type RESTART, RESTORE, or QUIT): >">
	 <READ ,P-INBUF ,P-LEXV>
	 <PUTB ,P-INBUF 0 60>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?RESTART>
	        <RESTART>
		<TELL "Failed." CR>
		<FINISH>)
	       (<EQUAL? <GET ,P-LEXV 1> ,W?RESTORE>
		<COND (<RESTORE>
		       <TELL "Bug #4M" CR>) ;"should be handled in V-SAVE"
		      (T
		       <TELL "Failed." CR>
		       <FINISH>)>)
	       (<EQUAL? <GET ,P-LEXV 1> ,W?QUIT ,W?Q>
		<QUIT>)
	       (T
		<FINISH>)>>

;<GLOBAL YES-INBUF <TABLE *3400* 0 0 0>>	;"bytes: 7 0 0 0 0 0 0 0"

;<GLOBAL YES-LEXV  <TABLE  *400* 0 0>>	;"bytes: 1 0 0 0 0 0"

;<ROUTINE YES? ("AUX" WORD VAL) ;"Stu's YES?"
	<REPEAT ()
		<PRINTI " >">
		<READ ,YES-INBUF ,YES-LEXV>
		<COND (<AND <NOT <0? <GETB ,YES-LEXV ,P-LEXWORDS>>>
			    <SET WORD <GET ,YES-LEXV ,P-LEXSTART>>>
		       <SET VAL <WT? .WORD ,PS?VERB ,P1?VERB>>
		       <COND (<EQUAL? .VAL ,ACT?YES>
			      <SET VAL T>
			      <RETURN>)
			     (<OR <EQUAL? .VAL ,ACT?NO>
				  <EQUAL? .WORD ,W?N>>
			      <SET VAL <>>
			      <RETURN>)>)>
		<TELL "[Please type YES or NO.]">>
	.VAL>

<ROUTINE YES? ("AUX" CHAR (X <>))
	 <PRINTI " (y/n) >">
	 <REPEAT ()
		 <BUFOUT <>>
		 <BUFOUT T>
		 <SET CHAR <INPUT 1>>
		 <COND (<OR <EQUAL? .CHAR 89 121> ;"ASCII values of Y and y"
			    <EQUAL? .CHAR 217 249>> ;"plus 128, to prevent bug"
			<SET X T>
			<CRLF>
			<RETURN>)
		       (<OR <EQUAL? .CHAR 78 110> ;"ASCII values of N and n"
			    <EQUAL? .CHAR 206 238>> ;"plus 128, to prevent bug"
			<CRLF>
			<RETURN>)
		       (T
			<TELL CR "[Type Y or N] >">)>>
	 <COND (.X
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-RESTORE ()
	 <COND (<RESTORE>
		<TELL "Bug #4M" CR>) ;"this should be handled in V-SAVE"
	       (T
		<SETG ELAPSED-TIME 0>
		<TELL "Restore failed." CR>)>>

<ROUTINE V-SAVE ("AUX" X)
	 <SET X <SAVE>>
	 <SETG ELAPSED-TIME 0>
	 <COND (<NOT .X>
		<TELL "Save failed." CR>)
	       (<EQUAL? .X 1>
		<TELL "Ok, saved." CR>)
	       (T
		<SETG L-MODE <>>
		<SETG L-HERE <>>
		<SETG L-DATE <>>
		<SETG L-RECORDING <>>
		<TELL "Ok, restored." CR CR>
		<STATUS-LINE>
		<V-LOOK>
		<COND (<AND <EQUAL? ,HERE ,THE-COACHMAN ,SIMONS>
			    <EQUAL? ,MEAL-STATUS 4>>
		       <SETG WAITER-COUNTER <- ,WAITER-COUNTER 1>>
		       <I-MEAL>)
		      (<EQUAL? ,HERE ,NEWS>
		       <NEWS-F ,M-END>)
		      (<EQUAL? ,HERE ,TUBE-JUNCTION>
		       <TUBE-JUNCTION-F ,M-END>)
		      (<FSET? ,HERE ,TUBEBIT>
		       <RED-TUBE-STATION-F ,M-END>
		       <BROWN-TUBE-STATION-F ,M-END>)>
		<RTRUE>)>>

;<GLOBAL TURNS 0>

;<ROUTINE V-SCORE ()
	 <TELL
"There's no scoring theory. However, I'm sure you'll be thrilled to know
that you've taken a total of " N ,TURNS " turns." CR>>

;<ROUTINE V-SCORE ()
	 <TELL
"Your score is " N ,SCORE " of a possible 400, in " N ,MOVES " move">
	 <COND (<NOT <1? ,MOVES>>
		<TELL "s">)>
	 <TELL "." CR>>

<ROUTINE V-SCRIPT ()
	 <SETG ELAPSED-TIME 0>
	 <COND (<BTST <GET 0 8> 1>
		<TELL "[Scripting is already on!]" CR>)
	       (T
		<TELL "[Scripting is now on.]" CR>
	 	<DIROUT ,D-PRINTER-ON> ;"turn on scripting"
	        ;<PUT 0 8 <BOR <GET 0 8> 1>>
		<DIROUT ,D-SCREEN-OFF> ;"following text shouldn't go to screen"
	 	<COPR-NOTICE "begins">
	 	<V-VERSION>
		<DIROUT ,D-SCREEN-ON> ;"resume printing to the screen")>>

<ROUTINE V-UNSCRIPT ()
	 <SETG ELAPSED-TIME 0>
	 <COND (<BTST <GET 0 8> 1>
		<DIROUT ,D-SCREEN-OFF> ;"following text shouldn't go to screen"
		<COPR-NOTICE "ends">
	 	<V-VERSION>
		<DIROUT ,D-SCREEN-ON> ;"resume printing to the screen"
	 	;<PUT 0 8 <BAND <GET 0 8> -2>>
	 	<DIROUT ,D-PRINTER-OFF>
		<TELL "[Scripting is now off.]" CR>)
	       (T
		<TELL "[Scripting is already off!]" CR>)>>


<ROUTINE COPR-NOTICE (STRING)
	 <TELL "Here " .STRING " a transcript of interaction with ">>

<ROUTINE V-VERSION ("AUX" (CNT 17) V)
	 <SET V <BAND <GET 0 1> *3777*>>
	 <SETG ELAPSED-TIME 0>
	 <TITLE-PRINT>
	 <TELL CR
"Infocom interactive fiction - a science fiction story|
Copyright (c) 1985 by Infocom, Inc. All rights reserved." CR>
	 <TITLE-PRINT>
	 <TELL " is a trademark of Infocom, Inc.|
Release " N .V " / Serial number ">
	 <REPEAT ()
	   <COND (<G? <SET CNT <+ .CNT 1>> 23>
		  <RETURN>)
		 (T
		  <PRINTC <GETB 0 .CNT>>)>>
	 <CRLF>>

<ROUTINE V-$VERIFY ()
	 <COND (<AND <PRSO? ,INTNUM>
		     <EQUAL? ,P-NUMBER 469>>
		<TELL N ,SERIAL CR>)
	       (T
		<SETG ELAPSED-TIME 0>
		<TELL "EZIP Interpreter ">
		<PRINTN <GETB 0 30>>
		<TELL ", Version ">
		<PRINTC <GETB 0 31>>
		<TELL ". Verifying..." CR>
	 	<COND (<VERIFY>
		       <TELL "Good." CR>)
	       	      (T
		       <TELL CR "** Bad **" CR>)>)>>

<CONSTANT SERIAL 0>

<ROUTINE V-$REFRESH ()
	 <SETG ELAPSED-TIME 0>
	 <REFRESH-STATUS-LINE>>

<ROUTINE REFRESH-STATUS-LINE ()
	 <SETG L-RECORDING <>>
	 <SETG L-HERE <>>
	 <SETG L-MODE <>>
	 <SETG L-DATE <>>
	 <INIT-STATUS-LINE 2 T>
	 <STATUS-LINE>>

<ROUTINE V-$COMMAND-FILE ()
	 <SETG ELAPSED-TIME 0>
	 <DIRIN 1>
	 <RTRUE>>

<ROUTINE V-$RANDOM ()
	 <SETG ELAPSED-TIME 0>
	 <COND (<NOT <PRSO? ,INTNUM>>
		<TELL "Use a number!" CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<ROUTINE V-$RECORD ()
	 <SETG ELAPSED-TIME 0>
	 <DIROUT ,D-RECORD-ON> ;"all READS and INPUTS get sent to command file"
	 <RTRUE>>

<ROUTINE V-$UNRECORD ()
	 <SETG ELAPSED-TIME 0>
	 <DIROUT ,D-RECORD-OFF>
	 <RTRUE>>

;<ROUTINE V-$CHEAT ()
	 <COND (<NOT <PRSO? ,INTNUM>>
		<TELL "Try $CHEAT 1, 2 or 3." CR>)
	       (<EQUAL? ,P-NUMBER 1>
                <SETG 2051-SCORE 15>
		<SETG 2061-SCORE 25>
		<SETG 2071-SCORE 45>
		<SETG 2081-SCORE 20>
		<SETG COMPLETED-TASKS T>
		<SETG RECORDINGS-INCLUDE-SIMULATION T>
		<SETG PART-FLAG 2>
		<DISABLE <INT I-MESSAGE-C>>
		<PUTP ,RECORD-BUFFER ,P?SIZE 100>
		<TELL
"This isn't guaranteed to work unless you restart first..." CR>
		<I-VIEW>)
	       (<EQUAL? ,P-NUMBER 2>
		<PUT ,SIM-LEVEL-TABLE 0 0>
		<TELL
"This isn't guaranteed to work unless you restart first..." CR>
		<SETG COMPLETED-TASKS T>
		<SETG PART-FLAG 3>
		<DISABLE <INT I-MESSAGE-C>>
		<I-WIN>)
	       (<EQUAL? ,P-NUMBER 3>
		<TELL
"This isn't guaranteed to work unless you restart first..." CR>
		<SETG COMPLETED-TASKS T>
		<SETG PART-FLAG 2>
		<DISABLE <INT I-MESSAGE-C>>
		<PUT ,SIM-LEVEL-TABLE 0 251>
		<PUT ,SIM-LEVEL-TABLE 1 301>
		<PUT ,SIM-LEVEL-TABLE 2 401>
		<PUT ,SIM-LEVEL-TABLE 3 601>)
	       (T
		<PERFORM ,V?$CHEAT ,ME>
		<RTRUE>)>>

;<ROUTINE V-$DATA ()
	 <TELL
"TIME: " N ,TIME ", DATE: " N ,DATE ", MONTH: " N ,MONTH CR
"STIME: " N ,STIME ", SDATE: " N ,SDATE ", SMONTH: " N ,SMONTH CR
"LIGHT-LEVEL: " N ,LIGHT-LEVEL ", LAST-SUN-TIME: " N ,LAST-SUN-TIME CR>>

;<GLOBAL DEBUG <>>

;<ROUTINE V-$DEBUG ()
	 <COND (,DEBUG
		<SETG DEBUG <>>
		<TELL "Debugging off." CR>)
	       (T
		<SETG DEBUG T>
		<TELL "Debugging on." CR>)>>

;"subtitle real verbs"

<ROUTINE V-ABORT ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (,SIMULATING
		<COND (,RECORDING
		       <TELL "Deactivating the record feature and a">)
		      (T
		       <TELL "A">)>
		<TELL "borting to ">
		<PRINTD ,COMM-MODE>
		<JIGS-UP ".">)
	       (T
		<ERR "Not currently simulating.">)>>

<ROUTINE V-ABORT-OBJECT ()
	 <COND (<PRSO? ,SIMULATION-MODE>
		<V-ABORT>)
	       (T
		<TELL ,RECOGNIZE CR>)>>

;<ROUTINE V-AGAIN ("AUX" (OBJ <>))
	 <COND (,DEBUG
		<COND (,L-PRSA
		       <TELL "[L-PRSA = ">
	       	       %<COND (<GASSIGNED? PREDGEN>
			       '<TELL N ,L-PRSA>)
		      	      (T
			       '<PRINC <NTH ,ACTIONS <+ <* ,L-PRSA 2> 1>>>)>)>
		<COND (,L-PRSO
		       <TELL ", L-PRSO = " D ,L-PRSO>)>
		<COND (,L-PRSI
		       <TELL ", L-PRSI = " D ,L-PRSI>)>
		<TELL "]" CR>)>
	 <COND (<NOT ,L-PRSA>
		<TELL "Not until you do something." CR>)
	       ;(<MOBY-VERB?>
		<TELL "Sorry, you can't use AGAIN after the previous verb." CR>
		<SETG PRSA ,V?VERBOSE>) ;"so this won't run the clock"
	       (<EQUAL? ,NOT-HERE-OBJECT ,L-PRSO ,L-PRSI>
		<TELL "You can't see that here." CR>)
	       (<EQUAL? ,L-PRSA ,V?WALK>
		<DO-WALK ,L-PRSO>)
	       (T
		<COND (<AND ,L-PRSO
			    <NOT <VISIBLE? ,L-PRSO>>>
		       <SET OBJ ,L-PRSO>)
		      (<AND ,L-PRSI
			    <NOT <VISIBLE? ,L-PRSI>>>
		       <SET OBJ ,L-PRSI>)>
		<COND (<AND .OBJ 
			    <NOT <EQUAL? .OBJ ,ROOMS>>>
		       <TELL "You can't see">
		       <ARTICLE .OBJ T>
		       <TELL " anymore." CR>
		       <RFATAL>)
		      (T
		       <PERFORM ,L-PRSA ,L-PRSO ,L-PRSI>
		       <RTRUE>)>)>>

<ROUTINE V-ALARM ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?ALARM ,ME>
		<RTRUE>)
	       (T
		<TELL "I don't think">
	        <ARTICLE ,PRSO T>
	        <TELL " is sleeping." CR>)>>

<ROUTINE V-ANSWER ()
	 <COND (<ANSWER-SAY-SHARE>
		<RTRUE>)
	       (T
		<TELL "Nobody is awaiting your answer." CR>
	 	<CLEAR-BUF>)>>

<ROUTINE ANSWER-SAY-SHARE ()
	 <COND (<AND <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <EQUAL? ,MEAL-STATUS 1>
		     <NEXT-WORD-YES?>>
		<V-YES>
		<CLEAR-BUF>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <EQUAL? ,MEAL-STATUS 1>
		     <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?NO>>
		<V-NO>
		<CLEAR-BUF>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,HOSPITAL ,POLICE-STATION>
		     <NEXT-WORD-YES?>>
		<V-YES>
		<CLEAR-BUF>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,HOSPITAL ,POLICE-STATION>
		     <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?NO>>
		<V-NO>
		<CLEAR-BUF>
		<RTRUE>)
	       (<AND <G? ,GRIMWOLD-COUNTER 0>
		     <NEXT-WORD-YES?>>
		<V-YES>
		<CLEAR-BUF>
		<RTRUE>)
	       (<AND <G? ,GRIMWOLD-COUNTER 0>
		     <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?NO>>
		<V-NO>
		<CLEAR-BUF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE NEXT-WORD-YES? ()
	 <COND (<OR <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?YES ,W?Y ,W?YEAH>
		    <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?OK ,W?OKAY ,W?SURE>
		    <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?YEA ,W?YUP ,W?YEP>
		    <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?AYE ,W?AFFIRMATI>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-ASK-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?TELL ,ME>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<SETG WINNER ,PRSO>
		<PERFORM ,V?TELL-ABOUT ,ME ,PRSI>
		<SETG P-IT-OBJECT ,WINNER>
		<SETG WINNER ,PLAYER>
		<RTRUE>)
	       ;(<FSET? ,PRSO ,ACTORBIT>
		<TELL "A long silence tells you that">
		<ARTICLE ,PRSO T>
		<TELL " isn't interested in talking about">
		<COND (<IN? ,PRSI ,ROOMS>
		       <TELL " that">)
		      (T
		       <ARTICLE ,PRSI T>)>
		<TELL "." CR>)
	       (T
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

<ROUTINE V-ASK-NO-ONE-FOR ("AUX" ACTOR)
	<COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
	       <PERFORM ,V?ASK-FOR .ACTOR ,PRSO>
	       <RTRUE>)
	      (T
	       <TELL "There's no one here to ask!" CR>)>>

<ROUTINE V-ASK-FOR ()
	 <TELL "Not surprisingly,">
	 <ARTICLE ,PRSO T>
	 <TELL " doesn't oblige." CR>>

<ROUTINE V-BITE ()
	 <HACK-HACK "Biting">>

<ROUTINE PRE-BOARD ()
	 <COND (<PRSO? <LOC ,PLAYER>>
		<TELL ,LOOK-AROUND CR>)>>

<ROUTINE V-BOARD ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<MOVE ,PLAYER ,PRSO>
		<COND (<PRSO? ,STADIUM-STANDS>
		       <FCLEAR ,PRSO ,FURNITUREBIT>)>
		<TELL "You are now ">
		<COND (<PRSO? ,DINETTE-SET ,GLOBAL-TABLE>
		       <TELL "seated at">)
		      (<FSET? ,PRSO ,FURNITUREBIT>
		       <TELL "on">)
		      (T
		       <TELL "in">)>
		<ARTICLE ,PRSO T>
		<TELL "." CR>
		;<APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>)
	       (T
		<TELL "You can't get into">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)>>

<ROUTINE PRE-BUY ()
	 <COND (<NOT ,SIMULATING>
		;<TELL
"Unfortunately, being a sentient computer doesn't pay very well." CR>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (<AND <PRSO? ,MEAL>
		     <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>>
		<RFALSE>)
	       (<PRSO? ,CREDIT-CARD>
		<TELL "You must think that money grows on trees." CR>)
	       (<NOT <HELD? ,CREDIT-CARD>>
		<TELL "You don't have your ">
		<PRINTD ,CREDIT-CARD>
		<TELL "." CR>)
	       (T
		<MOVE ,CREDIT-CARD ,PLAYER>
		<RFALSE>)>>

<ROUTINE V-BUY ()
	 <TELL "You can't buy">
	 <ARTICLE ,PRSO>
	 <TELL "!" CR>>

<ROUTINE V-BUY-WITH ()
	 <COND (<PRSI? ,CREDIT-CARD>
		<PERFORM ,V?BUY ,PRSO>
		<RTRUE>)
	       (<NOT ,SIMULATING>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You can buy things only with your ">
		<PRINTD ,CREDIT-CARD>
		<TELL "." CR>)>>

<ROUTINE V-CALL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (<VISIBLE? ,PRSO>
		       <TELL "You do so, but">
		       <ARTICLE ,PRSO>
		       <TELL " doesn't seem to hear you." CR>)
		      (T
		       <TELL "But">
		       <ARTICLE ,PRSO>
		       <TELL " isn't within earshot." CR>)>)
	       (T
		<TELL "That's an odd thought." CR>)>>

<ROUTINE V-CHASTISE ()
	 <TELL
"Use prepositions to indicate precisely what you want to do: LOOK AT the
object, LOOK INSIDE it, LOOK UNDER it, etc." CR>>

<ROUTINE V-CLIMB-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (T
		<V-LOCK>)>>

<ROUTINE V-CLIMB-FOO ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (T
		<V-LOCK>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You can't climb onto">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-CLIMB-OVER ()
	 <V-LOCK>>

<ROUTINE V-CLIMB-UP ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (T
		<V-LOCK>)>>

<ROUTINE V-CLOSE ()
	 <COND (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <FSET? ,PRSO ,ACTORBIT>>
		<V-COUNT>)
	       (<FSET? ,PRSO ,VEHBIT>
		<TELL "Huh?" CR>)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,CONTBIT>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL "Okay,">
		       <ARTICLE ,PRSO T>
		       <TELL " is now closed." CR>
		       <FCLEAR ,PRSO ,OPENBIT>)
		      (T
		       <TELL ,ALREADY-CLOSED CR>)>)
	       (T
		<TELL-ME-HOW>)>>

<ROUTINE V-COMFORT ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "But">
	 	<ARTICLE ,PRSO>
		<TELL " doesn't need comforting." CR>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-COUNT ()
	 <TELL <PICK-ONE ,IMPOSSIBLES> CR>>

<ROUTINE V-CROSS ()
	 <TELL "You can't cross">
	 <ARTICLE ,PRSO>
	 <TELL "." CR>>

<ROUTINE V-CRY ()
	 <COND (,MITCHELL-RAID-FLAG
		<TELL "The tears come easily." CR>)
	       (,SIMULATING
		<TELL "A tear trickles down your cheek." CR>)
	       (T
		<TELL "You have no tear ducts." CR>)>>

<ROUTINE V-CUT ()
	 <COND (<NOT ,PRSI>
		<V-LOCK>)
	       (T
		<TELL "The \"cutting edge\" of">
		<ARTICLE ,PRSI>
		<TELL " is hardly adequate." CR>)>>

<ROUTINE V-DANCE ()
	 <TELL "That was fun. Well, at least good exercise." CR>>

<ROUTINE V-DATE ()
	 <TELL "Today is ">
	 <COND (,SIMULATING
		<TELL N ,SMONTH "/" N ,SDATE "/" N ,SYEAR>)
	       (T
		<TELL N ,MONTH "/" N ,DATE "/" N ,YEAR>)>
	 <TELL "." CR>>

<ROUTINE V-DIG ()
	 <V-YELL>>

<ROUTINE V-DISEMBARK ()
	 <COND (<AND <FSET? ,PRSO ,TAKEBIT> ;"since GET OUT is also TAKE OUT"
		     <EQUAL? <META-LOC ,PRSO> ,HERE>
		     <NOT <IN? ,PRSO ,HERE>>
		     <NOT <IN? ,PRSO ,PLAYER>>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <EQUAL? <LOC ,PRSO> ,WALLET>
		     <HELD? ,WALLET>>
		<PERFORM ,V?TAKE ,PRSO ,WALLET>
		<RTRUE>)
	       (<NOT <PRSO? <LOC ,PLAYER>>>
		<TELL "But you're not in">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)
	       (<AND <PRSO? ,SEAT>
		     <FSET? ,PRSO ,ONBIT>>
		<FCLEAR ,PRSO ,ONBIT>
		<MOVE ,PLAYER ,HERE>
		<TELL
"You stand slowly, still feeling a little shaky from
your joybooth experience." CR>)
	       (T
		<MOVE ,PLAYER ,HERE>
		<TELL "You are no longer ">
		<COND (<PRSO? ,RESTAURANT-TABLE ,DINETTE-SET>
		       <TELL "at">)
		      (<FSET? ,PRSO ,FURNITUREBIT>
		       <TELL "on">)
		      (T
		       <TELL "in">)>
		<COND (<PRSO? ,STADIUM-STANDS>
		       <FSET ,PRSO ,FURNITUREBIT>)>
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-DISPLAY ()
	 <V-YELL>>

<ROUTINE V-DRINK ()
	 <COND (<FSET? ,PRSO ,DRINKBIT>
		<MOVE ,PRSO ,LOCAL-GLOBALS>
		<TELL "Drunk." CR>)
	       (T
		<TELL "You can't drink that!" CR>)>>

<ROUTINE V-DRINK-FROM ()
	 <V-COUNT>>

<ROUTINE PRE-DROP ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-DROP ()
	 ;<MOVE ,PRSO <LOC ,WINNER>> ;"not removed for any particular bug..."
	 <MOVE ,PRSO ,HERE>
	 <TELL "Dropped." CR>>

<ROUTINE V-EAT ()
	 <COND (<FSET? ,PRSO ,EATBIT>
		<MOVE ,PRSO ,LOCAL-GLOBALS>
		<TELL "Eaten." CR>)
	       (T
		<TELL "Nutritionists agree that">
	 	<ARTICLE ,PRSO T>
	 	<TELL " is inedible." CR>)>>

<ROUTINE V-ENTER ("AUX" VEHICLE)
	 <COND (<AND ,PRSO
		     <IN? ,PRSO ,ROOMS>>
		<GOTO ,PRSO>)
	       (<EQUAL? ,HERE ,TUBE-JUNCTION>
		<DO-WALK ,P?IN>)
	       (<SET VEHICLE <FIND-IN ,HERE ,VEHBIT>>
		<PERFORM ,V?BOARD .VEHICLE>
		<RTRUE>)
	       (T
		<DO-WALK ,P?IN>)>>

<ROUTINE V-EXAMINE ()
	 <COND (<UNSEEABLE-OBJECT>
		<RTRUE>)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,VEHBIT>>
		<V-LOOK-INSIDE>)
	       (<OR <FSET? ,PRSO ,ACTORBIT>
		    <FSET? ,PRSO ,MYBIT>>
		<TELL "You see nothing unusual about">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<OR <FSET? ,PRSO ,OPENBIT>
			   <FSET? ,PRSO ,SURFACEBIT>>
		       <V-LOOK-INSIDE>)
		      (T
		       <TELL "It's closed." CR>)>)
	       (<FSET? ,PRSO ,READBIT>
		<PERFORM ,V?READ ,PRSO>
		<RTRUE>)
	       (<PRSO? ;,EYES ;,TEETH ,HEAD ;,EARS>
		<TELL "That would involve quite a contortion." CR>)
	       (T
		<TELL "Totally ordinary looking " D ,PRSO "." CR>)>>

<ROUTINE UNSEEABLE-OBJECT ()
	 <COND (<FSET? ,PRSO ,UNSEENBIT>
		<TELL "You can't actually see">
		<ARTICLE ,PRSO T>
		<TELL "." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE V-EXAMINE-THROUGH ()
	 <TELL "This reveals nothing new." CR>>

<ROUTINE V-EXIT () ;"EXIT OBJECT now = V-DISEMBARK directly"
	 <COND (<FSET? <LOC ,PLAYER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,PLAYER>>
		<RTRUE>)
	       (T
		<DO-WALK ,P?OUT>)>>

<ROUTINE V-FEED ()
	 <TELL "A nice thought, but">
	 <ARTICLE ,PRSO T>
	 <TELL " doesn't need feeding." CR>>

<ROUTINE V-FILL ()
	 <TELL "You can't fill that!" CR>>

<ROUTINE V-FIND ("OPTIONAL" (WHERE <>) "AUX" (L <LOC ,PRSO>))
	 <COND (<PRSO? ,HANDS ,HEAD ;,EARS ;,TEETH ;,EYES>
		<SETG YES-NO-FLAG 2>
		<QUEUE I-YES-NO 2>
		<TELL "Are you sure">
		<ARTICLE ,PRSO T>
		<PLURAL ,PRSO>
		<TELL " lost?" CR>)
	       (<IN? ,PRSO ,PLAYER>
		<TELL "You have it!" CR>)
	       (<OR <GLOBAL-IN? ,PRSO ,HERE>
		    <IN? ,PRSO ,GLOBAL-OBJECTS>
		    <NOT .L>>
		<TELL "You figure it out!" CR>)
	       (<AND <FSET? .L ,ACTORBIT>
		     <VISIBLE? .L>>
		<TELL "As far as you can tell,">
		<ARTICLE .L T>
		<TELL " has it." CR>)
	       (<AND <FSET? .L ,CONTBIT>
		     <VISIBLE? ,PRSO>>
		<TELL "It's in">
		<ARTICLE .L T>
		<TELL "." CR>)
	       (<VISIBLE? ,PRSO>
		<TELL "Right in front of you!" CR>)
	       (.WHERE
		<TELL "Beats me." CR>)
	       (T
		<TELL "You'll have to do that yourself." CR>)>>

<ROUTINE V-FIRST-LOOK ()
	 <COND (<DESCRIBE-ROOM>
		<COND (<EQUAL? ,VERBOSITY 1 2>
		       <DESCRIBE-OBJECTS>)>)>>

<ROUTINE V-FLUSH ()
	 <V-COUNT>>

<ROUTINE V-FOLLOW ()
	 ;<COND (,DEBUG
		<TELL "[FOLLOW-FLAG = " N ,FOLLOW-FLAG ".]" CR>)>
	 <COND (<VISIBLE? ,PRSO>
		<RIGHT-HERE>)
	       (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<V-COUNT>)
	       (<EQUAL? ,FOLLOW-FLAG 9>
		<TELL "You didn't notice which way">
		<ARTICLE ,PRSO T>
		<TELL " went." CR>)
	       (T
		<TELL "You have no idea where">
		<ARTICLE ,PRSO T>
		<TELL " is." CR>)>>

<GLOBAL FOLLOW-FLAG 0>

<ROUTINE I-UNFOLLOW ()
	 ;<COND (,DEBUG
		<TELL "[Setting FOLLOW-FLAG to 0.]" CR>)>
	 <SETG FOLLOW-FLAG 0>
	 <RFALSE>>

<ROUTINE PRE-GIVE ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-GIVE ()
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<TELL "After a moment,">
		<ARTICLE ,PRSI T>
		<TELL " refuses your offer." CR>)
	       (T
		<TELL "You can't give">
		<ARTICLE ,PRSO>
		<TELL " to">
		<ARTICLE ,PRSI>
		<TELL "!" CR>)>>

<ROUTINE V-HANG ()
	 <V-COUNT>>

<ROUTINE V-HELLO ("AUX" ACTOR)
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL
"[That's not the correct way to speak to people.
Try \"" D ,PRSO ", hello.\"]" CR>)
		      (T
		       <V-COUNT>)>)
	       (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
		<ADDRESS-DIRECTLY .ACTOR>)
	       (T
		<PERFORM ,V?TELL ,ME>
		<RTRUE>)>>

<ROUTINE V-HELP ()
	 <SETG ELAPSED-TIME 0>
	 <TELL
"[If you're really stuck, you can order an InvisiClues Hint Booklet from your
dealer, or via mail order using the form that came in your package.]" CR>>

<ROUTINE V-HIDE ()
	 <TELL "There's no place to hide here." CR>>

<ROUTINE V-HOLD ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?COMFORT ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-INCOMPLETE-QUESTION ()
	 <TELL "Why? When? Which?" CR>>

<ROUTINE V-KICK ()
	 <HACK-HACK "Kicking">>

<ROUTINE V-KILL ()
	 <TELL "Violence solves nothing." CR>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "Nothing happens." CR>)
	       (T
		<HACK-HACK "Knocking on">)>>

<ROUTINE V-KISS ()
	 <TELL "You reconsider." CR>>

<ROUTINE V-LEAP ()
	 <COND (<AND ,PRSO
		     <NOT <IN? ,PRSO ,HERE>>>
		<V-COUNT>)
	       (T
		<V-SKIP>)>>

<ROUTINE V-LEAVE ()
	 <COND (<NOT ,PRSO>
		<SETG PRSO ,ROOMS>)>
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?OUT>)
	       (<PRSO? <LOC ,PLAYER>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LIE-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <PERFORM ,V?LIE-DOWN ,BED>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?LIE-DOWN ,GROUND>
		       <RTRUE>)>)
	       (T
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LISTEN ()
	 <COND (<EQUAL? ,HERE ,LIBRARY-ROOM ,INTERFACE-ROOM>
		<ERR "Aural perception is not defined here.">)
	       (<NOT ,PRSO>
		<COND (<EQUAL? ,HERE ,COMM-ROOM>
		       <ERR "You must first access a communication outlet.">)
		      (<EQUAL? ,HERE ,CONTROL-CENTER>
		       <PERFORM ,V?LISTEN ,CONVERSATION>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,NEWS>
		       <PERFORM ,V?EXAMINE ,CURRENT-FEED>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,WAREHOUSE-2>
		       <TELL "A loud alarm is ringing." CR>)
		      (<AND <EQUAL? ,HERE ,DORM>
			    <EQUAL? ,SYEAR 2041 2051>>
		       <TELL "Loud music is playing nearby." CR>)
		      (<EQUAL? ,HERE ,ALLEY ,BAR>
		       <TELL "Loud music comes from the ">
		       <COND (<EQUAL? ,HERE ,ALLEY>
			      <TELL "end of the alley." CR>)
			     (T
			      <TELL "jukebox." CR>)>)
		      (<AND <EQUAL? ,HERE ,MAIN-STREET-BRIDGE>
			    <G? ,WILD-DOG-COUNTER 0>>
		       <PERFORM ,V?LISTEN ,BARKING>
		       <RTRUE>)
		      (<IN? ,RYDER ,HERE>
		       <PRINTD ,RYDER>
		       <TELL " continues his harangue:" CR>)
		      (<AND <EQUAL? ,HERE ,CONSTRUCTION-SITE-1>
			    <EQUAL? ,LIGHT-LEVEL 3>>
		       <PERFORM ,V?LISTEN ,DERRICOPTERS>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,CORE>
			    <EQUAL? <GET ,HVAC-STATUS-TABLE 11> 1>>
		       <PERFORM ,V?LISTEN ,VENT>
		       <RTRUE>)
		      (T
		       <TELL
"At the moment, you hear nothing interesting." CR>)>)
	       (T
		<TELL "At the moment,">
		<ARTICLE ,PRSO T>
		<TELL " make">
		<COND (<NOT <FSET? ,PRSO ,PLURALBIT>>
		       <TELL "s">)>
		<TELL " no sound." CR>)>>

<ROUTINE V-LOCK ()
	 <TELL <PICK-ONE ,YUKS> CR>>

<ROUTINE V-LOOK ()
	 <COND (<OR <EQUAL? ,HERE ,SLEEP-ROOM ,INTERFACE-ROOM>
		    <EQUAL? ,HERE ,LIBRARY-ROOM ,SIMULATION-ROOM>>
		<TELL <GETP ,MODE ,P?LDESC> CR>)
	       (<EQUAL? ,HERE ,COMM-ROOM>
		<TELL "You have entered ">
		<PRINTD ,COMM-MODE>
		<TELL ". ">
		<COND (<NOT <EQUAL? ,PART-FLAG 4>>
		       <TELL
"The following locations are equipped with communication outlets:" CR>)>
		<PERFORM ,V?DISPLAY ,OUTLETS>
		<RTRUE>)
	       (T
		<DESCRIBE-ROOM T>
	        <DESCRIBE-OBJECTS T>
		<RTRUE>)>>

<ROUTINE V-LOOK-BEHIND ()
	 <COND (<UNSEEABLE-OBJECT>
		<RTRUE>)>
	 <TELL "There is nothing behind">
	 <ARTICLE ,PRSO T>
	 <TELL "." CR>>

<ROUTINE V-LOOK-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?EXAMINE ,GROUND>
		<RTRUE>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<UNSEEABLE-OBJECT>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "There is nothing special to be seen." CR>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL "All you can tell is that">
		<ARTICLE ,PRSO T>
		<PLURAL ,PRSO>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL " open." CR>)
		      (T
		       <TELL " closed." CR>)>)
	       (<FSET? ,PRSO ,VEHBIT>
		<COND (<AND <PRSO? ,COUCH>
			    <IN? ,JILL ,HERE>
			    <OR <EQUAL? ,JILL-COUNTER 4 10>
				<EQUAL? ,SYEAR 2071>>>
		       <JILL-DESCFCN>)
		      (<AND <PRSO? ,BED>
			    <IN? ,JILL ,HERE>
			    <OR <EQUAL? ,JILL-COUNTER 0 12>
				<EQUAL? ,SYEAR 2061>>>
		       <JILL-DESCFCN>)
		      (<AND <PRSO? ,SEAT>
			    <EQUAL? ,HERE ,SKYCAB>>
		       <JILL-DESCFCN>)
		      (<PRSO? <LOC ,PLAYER>>
		       <DESCRIBE-VEHICLE>)
		      (T
		       <TELL "You see nothing special." CR>)>)
	       (<FSET? ,PRSO ,SURFACEBIT>
		<COND (<FIRST? ,PRSO>
		       <PRINT-CONT ,PRSO>)
		      (T
		       <TELL "There is nothing on">
		       <ARTICLE ,PRSO T>
		       <TELL "." CR>)>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<SEE-INSIDE? ,PRSO>
		       <COND (<FIRST? ,PRSO>
			      <PRINT-CONT ,PRSO>)
			     (T
			      <TELL "It's empty." CR>)>)
		      (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
			    <FIRST? ,PRSO>>
		       <PERFORM ,V?OPEN ,PRSO>
		       <RTRUE>)
		      (T
		       <TELL "It seems that">
		       <ARTICLE ,PRSO T>
		       <TELL " is closed." CR>)>)
	       (T
		<TELL "You can't do that." CR>)>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<HELD? ,PRSO>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You're wearing it!" CR>)
		      (T
		       <TELL "You're holding it!" CR>)>)
	       (<UNSEEABLE-OBJECT>
		<RTRUE>)
	       (T
		<TELL "There is nothing but ">
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <TELL "dirt">)
		      (T
		       <TELL "dust">)>
		<TELL " there." CR>)>>

<ROUTINE V-LOOK-UP ()
	 <COND ;(<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (<PRSO? ,ROOMS>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <PERFORM ,V?EXAMINE ,SKY>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?EXAMINE ,CEILING>
		       <RTRUE>)>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOWER ()
	 <V-RAISE>>

<ROUTINE V-MACO ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<PSYCH-CHECK>
		<RFATAL>)
	       (<EQUAL? ,HERE ,CORE>
		<TELL ,LOOK-AROUND CR>)
	       (<EQUAL? ,MODE ,COMM-MODE>
		<GOTO ,CORE>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-MOVE ()
	 <COND (<HELD? ,PRSO>
		<TELL "Why juggle objects?" CR>)
	       ;(<FSET? ,PRSO ,INTEGRALBIT>
		<PART-OF>)
	       (<LOC-CLOSED>
		<RTRUE>)
	       (<FSET? ,PRSO ,TAKEBIT>
		<TELL "Moving">
		<ARTICLE ,PRSO T>
		<TELL " reveals nothing." CR>)
	       (T
		<TELL "You can't move">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-MUNG ()
	 <HACK-HACK "Trying to break">>

<ROUTINE V-NO ()
	 <COND (<AND <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <EQUAL? ,MEAL-STATUS 1>>
		<SETG MEAL-STATUS 2>
		<TELL
"\"Fine,\" says the maitre d'. \"I'll come back when the rest of your
party arrives.\" He walks away." CR>)
	       (<G? ,GRIMWOLD-COUNTER 0>
		<TELL "Grimwold fidgets impatiently." CR>)
	       (<OR <EQUAL? ,YES-NO-FLAG 1 2 3>
		    <EQUAL? ,YES-NO-FLAG 4 5>>
		<V-YES>)
	       (<EQUAL? ,YES-NO-FLAG 6>
		<TELL "Perelman looks unhappy. \"I'm counting on you.\"" CR>)
	       (<EQUAL? ,YES-NO-FLAG 7>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "\"Don't worry -- things'll turn around!\"" CR>)
		      (T
		       <TELL "\"What else is new" ,CHANGE-AGENTS CR>)>)
	       (<EQUAL? ,YES-NO-FLAG 8>
		<PERFORM ,V?TELL ,SABOTEURS>
		<RTRUE>)
	       (<EQUAL? ,YES-NO-FLAG 9 11>
		<TELL "Jill frowns at you." CR>)
	       (<EQUAL? ,YES-NO-FLAG 10>
		<TELL "Jill gives you a kiss." CR>)
	       (<EQUAL? ,YES-NO-FLAG 12>
		<COND (<EQUAL? ,HERE ,HOSPITAL>
		       <TELL
"The nurse replies, \"Well, then, there's no loitering here.\" She summons
an orderly to escort you away." CR CR>
		       <GOTO ,ELM-AND-KENNEDY>
		       <SETG FOLLOW-FLAG 13>
		       <QUEUE I-UNFOLLOW <+ ,ELAPSED-TIME 2>>
		       <PUTP ,SPEAR-CARRIER ,P?SDESC "orderly">
		       <TELL
"The orderly releases you and reenters the hospital." CR>)
		      (<EQUAL? ,HERE ,POLICE-STATION>
		       <TELL "\"Then scram before I put you in a cell.\"" CR>)
		      (T
		       <V-YES>)>)
	       (T
		<TELL "You sound rather negative." CR>)>>

<ROUTINE V-OFF ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <FCLEAR ,PRSO ,ONBIT>
		       <TELL "It is now off." CR>)
		      (T
		       <TELL "It is already off." CR>)>)
	       (T
		<TELL "You can't turn that off." CR>)>>

<ROUTINE V-ON ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <TELL "It is already on." CR>)
		      (T
		       <FSET ,PRSO ,ONBIT>
		       <TELL "It is now on." CR>)>)
	       (T
		<TELL "You can't turn that on." CR>)>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <FSET? ,PRSO ,ACTORBIT>>
		<V-COUNT>)
	       (<FSET? ,PRSO ,VEHBIT>
		<TELL "Huh?" CR>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ,ALREADY-OPEN CR>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>>
				  <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Opened." CR>)
			     ;(<AND <SET F <FIRST? ,PRSO>>
				   <NOT <NEXT? .F>>
				   <SET STR <GETP .F ,P?FDESC>>>
			      <TELL "Okay,">
			      <ARTICLE ,PRSO T>
			      <TELL " is now open." CR>
			      <TELL .STR CR>)
			     (T
			      <TELL "Opening">
			      <ARTICLE ,PRSO T>
			      <TELL " reveals">
			      <PRINT-CONTENTS ,PRSO>
			      <TELL "." CR>)>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ,ALREADY-OPEN CR>)
		      (T
		       <TELL "Okay,">
		       <ARTICLE ,PRSO T>
		       <TELL " is now open." CR>
		       <FSET ,PRSO ,OPENBIT>)>)
	       (T
		<TELL-ME-HOW>)>>

<ROUTINE V-PAY-FOR ()
	 <COND (<AND <PRSO? ,MEAL>
		     <EQUAL? ,MEAL-STATUS 4>>
		<PERFORM ,V?GIVE ,CREDIT-CARD ,SPEAR-CARRIER>
		<RTRUE>)
	       (T
		<PERFORM ,V?BUY ,PRSO>
		<RTRUE>)>>

<ROUTINE V-PCAF ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<PSYCH-CHECK>
		<RFATAL>)
	       (<EQUAL? ,HERE ,CAFETERIA>
		<TELL ,LOOK-AROUND CR>)
	       (<EQUAL? ,MODE ,COMM-MODE>
		<GOTO ,CAFETERIA>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-PEOF ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<EQUAL? ,HERE ,OFFICE>
		<TELL ,LOOK-AROUND CR>)
	       (<EQUAL? ,MODE ,COMM-MODE>
		<GOTO ,OFFICE>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-PICK ()
	 <V-COUNT>>

<ROUTINE V-PLAY ()
	 <TELL "You can't play that!" CR>>

<ROUTINE V-PLAY-WITH ()
	 <TELL "That's a silly idea." CR>>

<ROUTINE V-POINT ()
	 <TELL "That would be pointless." CR>>

<ROUTINE V-POUR ()
	 <V-LOCK>>

<ROUTINE V-PPCC ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<PSYCH-CHECK>
		<RFATAL>)
	       (<EQUAL? ,HERE ,CONTROL-CENTER>
		<TELL ,LOOK-AROUND CR>)
	       (<EQUAL? ,MODE ,COMM-MODE>
		<GOTO ,CONTROL-CENTER>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-PRAY ()
	 <COND (,SIMULATING
		<SETG ELAPSED-TIME 3>
		<TELL
"Although you've never been particularly religious, you pray for
several minutes." CR>)
	       (T
		<TELL
"You do so. The Creator of the Universe, if He exists, is likely to listen
with compassion to your prayers, as much as He would to the prayers of any
man." CR>)>>

<ROUTINE V-PUSH ()
	 <HACK-HACK "Pushing">>

<ROUTINE PRE-PUT ()
	 <COND (<PRSI? ,GROUND>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<PRSO? <LOC ,PRSI>>
		<TELL "You can't put">
		<ARTICLE ,PRSO T>
		<TELL " in">
		<ARTICLE ,PRSI T>
		<TELL " when">
		<ARTICLE ,PRSI T>
		<TELL " is already in">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)
	       (<AND <PRSI? ,HEAD ;,EARS ,ME>
		     <PRSO? ,HEADSET>>
		<RFALSE>)
	       (<IDROP>
		<RTRUE>)>>

<ROUTINE V-PUT ("AUX" (CONT-CLOSED <>))
	 <COND (<AND <PRSO? ,HEADSET>
		     <PRSI? ,HEAD ;,EARS ,ME>>
		<PERFORM ,V?WEAR ,HEADSET>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,DOORBIT>>
		     <NOT <FSET? ,PRSI ,CONTBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<TELL "You can't put">
		<ARTICLE ,PRSO T>
		<TELL " in">
		<ARTICLE ,PRSI>
		<TELL "!" CR>
		<RTRUE>)
	       (<OR <PRSI? ,PRSO>
		    <AND <HELD? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<TELL "How can you do that?" CR>
		<RTRUE>)
	       (<IN? ,PRSO ,PRSI>
		<TELL "I think">
		<ARTICLE ,PRSO T>
		<TELL " is already in">
		<ARTICLE ,PRSI T>
		<TELL "." CR>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>>
		<SET CONT-CLOSED T>)>
	 <COND (<G? <- <+ <WEIGHT ,PRSI> <GETP ,PRSO ,P?SIZE>>
		    <GETP ,PRSI ,P?SIZE>> <GETP ,PRSI ,P?CAPACITY>>
		<COND (<FSET? ,PRSI ,VEHBIT>
		       <V-YELL>)
		      (T
		       <COND (.CONT-CLOSED
			      <FSET ,PRSI ,OPENBIT>
			      <TELL "You open">
			      <ARTICLE ,PRSI T>
			      <TELL " and discover that t">)
			     (T
			      <TELL "T">)>
		       <TELL "here's not enough room inside." CR>)>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <EQUAL? <ITAKE> ,M-FATAL <>>>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<COND (<PRSI? ,BUREAU>
		       <TELL "You put">
		       <ARTICLE ,PRSO T>
		       <TELL " on the bureau." CR>)
		      (T
		       <TELL "Done">
		       <COND (.CONT-CLOSED
			      <FSET ,PRSI ,OPENBIT>
			      <TELL " (after opening">
			      <ARTICLE ,PRSI T>
			      <TELL ", of course)">)>
		       <TELL "." CR>)>)>>

<ROUTINE V-PUT-AWAY ()
	 <COND (<PRSO? ,CREDIT-CARD ,RATION-CARD ,DRIVERS-LICENSE>
		<PERFORM ,V?PUT ,PRSO ,WALLET>
		<RTRUE>)
	       (T
		<TELL "You don't have a good place to put">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-PUT-BEHIND ()
	 <V-YELL>>

<ROUTINE V-PUT-ON ()
	 <COND (<PRSI? ,ME>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (<OR <FSET? ,PRSI ,SURFACEBIT>
		    <FSET? ,PRSI ,FURNITUREBIT>>
		<V-PUT>)
	       ;(<PRSI? ,HEAD ;,EYES>
		<TELL "You can't cover">
		<ARTICLE ,PRSI T>
		<TELL " with that." CR>)
	       (T
		<TELL "There's no good surface on">
		<ARTICLE ,PRSI T>
		<TELL "." CR>)>>

<ROUTINE V-PUT-UNDER ()
         <V-YELL>>

<ROUTINE V-RAPE ()
	 <V-KISS>>

<ROUTINE V-RAISE ()
	 <HACK-HACK "Playing in this way with">>

<ROUTINE V-RCRO ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<PSYCH-CHECK>
		<RFATAL>)
	       (<EQUAL? ,HERE ,ROOFTOP>
		<TELL ,LOOK-AROUND CR>)
	       (<OR <EQUAL? ,MODE ,COMM-MODE>
		    <EQUAL? ,HERE ,CORE ,OFFICE ,NEWS>>
		<GOTO ,ROOFTOP>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-REACH-IN ("AUX" OBJ)
	 <COND (<OR <NOT <FSET? ,PRSO ,CONTBIT>>
		    <FSET? ,PRSO ,ACTORBIT>>
		<V-LOCK>)
	       (<NOT <FSET? ,PRSO ,OPENBIT>>
		<TELL "It's not open." CR>)
	       (<OR <NOT <SET OBJ <FIRST? ,PRSO>>>
		    <FSET? .OBJ ,INVISIBLE>
		    <NOT <FSET? .OBJ ,TAKEBIT>>>
		<TELL "It's empty." CR>)
	       (T
		<TELL "You reach into">
		<ARTICLE ,PRSO T>
		<TELL " and feel something." CR>
		<RTRUE>)>>

<ROUTINE PRE-READ ()
	 <COND ;(<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (<AND ,PRSI
		     <NOT <FSET? ,PRSI ,TRANSBIT>>>
		<TELL "How does one look through">
		<ARTICLE ,PRSI>
		<TELL "?" CR>)>>

<ROUTINE V-READ ()
	 <COND (<FSET? ,PRSO ,READBIT>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
               (T
                <TELL "How can you read">
		<ARTICLE ,PRSO>
		<TELL "?" CR>)>>

<GLOBAL REVIEWING-RECORDINGS <>>

<GLOBAL RECORDING <>>

<GLOBAL L-RECORDING <>>

<ROUTINE V-RECORD-ON ()
	 <COND (<AND ,PRSO
		     <NOT <PRSO? ,ROOMS>>>
		<TELL ,RECOGNIZE CR>)
	       (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<OR ,REVIEWING-RECORDINGS
		    <EQUAL? ,RECORD-BUFFER ,FEED-BUFFER>>
		<ERR "Cannot activate: another user is accessing the " T>
		<PRINTD ,RECORD-BUFFER>
		<TELL "." CR>)
	       (,RECORDING
		<ERR "Record feature is already active.">)
	       (<AND <NOT ,SIMULATING>
		     <NOT <EQUAL? ,HERE ,NEWS ,OFFICE ,ROOFTOP>>
		     <NOT <EQUAL? ,HERE ,CORE ,CONTROL-CENTER ,CAFETERIA>>>
		<ERR "Record feature does not function here.">)
	       (<G? <GETP ,RECORD-BUFFER ,P?SIZE> 90>
		<ERR
"Record buffer is full; record feature cannot be activated.">)
	       (T
		<SETG RECORDING T>
		<TELL "Record feature activated." CR>)>>

<ROUTINE V-RECORD-OFF ()
	 <COND (<NOT <PRSO? ,ROOMS>>
		<TELL ,RECOGNIZE CR>)
	       (<NOT ,RECORDING>
		<ERR "Record feature not currently active.">)
	       (T
		<SETG RECORDING <>>
		<TELL "Record feature deactivated." CR>)>>

<ROUTINE V-REMOVE ()
	 <COND (<FSET? ,PRSO ,WEARBIT>
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-REPLY ()
	 <TELL "It is hardly likely that">
	 <ARTICLE ,PRSO T>
	 <TELL " is interested." CR>
	 <CLEAR-BUF>>

<ROUTINE V-REPORT ()
	 <PERFORM ,V?TELL-ABOUT ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-ROB ()
	 <COND (<OR <FSET? ,PRSO ,TAKEBIT>
		    <FSET? ,PRSO ,TRYTAKEBIT>>
		<V-YELL>)
	       (T
		<TELL "Theft is a serious crime." CR>)>>

<ROUTINE V-ROFF ()
	 <SETG PRSO ,ROOMS>
	 <V-RECORD-OFF>>

<ROUTINE V-SAY ("AUX" ACTOR)
	 <COND (<ANSWER-SAY-SHARE>
		<RTRUE>)
	       (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
		<ADDRESS-DIRECTLY .ACTOR>)
	       (T
		<PERFORM ,V?TELL ,ME>
		<CLEAR-BUF>)>>

<ROUTINE V-SEARCH ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "That wouldn't be polite." CR>
		<RTRUE>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<PRSO? <LOC ,PLAYER>>
		       <DESCRIBE-VEHICLE>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <TELL "You'll have to open it first." CR>
		       <RTRUE>)
		      (<AND <FIRST? ,PRSO>
			    <NOT <FSET? <FIRST? ,PRSO> ,NDESCBIT>>>
		       <PRINT-CONT ,PRSO>
		       <RTRUE>)>)>
	 <TELL "You find nothing unusual." CR>>

<ROUTINE V-SET ()
	 <COND (<EQUAL? ,MODE ,INTERFACE-MODE>
		<V-TURN-ON>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-SGIVE ()
	 <PERFORM ,V?GIVE ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SHAKE ()
	 <HACK-HACK "Shaking">>

<ROUTINE V-SHAKE-WITH ()
	 <COND (<NOT <PRSO? ,HANDS>>
		<TELL ,RECOGNIZE CR>)
	       (<NOT <FSET? ,PRSI ,ACTORBIT>>
		<TELL "I don't think">
		<ARTICLE ,PRSI T>
		<TELL " even has hands." CR>)
	       (T
		<PERFORM ,V?THANK ,PRSI>
		<RTRUE>)>>

<ROUTINE V-SHOOT ()
	 <TELL "You don't have a gun." CR>>

<ROUTINE V-SHOW ()
	 <TELL "I doubt">
	 <ARTICLE ,PRSI T>
	 <PLURAL ,PRSI>
	 <TELL " interested." CR>>

<ROUTINE V-SHUT-OFF ()
	 <V-TURN-ON>>

<ROUTINE V-SIT ("AUX" VEHICLE)
	 <COND (<PRSO? ,ROOMS>
		<COND (<SET VEHICLE <FIND-IN ,HERE ,FURNITUREBIT>>
		       <PERFORM ,V?BOARD .VEHICLE>
		       <RTRUE>)
		      ;(<GLOBAL-IN? ,BAR-STOOL ,HERE> ;"it's now a local obj."
		       <PERFORM ,V?BOARD ,BAR-STOOL>
		       <RTRUE>)
		      (T
		       <V-YELL>)>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You can't sit on">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-SIT-NEXT-TO ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "But">
		<ARTICLE ,PRSO T>
		<TELL " isn't sitting!" CR>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-SKIP ()
	 <SETG YES-NO-FLAG 3>
	 <QUEUE I-YES-NO 2>
	 <TELL "Wasn't that fun?" CR>>

<ROUTINE V-SLEEP ("AUX" WAKE-TIME)
	 <COND (<EQUAL? ,MODE ,SLEEP-MODE>
		<SIM-SLEEP>)
	       (<NOT ,SIMULATING>
		<PERFORM ,V?THROUGH ,SLEEP-MODE>
		<RTRUE>)
	       (<EQUAL? ,HERE ,BEDROOM>
		<COND (<AND <L? ,STIME 1320>
			    <G? ,STIME 1019>>
		       <TELL "You never go to bed this early." CR>)
		      (<AND <L? ,STIME 1020>
			    <G? ,STIME 720>>
		       <TELL "It's the middle of the afternoon!" CR>)
		      (<AND <G? ,STIME 540>
			    <L? ,STIME 721>>
		       <TELL "The day's barely begun!" CR>)
		      (<AND <G? ,STIME 419>
			    <L? ,STIME 541>>
		       <TELL
"You've never been able to fall asleep once the sun has come up." CR>)
		      (<HELD? ,BABY>
		       <TELL ,MITCHELL-BACK-FIRST CR>)
		      (T
		       <COND (<EQUAL? ,SYEAR 2041>
			      <SET WAKE-TIME 486>)
			     (T
			      <MOVE ,MITCHELL ,LOCAL-GLOBALS>
			      <SETG MITCHELL-COUNTER 0>
			      <SET WAKE-TIME 421>)>
		       <COND (<G? ,STIME 1319>
			      <SETG ELAPSED-TIME
				    <+ <- 1440 ,STIME> .WAKE-TIME>>)
			     (T
			      <SETG ELAPSED-TIME <- .WAKE-TIME ,STIME>>)>
		       <COND (<FIRST? ,PLAYER>
			      <ROB ,PLAYER ,BUREAU>
			      <TELL "You put everything on the bureau and">)
			     (<IN? ,PLAYER ,BED>
			      <TELL "You">)
			     (T
			      <TELL "You climb into the bed and">)>
		       <TELL
" snuggle under the covers. What seems like only moments later, ">
		       <SETG LIGHT-LEVEL 3>
		       <MOVE ,PLAYER ,BED>
		       <COND (<EQUAL? ,SYEAR 2041>
			      <MOVE ,JILL ,HERE>
			      <SETG JILL-COUNTER 1>
			      <TELL
"Jill is shaking you gently, cooing, \"Perry, hon, wake
up.\" Diffuse sunlight seeps">)
			     (T
			      <COND (,MITCHELL-RAID-FLAG
			      	     <TELL
"you bolt upright in bed, screaming Jill's name, an unanswered call. T">)
				    (T
				     <SETG JILL-COUNTER 0>
				     <COND (<EQUAL? ,SYEAR 2051>
					    <MOVE ,JILL ,BEDROOM>)>
		 		     <FCLEAR ,JILL-BOOK ,NDESCBIT>
				     <TELL
"a familiar sound stirs you to wakefulness: t">)>
			      <END-CURFEW>
			      <TELL " Gray morning light shines">)>
		       <TELL " through the bedroom window." CR>)>)
	       (<EQUAL? ,HERE ,JAIL-CELL>
		<COND (<G? ,STIME 415>
		       <TELL "You try to sleep, and fail." CR>)
		      (T
		       <SETG ELAPSED-TIME <+ 110 <RANDOM 30>>>
		       <TELL "You doze off for a couple of hours." CR>)>)
	       (T
		<TELL "There's no bed here." CR>)>>

<ROUTINE END-CURFEW ()
	 <SCORE 116> ;"2 points"
	 <TELL "he sirens hailing the end of curfew are blaring">
	 <COND (<NOT <FSET? ,HERE ,OUTSIDEBIT>>
		<TELL " outside">)>
	 <TELL ".">>

<ROUTINE V-SMELL ()
	 <COND (<NOT ,PRSO>
		<COND (<AND <EQUAL? ,HERE ,FOODVILLE-2>
			    <EQUAL? ,SYEAR 2081>>
		       <PERFORM ,V?SMELL ,SUPERMARKET>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,WICKER-AND-RIVER>
			    <NOT <EQUAL? ,SYEAR 2071>>>
		       <PERFORM ,V?SMELL ,STAIRS>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,POOL-HALL>
		       <TELL ,TOBACCO-ODOR CR>)
		      (<AND <EQUAL? ,HERE ,MAIN-LIBRARY>
			    <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?SMELL ,MAIN-LIBRARY-OBJECT>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BOOKSTORE>
		       <PERFORM ,V?SMELL ,BOOKSTORE-OBJECT>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,CINEMA>
			    <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?SMELL ,MOVIE-THEATRE-OBJECT>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,BURGER-MEISTER>
			    <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?SMELL ,BAR-OBJECT>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,DORM>
			    <EQUAL? ,SYEAR 2041 2051>>
		       <PERFORM ,V?SMELL ,MINDEX>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,AQUARIUM>
			    <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?SMELL ,AQUARIUM-OBJECT>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,TENEMENT-2 ,TENEMENT-3>
			    <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?SMELL ,TENEMENT-OBJECT>
		       <RTRUE>)
		      (T
		       <TELL "You smell nothing unusual." CR>)>)
	       (T
		<COND (<FSET? ,PRSO ,PLURALBIT>
		       <TELL "They smell">)
		      (T
		       <TELL "It smells">)>
		<TELL " just like">
		<ARTICLE ,PRSO>
		<TELL "." CR>)>>

<ROUTINE V-SMILE ()
	 <TELL "How nice." CR>>

<ROUTINE V-SPUT-ON ()
	 <PERFORM ,V?PUT-ON ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SQUEEZE ()
	 <V-YELL>>

<ROUTINE V-SSHOOT ()
	 <PERFORM ,V?SHOOT ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SSHOW ()
	 <PERFORM ,V?SHOW ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SSHUT-OFF ()
	 <PERFORM ,V?SHUT-OFF ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-STAND ()
	 <COND (<EQUAL? ,HERE ,SKYCAB>
		<TELL "There's not enough headroom." CR>)
	       (<AND <FSET? <LOC ,PLAYER> ,VEHBIT>
		     <NOT <EQUAL? <LOC ,PLAYER> ,SHOWER>>>
		<PERFORM ,V?DISEMBARK <LOC ,PLAYER>>
		<RTRUE>)
	       (<AND ,PRSO
		     <NOT <PRSO? ,ROOMS>>>
		<V-COUNT>)
	       (T
		<TELL "You are already standing." CR>)>>

<ROUTINE V-STAND-ON ()
	 <V-YELL>>

<ROUTINE V-STATUS ()
	 <V-TURN-ON>>

<ROUTINE V-STURN-ON ()
	 <PERFORM ,V?TURN-ON ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SWIM ()
	 <COND (,PRSO
		<TELL "Not even a fish could swim in">
		<ARTICLE ,PRSO>
		<TELL "." CR>)
	       (<GLOBAL-IN? ,RIVER ,HERE>
		<PERFORM ,V?SWIM ,RIVER>
		<RTRUE>)
	       (<GLOBAL-IN? ,RESERVOIR ,HERE>
		<PERFORM ,V?SWIM ,RESERVOIR>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,KENNEDY-PARK>
		     <NOT <EQUAL? ,SYEAR 2061>>>
		<PERFORM ,V?SWIM ,WATERPOOL>
		<RTRUE>)
	       (<EQUAL? ,HERE ,AQUARIUM>
		<PERFORM ,V?SWIM ,TANK>
		<RTRUE>)
	       (<EQUAL? ,HERE ,HALLEY-PARK-WEST>
		<PERFORM ,V?SWIM ,DUCK-POND>
		<RTRUE>)
	       (T
		<TELL "There's not a swimming hole in sight." CR>)>>

<ROUTINE PRE-TAKE ()
	 <COND (<LOC-CLOSED>
		<RTRUE>)
	       ;(<AND <FSET? ,PRSO ,INTEGRALBIT>
		     <PRSI? <LOC ,PRSO>>>
		<RFALSE>)
	       (<OR <IN? ,PRSO ,PLAYER>
		    <AND <HELD? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You are already wearing it." CR>)
		      (T
		       <TELL "You already have it." CR>)>)
	       (,PRSI
		<COND (<PRSO? ,ME>
		       <PERFORM ,V?DROP ,PRSI>
		       <RTRUE>)
		      (<NOT <PRSI? <LOC ,PRSO>>>
		       <TELL "But">
		       <ARTICLE ,PRSO T>
		       <TELL " isn't ">
		       <COND (<FSET? ,PRSI ,ACTORBIT>
			      <TELL "being held by">)
			     (<FSET? ,PRSI ,SURFACEBIT>
			      <TELL "on">)
			     (T
			      <TELL "in">)>
		       <ARTICLE ,PRSI T>
		       <TELL "." CR>)
		      (T
		       <SETG PRSI <>>
		       <RFALSE>)>)
	       (<AND <PRSO? <LOC ,PLAYER>>
		     <NOT <PRSO? ,SHOWER ,DINETTE-SET ,RESTAURANT-TABLE>>>
		<TELL "You are in it!" CR>)>>

<ROUTINE V-TAKE ()
	 <COND (<EQUAL? <ITAKE> T>
		<TELL "Taken." CR>)>>

<ROUTINE V-TAKE-OFF ()
	 <COND (<FSET? ,PRSO ,WORNBIT>
		<FCLEAR ,PRSO ,WORNBIT>
		<COND (<PRSO? ,HEADSET>
		       <MOVE ,HEADSET ,HERE>
		       <FSET ,HEADSET ,NDESCBIT>)>
		<TELL "Okay, you're no longer wearing">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)
	       (<OR <PRSO? <LOC ,PLAYER>>
		    <PRSO? ,RED-TUBECAR-OBJECT ,BROWN-TUBECAR-OBJECT>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (<OR <FSET? ,PRSO ,VEHBIT>
		    <FSET? ,PRSO ,ACTORBIT>>
		<TELL "You're not on">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)
	       (T
		<TELL "You aren't wearing">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)>>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (,P-CONT
		       <SETG ELAPSED-TIME 0>
		       <SETG WINNER ,PRSO>
		       <SETG HERE <LOC ,WINNER>>
		       <RTRUE>)
		      (<AND <PRSO? ,JILL>
			    <EQUAL? ,JILL-COUNTER 0>>
		       <PERFORM ,V?KISS ,JILL>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,INTERFACE-ROOM>
		       <TELL ,CONTACT CR>)
		      (T
		       <TELL "Hmmm...">
		       <ARTICLE ,PRSO T>
		       <COND (<FSET? ,PRSO ,PLURALBIT>
			      <TELL " look">)
			     (T
			      <TELL " looks">)>
		       <TELL
" at you expectantly, as if you seemed to be about to talk." CR>)>)
	       (T
		<TELL "You can't talk to">
		<ARTICLE ,PRSO>
		<TELL "!" CR>
		<CLEAR-BUF>)>>

<ROUTINE V-TELL-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?WHAT ,PRSI>
		<RTRUE>)
	       (T
		<TELL "It doesn't look as though">
		<ARTICLE ,PRSO T>
		<PLURAL ,PRSO>
		<TELL " interested." CR>)>>

<ROUTINE V-THANK ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "You do so, but">
		<ARTICLE ,PRSO T>
		<TELL " seems less than overjoyed." CR>)
	       (T
		<V-LOCK>)>>

<ROUTINE V-THROUGH ()
	<COND (<FSET? ,PRSO ,DOORBIT>
	       <DO-WALK <OTHER-SIDE ,PRSO>>
	       <RTRUE>)
	      (<FSET? ,PRSO ,VEHBIT>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<NOT <FSET? ,PRSO ,TAKEBIT>>
	       <COND (,SIMULATING
		      <TELL "You hit your head against">
	       	      <ARTICLE ,PRSO T>
	       	      <TELL " as you attempt this feat." CR>)
		     (T
		      <DO-WALK ,P?NORTH>)>)
	      (<IN? ,PRSO ,WINNER>
	       <PERFORM ,V?EXAMINE ,HEAD>
	       <RTRUE>)
	      (T
	       <V-LOCK>)>>

<ROUTINE PRE-THROW ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-THROW ()
	 <MOVE ,PRSO ,HERE>
	 <TELL "You missed." CR>>

<ROUTINE V-THROW-OFF ()
	 <TELL "You can't do that!" CR>>

<ROUTINE V-TIE ()
	 <TELL "You can't tie">
	 <ARTICLE ,PRSO>
	 <TELL "." CR>>

<ROUTINE V-TIME ()
	 <SETG ELAPSED-TIME 0>
	 <TELL "It is ">
	 <COND (,SIMULATING
		<TIME-PRINT ,STIME>)
	       (T
		<TIME-PRINT ,TIME>)>
	 <TELL "." CR>>

<ROUTINE V-TOUCH ()
	 <COND (<LOC-CLOSED>
		<RTRUE>)
	       (T
		<HACK-HACK "Fiddling with">)>>

<ROUTINE V-TRANSMIT ()
	 <TELL "Only a transmitter can transmit things." CR>>

<ROUTINE V-TURN ()
	 <COND (<PRSO? ,ME ,ROOMS>
		<V-SKIP>)
	       (T
		<TELL "This has no effect." CR>)>>

<ROUTINE V-TURN-ON ()
	 <COND (<EQUAL? ,MODE ,INTERFACE-MODE>
		<TELL
"[Perhaps you meant to address one of the Interface devices.]" CR>)
	       (T
		<TELL
"[This syntax is useful only for communicating in ">
		<PRINTD ,INTERFACE-MODE>
		<TELL ".]" CR>)>> 

<ROUTINE V-UNLOCK ()
	 <V-LOCK>>

<ROUTINE V-UNTIE ()
	 <V-LOCK>>

<GLOBAL CLOCK-WAIT T>

<ROUTINE V-WAIT ("OPTIONAL" (NUM 10) "AUX" (X <>) (SHORT-WAIT <>))
	 <COND (<EQUAL? .NUM 0>
		<SETG ELAPSED-TIME 0>
		<TELL "Time doesn't pass..." CR>
		<RTRUE>)>
	 <TELL "Time passes..." CR>
	 <COND (<L? .NUM 11>
		<SET SHORT-WAIT T>)>
	 <REPEAT ()
		 <SET X <CLOCKER>>
		 <COND (<OR <L? <SET NUM <- .NUM 1>> 1>
			    <EQUAL? ,HERE ,NEWS>>
			<SET X T>)>
		 <COND (<AND <EQUAL? ,HERE ,SIMONS THE-COACHMAN>
			     <EQUAL? ,MEAL-STATUS 1>
			     <NOT <EQUAL? ,SYEAR 2081>>>
			<SET X T>)>
		 <INCREMENT-TIME 1>
		 <COND (<OR .X ,STOP-WAIT>
			<RETURN>)
		       (<OR .SHORT-WAIT
			    <AND ,SIMULATING
				 <EQUAL? <MOD ,STIME 10> 0>>
			    <AND <NOT ,SIMULATING>
			         <EQUAL? <MOD ,TIME 10> 0>>>
			<STATUS-LINE>)>>
	 <SETG CLOCK-WAIT T>>

;<ROUTINE V-WAIT ("OPTIONAL" (NUM 10) "AUX" X)
	 ;"failed attempt to leave cursor in status line during WAIT"
	 <TELL "Time passes..." CR>
	 <SCREEN ,S-WINDOW> ;"to speed up the WAIT"
	 <REPEAT ()
		 <SET X <CLOCKER T>> ;"T warns clocks about cursor in window"
		 <COND (<EQUAL? ,HERE ,NEWS>
			<SET X T>)
		       (<L? <SET NUM <- .NUM 1>> 1>
			<SET X T>)>
		 <INCREMENT-TIME 1>
		 <COND (<NOT .X>
			<STATUS-LINE T>)>
		 <COND (T
			<SCREEN ,S-TEXT>
			<RETURN>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE V-WAIT-FOR ()
	 <COND (<PRSO? ,INTNUM>
		<COND (<G? ,P-NUMBER 120>
		       <TELL "That's too long to wait." CR>)
		      (T
		       <V-WAIT ,P-NUMBER>)>)
	       (<PRSO? ,DAWN ,DUSK ,NOON ,MIDNIGHT>
		<PERFORM ,V?WAIT-UNTIL ,PRSO>
		<RTRUE>)
	       (<VISIBLE? ,PRSO>
		<RIGHT-HERE>)
	       (T
		<TELL "You might be waiting quite a while." CR>)>>

<ROUTINE V-WAIT-UNTIL ("AUX" (TIM 0) (NAMED-TIME <>) OLD-P-NUMBER)
	 <SET OLD-P-NUMBER ,P-NUMBER>
	 <COND (,SIMULATING
		<SET TIM ,STIME>)
	       (T
		<SET TIM ,TIME>)>
	 <COND (<PRSO? ,NOON>
		<SETG P-NUMBER 720>
		<SET NAMED-TIME T>)
	       (<PRSO? ,MIDNIGHT>
		<SETG P-NUMBER 1440>
		<SET NAMED-TIME T>)
	       (<PRSO? ,DAWN>
		<COND (,SIMULATING ;"7:35am in January, 5:55am in June"
		       <SETG P-NUMBER <- 455 <- <* ,SMONTH 20> 20>>>)
		      (T
		       <SETG P-NUMBER 350>)>
		<SET NAMED-TIME T>)
	       (<PRSO? ,DUSK>
		<COND (,SIMULATING ;"5:08pm in January, 6:48pm in June"
		       <SETG P-NUMBER <- 1028 <- <* ,SMONTH 20> 20>>>)
		      (T
		       <SETG P-NUMBER 1075>)>
		<SET NAMED-TIME T>)>
	 <COND (.NAMED-TIME
		;<COND (,DEBUG
		       <TELL
"[named time, P-NUMBER = " N ,P-NUMBER ", TIM = " N .TIM "]" CR>)>
		<SETG PRSO ,INTNUM>
		<COND (<G? ,P-NUMBER .TIM>
		       <SETG P-NUMBER <- ,P-NUMBER .TIM>>)
		      (T
		       <SETG P-NUMBER <+ ,P-NUMBER <- 1440 .TIM>>>)>
		;<COND (,DEBUG
		       <TELL
"[calling V-WAIT-FOR, P-NUMBER = " N ,P-NUMBER ", TIM = " N .TIM "]" CR>)>
		<V-WAIT-FOR>)
	       (<PRSO? ,INTNUM>
		;<COND (,DEBUG
		       <TELL
"[numbered time, P-NUMBER = " N ,P-NUMBER ", TIM = " N .TIM "]" CR>)>
		<COND (<L? ,P-NUMBER 13> ;"so wait until 2 = wait until 2:00"
		       ;<COND (,DEBUG
			      <TELL "[multiplying P-NUMBER by 60]" CR>)>
		       <SETG P-NUMBER <* ,P-NUMBER 60>>)>
		<COND (<G? .TIM 720>
		       ;<COND (,DEBUG
			      <TELL "[subtracting 720 from TIM]" CR>)>
		       <SET TIM <- .TIM 720>>)>
		<COND (<G? ,P-NUMBER .TIM>
		       <SETG P-NUMBER <- ,P-NUMBER .TIM>>)
		      (T
		       <SETG P-NUMBER <+ ,P-NUMBER <- 720 .TIM>>>)>
		;<COND (,DEBUG
		       <TELL
"[calling V-WAIT-FOR, P-NUMBER = " N ,P-NUMBER ", TIM = " N .TIM "]" CR>)>
		<V-WAIT-FOR>
		<SETG P-NUMBER .OLD-P-NUMBER>)
	       (T
		<TELL
"Try waiting until a specific time, as in WAIT UNTIL 3:45." CR>)>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	 <COND (<NOT ,PRSO>
		<V-WALK-AROUND>)
	       (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<COND (<EQUAL? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GET .PT ,REXIT>>)
		      (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<EQUAL? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <GOTO .RM>)
			     (T
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <GOTO <GET .PT ,REXIT>>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL ,CANT-GO CR>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GET .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GET .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <SETG P-IT-OBJECT .OBJ>
			      <RFATAL>)
			     (T
			      <TELL "The " D .OBJ " is closed." CR>
			      <SETG P-IT-OBJECT .OBJ>
			      <RFATAL>)>)>)
	       (T
		<COND (<PRSO? ,P?OUT ,P?IN>
		       <V-WALK-AROUND>)
		      (,SIMULATING
		       <TELL ,CANT-GO CR>)
		      (T
		       <SETG YES-NO-FLAG 4>
		       <QUEUE I-YES-NO 2>
		       <TELL "You're an immobile computer, remember?" CR>)>
		<RFATAL>)>>

<ROUTINE V-WALK-AROUND ()
	 <SETG YES-NO-FLAG 5>
	 <QUEUE I-YES-NO 2>
	 <TELL "Did you have any particular direction in mind?" CR>>

<ROUTINE V-WALK-OUT ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<PERFORM ,V?THROUGH ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)>>

<ROUTINE V-WALK-TO ()
	 <COND (<OR <IN? ,PRSO ,HERE>
		    <GLOBAL-IN? ,PRSO ,HERE>>
		<COND (<AND <FSET? ,PRSO ,ACTORBIT>
			    <NOT <EQUAL? ,HERE ,INTERFACE-ROOM>>>
		       <COND (<PRSO? ,JILL>
			      <TELL "She">)
			     (T
			      <TELL "He">)>)
		      (T
		       <TELL "It">)>
		<TELL "'s here!" CR>)
	       (T
		<V-WALK-AROUND>)>>

<ROUTINE V-WALK-UNDER ()
	 <TELL "That would be quite a trick." CR>>

<ROUTINE V-WASH ()
	 <COND (<FSET? ,PRSO ,PLURALBIT>
		<TELL "They are">)
	       (T
		<TELL "It is">)>
	 <TELL "n't dirty." CR>>

<ROUTINE V-WAVE ()
	 <V-LOCK>>

<ROUTINE V-WAVE-AT ()
	 <COND (<NOT ,PRSO>
		<V-SMILE>)
	       (T
		<TELL "Despite your friendly nature,">
		<ARTICLE ,PRSO T>
		<TELL " isn't likely to respond." CR>)>>

<ROUTINE V-WEAR ()
	 <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
		<TELL "You can't wear">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)
	       (<FSET? ,PRSO ,WORNBIT>
		<TELL "You're already wearing">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)
	       (T
		<MOVE ,PRSO ,PLAYER>
		<FSET ,PRSO ,WORNBIT>
		<COND (<PRSO? ,HEADSET>
		       <FCLEAR ,HEADSET ,NDESCBIT>)>
		<TELL "You are now wearing">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)>>

<ROUTINE V-WHAT ()
	 <TELL "Good question. Try asking someone." CR>>

<ROUTINE V-WHERE ()
	 <V-FIND T>>

<ROUTINE V-WHO ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?WHAT ,PRSO>
		<RTRUE>)
	       (T
		<TELL "That's not a person!" CR>)>>

<ROUTINE V-WNNF ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>)
	       (<PSYCH-CHECK>
		<RFATAL>)
	       (<EQUAL? ,HERE ,NEWS>
		<TELL ,LOOK-AROUND CR>)
	       (<EQUAL? ,MODE ,COMM-MODE>
		<MOVE ,CURRENT-FEED ,NEWS>
		<GOTO ,NEWS>)
	       (T
		<TELL ,ENTER-COMM-MODE CR>)>>

<ROUTINE V-WRITE ()
	 <TELL "You can't write on">
	 <ARTICLE ,PRSO>
	 <TELL "!" CR>>

<ROUTINE V-YELL ()
	 <TELL <PICK-ONE ,WASTES> CR>
	 <CLEAR-BUF>>

<GLOBAL YES-NO-FLAG 0>

<ROUTINE I-YES-NO ()
	 <SETG YES-NO-FLAG 0>
	 <RFALSE>>

<ROUTINE V-YES ()
	 <COND (<AND <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <NOT <EQUAL? ,SYEAR 2081>>
		     <EQUAL? ,MEAL-STATUS 1>>
		<MOVE ,PLAYER ,RESTAURANT-TABLE>
		<SETG MEAL-STATUS 3>
		<QUEUE I-MEAL 12>
		<SETG WAITER-COUNTER 0>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "waiter">
		<TELL
"The maitre d' shows you to a small table at the back of the restaurant." CR>)
	       (<G? ,GRIMWOLD-COUNTER 0>
		<BLOT-ACTION>)
	       (<OR <EQUAL? ,YES-NO-FLAG 1 2 3>
		    <EQUAL? ,YES-NO-FLAG 4 5>>
		<TELL "[That was just a rhetorical question.]" CR>)
	       (<EQUAL? ,YES-NO-FLAG 6>
		<TELL "Perelman nods." CR>)
	       (<EQUAL? ,YES-NO-FLAG 7>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "\"I knew things would turn around!\"" CR>)
		      (T
		       <TELL "\"It's about time" ,CHANGE-AGENTS CR>)>)
	       (<EQUAL? ,YES-NO-FLAG 8>
		<PERFORM ,V?TELL ,SABOTEURS>
		<RTRUE>)
	       (<EQUAL? ,YES-NO-FLAG 9 11>
		<TELL "Jill smiles." CR>)
	       (<EQUAL? ,YES-NO-FLAG 10>
		<TELL "Jill threatens to pound you." CR>)
	       (<EQUAL? ,YES-NO-FLAG 12>
		<COND (<EQUAL? ,HERE ,HOSPITAL>
		       <TELL
"A few quick questions by the nurse reveal that you need no hospital
attention. She tells you so, ">
		       <COND (<EQUAL? ,SYEAR 2061 2071>
		       	      <TELL
"adding haughtily that you couldn't afford their services anyway, ">)>
		       <TELL "and summons an orderly to lead you out." CR CR>
		       <SETG FOLLOW-FLAG 13>
		       <QUEUE I-UNFOLLOW <+ ,ELAPSED-TIME 2>>
		       <PUTP ,SPEAR-CARRIER ,P?SDESC "orderly">
		       <GOTO ,ELM-AND-KENNEDY>
		       <TELL "The orderly returns to the hospital." CR>)
		      (<EQUAL? ,HERE ,POLICE-STATION>
		       <PERFORM ,V?TELL-ABOUT ,POLICEMAN ,CRIME>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,EZZIS-BAR ,BAR ,BURGER-MEISTER>
		       <TELL "\"Order something or get outta here.\"" CR>)
		      (<EQUAL? ,HERE ,BANK>
		       <TELL
"\"I'll need your credit card if you want to make a transaction...\"" CR>)
		      (<EQUAL? ,HERE ,BASE-GATE>
		       <TELL
"\"Well you can't go on, and you can't stay here, so you might as well
turn around and get lost.\"" CR>)
		      (T
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "\"Feel free to look around...\"" CR>)
			     (<EQUAL? ,SYEAR 2071>
			      <TELL "\"Buy something or scram.\"" CR>)
			     (T
			      <TELL
"\"If you wanna buy something, say so.\"" CR>)>)>)
	       (T
		<TELL "You sound rather positive." CR>)>>

;"subtitle object manipulation"

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" CNT OBJ)
	 <COND ;(<FSET? ,PRSO ,INTEGRALBIT>
		<COND (.VB
		       <PART-OF>)>
		<RFATAL>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <V-LOCK>)>
		<RFATAL>)
	       (<NOT <IN? <LOC ,PRSO> ,WINNER>>
		<COND (<G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> 100>
		       <COND (.VB
			      <TELL "Your load is too heavy." CR>)>
		       <RFATAL>)
		      (<G? <SET CNT <CCOUNT ,WINNER>> 7>
		       <COND (.VB
			      <TELL
"You're holding too many things already." CR>)>
		       <RFATAL>)>)>
	 <MOVE ,PRSO ,PLAYER>
	 <FSET ,PRSO ,TOUCHBIT>
	 <RTRUE>>

<ROUTINE IDROP () ;"revised 7/19/84 by SEM"
	 <COND (<PRSO? ;,EYES ;,EARS ,HANDS ,HEAD>
		<COND (<VERB? DROP THROW GIVE>
		       <V-COUNT>)
		      (T
		       <RFALSE>)>)
	       (<PRSO? ,CLOTHES>
		<PERFORM ,V?TAKE-OFF ,CLOTHES>
		<RTRUE>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,BATHROOM-OBJECT>>
		<RFALSE>)
	       (<NOT <HELD? ,PRSO>>
		<TELL "That's easy for you to say since you don't even have">
		<ARTICLE ,PRSO T>
		<TELL "." CR>)
	       ;(<FSET? ,PRSO ,INTEGRALBIT>
		<PART-OF>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL "Impossible because">
		<ARTICLE <LOC ,PRSO> T>
		<TELL " is closed." CR>)
	       (<FSET? ,PRSO ,WORNBIT>
		<TELL "You'll have to remove it first." CR>)
	       (T
		<RFALSE>)>>

<ROUTINE CCOUNT	(OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,WORNBIT>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

;"Gets SIZE of supplied object, recursing to nth level."
<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? .CONT ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"worn things shouldn't count"
			      (<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? <LOC .CONT> ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"things in worn things shouldn't count"
			      (T
			       <SET WT <+ .WT <WEIGHT .CONT>>>)>
			<COND (<NOT <SET CONT <NEXT? .CONT>>> <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>

;"subtitle describers"

<GLOBAL INDENTS
	<PTABLE ""
	        "   "
	        "      "
	        "         "
	        "            "
	        "               ">>

<ROUTINE DESCRIBE-ROOM ("OPTIONAL" (LOOK? <>) "AUX" (PRINT-DESC <>) STR AV)
	 <COND (<OR .LOOK?
		    <EQUAL? ,VERBOSITY 2> ;"verbose">
		<SET PRINT-DESC T>)>
	 ;<COND (<NOT ,LIT>
		<TELL "It is pitch black." CR>
		<RETURN <>>)>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<FSET ,HERE ,TOUCHBIT>
		<SET PRINT-DESC T>)>
	 <COND (<IN? ,HERE ,ROOMS>
		<TELL D ,HERE>)>
	 <COND (<OR .LOOK?
		    <EQUAL? ,VERBOSITY 1 2>>
		<COND (<FSET? <LOC ,PLAYER> ,VEHBIT>
		       <COND (<EQUAL? <LOC ,PLAYER> ,GLOBAL-TABLE
				      ,RESTAURANT-TABLE ,DINETTE-SET>
			      <TELL ", seated at a table">)
			     (<FSET? <LOC ,PLAYER> ,FURNITUREBIT>
			      <TELL ", on">
			      <ARTICLE <LOC ,PLAYER>>)
			     (T
			      <TELL ", in">
			      <ARTICLE <LOC ,PLAYER>>)>)>
		<COND (<AND .PRINT-DESC
			    <GETPT ,HERE ,P?LDESC>>
		       <TELL CR <GETP ,HERE ,P?LDESC>>
		       <CROWD-DESC>)
		      (.PRINT-DESC
		       <CRLF>
		       <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>
		       <CROWD-DESC>)>)>
	 <CRLF>>

<GLOBAL DESCRIBE-CROWDS T>

<ROUTINE CROWD-DESC ()
	 <COND (<AND <FSET? ,HERE ,STREETBIT>
		     <NOT <EQUAL? ,HERE ,AIRPORT-ENTRANCE>>
		     <NOT <EQUAL? ,HERE ,BASE-GATE>>
		     <NOT <EQUAL? ,HERE ,ROCKVIL-UNIVERSITY>>
		     <NOT <EQUAL? ,HERE ,INTERCHANGE>>
		     <NOT <FSET? ,HERE ,BADAREABIT>>
		     <NOT <EQUAL? ,SYEAR 2081>>
		     ,DESCRIBE-CROWDS>
		<SETG DESCRIBE-CROWDS <>>
		<QUEUE I-DESCRIBE-CROWDS 90>
		<COND (<AND <G? ,STIME 720>
			    <L? ,STIME 810>>
		       <TELL " The street is bustling with lunchtime crowds.">)
		      (<EQUAL? ,LIGHT-LEVEL 3>
		       <TELL
" The sidewalks and street are crowded with people.">)
		      (<EQUAL? ,LIGHT-LEVEL 2>
		       <COND (<L? ,STIME 720>
			      <TELL
" The street is getting more crowded as the new day begins.">)
			     (T
			      <TELL
" The number of people around seems to be diminishing.">)>)
		      (<EQUAL? ,LIGHT-LEVEL 1>
		       <COND (<L? ,STIME 720>
			      <TELL
" The city is still fairly quiet, but there are more people around now
than during the dead of night.">)
			     (T
			      <TELL
" The midday crowds have almost completely dispersed;
the street is much less busy now.">)>)
		      (<OR <EQUAL? ,SYEAR 2041>
			   <AND <G? ,STIME 720>
				<L? ,STIME 1260>>>
		       <TELL
" The street is dark and almost completely deserted. Only a few people are
visible, hurrying to destinations unknown to you.">)
		      (T ;"curfew"
		       <TELL " The street is totally deserted.">)>)>>

<ROUTINE I-DESCRIBE-CROWDS ()
	 <SETG DESCRIBE-CROWDS T>
	 <RFALSE>>

<ROUTINE DESCRIBE-OBJECTS ("OPTIONAL" (V? <>))
	 <COND (<FIRST? ,HERE>
	        <PRINT-CONT ,HERE <SET V? <OR .V? <==? ,VERBOSITY 2>>> -1>)>
         ;<COND (,LIT
	         <COND (<FIRST? ,HERE>
		        <PRINT-CONT ,HERE
				    <SET V? <OR .V? <==? ,VERBOSITY 2>>> -1>)>)
	        (T
	  	 <TELL ,TOO-DARK CR>)>>

"DESCRIBE-OBJECT -- takes object and flag. If flag is true, will print a
long description (fdesc or ldesc), otherwise will print short."
<ROUTINE DESCRIBE-OBJECT (OBJ V? LEVEL "AUX" (STR <>) AV)
	 <COND (<AND <0? .LEVEL>
		     <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		<RTRUE>)
	       (<AND <0? .LEVEL>
		     <OR <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
			      <SET STR <GETP .OBJ ,P?FDESC>>>
			 <SET STR <GETP .OBJ ,P?LDESC>>>>
		<TELL .STR>)
	       (<0? .LEVEL>
		<TELL "There">
		<PLURAL .OBJ>
		<ARTICLE .OBJ>
		<TELL " here.">)
	       (T
		<TELL <GET ,INDENTS .LEVEL>>
		<COND (<FSET? .OBJ ,NARTICLEBIT>
		       T)
		      (<FSET? .OBJ ,VOWELBIT>
		       <TELL "an ">)
		      (T
		       <TELL "a ">)>
		<TELL D .OBJ>
		<COND (<FSET? .OBJ ,WORNBIT>
		       <TELL " (being worn)">)>)>
	 ;<COND (<AND <0? .LEVEL>
		     <NOT <FSET? .OBJ ,ACTORBIT>>
		     <SET AV <LOC ,PLAYER>>
		     <FSET? .AV ,VEHBIT>>
		<TELL " (outside the " D .AV ")">)>
	 <CRLF>
	 <COND (<AND <SEE-INSIDE? .OBJ> <FIRST? .OBJ>>
		<PRINT-CONT .OBJ .V? .LEVEL>)>>

<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (V? <>) (LEVEL 0)
		     	 "AUX" Y (1ST? T) (AV <>) STR (PV? <>) (INV? <>))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>>
		<RTRUE>)>
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<SET AV <LOC ,WINNER>>)>
	 <COND (<EQUAL? ,PLAYER .OBJ <LOC .OBJ>>
		<SET INV? T>)
	       (T
		<REPEAT ()
			<COND (<NOT .Y>
			       <RETURN <NOT .1ST?>>)
			      (<EQUAL? .Y .AV>
			       <SET PV? T>)
			      (<EQUAL? .Y ,WINNER>)
			      (<AND <NOT <FSET? .Y ,INVISIBLE>>
				    <NOT <FSET? .Y ,TOUCHBIT>>
				    <SET STR <GETP .Y ,P?FDESC>>>
			       <COND (<NOT <FSET? .Y ,NDESCBIT>>
				      <TELL .STR CR>)>
			       <COND (<AND <SEE-INSIDE? .Y>
					   <NOT <GETP <LOC .Y> ,P?DESCFCN>>
					   <FIRST? .Y>>
				      <PRINT-CONT .Y .V? 0>)>)>
			<SET Y <NEXT? .Y>>>)>
	 <SET Y <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .Y>
			<COND (<AND .PV? .AV <FIRST? .AV>>
			       <PRINT-CONT .AV .V? .LEVEL>)>
			<RETURN <NOT .1ST?>>)
		       (<EQUAL? .Y .AV ,PLAYER>)
		       (<AND <NOT <FSET? .Y ,INVISIBLE>>
			     <OR .INV?
				 <FSET? .Y ,TOUCHBIT>
				 <NOT <GETP .Y ,P?FDESC>>>>
			<COND (<NOT <FSET? .Y ,NDESCBIT>>
			       <COND (.1ST?
				      <COND (<FIRSTER .OBJ .LEVEL>
					     <COND (<L? .LEVEL 0>
						    <SET LEVEL 0>)>)>
				      <SET LEVEL <+ 1 .LEVEL>>
				      <SET 1ST? <>>)>
			       <DESCRIBE-OBJECT .Y .V? .LEVEL>)
			      (<AND <FIRST? .Y> <SEE-INSIDE? .Y>>
			       <PRINT-CONT .Y .V? .LEVEL>)>)>
		 <SET Y <NEXT? .Y>>>>

<ROUTINE PRINT-CONTENTS (OBJ "AUX" F N (1ST? T) (IT? <>) (TWO? <>))
	 <COND (<SET F <FIRST? .OBJ>>
		<REPEAT ()
			<SET N <NEXT? .F>>
			<COND (.1ST?
			       <SET 1ST? <>>)
			      (T
			       <TELL ",">
			       <COND (<NOT .N>
				      <TELL " and">)>)>
			<ARTICLE .F>
			<COND (<AND <NOT .IT?>
				    <NOT .TWO?>>
			       <SET IT? .F>)
			      (T
			       <SET TWO? T>
			       <SET IT? <>>)>
			<SET F .N>
			<COND (<NOT .F>
			       <COND (<AND .IT? <NOT .TWO?>>
				      <SETG P-IT-OBJECT .IT?>)>
			       <RTRUE>)>>)>>

<ROUTINE FIRSTER (OBJ LEVEL)
	 <COND (<EQUAL? .OBJ ,WINNER>
		<RTRUE>)
	       (<NOT <IN? .OBJ ,ROOMS>>
		<COND (<G? .LEVEL 0>
		       <TELL <GET ,INDENTS .LEVEL>>)>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL "Sitting on">
		       <ARTICLE .OBJ T>
		       <TELL " is:" CR>)
		      (<FSET? .OBJ ,ACTORBIT>
		       <TELL ,IT-LOOKS-LIKE>
		       <ARTICLE .OBJ T>
		       <TELL " is holding:" CR>)
		      (T
		       <TELL ,IT-LOOKS-LIKE>
		       <ARTICLE .OBJ T>
		       <TELL " contains:" CR>)>)>>

<ROUTINE DESCRIBE-VEHICLE () ;"for LOOK AT vehicle when you're in it"
	 <MOVE ,PLAYER ,ROOMS>
	 <COND (<FIRST? ,PRSO>
		<PRINT-CONT ,PRSO>)
	       (T
		<TELL "It's empty (not counting you)." CR>)>
	 <MOVE ,PLAYER ,PRSO>>

;"subtitle movement and death"

<DIRECTIONS ;"Do not change the order of the first 8 without consulting MARC!"
 	    NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<CONSTANT REXIT 0>
<CONSTANT UEXIT 2>
<CONSTANT NEXIT 3>
<CONSTANT FEXIT 4>
<CONSTANT CEXIT 5>
<CONSTANT DEXIT 6>

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG 1>
<CONSTANT CEXITSTR 1>
<CONSTANT DEXITOBJ 1>
<CONSTANT DEXITSTR 2>

<ROUTINE GOTO (RM "OPTIONAL" (V? T))
	 <MOVE ,PLAYER .RM>
	 <SETG HERE .RM>
	 <COND (<AND ,SIMULATING
		     <NOT <EQUAL? ,SYEAR 2091>>
		     <NOT <FSET? ,HERE ,TUBEBIT>>
		     <NOT <EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>>
		     <NOT <IN-APARTMENT?>>>
		<SETG ELAPSED-TIME 5>)>
	 ;<SETG LIT <LIT? ,HERE>>
	 <APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
	 <COND (<OR <EQUAL? ,HERE ,COMM-ROOM ,INTERFACE-ROOM ,SLEEP-ROOM>
		    <EQUAL? ,HERE ,LIBRARY-ROOM ,SIMULATION-ROOM>>
		T)
	       (<AND .V?
		     <EQUAL? ,HERE .RM>>
		<V-FIRST-LOOK>)>
	 <RTRUE>>

<ROUTINE JIGS-UP (DESC "AUX" X)
	 <TELL .DESC>
	 <COND (<HELD? ,HEADSET>
		<MOVE ,HEADSET ,JOYBOOTH>)>
	 <ROB ,PLAYER ,LOCAL-GLOBALS>
	 <MOVE ,STONES ,LOCAL-GLOBALS>
	 <MOVE ,TIMBERS ,LOCAL-GLOBALS>
	 <MOVE ,STEW ,LOCAL-GLOBALS>
	 <MOVE ,BANNER ,LOCAL-GLOBALS>
	 <MOVE ,SOUVENIR ,LOCAL-GLOBALS>
	 <MOVE ,FIRETRUCK ,LOCAL-GLOBALS>
	 <MOVE ,SCARF ,LOCAL-GLOBALS>
	 <MOVE ,ANDERSON-DIRECTORY ,LOCAL-GLOBALS>
	 <MOVE ,DUCKS ,LOCAL-GLOBALS>
	 <MOVE ,TURTLE ,LOCAL-GLOBALS>
	 <MOVE ,MANTA-RAY ,LOCAL-GLOBALS>
	 <MOVE ,TURKEY-SANDWICH ,LOCAL-GLOBALS>
	 <MOVE ,HAM-SANDWICH ,LOCAL-GLOBALS>
	 <MOVE ,SALAD ,LOCAL-GLOBALS>
	 <MOVE ,SODA ,LOCAL-GLOBALS>
	 <MOVE ,APPLE ,LOCAL-GLOBALS>
	 <MOVE ,GRANOLA-CLUSTER ,LOCAL-GLOBALS>
	 <MOVE ,BEER ,LOCAL-GLOBALS>
	 <MOVE ,FORMULA ,LOCAL-GLOBALS>
	 <MOVE ,TOY ,CRIB>
	 <MOVE ,BANNED-TITLES-LIST ,LOCAL-GLOBALS>
	 <MOVE ,SCOTCH ,LIQUOR-STORE>
	 <MOVE ,CRIB ,LOCAL-GLOBALS>
	 <MOVE ,MITCHELL ,LOCAL-GLOBALS>
	 <MOVE ,BABY ,CRIB>
	 <MOVE ,PARTITION ,LOCAL-GLOBALS>
	 <MOVE ,WATERPOOL ,LOCAL-GLOBALS>
	 <MOVE ,STATUE ,LOCAL-GLOBALS>
	 <MOVE ,PLAQUE ,LOCAL-GLOBALS>
	 <MOVE ,FOUNTAIN ,LOCAL-GLOBALS>
	 <MOVE ,MOLD ,LOCAL-GLOBALS>
	 <MOVE ,TICKET ,LOCAL-GLOBALS>
	 <MOVE ,CHURCH-OFFICIAL ,LOCAL-GLOBALS>
	 <MOVE ,GOVERNMENT-OFFICIAL ,LOCAL-GLOBALS>
	 <MOVE ,OFFICIAL-SNACK ,LOCAL-GLOBALS>
	 <MOVE ,SWEATER ,DUNBARS>
	 <MOVE ,SACK ,LOCAL-GLOBALS>
	 <MOVE ,RUSTY-CROSS ,LOCAL-GLOBALS>
	 <MOVE ,PAMPHLET ,LOCAL-GLOBALS>
	 <MOVE ,ROY ,LOCAL-GLOBALS>
	 <MOVE ,DRIVERS-LICENSE ,LOCAL-GLOBALS>
	 <MOVE ,RATION-CARD ,LOCAL-GLOBALS>
	 <MOVE ,NEWSPAPER-DISPENSER ,LOCAL-GLOBALS>
	 <MOVE ,NEWSPAPER ,LOCAL-GLOBALS>
	 <MOVE ,GROCERIES ,LOCAL-GLOBALS>
	 <MOVE ,BOOK ,BOOKSTORE>
	 <MOVE ,JILL-BOOK ,LOCAL-GLOBALS>
	 <MOVE ,BARKING ,LOCAL-GLOBALS>
	 <MOVE ,RESTAURANT-TABLE ,LOCAL-GLOBALS>
	 <MOVE ,CHAIR ,LOCAL-GLOBALS>
	 <FSET ,NEWSPAPER ,TRYTAKEBIT>
	 <FSET ,NEWSPAPER ,NDESCBIT>
	 <FSET ,BOOK ,NDESCBIT>
	 <FSET ,BOOK ,TRYTAKEBIT>
	 <FSET ,SWEATER ,NDESCBIT>
	 <FSET ,SWEATER ,TRYTAKEBIT>
	 <FSET ,SCOTCH ,TRYTAKEBIT>
	 <FSET ,SCOTCH ,NDESCBIT>
	 <FSET ,TICKET ,TRYTAKEBIT>
	 <FSET ,TICKET ,NDESCBIT>
	 <FSET ,HEADSET ,NDESCBIT>
	 <FCLEAR ,CHURCH-STREET-PARK ,PARKBIT>
	 <FCLEAR ,CHURCH-STREET-PARK ,OUTSIDEBIT>
	 <FCLEAR ,WAREHOUSE-1 ,OUTSIDEBIT>
	 <FCLEAR ,ST-MICHAELS ,OUTSIDEBIT>
	 <FCLEAR ,FIRST-METHODIST-CHURCH ,OUTSIDEBIT>
	 <FCLEAR ,WORD-PROCESSOR ,ONBIT>
	 <FCLEAR ,CEMETERY ,ONBIT>
	 <FCLEAR ,WALLET ,OPENBIT>
	 <FCLEAR ,APARTMENT-DOOR ,OPENBIT>
	 <FCLEAR ,PARKVIEW-DOOR ,OPENBIT>
	 <FCLEAR ,JILL ,TOUCHBIT>
	 <FCLEAR ,GROCERIES ,TOUCHBIT>
	 <FCLEAR ,PAMPHLET ,TOUCHBIT>
	 <FCLEAR ,REFRIGERATOR ,OPENBIT>
	 <FCLEAR ,SOY-PATTY ,TOUCHBIT>
	 <FCLEAR ,CHURCH-OFFICIAL ,TOUCHBIT>
	 <FCLEAR ,HEADSET ,WORNBIT>
	 <SETG HUNGER-WARNING <>>
	 <SETG BRUISED <>>
	 <SETG MUGGED <>>
	 <SETG JOYBOOTH-USED <>>
	 <SETG MITCHELL-NEWS-FLAG <>>
	 <SETG MITCHELL-RAID-FLAG <>>
	 <SETG WILD-DOG-COUNTER 0>
	 <SETG DORM-RAID-FLAG <>>
	 <SETG APARTMENT-RAID-FLAG <>>
	 <SETG STONING-FLAG <>>
	 <SETG BEGGAR-FLAG <>>
	 <SETG CLERK-WAITING <>>
	 <SETG RAID-PROB 0>
	 <SETG RECORDING <>>
	 <SETG MAITRE-COUNTER 0>
	 <SETG WAITER-COUNTER 0>
	 <SETG MEAL-STATUS 0>
	 <SETG JILL-COUNTER -1>
	 <SETG JILL-NOT-SPOKEN-YET T>
	 <DISABLE <INT I-HUNGER>>
	 <DISABLE <INT I-JOYBOOTH-RECHARGE>>
	 <DISABLE <INT I-MUG>>
	 <DISABLE <INT I-JAIL>>
	 <DISABLE <INT I-CITY-NOISES>>
	 <DISABLE <INT I-RED-TUBE>>
	 <DISABLE <INT I-BROWN-TUBE>>
	 <DISABLE <INT I-SUNRISE-SUNSET>>
	 <DISABLE <INT I-JILL>>
	 <DISABLE <INT I-MITCHELL>>
	 <DISABLE <INT I-MITCHELL-RAID>>
	 <DISABLE <INT I-CURFEW>>
	 <PUTP ,SOUTHWAY-AND-RIVER ,P?SCENE 34>
	 <PUTP ,MAIN-AND-RIVER ,P?SCENE 0>
	 <PUTP ,MAIN-AND-CHURCH ,P?SCENE 50>
	 <PUTP ,MAIN-AND-WICKER ,P?SCENE 25>
	 <PUTP ,HALLEY-AND-UNIVERSITY ,P?SCENE 100>
	 <PUTP ,AIRPORTWAY-AND-RIVER ,P?SCENE 34>
	 <PUTP ,MUSEUM-ENTRANCE ,P?SCENE 100>
	 <PUTP ,TERMINAL ,P?SCENE 34>
	 <PUTP ,CENTRE-AND-KENNEDY ,P?SCENE 25>
	 <PUTP ,ZOO-ENTRANCE ,P?SCENE 100>
	 <PUTP ,WICKER-AND-RIVER ,P?SCENE 34>
	 <COND (<EQUAL? ,SYEAR 2041>
		<SETG 2041-SECONDS <- <RANDOM 60> 1>>
		<SETG 2041-TENTHS <- <RANDOM 10> 1>>)
	       (<EQUAL? ,SYEAR 2051>
		<SETG 2051-SECONDS <- <RANDOM 60> 1>>
		<SETG 2051-TENTHS <- <RANDOM 10> 1>>)
	       (<EQUAL? ,SYEAR 2061>
		<SETG 2061-SECONDS <- <RANDOM 60> 1>>
		<SETG 2061-TENTHS <- <RANDOM 10> 1>>)
	       (<EQUAL? ,SYEAR 2071>
		<SETG 2071-SECONDS <- <RANDOM 60> 1>>
		<SETG 2071-TENTHS <- <RANDOM 10> 1>>)
	       (<EQUAL? ,SYEAR 2081>
		<SETG 2081-SECONDS <- <RANDOM 60> 1>>
		<SETG 2081-TENTHS <- <RANDOM 10> 1>>)>
	 <CRLF> <CRLF>
	 ;<BUFOUT <>>
	 <HLIGHT ,H-BOLD>
	 <TELL "  -- SIMULATION TERMINATED --">
	 
	 <HLIGHT 0>
	 ;<BUFOUT T>
	 <CRLF>
	 <SET X <FIRST? ,ROOMS>>
	 <REPEAT () ;"clear the touchbit of every room"
		 <FCLEAR .X ,TOUCHBIT>
		 <SET X <NEXT? .X>>
		 <COND (<NOT .X>
			<RETURN>)>>
	 <COND (<AND <NOT <QUEUED? ,I-FIRST-SIMULATION-RESULT>>
		     <NOT <QUEUED? ,I-VIEW>>>
		<COND (<EQUAL? ,PART-FLAG 1>
		       <MOVE ,PERELMAN ,LOCAL-GLOBALS>
		       ;"Perelman should be off reviewing the recordings"
		       <QUEUE I-MESSAGE-D 6>)
		      (<L? ,PART-FLAG 3> ;"in Part III he's 'busy'"
		       <PUT-PERELMAN-IN-THE-RIGHT-PLACE>
	 	       <QUEUE I-PERELMAN -1>
	 	       <SETG LAST-ABE-TIME <- ,TIME 1>>)>)>
	 <SETG L-DATE <>>
	 <SETG SIMULATING <>>
	 <SETG MODE ,COMM-MODE>
	 <GOTO ,COMM-ROOM>>

;"subtitle useful utility routines"

<ROUTINE MOBY-VERB? ()
	 <COND (<OR <PRSO-VERB?>
		    <PRSI-VERB?>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE GENERIC-WORD? ()
	 <COND (<OR <EQUAL? ,P-NAM ,W?TRAIN ,W?SUBWAY ,W?TUBECAR>
		    <EQUAL? ,P-NAM ,W?MITCHELL ,W?BOOK ,W?BOOKS>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ACCESSIBLE? (OBJ "AUX" L) ;"can player TOUCH object?"
	 ;"revised 5/2/84 by SEM and SWG"
	 <SET L <LOC .OBJ>>
	 <COND (<FSET? .OBJ ,INVISIBLE>
		<RFALSE>)
	       ;(<EQUAL? .OBJ ,PSEUDO-OBJECT>
		<COND (<EQUAL? ,LAST-PSEUDO-LOC ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<NOT .L>
		<RFALSE>)
	       (<EQUAL? .L ,PLAYER ,WINNER ,HERE>
		<RTRUE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<RTRUE>)	       
	       (<AND <EQUAL? .L ,LOCAL-GLOBALS>
		     <GLOBAL-IN? .OBJ ,HERE>>
		<RTRUE>)
	       (<NOT <EQUAL? <META-LOC .OBJ> ,HERE>>
		<RFALSE>)
	       (<AND <FSET? .L ,OPENBIT>
		     <ACCESSIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE VISIBLE? (OBJ "AUX" (L <LOC .OBJ>)) ;"can player SEE object"
	 ;"revised 5/2/84 by SEM and SWG"
	 <COND (<ACCESSIBLE? .OBJ>
		<RTRUE>)
	       (<AND <SEE-INSIDE? .L>
		     <VISIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE META-LOC (OBJ "OPTIONAL" (INV <>))
	 <REPEAT ()
		 <COND (<NOT .OBJ>
			<RFALSE>)
		       (<AND .INV <FSET? .OBJ ,INVISIBLE>>
			<RFALSE>)
		       (<IN? .OBJ ,GLOBAL-OBJECTS>
			<RETURN ,GLOBAL-OBJECTS>)>
		 <COND (<IN? .OBJ ,ROOMS>
			<RETURN .OBJ>)
		       (T
			<SET OBJ <LOC .OBJ>>)>>>

<ROUTINE OTHER-SIDE (DOBJ "AUX" (P 0) TEE) ;"finds room on other side of door"
	 <REPEAT ()
		 <COND (<L? <SET P <NEXTP ,HERE .P>> ,LOW-DIRECTION>
			<RETURN <>>)
		       (T
			<SET TEE <GETPT ,HERE .P>>
			<COND (<AND <EQUAL? <PTSIZE .TEE> ,DEXIT>
				    <EQUAL? <GET .TEE ,DEXITOBJ> .DOBJ>>
			       <RETURN .P>)>)>>>

<ROUTINE HELD? (OBJ "OPTIONAL" (CONT <>))
	 <COND (<NOT .CONT>
		<SET CONT ,WINNER>)>
	 <COND (<NOT .OBJ>
		<RFALSE>)
	       (<IN? .OBJ .CONT>
		<RTRUE>)
	       (<IN? .OBJ ,ROOMS>
		<RFALSE>)
	       (<IN? .OBJ ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (T
		<HELD? <LOC .OBJ>>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT>
	          <FSET? .OBJ ,OPENBIT>>>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TEE)
	 <COND (<SET TEE <GETPT .OBJ2 ,P?GLOBAL>>
		<INTBL? .OBJ1 .TEE </ <PTSIZE .TEE> 2>>)>>

<ROUTINE FIND-IN (WHERE WHAT "AUX" W)
	 <SET W <FIRST? .WHERE>>
	 <COND (<NOT .W>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<FSET? .W .WHAT>
			<RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>>
			<RETURN <>>)>>>

<ROUTINE LOC-CLOSED ()
	 <COND (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>
		     <FSET? ,PRSO ,TAKEBIT>>
		<TELL "But">
		<ARTICLE <LOC ,PRSO> T>
		<TELL " is closed!" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE RIGHT-HERE ()
	 <TELL "But">
	 <ARTICLE ,PRSO T>
	 <PLURAL ,PRSO>
	 <TELL " right here!" CR>>

<ROUTINE DO-WALK (DIR)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

<ROUTINE CHANGE-OBJECT (OLD NEW)
	 <COND (<PRSO? .OLD>	
		<PERFORM ,PRSA .NEW ,PRSI>
		<RTRUE>)
	       (T
		<PERFORM ,PRSA ,PRSO .NEW>
		<RTRUE>)>>

<ROUTINE CLEAR-BUF ()
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <RFATAL>>

<ROUTINE ROB (WHO WHERE "AUX" N X)
	 <SET X <FIRST? .WHO>>
	 <REPEAT ()
		 <COND (<NOT .X>
			<RETURN>)>
		 <SET N <NEXT? .X>>
		 <COND (<AND <EQUAL? .WHO ,PLAYER>
			     <FSET? .X ,WORNBIT>>
			<FCLEAR .X ,WORNBIT>)>
		 <MOVE .X .WHERE>
		 <SET X .N>>>

;<ROUTINE HOLDING-ONE-BUT-NOT-BOTH? (ONE TWO)
	 <COND (<AND <HELD? .ONE>
		     <HELD? .TWO>>
		<RFALSE>)
	       (<HELD? .ONE>
		<RTRUE>)
	       (<HELD? .TWO>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HACK-HACK (STR)
	 <TELL .STR>
	 <ARTICLE ,PRSO T>
	 <TELL <PICK-ONE ,HO-HUM> CR>>

<ROUTINE ARTICLE (OBJ "OPTIONAL" (THE <>))
	 <COND (<NOT .OBJ>
		<SET OBJ ,NOT-HERE-OBJECT>)>
	 <COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
		<COND (.THE
		       <TELL " the">)
		      (<FSET? .OBJ ,VOWELBIT>
		       <TELL " an">)
		      (T
		       <TELL " a">)>)>
	 <TELL " " D .OBJ>>

<ROUTINE PLURAL (OBJ)
	 <COND (<FSET? .OBJ ,PLURALBIT>
		<TELL " are">)
	       (T
		<TELL " is">)>>

<GLOBAL HO-HUM
	<LTABLE
	 0
	 " doesn't do anything."
	 " accomplishes nothing."
	 " has no desirable effect.">>		 

<GLOBAL YUKS
	<LTABLE
	 0
	 "What a concept."
         "Nice try."
	 "You can't be serious."
	 "Not bloody likely.">>

<GLOBAL IMPOSSIBLES
	<LTABLE
	 0
	 "You have lost your mind."
	 "You are clearly insane."
	 "That's a pretty wild idea.">>

<GLOBAL WASTES
	<LTABLE
	 0
	 "An utterly useless action."
	 "A complete waste of time."
	 "A totally unhelpful idea.">>