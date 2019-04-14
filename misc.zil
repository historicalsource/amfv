"MISC for
			A MIND FOREVER VOYAGING
	     (c) 1985 by Infocom, Inc.  All Rights Reserved."

;"former MACROS.ZIL stuff"

<ZSTR-OFF>

"<SETG C-ENABLED? 0>
<SETG C-ENABLED 1>
<SETG C-DISABLED 0>"

;<ROUTINE ENABLED? (RTN "AUX" C E)
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<==? .C .E>
			<RFALSE>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<COND (<0? <GET .C ,C-ENABLED?>>
			       <RFALSE>)
			      (T
			       <RTRUE>)>)>
		 <SET C <REST .C ,C-INTLEN>>>>

<ROUTINE INT-NO-INSERT (RTN "OPTIONAL" E C (INT <>))
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E> <RFALSE>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<RETURN .C>)>
		 <SET C <REST .C ,C-INTLEN>>>>

<ROUTINE QUEUED? (RTN "AUX" C)
	 <COND (<SET C <INT-NO-INSERT .RTN>>
		<COND (<OR ;<0? <GET .C ,C-ENABLED?>>
			   <0? <GET .C ,C-TICK>>>
		       <RFALSE>)
		      (T <RETURN .C>)>)>>

<ROUTINE RUNNING? (RTN "AUX" C TICK)
	 <COND (<SET C <INT-NO-INSERT .RTN>>
		<SET TICK <GET .C ,C-TICK>>
		<COND (<OR ;<0? <GET .C ,C-ENABLED?>>
			   <0? .TICK>
			   <G? .TICK 1>>
		       <RFALSE>)
		      (T <RETURN .C>)>)>>

<DEFMAC TELL ("ARGS" A)
	<FORM PROG ()
	      !<MAPF ,LIST
		     <FUNCTION ("AUX" E P O)
			  <COND (<EMPTY? .A> <MAPSTOP>)
				(<SET E <NTH .A 1>>
				 <SET A <REST .A>>)>
			  <COND (<TYPE? .E ATOM>
				 <COND (<OR <=? <SET P <SPNAME .E>>
						"CRLF">
					    <=? .P "CR">>
					<MAPRET '<CRLF>>)
				       (<EMPTY? .A>
					<ERROR INDICATOR-AT-END? .E>)
				       (ELSE
					<SET O <NTH .A 1>>
					<SET A <REST .A>>
					<COND (<OR <=? <SET P <SPNAME .E>>
						       "DESC">
						   <=? .P "D">
						   <=? .P "OBJ">
						   <=? .P "O">>
					       <MAPRET <FORM DPRINT .O>>)
					      (<OR <=? .P "NUM">
						   <=? .P "N">>
					       <MAPRET <FORM PRINTN .O>>)
					      (<=? .P "S">
					       <MAPRET <FORM SPRINT .O>>)
					      (<OR <=? .P "CHAR">
						   <=? .P "CHR">
						   <=? .P "C">>
					       <MAPRET <FORM PRINTC .O>>)
					      (ELSE
					       <MAPRET
						 <FORM PRINT
						       <FORM GETP .O .E>>>)>)>)
				(<TYPE? .E STRING ZSTRING>
				 <MAPRET <FORM PRINTI .E>>)
				(<TYPE? .E FORM LVAL GVAL>
				 <MAPRET <FORM PRINT .E>>)
				(ELSE <ERROR UNKNOWN-TYPE .E>)>>>>>

<DEFMAC VERB? ("ARGS" ATMS)
	<MULTIFROB PRSA .ATMS>>

<DEFMAC PRSO? ("ARGS" ATMS)
	<MULTIFROB PRSO .ATMS>>

<DEFMAC PRSI? ("ARGS" ATMS)
	<MULTIFROB PRSI .ATMS>>

<DEFMAC ROOM? ("ARGS" ATMS)
	<MULTIFROB HERE .ATMS>>

<DEFINE MULTIFROB (X ATMS "AUX" (OO (OR)) (O .OO) (L ()) ATM) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .OO 1> <ERROR .X>)
				       (<LENGTH? .OO 2> <NTH .OO 2>)
				       (ELSE <CHTYPE .OO FORM>)>>)>
		<REPEAT ()
			<COND (<EMPTY? .ATMS> <RETURN!->)>
			<SET ATM <NTH .ATMS 1>>
			<SET L
			     (<COND (<TYPE? .ATM ATOM>
				     <CHTYPE <COND (<==? .X PRSA>
						    <PARSE
						     <STRING "V?"
							     <SPNAME .ATM>>>)
						   (ELSE .ATM)> GVAL>)
				    (ELSE .ATM)>
			      !.L)>
			<SET ATMS <REST .ATMS>>
			<COND (<==? <LENGTH .L> 3> <RETURN!->)>>
		<SET O <REST <PUTREST .O
				      (<FORM EQUAL? <CHTYPE .X GVAL> !.L>)>>>
		<SET L ()>>>

<DEFMAC BSET ('OBJ "ARGS" BITS)
	<MULTIBITS FSET .OBJ .BITS>>

<DEFMAC BCLEAR ('OBJ "ARGS" BITS)
	<MULTIBITS FCLEAR .OBJ .BITS>>

<DEFMAC BSET? ('OBJ "ARGS" BITS)
	<MULTIBITS FSET? .OBJ .BITS>>

<DEFINE MULTIBITS (X OBJ ATMS "AUX" (O ()) ATM) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .O 1> <NTH .O 1>)
				       (<EQUAL? .X FSET?> <FORM OR !.O>)
				       (ELSE <FORM PROG () !.O>)>>)>
		<SET ATM <NTH .ATMS 1>>
		<SET ATMS <REST .ATMS>>
		<SET O
		     (<FORM .X
			    .OBJ
			    <COND (<TYPE? .ATM FORM> .ATM)
				  (ELSE <CHTYPE .ATM GVAL>)>>
		      !.O)>>>

<DEFMAC RFATAL ()
	'<PROG () <PUSH 2> <RSTACK>>>

<DEFMAC PROB ('BASE?)
	<FORM NOT <FORM L? .BASE? '<RANDOM 100>>>>

;<ROUTINE PICK-ONE (FROB) ;"totally random PICK-ONE"
	 <GET .FROB <RANDOM <GET .FROB 0>>>>

<ROUTINE PICK-ONE ;"this won't repeat any strings until they've all been used"
	 (FROB "AUX" (L <GET .FROB 0>) (CNT <GET .FROB 1>) RND MSG RFROB)
	 <SET L <- .L 1>>
	 <SET FROB <REST .FROB 2>>
	 <SET RFROB <REST .FROB <* .CNT 2>>>
	 <SET RND <RANDOM <- .L .CNT>>>
	 <SET MSG <GET .RFROB .RND>>
	 <PUT .RFROB .RND <GET .RFROB 1>>
	 <PUT .RFROB 1 .MSG>
	 <SET CNT <+ .CNT 1>>
	 <COND (<==? .CNT .L> <SET CNT 0>)>
	 <PUT .FROB 0 .CNT>
	 .MSG>

;<DEFMAC ENABLE ('INT)
	<FORM PUT .INT ,C-ENABLED? 1>>

<DEFMAC DISABLE ('INT)
	<FORM PUT .INT ,C-RTN 0>>

<ROUTINE SPRINT (OBJ)
	 <COND (<L? .OBJ 10>
		<TELL "   ">)
	       (<L? .OBJ 100>
		<TELL "  ">)
	       (<L? .OBJ 1000>
		<TELL " ">)>
	 <TELL N .OBJ>>

<ROUTINE DPRINT (OBJ)
	 <COND (<GETP .OBJ ,P?MDESC> ;"message desc"
		<TELL "MESSAGE."
		      N <GET <GETP .OBJ ,P?MDESC> 0>
		      "/"
		      N <GET <GETP .OBJ ,P?MDESC> 1>
		      "/"
		      N <GET <GETP .OBJ ,P?MDESC> 2>
		      ".">
		<TIME-PRINT <GET <GETP .OBJ ,P?MDESC> 3>>)
	       (<GETP .OBJ ,P?SDESC>
		<TELL <GETP .OBJ ,P?SDESC>>)
	       (T
		<PRINTD .OBJ>)>>

<ZSTR-ON>

;"former MAIN.ZIL stuff"

<GLOBAL P-WON <>>

<GLOBAL ELAPSED-TIME 1>

<CONSTANT M-FATAL 2>
<CONSTANT M-BEG 1>
<CONSTANT M-END 6>
<CONSTANT M-ENTER 2>
<CONSTANT M-LOOK 3>
<CONSTANT M-FLASH 4>
<CONSTANT M-OBJDESC 5>

<ROUTINE GO ()
	 ;"put interrupts on clock chain"
	 <SETG LAST-ABE-TIME <- ,TIME 1>>
	 ;<QUEUE I-UNFOLLOW 0> ;"so it's always the last interrupt called"
	 <QUEUE I-PERELMAN -1>
	 <QUEUE I-MESSAGE-C 28>
	 <QUEUE I-MESSAGE-Y 1373>	 
	 ;"set up and go"
	 <PUTB ,P-LEXV 0 59>
	 <SETG WINNER ,PLAYER>
	 <SETG HERE ,COMM-ROOM>
	 <SETG MODE ,COMM-MODE>
	 <SETG FEED-BUFFER ,NEWS-BUFFER>
	 <NAME-MESSAGE ,MESSAGE-B>
	 <CHAPTER-PRINT 1>
	 <TELL CR CR CR CR>
	 <PRINT-SPACES 22>
	 <TELL "\"Tomorrow never yet" CR>
	 <PRINT-SPACES 23>
	 <TELL "On any human being rose or set.\"" CR>
	 <PRINT-SPACES 39>
	 <TELL "-- William Marsden" CR CR CR CR CR>
	 <CONTINUE>
	 <INIT-STATUS-LINE 2>
	 <STATUS-LINE>
	 <TELL
"You \"hear\" a message coming in on the official message line: "
<GETP ,MESSAGE-B ,P?TEXT> CR CR>
	 <V-VERSION>
	 <CRLF>
	 <V-LOOK>
	 <MAIN-LOOP>
	 <AGAIN>>    

<ROUTINE MAIN-LOOP ("AUX" TRASH)
	<REPEAT ()
	     <SET TRASH <MAIN-LOOP-1>>>>

<ROUTINE MAIN-LOOP-1 ("AUX" ICNT OCNT NUM CNT OBJ TBL V PTBL OBJ1 TMP NOT-HERE)
     <SETG ELAPSED-TIME 1>
     <SETG INCREMENT-WAIT <>>
     <SETG STOP-WAIT <>>
     <SET CNT 0>
     <SET OBJ <>>
     <SET PTBL T>
     <COND (<SETG P-WON <PARSER>>
	    <SET ICNT <GET ,P-PRSI ,P-MATCHLEN>>
	    <SET OCNT <GET ,P-PRSO ,P-MATCHLEN>>
	    <COND (<AND ,P-IT-OBJECT <ACCESSIBLE? ,P-IT-OBJECT>>
		   <SET TMP <>>
		   <REPEAT ()
			   <COND (<G? <SET CNT <+ .CNT 1>> .ICNT>
				  <RETURN>)
				 (T
				  <COND (<EQUAL? <GET ,P-PRSI .CNT> ,IT>
					 <PUT ,P-PRSI .CNT ,P-IT-OBJECT>
					 <SET TMP T>
					 <RETURN>)>)>>
		   <COND (<NOT .TMP>
			  <SET CNT 0>
			  <REPEAT ()
			   <COND (<G? <SET CNT <+ .CNT 1>> .OCNT>
				  <RETURN>)
				 (T
				  <COND (<EQUAL? <GET ,P-PRSO .CNT> ,IT>
					 <PUT ,P-PRSO .CNT ,P-IT-OBJECT>
					 <RETURN>)>)>>)>
		   <SET CNT 0>)>
	    <SET NUM
		 <COND (<0? .OCNT> .OCNT)
		       (<G? .OCNT 1>
			<SET TBL ,P-PRSO>
			<COND (<0? .ICNT> <SET OBJ <>>)
			      (T <SET OBJ <GET ,P-PRSI 1>>)>
			.OCNT)
		       (<G? .ICNT 1>
			<SET PTBL <>>
			<SET TBL ,P-PRSI>
			<SET OBJ <GET ,P-PRSO 1>>
			.ICNT)
		       (T 1)>>
	    <COND (<AND <NOT .OBJ>
			<1? .ICNT>>
		   <SET OBJ <GET ,P-PRSI 1>>)>
	    <COND (<EQUAL? ,PRSA ,V?WALK>
		   <SET V <PERFORM ,PRSA ,PRSO>>)
		  (<0? .NUM>
		   <COND (<0? <BAND <GETB ,P-SYNTAX ,P-SBITS> ,P-SONUMS>>
			  <SET V <PERFORM ,PRSA>>
			  <SETG PRSO <>>)
			 ;(<NOT ,LIT>
			  <TELL ,TOO-DARK CR>
			  <CLEAR-BUF>)
			 (T
			  <TELL "There isn't anything to ">
			  <SET TMP <GET ,P-ITBL ,P-VERBN>>
			  <COND (<VERB? TELL>
				 <TELL "talk to">)
				(<OR ,P-OFLAG ,P-MERGED>
				 <PRINTB <GET .TMP 0>>)
				(T
				 <WORD-PRINT <GETB .TMP 2>
					     <GETB .TMP 3>>)>
			  <TELL "!" CR>
			  <SET V <>>
			  <CLEAR-BUF>)>)
		  (T
		   <SET NOT-HERE 0>
		   ;<SETG P-MULT <>>
		   ;<COND (<G? .NUM 1>
			  <SETG P-MULT T>)>
		   <SET TMP <>>
		   <REPEAT ()
		    <COND (<G? <SET CNT <+ .CNT 1>> .NUM>
			   <COND (<G? .NOT-HERE 0>
				  <TELL "[The ">
				  <COND (<NOT <EQUAL? .NOT-HERE .NUM>>
					 <TELL "other ">)>
				  <TELL "object">
				  <COND (<NOT <EQUAL? .NOT-HERE 1>>
					 <TELL "s">)>
				  <TELL " that you mentioned ">
				  <COND (<NOT <EQUAL? .NOT-HERE 1>>
					 <TELL "are">)
					(T
					 <TELL "is">)>
				  <TELL "n't here.]" CR>)
				 (<NOT .TMP>
				  <TELL ,REFERRING CR>)>
			   <RETURN>)
			  (T
			   <COND (.PTBL
				  <SET OBJ1 <GET ,P-PRSO .CNT>>
				  <SETG PRSO .OBJ1>
				  <SETG PRSI .OBJ>)
				 (T
				  <SET OBJ1 <GET ,P-PRSI .CNT>>
				  <SETG PRSO .OBJ>
				  <SETG PRSI .OBJ1>)>
			   <COND (<OR <G? .NUM 1>
				      <EQUAL? <GET <GET ,P-ITBL ,P-NC1> 0>
					      ,W?ALL>>
				  <COND (<EQUAL? .OBJ1 ,NOT-HERE-OBJECT>
					 <SET NOT-HERE <+ .NOT-HERE 1>>
					 <AGAIN>)
					(<AND <==? ,P-GETFLAGS ,P-ALL>
					      <DONT-ALL? ,PRSO ,PRSI .PTBL>>
					 <AGAIN>)
					(<AND <VERB? TAKE>
					      ,PRSI
					      <NOT <IN? ,PRSO ,PRSI>>>
					 <AGAIN>)
					(<NOT <ACCESSIBLE? .OBJ1>>
					 <AGAIN>)
					(<NOT <==? .OBJ1 ,BUZZERS ,BOOKS>>
					 <COND (<EQUAL? .OBJ1 ,IT>
						<PRINTD ,P-IT-OBJECT>)
					       (T
						<PRINTD .OBJ1>)>
					 <TELL ": ">)>)>
			   <SET TMP T>
			   <SET V <PERFORM ,PRSA ,PRSO ,PRSI>>
			   <COND (<EQUAL? .V ,M-FATAL>
				  <RETURN>)>)>>)>
	    <COND (<OR <NOT <EQUAL? .V ,M-FATAL>>
		       <EQUAL? ,HERE ,NEWS>>
		   <COND ;(<VERB? TELL BRIEF SUPER-BRIEF VERBOSE
				 SAVE VERSION RESTORE SCRIPT UNSCRIPT>
			  T)
			 (<NOT <EQUAL? ,ELAPSED-TIME 0>>
			  ;<APPLY <GETP <LOC ,WINNER> ,P?ACTION> ,M-END>
			  <SET V <APPLY <GETP ,HERE ,P?ACTION> ,M-END>>)>)>
	    ;<COND (<VERB? AGAIN SAVE RESTORE SCRIPT UNSCRIPT
			  VERBOSE BRIEF SUPER-BRIEF>
		   T)
		  (,P-OFLAG
		   T)
		  (T
		   <SETG L-PRSA ,PRSA>
		   <SETG L-PRSO ,PRSO>
		   <SETG L-PRSI ,PRSI>)>
	    <COND (<NOT ,CLOCK-WAIT>
		   <INCREMENT-TIME ,ELAPSED-TIME>)>
	    ;<SETG TURNS <+ ,TURNS 1>>
	    <COND (<EQUAL? .V ,M-FATAL>
		   <SETG P-CONT <>>)>)
	   (T
	    <SETG P-CONT <>>)>
     <COND (,P-WON
	    ;<COND (<VERB? TELL BRIEF SUPER-BRIEF VERBOSE VERSION QUIT SCORE
			  SAVE RESTORE SCRIPT UNSCRIPT HELP RESTART>
		   T)
		  (<AND <VERB? AGAIN>
			<OR <EQUAL? ,L-PRSA ,V?BRIEF ,V?SUPER-BRIEF ,V?VERBOSE>
			    <EQUAL? ,L-PRSA ,V?SAVE ,V?RESTORE ,V?SCRIPT>
			    <EQUAL? ,L-PRSA ,V?RESTART ,V?QUIT ,V?SCORE>
			    <EQUAL? ,L-PRSA ,V?VERSION ,V?HELP ,V?UNSCRIPT>>>
		   T)
		  (T
		   <STATUS-LINE>
		   <SET V <CLOCKER>>)>
	    <COND (<NOT <EQUAL? ,ELAPSED-TIME 0>>
		   <SET V <CLOCKER>>)>
	    <STATUS-LINE>
	    <SETG PRSA <>>
	    <SETG PRSO <>>
	    <SETG PRSI <>>)>>

<ROUTINE DONT-ALL? (O I ALL-O? "AUX" LOCATION)
	 <SET LOCATION <LOC .O>>
	 <COND (<EQUAL? .O .I>
		<RTRUE>)
	       (<VERB? TAKE>
		<COND (<EQUAL? .LOCATION ,PLAYER ,WINNER>
		       <RTRUE>)
		      (<AND <NOT <FSET? .O ,TAKEBIT>>
			    <NOT <FSET? .O ,TRYTAKEBIT>>>
		       <RTRUE>)
		      (.I
		       <COND (<NOT <EQUAL? .LOCATION .I>>
			      <RTRUE>)
			     (<SEE-INSIDE? .I>
			      <RFALSE>)
			     (T
			      <RTRUE>)>)
		      (<EQUAL? .LOCATION ,HERE ,SHOWER>
		       <RFALSE>)
		      (<FSET? .LOCATION ,SURFACEBIT>
		       <RFALSE>)
		      (<FSET? .LOCATION ,ACTORBIT>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<VERB? DROP PUT PUT-ON THROW>
		<COND (<EQUAL? .LOCATION ,PLAYER ,WINNER>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<AND <VERB? TURN-ON SHUT-OFF>
		     <EQUAL? ,HERE ,INTERFACE-ROOM>>
		<COND (<EQUAL? ,WINNER ,HVAC-CONTROLLER>
		       <COND (<EQUAL? .I ,ALPHA-SECTOR ,BETA-SECTOR>
			      <RFALSE>)
			     (<EQUAL? .I ,GAMMA-SECTOR ,DELTA-SECTOR>
			      <RFALSE>)
			     (T
			      <RTRUE>)>)
		      (T
		       <COND (<EQUAL? .I ,ALPHA-SECTOR>
			      <RFALSE>)
			     (T
			      <RTRUE>)>)>)
	       (T
		<RFALSE>)>>

<ROUTINE FAKE-ORPHAN ("AUX" TMP)
	 <ORPHAN ,P-SYNTAX <>>
	 <TELL "[Be specific: what object do you want to ">
	 <SET TMP <GET ,P-OTBL ,P-VERBN>>
	 <COND (<EQUAL? .TMP 0>
		<TELL "tell">)
	       (<0? <GETB ,P-VTBL 2>>
		<PRINTB <GET .TMP 0>>)
	       (T
		<WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
		<PUTB ,P-VTBL 2 0>)>
	 <SETG P-OFLAG T>
	 <SETG P-WON <>>
	 <PREP-PRINT
	     <GETB ,P-SYNTAX ,P-SPREP1>>
	 <TELL "?]" CR>>

<ROUTINE PERFORM (A "OPTIONAL" (O <>) (I <>) "AUX" (V <>) OA OO OI)
	;<COND (,DEBUG
	       <TELL "[Perform: ">
	       %<COND (<GASSIGNED? PREDGEN> '<TELL N .A>)
		      (T '<PRINC <NTH ,ACTIONS <+ <* .A 2> 1>>>)>
	       <COND (<AND .O <NOT <EQUAL? .A ,V?WALK>>>
		      <TELL " / PRSO = " D .O>)>
	       <COND (.I <TELL " / PRSI = " D .I>)>
	       <TELL "]" CR>)>
	<SET OA ,PRSA>
	<SET OO ,PRSO>
	<SET OI ,PRSI>
	<SETG PRSA .A>
	<COND (<EQUAL? ,IT .I .O>
	       <COND (<NOT .I>
		      <FAKE-ORPHAN>)
		     (T
		      <TELL ,REFERRING CR>)>
	       <RFATAL>)>
	<SETG PRSO .O>
	<COND (<AND ,PRSO
		    <NOT <PRSO? ,INTNUM>>
		    <NOT <VERB? WALK>>
		    <NOT <PRSO? ,NOT-HERE-OBJECT>>>
	       <SETG P-IT-OBJECT ,PRSO>)>
	<SETG PRSI .I>
	;<COND (<NOT <EQUAL? .A ,V?AGAIN>>
	       <SETG L-PRSA .A>
	       <COND (<EQUAL? .A ,V?WALK>
		      <SETG L-PRSO <>>)
		     (T
		      <SETG L-PRSO .O>)>
	       <SETG L-PRSI .I>)>
	<COND (<AND <NOT <EQUAL? .A ,V?WALK>>
		    <EQUAL? ,NOT-HERE-OBJECT ,PRSO ,PRSI>
		    <SET V <D-APPLY "Not Here" ,NOT-HERE-OBJECT-F>>>
	       <SETG P-WON <>>
	       .V)
	      (T
	       <SET O ,PRSO>
	       <SET I ,PRSI>
	       <COND (<SET V <D-APPLY "Actor" <GETP ,WINNER ,P?ACTION>>>
		      .V)
		     (<SET V <D-APPLY "M-Beg" <GETP ,HERE ,P?ACTION> ,M-BEG>>
		      ;<D-APPLY <GETP <LOC ,WINNER> ,P?ACTION ,M-BEG>>
		      .V)
		     (<SET V <D-APPLY "Preaction" <GET ,PREACTIONS .A>>>
		      .V)
		     (<AND .I <SET V <D-APPLY "PRSI" <GETP .I ,P?ACTION>>>>
		      .V)
		     ;(<AND .O
			   <NOT <EQUAL? .A ,V?WALK>>
			   <LOC .O>
			   <GETP <LOC .O> ,P?CONTFCN>
			   <SET V <D-APPLY "Cont" <GETP <LOC .O> ,P?CONTFCN>>>>
		      .V) 
		     (<AND .O
			   <NOT <EQUAL? .A ,V?WALK>>
			   <SET V <D-APPLY "PRSO" <GETP .O ,P?ACTION>>>>
		      .V)
		     (<SET V <D-APPLY <> <GET ,ACTIONS .A>>>
		      .V)>)>
	<SETG PRSA .OA>
	<SETG PRSO .OO>
	<SETG PRSI .OI>
	.V>

<ROUTINE D-APPLY (STR FCN "OPTIONAL" (FOO <>) "AUX" RES)
	<COND (<NOT .FCN> <>)
	      (T
	       ;<COND (,DEBUG
		      <COND (<NOT .STR>
			     <TELL CR "  Default ->" CR>)
			    (T <TELL CR "  " .STR " -> ">)>)>
	       <SET RES
		    <COND (.FOO <APPLY .FCN .FOO>)
			  (T <APPLY .FCN>)>>
	       ;<COND (<AND ,DEBUG .STR>
		      <COND (<EQUAL? .RES ,M-FATAL>
			     <TELL "Fatal" CR>)
			    (<NOT .RES>
			     <TELL "Not handled">)
			    (T
			     <TELL "Handled" CR>)>)>
	       .RES)>>

;"former CLOCK.ZIL stuff"

<GLOBAL C-TABLE %<COND (<GASSIGNED? PREDGEN>
			'<ITABLE NONE 50>)
		       (T
			'<ITABLE NONE 100>)>>

<CONSTANT C-TABLELEN 100>

<GLOBAL C-INTS 100>

<CONSTANT C-INTLEN 4>

;<CONSTANT C-ENABLED? 0>

<CONSTANT C-TICK 1>

<CONSTANT C-RTN 0>

<ROUTINE QUEUE (INTERRUPT-ROUTINE TICK-NUMBER "AUX" CLOCKER-INT)
	 <PUT <SET CLOCKER-INT <INT .INTERRUPT-ROUTINE>> ,C-TICK .TICK-NUMBER>
	 .CLOCKER-INT>

<ROUTINE INT (RTN "OPTIONAL" E C (INT <>))
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E>
			<COND (<NOT .INT>
			       <COND (<L? ,C-INTS ,C-INTLEN>
				      <TELL "Bug #25I" CR>)>
			       <SETG C-INTS <- ,C-INTS ,C-INTLEN>>
			       <SET INT <REST ,C-TABLE ,C-INTS>>)>
			<PUT .INT ,C-RTN .RTN>
			<RETURN .INT>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<RETURN .C>)
		       (<AND <NOT .INT>
			     <ZERO? <GET .C ,C-RTN>>>
			<SET INT .C>)>
		 <SET C <REST .C ,C-INTLEN>>>>

<ROUTINE CLOCKER ("AUX" C E TICK RTN (FLG <>))
	 <COND (,CLOCK-WAIT
		<SETG CLOCK-WAIT <>>
		<RFALSE>)>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <REPEAT ()
	      <COND (<==? .C .E>
		     <RETURN .FLG>)>
	      <SET RTN <GET .C ,C-RTN>>
	      <COND (<NOT <ZERO? .RTN>>
		     <SET TICK <GET .C ,C-TICK>>
		     <COND (T ;<NOT <ZERO? .TICK>>;"test only if <QUEUE ... 0>"
			    <COND (<==? .TICK -1>
				   <COND (<APPLY .RTN>
					  <SET FLG T>)>)
				  (T
				   <SET TICK <- .TICK ,ELAPSED-TIME>>
				   <COND (<G? .TICK 0>
					  <PUT .C ,C-TICK .TICK>)
					 (T
					  ;<PUT .C ,C-TICK 0>
					  <COND (T ;<ZERO? .TICK>
						 <PUT .C ,C-RTN 0>)>
					  <COND (<APPLY .RTN>
						 <SET FLG T>)>)>)>)>)>
	      <SET C <REST .C ,C-INTLEN>>>>

<GLOBAL INCREMENT-WAIT <>>

<GLOBAL STOP-WAIT <>>

<ROUTINE INCREMENT-TIME (X "AUX" TMP)
	 <SETG TIME <+ ,TIME .X>>
	 <COND (<G? ,TIME 1439>
		<SETG TIME <- ,TIME 1440>>
		<SETG DATE <+ ,DATE 1>>
		<COND (<EQUAL? ,DATE 18>
		       <SETG FEED-BUFFER ,REPORT-BUFFER>)
		      (T
		       <SETG FEED-BUFFER ,NEWS-BUFFER>)>
		<COND (<G? ,DATE 28>
		       <COND (<OR <EQUAL? ,DATE 32>
				  <EQUAL? ,MONTH 2>
				  <AND <EQUAL? ,DATE 31>
				       <OR <EQUAL? ,MONTH 4 6 9>
					   <EQUAL? ,MONTH 11>>>>
			      <SETG DATE 1>
			      <SETG MONTH <+ ,MONTH 1>>
			      ;<COND (<EQUAL? ,MONTH 13>
				     <SETG MONTH 1>
				     <SETG YEAR <+ ,YEAR 1>>)>)>)>
		<COND (<EQUAL? ,HERE ,ROOF>
		       <COND (<EQUAL? ,TIME 348>
			      <TELL CR
"The first glow of dawn appears on the horizon." CR>)
			     (<EQUAL? ,TIME 378>
			      <TELL CR
"The sun is now well above the horizon; day has begun." CR>)
			     (<EQUAL? ,TIME 1073>
			      <TELL CR
"The sky begins to darken as the sun sinks into the western sky." CR>)
			     (<EQUAL? ,TIME 1103>
			      <TELL CR
"The last glow of dusk fades as nighttime falls across the rooftop." CR>)>)>)>
	 <COND (,SIMULATING
		<SET TMP ,STIME>
		<SETG STIME <+ ,STIME .X>>
		<COND (<G? ,STIME 1439>
		       <SETG STIME <- ,STIME 1440>>
		       <SETG SDATE <+ ,SDATE 1>>
		       <COND (<G? ,SDATE 28>
			      <COND (<OR <EQUAL? ,SDATE 32>
					 <EQUAL? ,SMONTH 2>
					 <AND <EQUAL? ,SDATE 31>
					      <OR <EQUAL? ,SMONTH 4 6 9>
						  <EQUAL? ,SMONTH 11>>>>
				     <SETG SDATE 1>
				     <SETG SMONTH <+ ,SMONTH 1>>
				     ;<COND (<EQUAL? ,SMONTH 13>
					    <SETG SMONTH 1>
					    <SETG SYEAR <+ ,SYEAR 1>>)>)>)>)>
		<PUT ,SIM-LEVEL-TABLE <CONVERT-SYEAR-TO-NUM>
		     <+ .X <GET ,SIM-LEVEL-TABLE <CONVERT-SYEAR-TO-NUM>>>>
		;<COND (<EQUAL? ,SYEAR 2041>
		       <SETG 2041-SIMULATION-LEVEL
			     <+ ,2041-SIMULATION-LEVEL .X>>)
		      (<EQUAL? ,SYEAR 2051>
		       <SETG 2051-SIMULATION-LEVEL
			     <+ ,2051-SIMULATION-LEVEL .X>>)
		      (<EQUAL? ,SYEAR 2061>
		       <SETG 2061-SIMULATION-LEVEL
			     <+ ,2061-SIMULATION-LEVEL .X>>)
		      (<EQUAL? ,SYEAR 2071>
		       <SETG 2071-SIMULATION-LEVEL
			     <+ ,2071-SIMULATION-LEVEL .X>>)
		      (T
		       <SETG 2081-SIMULATION-LEVEL
			     <+ ,2081-SIMULATION-LEVEL .X>>)>
		<COND (<TUBES-CLOSE?>
		       <TELL CR
"A surly cop warns that curfew is approaching and hustles you out of the ">
		       <PRINTD ,TUBE-STATION>
		       <TELL "." CR CR>
		       <COND (<EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>
			      <MOVE ,PLAYER <GET ,RED-TABLE ,RED-POINTER>>
			      <SETG HERE <GET ,RED-TABLE ,RED-POINTER>>)>
		       <DO-WALK ,P?UP>)
		      (<AND <EQUAL? ,HERE ,ROCKVIL-STADIUM>
			    <EQUAL? ,SYEAR 2061 2071>>
		       <COND (<AND <G? ,STIME 1154>
				   <L? ,STIME 1200>
				   <NOT ,INCREMENT-WAIT>
				   ;"already told during wait">
			      <SETG INCREMENT-WAIT T>
			      <TELL CR
"As the day's executions wind to a conclusion, the people in the stands
begin heading toward the exits." CR>)
			     (<EQUAL? ,STIME 480> ;"already told during wait"
			      <SETG STOP-WAIT T>
			      <TELL CR
"People begin gathering in the stands as the day's executions begin." CR>)>)>
		<COND (<NOT <EQUAL? ,SYEAR 2041 2081>>
		       <COND (<AND <G? ,STIME 1260>
				   <NOT <G? .TMP 1260>>>
			      ;"has it just passed 9:00pm?"
			      <QUEUE I-CURFEW 15>
			      <SETG STOP-WAIT T>
			      <SCORE 116> ;"2 points"
			      <TELL CR
"A surge of adrenal fear passes through you as sirens all around begin
wailing, an audio sine wave announcing the beginning of curfew." CR>)
			     (<AND <G? ,STIME 420>
				   <NOT <G? .TMP 420>>
				   <NOT <VERB? SLEEP>>>
			      ;"has it just passed 7:00am?"
			      <SETG STOP-WAIT T>
			      <TELL CR "T">
			      <END-CURFEW>
			      <CRLF>)>)>)>
	 <COND (,RECORDING
		<COND (<OR <EQUAL? ,HERE ,LIVING-ROOM ,KITCHEN>
			   <EQUAL? ,HERE ,BEDROOM ,BATHROOM>>
		       ;<IN-APARTMENT?>
		       <PUT ,RECORDING-TABLE 16 1>)
		      (<EQUAL? ,HERE ,COURTHOUSE>
		       <PUT ,RECORDING-TABLE 10 1>)
		      (<EQUAL? ,HERE ,POWER-STATION>
		       <PUT ,RECORDING-TABLE 4 1>)>
		<COND (<EQUAL? ,SYEAR 2051>
		       <SETG 2051-RECORDED T>)
		      (<EQUAL? ,SYEAR 2061>
		       <SETG 2061-RECORDED T>)
		      (<EQUAL? ,SYEAR 2071>
		       <SETG 2071-RECORDED T>)
		      (<EQUAL? ,SYEAR 2081>
		       <SETG 2081-RECORDED T>)>
		<SET TMP <GETP ,RECORD-BUFFER ,P?SIZE>>
		<PUTP ,RECORD-BUFFER ,P?SIZE <+ .TMP .X>>
		<COND (,SIMULATING
		       <SETG RECORDINGS-INCLUDE-SIMULATION T>)>
		<COND (<AND <G? <GETP ,RECORD-BUFFER ,P?SIZE> 45>
			    <NOT <G? .TMP 45>>>
		       <SOUND 1>
		       <TELL CR "WARNING: Record buffer is now half-full." CR>)
		      (<G? <GETP ,RECORD-BUFFER ,P?SIZE> 90>
		       <SETG RECORDING <>>
		       <PUTP ,RECORD-BUFFER ,P?SIZE 90>
		       <SOUND 1>
		       <TELL CR
"WARNING: Record buffer full. Auto-deactivation of record feature." CR>)>)>>

<ROUTINE TUBES-CLOSE? ()
	 <COND (<EQUAL? ,SYEAR 2041>
		<RFALSE>)
	       (<L? ,STIME 1250>
		<RFALSE>)
	       (<FSET? ,HERE ,TUBEBIT>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,RED-TUBECAR>
		     ,RED-TUBECAR-IN-STATION>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,BROWN-TUBECAR>
		     ,BROWN-TUBECAR-IN-STATION>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ITALICIZE (STR "OPTIONAL" (NO-CAPS? <>)
			"AUX" LEN (PTR 2) CHAR (SCRIPTING-ON <>))
	 <BUFOUT <>>
	 <BUFOUT T>
	 <COND (<BTST <GET 0 8> 1>
		<SET SCRIPTING-ON T>)>
	 <COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-OFF>)>
	 <DIROUT ,D-SCREEN-OFF>
	 <DIROUT ,D-TABLE-ON ,SL-BUFFER>
	 <TELL .STR>
	 <DIROUT ,D-TABLE-OFF>
	 <COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-ON>)>
	 <COND (<NOT <VERB? SCRIPT UNSCRIPT>>
		<DIROUT ,D-SCREEN-ON>)>
	 <SET LEN <+ <GET ,SL-BUFFER 0> 1>>
	 <COND (<EQUAL? .LEN 1>
		<RTRUE>)
	       (<OR <ZERO? <GETB 0 18>>  ; "ZIL?"
		    <BAND <GETB 0 1> 8>> ; "ITALICS BIT SET?"
		<HLIGHT ,H-ITALIC>
		<REPEAT ()
			<SET CHAR <GETB ,SL-BUFFER .PTR>>
			<COND (<EQUAL? .CHAR 32> ; "SPACE?"
			       <HLIGHT ,H-NORMAL>
			       <PRINTC 32>
			       <HLIGHT ,H-ITALIC>)
			      (T
			       <PRINTC .CHAR>)>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>
		<HLIGHT ,H-NORMAL>)
	       (.NO-CAPS?
		<TELL .STR>)
	       (T                       ; "NO ITALICS, CAPITALIZE"
		<REPEAT ()
			<SET CHAR <GETB ,SL-BUFFER .PTR>>
			<COND (<AND <G? .CHAR 96>
				    <L? .CHAR 123>>
			       <SET CHAR <- .CHAR 32>>)>
			<PRINTC .CHAR>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>)>>

<ROUTINE CONVERT-SYEAR-TO-NUM ()
	 <RETURN </ <- ,SYEAR 2041> 10>>>