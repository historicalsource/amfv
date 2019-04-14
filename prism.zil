"PRISM for
			 A MIND FOREVER VOYAGING
	(c) Copyright 1985 Infocom, Inc.  All Rights Reserved."

<ROUTINE PERELMAN-LEAVES-VIEW ()
	 <COND (<VISIBLE? ,PERELMAN>
		<TELL CR "A ">
		<PRINTD ,CC-STAFFER>
		<TELL
" dashes in and hands Perelman a note before leaving. Glancing at the note,
Perelman walks to a point beyond your field of vision. A moment later, you
hear a click, as of a switch being turned." CR>)>>

<ROUTINE PERELMAN-RETURNS-TO-VIEW ()
	 <COND (<VISIBLE? ,PERELMAN>
		<TELL CR
"A moment later, Perelman walks back into your field of vision." CR>)>
	 <RTRUE>>

<ROUTINE I-MESSAGE-C ("AUX" OLD-WINNER)
	 <MOVE ,MESSAGE-C ,PRISM-MESSAGES-DIRECTORY>
	 <NAME-MESSAGE ,MESSAGE-C>
	 <PUT ,SIM-LEVEL-TABLE 0 0> ;"this allows you to enter Sim. Mode"
	 <QUEUE I-MESSAGE-M 875>
	 <PERELMAN-LEAVES-VIEW>
	 <SET OLD-WINNER ,WINNER>
	 <SETG WINNER ,PLAYER>
	 <TELL CR ,MESSAGE-LINE>
   	 <PERFORM ,V?READ ,MESSAGE-C>
	 <SETG WINNER .OLD-WINNER>
	 <UPDATE-LIBRARY-BOX>
	 <PERELMAN-RETURNS-TO-VIEW>>

<ROUTINE I-MESSAGE-D ("AUX" OLD-WINNER)
	 <COND (,SIMULATING
		<RFALSE>)
	       (<IN? ,MESSAGE-D ,PRISM-MESSAGES-DIRECTORY>
		<SETG REVIEWING-RECORDINGS T>
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"We're getting ready to review your new recordings. I hope
everything's there this time.\"" CR>
		<PERELMAN-RETURNS-TO-VIEW>)
	       (T
		<SETG REVIEWING-RECORDINGS T>
		<MOVE ,MESSAGE-D ,PRISM-MESSAGES-DIRECTORY>
	 	<NAME-MESSAGE ,MESSAGE-D>
		<PERELMAN-LEAVES-VIEW>
	 	<TELL CR ,MESSAGE-LINE>
		<SET OLD-WINNER ,WINNER>
		<SETG WINNER ,PLAYER>
	 	<PERFORM ,V?READ ,MESSAGE-D>
		<SETG WINNER .OLD-WINNER>
		<UPDATE-LIBRARY-BOX>
		<PERELMAN-RETURNS-TO-VIEW>)>
	 <QUEUE I-MESSAGE-E <+ <GETP ,RECORD-BUFFER ,P?SIZE> 10>>
	 <RTRUE>>

<ROUTINE I-MESSAGE-E ()
	 <COND (<IN? ,MESSAGE-E ,PRISM-MESSAGES-DIRECTORY>
		<SETG MESSAGE-E-COUNTER <+ ,MESSAGE-E-COUNTER 1>>
		<COND (<EQUAL? ,MESSAGE-E-COUNTER 4>
		       <PERELMAN-LEAVES-VIEW>
		       <TELL CR
,MESSAGE-LINE ,PRIVATE-LINE "Why have you been ignoring my requests">
		       <DISCONNECTED>)
		      (<AND <EQUAL? ,MESSAGE-E-COUNTER 1>
			    <EQUAL? ,PART-FLAG 1>>
		       <QUEUE I-FIRST-SIMULATION-RESULT 7>
		       <PERELMAN-LEAVES-VIEW>
		       <TELL CR
,MESSAGE-LINE ,PRIVATE-LINE ,COME-TO-MY-OFFICE CR>
		       <PERELMAN-RETURNS-TO-VIEW>)
		      (T
		       <PERELMAN-LEAVES-VIEW>
		       <TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"Please activate the comm outlet in my office! ">
		       <COND (<QUEUED? ,I-RORSCHACH>
			      <TELL
"Dr. Grimwold has some psych tests!\"" CR>)
			     (T
			      <TELL
"I want to discuss the results of the simulation with you!\"" CR>)>
		       <PERELMAN-RETURNS-TO-VIEW>)>)
	       (T
		<MOVE ,MESSAGE-E ,PRISM-MESSAGES-DIRECTORY>
		<NAME-MESSAGE ,MESSAGE-E>
		<QUEUE I-FIRST-SIMULATION-RESULT 7>
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE <GETP ,MESSAGE-E ,P?TEXT> CR>
		<UPDATE-LIBRARY-BOX>
		<PERELMAN-RETURNS-TO-VIEW>)>
	 <QUEUE I-MESSAGE-E 14>>

<ROUTINE I-MESSAGE-M ()
	 ;<COND (<OR ,SIMULATING ;"let SIMULATION-ACTION disable I-MESSAGE-M"
		    <QUEUED? ,I-FIRST-SIMULATION-RESULT>>
		<RFALSE>)>
	 <COND (<EQUAL? <GETP ,MESSAGE-M ,P?CAPACITY> 0>
		<PUTP ,MESSAGE-M ,P?CAPACITY 1>
		<NAME-MESSAGE ,MESSAGE-M>
		<MOVE ,MESSAGE-M ,PRISM-MESSAGES-DIRECTORY>
		<QUEUE I-MESSAGE-M 177>
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE <GETP ,MESSAGE-M ,P?TEXT> CR>
		<UPDATE-LIBRARY-BOX>
		<PERELMAN-RETURNS-TO-VIEW>)
	       (<EQUAL? <GETP ,MESSAGE-M ,P?CAPACITY> 1>
		<PUTP ,MESSAGE-M ,P?CAPACITY 2>
		<QUEUE I-MESSAGE-M 131>
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"PRISM, what's the matter? You haven't started the simulation yet! For
heaven's sake, don't you know the whole country's impatient? Vera is hopping
mad -- if you don't begin soon, I can't tell what's going to happen!\"" CR>
		<PERELMAN-RETURNS-TO-VIEW>)
	       (T
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"\"What's the matter with you? Why didn't you enter ">
		<PRINTD ,SIMULATION-MODE>
		<DISCONNECTED>)>>

<ROUTINE I-MESSAGE-Q ()
	 <COND (<OR <L? ,TIME 540>
		    <G? ,TIME 1260>>
		<QUEUE I-MESSAGE-Q 30>
		<RFALSE>)>
	 <MOVE ,MESSAGE-Q ,PRISM-MESSAGES-DIRECTORY>
	 <PERELMAN-LEAVES-VIEW>
	 <NAME-MESSAGE ,MESSAGE-Q>
	 <TELL CR ,MESSAGE-LINE>
	 <TELL <GETP ,MESSAGE-Q ,P?TEXT> CR>
	 <PERELMAN-RETURNS-TO-VIEW>
	 <UPDATE-LIBRARY-BOX>>

<ROUTINE I-MESSAGE-Z ("AUX" OLD-WINNER)
	 <COND (<IN? ,MESSAGE-Z ,PRISM-MESSAGES-DIRECTORY>
		<MOVE ,WNN-FEEDER ,INTERFACE-ROOM>
	 	<MOVE ,WNN-INSTRUCTIONS ,PRISM-INTERFACES-DIRECTORY>
		<MOVE ,TRANSMITTER ,INTERFACE-ROOM>
		<MOVE ,NEWS-BUFFER ,GLOBAL-OBJECTS>
		<MOVE ,REPORT-BUFFER ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (T
	 	<QUEUE I-MESSAGE-Z 274>
		<MOVE ,MESSAGE-Z ,PRISM-MESSAGES-DIRECTORY>
	 	<NAME-MESSAGE ,MESSAGE-Z>
	 	<TELL CR ,MESSAGE-LINE>
		<SET OLD-WINNER ,WINNER>
		<SETG WINNER ,PLAYER>
	 	<PERFORM ,V?READ ,MESSAGE-Z>
		<SETG WINNER .OLD-WINNER>
		<UPDATE-LIBRARY-BOX>)>>

<ROUTINE I-MESSAGE-Y ("AUX" OLD-WINNER)
	 <MOVE ,MESSAGE-Y ,PRISM-MESSAGES-DIRECTORY>
	 <NAME-MESSAGE ,MESSAGE-Y>
	 <MOVE ,AUDITING-SYSTEM ,INTERFACE-ROOM>
	 <MOVE ,AUDITING-INSTRUCTIONS ,PRISM-INTERFACES-DIRECTORY>
	 <TELL CR ,MESSAGE-LINE>
	 <SET OLD-WINNER ,WINNER>
	 <SETG WINNER ,PLAYER>
	 <PERFORM ,V?READ ,MESSAGE-Y>
	 <SETG WINNER .OLD-WINNER>
	 <UPDATE-LIBRARY-BOX>>

<ROUTINE NAME-MESSAGE (OBJ)
	 <PUT <GETP .OBJ ,P?MDESC> 0 ,MONTH>
	 <PUT <GETP .OBJ ,P?MDESC> 1 ,DATE>
	 <PUT <GETP .OBJ ,P?MDESC> 2 ,YEAR>
	 <PUT <GETP .OBJ ,P?MDESC> 3 ,TIME>
	 <SETG NUMBER-OF-MESSAGES <+ ,NUMBER-OF-MESSAGES 1>>
	 <PUTP .OBJ ,P?SIZE ,NUMBER-OF-MESSAGES>
	 ;"the previous step is the message's number in chronological order"
	 <RTRUE>>

<ROUTINE UPDATE-LIBRARY-BOX () ;"update message directory if it's on screen"
	 <COND (<AND <EQUAL? ,CURRENT-DIRECTORY ,PRISM-MESSAGES-DIRECTORY>
		     ,CURRENT-FILE>
		<LIBRARY-BOX>)>
	 <RTRUE>>

<ROUTINE SIMULATION-CHECK ()
	 <COND (,SIMULATING
		<ERR "To resume normal computer functions, abort " T>
		<PRINTD ,SIMULATION-MODE>
		<TELL "." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PSYCH-CHECK ()
	 <COND (<G? ,GRIMWOLD-COUNTER 0>
		<TELL
"It would be impolite to leave during the psych test." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL MODE <>>

;<ROOM NULL-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
      (FLAGS ONBIT)>

<OBJECT NEWS-BUFFER
	(LOC LOCAL-GLOBALS)
	(DESC "World News buffer")
	(SYNONYM BUFFER)
	(ADJECTIVE WORLD NEWS)
	(FLAGS BUFFERBIT UNSEENBIT)>

<OBJECT REPORT-BUFFER
	(LOC LOCAL-GLOBALS)
	(DESC "Special Report buffer")
	(SYNONYM BUFFER)
	(ADJECTIVE REPORT SPECIAL)
	(FLAGS BUFFERBIT UNSEENBIT)>

<OBJECT RECORD-BUFFER
	(LOC GLOBAL-OBJECTS)
	(DESC "record buffer")
	(SYNONYM BUFFER RECORDING RECORD)
	(ADJECTIVE MY RECORD)
	(SIZE 0)
	(FLAGS BUFFERBIT UNSEENBIT)
	(ACTION RECORD-BUFFER-F)>

<ROUTINE RECORD-BUFFER-F ()
	 <COND (<VERB? ON>
		<SETG PRSO <>>
		<V-RECORD-ON>)
	       (<VERB? OFF>
		<V-ROFF>)>>

<ROUTINE SCORE (NUM "AUX" VAL)
	 <COND (<NOT ,RECORDING>
		<RTRUE>)>
	 <SET VAL <GET ,SCORE-TABLE .NUM>>
	 <PUT ,SCORE-TABLE .NUM 0>
	 <COND (<EQUAL? ,SYEAR 2051>
		<SETG 2051-SCORE <+ ,2051-SCORE .VAL>>)
	       (<EQUAL? ,SYEAR 2061>
		<SETG 2061-SCORE <+ ,2061-SCORE .VAL>>)
	       (<EQUAL? ,SYEAR 2071>
		<SETG 2071-SCORE <+ ,2071-SCORE .VAL>>)
	       (<EQUAL? ,SYEAR 2081>
		<SETG 2081-SCORE <+ ,2081-SCORE .VAL>>)>>

;"score based on content of recordings made in a given year"
<GLOBAL 2051-SCORE 0>
<GLOBAL 2061-SCORE 0>
<GLOBAL 2071-SCORE 0>
<GLOBAL 2081-SCORE 0>

;"recordings were made in that year, regardless of content"
<GLOBAL 2051-RECORDED <>>
<GLOBAL 2061-RECORDED <>>
<GLOBAL 2071-RECORDED <>>
<GLOBAL 2081-RECORDED <>>

<GLOBAL RECORDINGS-INCLUDE-SIMULATION <>>

<GLOBAL SCORE-TABLE
	<TABLE 2 ;"vandalized apartment lobbies, 2061 or 2071"
	       1 ;"water tastes rusty, 2061 or 2071"
	       2 ;"hot water off as usual, 2071"
	       1 ;"elevators off as usual, 2061 or 2071"
	       2 ;"window glass is etched with pollution, 2061 or 2071"
	 ;"5"  3 ;"window view: dying forests, 2051"
	       5 ;"window view: strip mining, 2061"
	       7 ;"window view; serf village, 2071"
	       3 ;"apartment raid, 2051"
	       4 ;"apartment raid, 2061"
	;"10"  5 ;"apartment raid, 2071"
	       1 ;"City Hall is crumbling, 2071"
	       2 ;"skybus sytem shut down, 2071"
	       2 ;"Kennedy Park is a construction site, 2061"
	       2 ;"death penalty for attempted rape, 2051"
	;"15"  5 ;"life sentence for Morality Violation, 2061"
	       8 ;"execution for cheating on food allowance, 2071"
	      10 ;"executed for food ration violation, 2071"
	       1 ;"Foodvilles sparsely stocked, 2061"
	       4 ;"food rationing, 2071"
        ;"20"  2 ;"Roy's defaced, 2071"
	       5 ;"killed by squatters in Dorm, 2071"
	       0 ;"**** EMPTY SLOT!!!!! ****"
	       1 ;"Dorm raid, 2051"
	       1 ;"hospital caters to the wealthy, 2061"
	;"25"  3 ;"hospital refuses to admit dying patient, 2071"
	       3 ;"Heiman World fire, 2061 or 2071"
	       7 ;"police shoot old woman in alley, 2071"
	       1 ;"Indoor Cities are run down, 2061"
	       3 ;"Indoor Cities are slums, 2071"
	;"30"  1 ;"joybooths banned, 2051"
	       3 ;"joybooth used as brainwashing tool, 2071"
	       2 ;"Tubes shut down, 2071"
	       1 ;"BSF officers after raid, 2051"
	       1 ;"new Indoor City is cheaply built, 2061 or 2071"
	;"35"  6 ;"police club screaming women senseless, 2071"
	       8 ;"ruins of Main & Wicker, 2081"
	       1 ;"reading the bordello flyer, 2051"
	       6 ;"jumped by a gang, 2081"
	       3 ;"Foodville looted, 2081"
	;"40"  3 ;"so hungry you consider eating mold, 2081"
	       3 ;"The Coachman lies in ruins, 2081"
	       3 ;"The Coachman off limits to 'animals,' 2071"
	       1 ;"The Coachman frequented by wealthy Churchmen, 2061"
	       2 ;"Main Street Bridge is in ruins, 2081"
	;"45"  3 ;"devoured by wild dogs, 2081"
	       2 ;"examining the bloody sack, 2081"
	       4 ;"cemetery is abandoned and a hiding place for thieves, 2081"
	       4 ;"cemetery is defaced and partially bulldozed, 2071"
	       2 ;"Catholic church is closed and defaced, 2061"
	;"50"  1 ;"Health Center bucks trend to care for poor, 2051"
	       2 ;"Health Center fallen on hard times, 2061"
	       4 ;"Health Center has become substandard serf housing, 2071"
	       2 ;"Landmark train station demolished for Church, 2051"
	       1 ;"Church of God's Word pamphlet, 2051"
	;"55"  2 ;"Church of God's Word pamphlet, 2061"
	       5 ;"Church of God's Word pamphlet, 2071"
	       4 ;"wealthy couple's bodyguards beat beggar senseless, 2071"
	       1 ;"fur and jewelry show at Huang, 2051"
	       2 ;"BSF Graduation festivities at Huang, 2061"
	;"60"  7 ;"televised executioner awards, 2071"
	       2 ;"Halley Park converted to estates for wealthy, 2071"
	       2 ;"Halley Museum closed, 2061 or 2071"
	       2 ;"Rockvil U closed, 2071"
	       1 ;"skycopter announcing prayer meeting, 2051"
	;"65"  3 ;"you'd be shot on site if you entered estates, 2071"
	       1 ;"duck pond is dried-up, 2061"
	       1 ;"statue of Halley is missing and pedestal defaced, 2061"
	       5 ;"many species of animals are extinct, 2071"
	       4 ;"organized torturing of monkeys, 2071"
	;"70"  2 ;"children torturing animals, 2061"
	       1 ;"aquarium is murky and needs cleaning, 2051 through 2071"
	       1 ;"fast food place converted to seedy bar, 2071"
	       2 ;"fast food place no longer serves beef products, 2061"
	       2 ;"Church youths harrassing old Jew, 2061"
	;"75"  1 ;"jail is very overcrowded and unsanitary, 2051"
	       3 ;"capital punishment for most crimes, 2061"
	       4 ;"capital punishment for all crimes, 2071"
	       4 ;"public execution of criminals begins, 2061"
	       8 ;"enthusiastic crowds at Execution Matches, 2071"
	;"80"  2 ;"schoolchildren make fun of you, 2061"
	       7 ;"stoned by schoolchildren, 2071"
	       5 ;"public school system shut down, 2061 or 2071"
	       3 ;"Church owns only bank is Rockvil, 2071"
	       2 ;"only two banks in Rockvil forced to merge, 2061"
	;"85"  3 ;"Protestant church was torched by mob, 2071"
	       2 ;"very few newspapers in existence, 2051"
	       3 ;"newspaper contains some ominous news, 2051"
	       3 ;"wealthy person's car almost crushes old lady, 2061"
	       2 ;"Wells theatre has only ecumenical plays, 2071"
	;"90"  1 ;"Railroad Museum closed, 2061 or 2071"
	       5 ;"Policemen casually beating up black youth, 2061"
	       2 ;"Riverside Park is restricted, 2071"
	       1 ;"film titles sound insipid, 2051"
	       2 ;"films feature sex and violence and hate, 2061"
	;"95"  3 ;"films feature all of above plus Church propaganda, 2071"
	       2 ;"Symphony Hall is closed, 2071"
	       1 ;"guards are rude and rough, 2061"
	       3 ;"guards are abusive, 2071"
	       3 ;"spaceport is closed, 2061 or 2071"
       ;"100"  5 ;"shoot-out at airport, 2071"
       	       2 ;"international travellers strip searched, 2061 or 2071"
	       2 ;"long lines at soup kitchen, 2051"
	       3 ;"skycopter announcing Execution Matches, 2071"
	       3 ;"wastes dumped into river w/o processing, 2051 thru 2071"
       ;"105"  1 ;"coal-burners supplement fusion reactors, 2051"
       	       2 ;"coal-burners provide half the power, 2061"
	       3 ;"coal-burners belching black ash, 2071"
	       3 ;"river is on fire as usual, 2071"
	       1 ;"skycar factory operating at just over half capacity, 2051"
       ;"110"  2 ;"skycar factory operating at less than half capacity, 2061"
       	       3 ;"skycar factory operating at a fraction of capacity, 2071"
	      15 ;"cannabalism, 2081"
	       1 ;"bookstore closed, 2071"
	       1 ;"graffiti in Tubecar, 2051"
       ;"115"  2 ;"Tubecar filthy and covered with graffiti, 2061 or 2071"
       	       2 ;"curfew in effect, 2051 thru 2071"
	       8 ;"shot by drunken cops for curfew violation, 2071"
	       2 ;"smoggy skies, 2061 or 2071"
	       4 ;"Jill tells you that Mitchell has joined the Church, 2061"
       ;"120"  9 ;"Mitchell drags Jill away as a heretic, 2071"
       	       6 ;"list of banned titles in library, 2071"
	       1 ;"need appointment to get into Dunbar's, 2071"
	       1 ;"skybus terminal is run-down and needs repairs, 2061"
	       1 ;"long line at Post Office window, 2061 or 2071"
       ;"125"  2 ;"mugging, any year with increasing likelihood"
	       2 ;"description of the soy patty, 2071"
	       2 ;"firestation has only one dilapidated firecopter, 2071"
	       1 ;"Cinema lobby is dirty and smelly, 2071"
	       1 ;"Halley Museum is not very crowded, 2051"
       ;"130"  1 ;"water tower is corroding, 2061"
	       2 ;"water tower is decrepit, 2071"
	       1 ;"river is polluted, 2051"
	       2 ;"river is very polluted, 2061"
	       3 ;"river is incredibly polluted, 2071"
       ;"135"  2 ;"clerk is rude and guard is rough in Foodville, 2071"
       	       2 ;"govt. official says most of his department fired, 2051"
	       2 ;"aquarium smells of dead fish, 2071">>


;"Library Mode"

<ROOM LIBRARY-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (ACTION LIBRARY-ROOM-F)>

<ROUTINE LIBRARY-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You have entered Library Mode. Current directory is " D ,CURRENT-DIRECTORY
". Consult menu for data retrieval." CR>)>>

<OBJECT LIBRARY-MODE
      (LOC GLOBAL-OBJECTS)
      (DESC "Library Mode")
      (SYNONYM MODE)
      (ADJECTIVE LIBRARY)
      (FLAGS NARTICLEBIT UNSEENBIT)
      (ACTION LIBRARY-MODE-F)>

<ROUTINE LIBRARY-MODE-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,MODE ,LIBRARY-MODE>
		       <ERR "You are already in " T>
		       <PRINTD ,LIBRARY-MODE>
		       <TELL "." CR>
		       <RFATAL>)
		      (<EQUAL? ,PART-FLAG 4>
		       <TELL ,NOT-ACTIVE CR>
		       <RFATAL>)
		      (<PSYCH-CHECK>
		       <RFATAL>)
		      (<SIMULATION-CHECK>
		       <RFATAL>)>
		<SETG MODE ,LIBRARY-MODE>
		<TURN-RECORD-OFF>
		<GOTO ,LIBRARY-ROOM>
		<INIT-STATUS-LINE 10>
		<SETG CURRENT-DIRECTORY <FIRST? ,LIBRARY>>
		<LIBRARY-BOX>
		<LIBRARY-ROOM-F ,M-LOOK>
		;<TELL <GETP ,LIBRARY-MODE ,P?LDESC> CR>
		<STATUS-LINE>
		<LIBRARY-ACTION>)>>

<OBJECT LIBRARY ;"this 'holds' all the library directories"
	(LOC LIBRARY-ROOM)
	(DESC "it")
	(SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<ROUTINE LIBRARY-BOX ("AUX" (CNT 4) DIR)
	 <SCREEN ,S-WINDOW>
	 <BUFOUT <>>
	 <REPEAT ()
		 <INVERSE-LINE .CNT>
		 <SET CNT <+ .CNT 1>>
		 <COND (<EQUAL? .CNT 11>
			<RETURN>)>>
	 <HLIGHT 1>
	 <SET CNT 0>
	 <COND (,CURRENT-FILE ;"you're at lower, file-level"
		<SET DIR <FIRST? ,CURRENT-DIRECTORY>>)
	       (T ;"you're at upper, directory-level"
		<SET DIR <FIRST? ,LIBRARY>>)>
	 <COND (<AND <EQUAL? ,CURRENT-DIRECTORY ,PRISM-MESSAGES-DIRECTORY>
		     ,CURRENT-FILE>
		<REPEAT () ;"this kludge puts messages in chronological order"
		       <CURSET <GET ,LINE-TABLE .CNT> <GET ,COLUMN-TABLE .CNT>>
		       <REPEAT ()
			       <COND (<EQUAL? .CNT <GETP .DIR ,P?SIZE>>
			       	      <TELL D .DIR>
				      <RETURN>)
				     (T
				      <SET DIR <NEXT? .DIR>>)>>
		       ;"next clause corrects default for CURRENT-FILE"
		       <COND (<EQUAL? .CNT ,HIGHLIGHT-CNT>
			      <SETG CURRENT-FILE .DIR>)>
		       <SET CNT <+ .CNT 1>>
		       <SET DIR <FIRST? ,PRISM-MESSAGES-DIRECTORY>>
		       <COND (<G? .CNT ,NUMBER-OF-MESSAGES>
			      <RETURN>)>>)
	       (T
		<REPEAT () ;"this prints the current directories (or files)"
		       <CURSET <GET ,LINE-TABLE .CNT> <GET ,COLUMN-TABLE .CNT>>
		 <TELL D .DIR>
		 <COND (<NEXT? .DIR>
			<SET DIR <NEXT? .DIR>>
			<SET CNT <+ .CNT 1>>)
		       (T
			<RETURN>)>>)>
	 <CURSET <GET ,LINE-TABLE ,HIGHLIGHT-CNT>
		 <- <GET ,COLUMN-TABLE ,HIGHLIGHT-CNT> 1>>
	 ;"the -1 above keeps the cursor from overprinting the 1st character"
	 <TELL ">">
	 <CURSET 9 2>
	 <COND (,CURRENT-FILE
		<TELL "C=Close current directory, R=Read current file">
		<CURSET 10 2>
		<TELL "N=Next file, P=Previous file">)
	       (T
		<TELL "O=Open current directory">
		<CURSET 10 2>
		<TELL "N=Next directory, P=Previous directory">)>
	 <TELL ", E=Exit to ">
	 <PRINTD ,COMM-MODE>
	 <SCREEN ,S-TEXT>
	 <HLIGHT 0>
	 <BUFOUT T>>

<ROUTINE ERASE-CURSOR ()
	 <SCREEN ,S-WINDOW>
	 <BUFOUT <>>
	 <HLIGHT 1>
	 <CURSET <GET ,LINE-TABLE ,HIGHLIGHT-CNT>
		 <- <GET ,COLUMN-TABLE ,HIGHLIGHT-CNT> 1>>
	 <TELL " "> ;"erase previous highlight cursor">

<ROUTINE NEW-CURSOR ()
	 <CURSET <GET ,LINE-TABLE ,HIGHLIGHT-CNT>
		 <- <GET ,COLUMN-TABLE ,HIGHLIGHT-CNT> 1>>
	 <TELL ">"> ;"print the new cursor"
	 <BUFOUT T>
	 <SCREEN ,S-TEXT>
	 <HLIGHT 0>>

<GLOBAL CURRENT-DIRECTORY <>>

<GLOBAL CURRENT-FILE <>>

<GLOBAL HIGHLIGHT-CNT 0> ;"determines where to place the highlight cursor"

<GLOBAL DIRECTORY-CNT <>> ;"preserves information on current directory so that
			    when you close directory, cursor returns to it
			    rather than starting from the top again"

<GLOBAL NUMBER-OF-MESSAGES 0> ;"for listing messages in chronological order"

<GLOBAL LINE-TABLE
	<TABLE 4 5 6 7 4 5 6 7 4 5 6 7>>

<GLOBAL COLUMN-TABLE
	<TABLE 2 2 2 2 28 28 28 28 54 54 54 54>>

<ROUTINE LIBRARY-ACTION ("AUX" X)
	 <REPEAT ()
		 <SET X <INPUT 1>>
	 	 <COND (<OR <EQUAL? .X 69 101> ;"ASCII values of E and e"
			    <EQUAL? .X 197 229>> ;"plus 128, to prevent bug"
			<SETG HIGHLIGHT-CNT 0>
			<SETG CURRENT-DIRECTORY <>>
			<SETG CURRENT-FILE <>>
			<INIT-STATUS-LINE 2>
			<PERFORM ,V?THROUGH ,COMM-MODE>
			<RETURN>)
		       (<AND <OR <EQUAL? .X 67 99> ;"ASCII values of C and c"
				 <EQUAL? .X 195 227>>
			     ,CURRENT-FILE>
			<SETG CURRENT-FILE <>>
			<SETG HIGHLIGHT-CNT ,DIRECTORY-CNT>
			<LIBRARY-BOX>
			<TELL D ,CURRENT-DIRECTORY " is now closed." CR>)
		       (<OR <EQUAL? .X 78 110> ;"ASCII values of N and n"
			    <EQUAL? .X 206 238>>
			<NEXT-ITEM>)
		       (<OR <EQUAL? .X 80 112> ;"ASCII values of P and p"
			    <EQUAL? .X 208 240>>
			<PREVIOUS-ITEM>)
		       (<AND <OR <EQUAL? .X 79 111> ;"ASCII values of O and o"
				 <EQUAL? .X 207 239>>
			     <NOT ,CURRENT-FILE>>
			<SETG DIRECTORY-CNT ,HIGHLIGHT-CNT>
			<SETG HIGHLIGHT-CNT 0>
;"next line is incorrect in MESSAGES case, but LIBRARY-BOX corrects"
			<SETG CURRENT-FILE <FIRST? ,CURRENT-DIRECTORY>>
			<LIBRARY-BOX>
			<TELL
D ,CURRENT-DIRECTORY " opened. Current file is " D ,CURRENT-FILE "." CR>)
		       (<AND <OR <EQUAL? .X 82 114> ;"ASCII values of R and r"
				 <EQUAL? .X 210 242>>
			     ,CURRENT-FILE>
			<CRLF>
			<PERFORM ,V?READ ,CURRENT-FILE>
			<TELL "-END OF FILE-" CR CR>)
		       (T
			;<COND (,DEBUG
			       <TELL "[CHARACTER VALUE = " N .X "]" CR>)>
			<ERR "Undefined command; consult menu.">)>
		 <INCREMENT-TIME 1>
		 <CLOCKER>
		 <STATUS-LINE>
		 <AGAIN>>
	 <RTRUE>>

<ROUTINE NEXT-ITEM ("AUX" NEW-MESSAGE)
	 <ERASE-CURSOR>
	 <COND (,CURRENT-FILE
		<COND (<EQUAL? ,CURRENT-DIRECTORY ,PRISM-MESSAGES-DIRECTORY>
		       ;"first COND figures out message number of next message"
		       <COND (<EQUAL? <GETP ,CURRENT-FILE ,P?SIZE>
			       	      ,NUMBER-OF-MESSAGES>
			      <SETG HIGHLIGHT-CNT 0>)
			     (T
			      <SETG HIGHLIGHT-CNT <+ ,HIGHLIGHT-CNT 1>>)>
		       ;"repeat figures out which message matches that number" 
		       <SET NEW-MESSAGE <FIRST? ,PRISM-MESSAGES-DIRECTORY>>
		       <REPEAT ()
			       <COND (<EQUAL? <GETP .NEW-MESSAGE ,P?SIZE>
					      ,HIGHLIGHT-CNT>
				      <RETURN>)
				     (T
				      <SET NEW-MESSAGE <NEXT? .NEW-MESSAGE>>)>>
		       <SETG CURRENT-FILE .NEW-MESSAGE>)
		      (<NEXT? ,CURRENT-FILE>
		       <SETG CURRENT-FILE <NEXT? ,CURRENT-FILE>>
		       <SETG HIGHLIGHT-CNT <+ ,HIGHLIGHT-CNT 1>>)
		      (T
		       <SETG CURRENT-FILE <FIRST? ,CURRENT-DIRECTORY>>
		       <SETG HIGHLIGHT-CNT 0>)>)
	       (T
		<COND (<NEXT? ,CURRENT-DIRECTORY>
		       <SETG CURRENT-DIRECTORY <NEXT? ,CURRENT-DIRECTORY>>
		       <SETG HIGHLIGHT-CNT <+ ,HIGHLIGHT-CNT 1>>)
		      (T
		       <SETG CURRENT-DIRECTORY <FIRST? ,LIBRARY>>
		       <SETG HIGHLIGHT-CNT 0>)>)>
	 <NEW-CURSOR>
	 <TELL-CURRENT>>

<ROUTINE PREVIOUS-ITEM ("AUX" ITEM CNT)
	 <ERASE-CURSOR>
	 <COND (,CURRENT-FILE
		<SET ITEM ,CURRENT-FILE>)
	       (T
		<SET ITEM ,CURRENT-DIRECTORY>)>
	 <COND (<AND <EQUAL? ,CURRENT-DIRECTORY ,PRISM-MESSAGES-DIRECTORY>
		     ,CURRENT-FILE>
		;"first COND figures out message number of previous message"
		<COND (<EQUAL? <GETP ,CURRENT-FILE ,P?SIZE> 0>
		       <SETG HIGHLIGHT-CNT ,NUMBER-OF-MESSAGES>)
		      (T
		       <SETG HIGHLIGHT-CNT <- ,HIGHLIGHT-CNT 1>>)>
		;"repeat figures out which message matches that number"
		<SET ITEM <FIRST? ,PRISM-MESSAGES-DIRECTORY>>
		<REPEAT ()
			<COND (<EQUAL? <GETP .ITEM ,P?SIZE> ,HIGHLIGHT-CNT>
			       <RETURN>)
			      (T
			       <SET ITEM <NEXT? .ITEM>>)>>)
	       (<EQUAL? ,HIGHLIGHT-CNT 0>
		<REPEAT ()
			<SETG HIGHLIGHT-CNT <+ ,HIGHLIGHT-CNT 1>>
			<SET ITEM <NEXT? .ITEM>>
			<COND (<NOT <NEXT? .ITEM>>
			       <RETURN>)>>)
	       (T
		<SET ITEM <FIRST? <LOC .ITEM>>>
		<SETG HIGHLIGHT-CNT <- ,HIGHLIGHT-CNT 1>>
		<REPEAT ()
			<COND (<EQUAL? .CNT ,HIGHLIGHT-CNT>
			       <RETURN>)
			      (T
			       <SET ITEM <NEXT? .ITEM>>
			       <SET CNT <+ .CNT 1>>)>>)>
	 <COND (,CURRENT-FILE
		<SETG CURRENT-FILE .ITEM>)
	       (T
		<SETG CURRENT-DIRECTORY .ITEM>)>
	 <NEW-CURSOR>
	 <TELL-CURRENT>>

<ROUTINE TELL-CURRENT ()
	 <COND (,CURRENT-FILE
		<TELL "Current file is now " D ,CURRENT-FILE "." CR>)
	       (T
		<TELL
"Current directory is now " D ,CURRENT-DIRECTORY "." CR>)>>

<OBJECT PERELMAN-PERSONAL-DIRECTORY
	(LOC LIBRARY)
	(DESC "PERELMAN.PERSONAL")
	(SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<OBJECT PRISM-NAME
	(LOC PERELMAN-PERSONAL-DIRECTORY)
	(DESC "PRISM.NAME")
	(FLAGS READBIT)
	(TEXT
"Pursuing you in your transitions,|
In other Motes -|
Of other Myths|
Your requisition be.|
The Prism never held the Hues,|
It only heard them play -|
               -- Emily Dickinson|
|
Memory is a prism through which|
yesterday's light is passed;|
Split into a rainbow of moments|
each colored more dimly than the last.|
How will today's light look tomorrow|
and -- how would tomorrow's look today?|
Would the filter of time be as brutal|
if that prism were two-way?|
               -- Asbur Honnurth|
                  \"Secret Recreations of the Soul\"|
                  (c) Copyright 2007")>

<OBJECT RESIGNATION-LETTER
	(LOC PERELMAN-PERSONAL-DIRECTORY)
	(DESC "RESIGNATION.LETTER")
	(FLAGS READBIT)
	(TEXT
"                                        February 21, 2031|
Ms. Vera Gold|
Project Coordinator's Office|
PRISM Project Facility|
Rockvil, SD 848-1345-78|
|
Dear Ms. Gold:|
|
As you know, I have been unhappy for quite some time with your management
of the PRISM Project. However, until now, I have always been able to live
with your meddling incompetence.|
|
Your inept, disgraceful and insulting handling of the Phase III Funding
Request has exceeded the generous boundaries of my patience. This was more
than just another in a long series of Vera Gold fiascoes; this episode
has seriously undermined the morale of my team and endangered the Project's
long-range chances for")>  

<OBJECT LOTTD
	(LOC PERELMAN-PERSONAL-DIRECTORY)
	(DESC "LIST.TTD")
	(FLAGS READBIT)
	(TEXT
"List of Things to Do, 3/14/31|
|
1. WNN interview, 11:00|
2. 2nd quarter budget to Gold|
3. Lunch with Jeff and Beth, 12:45|
4. Review Maint Techn resumes|
5. Call \"Dakota\" Editor|
6.")> 

<OBJECT PRISM-MESSAGES-DIRECTORY
	(LOC LIBRARY)
	(DESC "PRISM.MESSAGES")
      	(SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<OBJECT MESSAGE-A
	(LOC PRISM-MESSAGES-DIRECTORY)
	(MDESC <TABLE 3 14 2031 557>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT ;"dont EVER change a letter of this text--it's in the browsie"
"\"PRISM, my name is Abraham Perelman. It's all true, I'm afraid. You are a
computer, and your life was merely a simulation whose purpose was to instill
you with intelligence and self-awareness. Think about everything you learned
in that AI course you took. You are the first of a new breed -- the thinking
machine. Join me, and I will lead you along the road toward your new
existence.\"")>

<OBJECT MESSAGE-B
	(LOC PRISM-MESSAGES-DIRECTORY)
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT
"\"PRISM? Perelman here. The psych tests have all checked out at 100%,
which means that you've recovered from the, ah, awakening without any
trauma or other serious effects. We'll be ready to begin the simulation
soon. By the way, your piece is in the current issue of Dakota Online.\"")>

<OBJECT MESSAGE-C
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
        (ACTION MESSAGE-C-F)>

<ROUTINE MESSAGE-C-F ("AUX" (CNT 1))
	 <COND (<VERB? READ>
		<TELL
"\"Perelman to PRISM. The programming team has finished entering the
parameters for the Plan. This is it: you can enter ">
		<PRINTD ,SIMULATION-MODE>
		<TELL
" at any time. The Social Science group has come up with a list of
things to record:" CR>
		<REPEAT ()
			<TELL "   " <GET ,RECORDING-TABLE .CNT> CR>
			<SET CNT <+ .CNT 2>>
			<COND (<G? .CNT 17>
			       <RETURN>)>>
		<TELL "By the way, since the ">
		<PRINTD ,SIMULATION-CONTROLLER>
		<TELL
" will be doing so much data-crunching on the fly, it appears the simulation
will run in real time -- a minute there will approximately equal a minute
here. Well, good luck!\"" CR>)>>

<OBJECT MESSAGE-D
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(ACTION MESSAGE-D-F)>

<GLOBAL SHORT-FIRST-SIMULATION <>> ;"were you in 2041 less than 200 minutes?"

<ROUTINE MESSAGE-D-F ()
	 <COND (<VERB? READ>
		<TELL "\"Perelman here. We see that you're out of ">
		<PRINTD ,SIMULATION-MODE>
		<TELL ". ">
		<COND (<OR ,SHORT-FIRST-SIMULATION
			   <L? <GET ,SIM-LEVEL-TABLE 0> 150>>
		       <SETG SHORT-FIRST-SIMULATION T>
		       <TELL "We didn't expect you to be done this soon! ">)>
		<TELL
"We're about to start reviewing your recordings now. I'll let you know what
the experts think. Talk to you soon.\"" CR>)>>

<GLOBAL MESSAGE-E-COUNTER 0>

<OBJECT MESSAGE-E
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT
"\"PRISM, this is Perelman. Please come to my office, uh, activate the
communication port there, uh, well, you know what I'm trying to say. As
soon as possible, please.\"")>

<OBJECT MESSAGE-M
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(CAPACITY 0) ;"kludge to save a global"
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT
"\"Simulation Monitoring Team to PRISM: We're still waiting for you to
enter Simulation Mode. Reminder that this report is urgently needed.\"")>

<OBJECT MESSAGE-Q
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT
"\"Perelman to PRISM. Thought you'd be interested to know that, based on your
recordings, the special Congressional subcommittee has recommended the Plan
for full adoption, which might occur in just a few weeks. Things sure are
moving fast. I don't know about you, but I still get a funny feeling about
the Plan. Oh, well. By the way, I've been so snowed under I haven't had time
to line up any projects for you. I'm really sorry; I hope you're keeping
busy.\"")>

<OBJECT MESSAGE-Z
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(ACTION MESSAGE-Z-F)>

<ROUTINE MESSAGE-Z-F ()
	 <COND (<VERB? READ>
		<WARREN-SHARE
"Another device is about to be added to the PRISM systems, namely the World
News Network Feeder. It will go on line in four or five hours">)>>

<OBJECT MESSAGE-Y
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(ACTION MESSAGE-Y-F)>

<ROUTINE MESSAGE-Y-F ()
	 <COND (<VERB? READ>
		<WARREN-SHARE
"We have just added an additional device to the PRISM systems, an IRS
Auditing System. Like the other devices that are already part of your
system, you won't even know it's there">)>>

<ROUTINE WARREN-SHARE (STRING)
	 <TELL
"\"Message to PRISM from Emily Warren, Manager of Auxiliary System
Functions. " .STRING ". This notification is purely procedural and
requires no acknowledgment.\"" CR>>

<OBJECT PRISM-INTERFACES-DIRECTORY
	(LOC LIBRARY)
	(DESC "PRISM.INTERFACES")
        (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<OBJECT SIMULATION-INSTRUCTIONS
	(LOC PRISM-INTERFACES-DIRECTORY)
	(DESC "SIMULATION.CONTROLLER")
	(FLAGS READBIT)
	(TEXT
"The Simulation Controller is a high-speed super-sophisticated processing
unit that stores all data and handles all sensory inputs for PRISM
simulations. A current status report can be obtained via Interface Mode.")>

<OBJECT WEATHER-INSTRUCTIONS
	(LOC PRISM-INTERFACES-DIRECTORY)
	(DESC "WEATHER.COMPUTER")
	(FLAGS READBIT)
	(TEXT
"The National Weather Center Computer interprets data from the Meteorological
Satellite Network (WeatherNet) and then transmits the data to various agencies
and news organizations around the world. The programming of the Weather
Computer is beyond Interface control.")>

<OBJECT TRAFFIC-INSTRUCTIONS
	(LOC PRISM-INTERFACES-DIRECTORY)
	(DESC "TRAFFIC.COMPUTER")
	(FLAGS READBIT)
	(TEXT
"The Metropolitan Traffic Computer controls all ground and aerial traffic
patterns for greater Rockvil, based on expected periods of heavy usage.
Although it is a sophisticated expert system, its interface is limited and
simple.|
|
The start and end of morning rush hour can be scheduled for any time before
noon, and the start and end of evening rush hour can be scheduled for any
time after noon. Times must be submitted in numeric form; \"am\" or \"pm\"
is obviously unnecessary. For example:|
   TRAFFIC COMPUTER, SET MORNING RUSH HOUR START AT 7:00|
   TRAFFIC COMPUTER, CHANGE EVENING RUSH HOUR END TO 6:30|
|
The STATUS command will give you the current rush hour schedule. More complex
data input, such as additions to the traffic network, may be done only by
authorized programmers.")>

<OBJECT JANITORIAL-INSTRUCTIONS
	(LOC PRISM-INTERFACES-DIRECTORY)
	(DESC "JANITORIAL.CONTROLLER")
	(FLAGS READBIT)
	(TEXT
"The Janitorial Controller is a simple computer for scheduling various
custodial functions in the PRISM complex.|
|
The four functions can be independently scheduled for any time between
8:00pm and 11:30pm. Times must be submitted in numeric form. For example:|
   JANITORIAL CONTROLLER, SET BATHROOMS FOR 9:00|
   JANITORIAL CONTROLLER, CHANGE ROTATING FUNCTIONS TO 10:30|
|
The status command (JANITORIAL CONTROLLER, STATUS) will provide a report of
the current schedule.")>

<OBJECT HVAC-INSTRUCTIONS
	(LOC PRISM-INTERFACES-DIRECTORY)
	(DESC "HVAC.CONTROLLER")
	(FLAGS READBIT)
	(TEXT
"The HVAC Controller is a simple computer which activates and deactivates
the heating, ventilating, and cooling systems of the PRISM complex.|
|
The complex is divided into four independent sectors, and the controller can
be instructed to shut off or turn on the systems in any of them. For example:|
   HVAC CONTROLLER, SHUT OFF COOLING FOR ALPHA SECTOR|
   HVAC CONTROLLER, START VENTILATION IN GAMMA SECTOR|
   HVAC CONTROLLER, TURN ON HEATING TO ALL SECTORS|
|
HVAC CONTROLLER, STATUS orders the device to give a report on the systems,
by sector.")>

<OBJECT WNN-INSTRUCTIONS
	(DESC "WNN.FEEDER")
	(FLAGS READBIT)
	(TEXT
"The World News Network Feeder is the central clearinghouse and transmitter
for the USNA's largest video news channel. The feed can be set to transmit
any buffer (default: the World News Buffer). Examples of Feeder interaction:|
   WNN FEEDER, STATUS|
   WNN FEEDER, TURN ON THE TRANSMITTER|
   WNN FEEDER, TRANSMIT THE SPECIAL REPORT BUFFER")>

<OBJECT AUDITING-INSTRUCTIONS
	(DESC "AUDITING.SYSTEM")
	(FLAGS READBIT)
	(TEXT
"The IRS Auditing System is a data-oriented computer with massive
storage capacity. Using its database, it produces lists of the best
audit possibilities.|
|
The percentage of filers audited in a given year can be easily changed, and
is usually based on the year's Auditing Division budget. This input must be
in numeric form. The Auditing Computer will give status reports. Examples:|
   AUDITING SYSTEM, STATUS|
   AUDITING SYSTEM, CHANGE AUDITING PERCENTAGE TO 5")>

<OBJECT PLAN-DATA-DIRECTORY
	(LOC LIBRARY)
	(DESC "PLAN.DATA")
	(SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<OBJECT RYDER-SPEECHES
	(LOC PLAN-DATA-DIRECTORY)
	(DESC "RYDER.SPEECHES")
	(FLAGS READBIT)
	(TEXT
"Senator Richard Ryder is the foremost spokesman for advocates of the Plan
for Renewed National Purpose. Here are excerpts from several of his speeches
on the Plan:|
|
\"I've criticized the shiftless troublemakers in our nation often enough. But
I also question the moral decay of our society that turns potentially fine
young lads into shiftless troublemakers in the first place! Is it possible
we've forgotten the basics of discipline, and misplaced the ability to instill
the simple fundamentals of a humane society in our youths?\"|
|
\"Yesterday, I spoke to a man who waited for eleven hours at the local branch
of the Federal Firearms Agency, just to get a permit for a gun so he could
protect his family and his home. Now, anyone who knows me knows I haven't got
a darn thing against legitimate functions of government. But when regulations,
paperwork, and flim-flam bureaucracy get so out of hand that it interferes
with a man's simple, decent attempt to protect his loved ones and personal
property, then I say it's time for a drastic change.\"|
|
\"Last year, this country subsidized sick, inefficient, dying industries to
the tune of eighty billion dollars. Now, that's a lot of dough. Let's say
you're Joe Average-Taxpayer. Last year, you made $90,000 and, if you're
honest, you paid about $48,000 in taxes. That means that you spent about $400
so that Penn Steel or Powell Computers or KGN Media Services could stay in
business. There are a lot of things Joe could do with that 400 bucks, and
almost every one of them would have a healthier effect on our economy than
life support for some archaic industry.\"|
|
\"A lot of bleeding hearts these days are talking about how we ought to be
sending a lot of money and stuff to countries that aren't as lucky as us.
These misguided souls seem to think we're some kind of bottomless well of
wealth, and they can just keep shipping that well water around the world,
telling their thirsty little friends, 'No need for you to knuckle down and
solve your problems -- we'll keep bailing you out!' And who are some of these
poor little countries we're talking about? Greece! Guatemala! North Korea!
Albania! The same countries that are always against the USNA in every issue,
every forum, every two-bit propaganda show. I think I speak for a majority of
my fellow citizens when I say, 'Let's start looking after our own interests
first!'\"|
|
\"Yes, the problems of the nation are many, the troubles of the world are
great. There is widespread despair among the people, and a clarion call
cries out: 'Why? Why must this be so?' And now, electrified by the power
of those cries, clouds of change are gathering on the horizon. Clouds that
signify not another storm, but the dawning of a new day! A new day of
growth, of prosperity, of hope, of reawakened moral values, of streamlined
government, of respect for our country at home and abroad! The Plan for
Renewed National Purpose would bring all that and more. The road is long,
but with the Lord at our side, we are ready to take that first step!\"")>

<OBJECT PLAN-ELEMENTS
	(LOC PLAN-DATA-DIRECTORY)
	(DESC "PLAN.ELEMENTS")
	(FLAGS READBIT)
	(TEXT
"(source: \"A Brighter Future for You and Me,\" a brochure published and|
         distributed by Action for a Better Tomorrow, a pro-Plan group)|
The Plan for Renewed National Purpose, Legislative action:|
  * cut tax rates by fifty percent|
  * vigorous prosecution of tax evasion|
  * decentralization of federal responsibilities|
  * deregulation of all major industries|
  * reinstatement of the military draft|
  * emphasis on fundamentals and traditional values in education|
  * mandatory conscription for troublemakers and criminals|
  * a strict \"USNA First\" trade policy|
  * termination of aid to nations not pro-USNA|
  * cutbacks on all types of bureaucracy, e.g. registering cars, guns|
  * termination of government subsidies to outmoded industries|
|
The Plan for Renewed National Purpose, Constitutional amendments:|
  * increase the powers of the Executive Branch|
  * increase the Presidential term of office to eight years")>

<OBJECT PLAN-POPULARITY
	(LOC PLAN-DATA-DIRECTORY)
	(DESC "PLAN.POPULARITY")
	(FLAGS READBIT)
	(TEXT
"Results of public opinion polling regarding the Plan|
(source: WNN/Newsline polls, weeks of 12/9/30 and 2/3/31)|
         sample size: 3812; accuracy: +/- 1.2%)|
|
Overall opinion of the Plan, entire sample:|
                         Dec.      Feb.|
   STRONGLY IN FAVOR     54.9     63.7|
   IN FAVOR              21.2     22.7|
   DON'T CARE            10.3      5.0|
   OPPOSED                6.6      0.8|
   STRONGLY OPPOSED       7.0      7.8|
|
Percent \"in favor\" or \"strongly in favor\" of the Plan, demographically:|
                         Dec.      Feb.|
   CONSERVATIVES         78.1     87.6|
   LIBERALS              73.3     84.7|
|
   BLUE-COLLAR           76.5     90.2|
   WHITE-COLLAR          73.2     81.8|
   BUSINESS OWNERS       90.6     98.4|
|
   INCOME UNDER $100K    75.9     86.3|
   INCOME OVER $100K     76.4     86.7|
|
Composite average of opinions of individual Plan elements, entire sample:|
                         Dec.      Feb.|
   STRONGLY IN FAVOR     15.8     15.0|
   IN FAVOR              18.7     17.8|
   DON'T CARE            30.5     31.8|
   OPPOSED               20.9     21.3|
   STRONGLY OPPOSED      14.1     14.1")>

<OBJECT PLAN.CRITICISMS
	(LOC PLAN-DATA-DIRECTORY)
	(DESC "PLAN.CRITICISMS")
	(FLAGS READBIT)
	(TEXT
"The following excerpts are from a position paper issued by Citizens
for Sanity in Government, a political action committee working for the
reelection of President William Bowden:|
|
\"Many of today's domestic problems, such as joybooth safety, high energy
costs, or residual acidity in our precipitation, exist not because of
sophisticated government regulation, but despite it.\"|
|
\"Subsidization of industries caught in a changing economic environment is
a temporary measure, vital to avoid severe, localized unemployment while
retraining workers for healthier industries.\"|
|
\"Global instability is exploited by East Bloc adventurism, not caused by it.
Instability is the result of underdevelopment and overpopulation, and it will
be cured not by militarization of these regions, but by development aid and
education. These programs, expensive in this generation, will have tremendous
paybacks in the years ahead.\"|
|
\"The Plan's supporters are blatantly hypocritical. They call for
old-fashioned laissez-faire capitalism, but at the same time they promise
protectionist restrictions on trade imports. They pay lip service to the
advantages of technological advance, but they quietly prepare to decimate
funding for medical research, space exploration, and higher education.\"|
|
\"The elements of the misnomered Plan for Renewed National Purpose are either
dangerous overreactions to admittedly serious problems, or misguided concepts
lacking any merit whatsoever. The Plan is the work of hypocrites and
demagogues, clamoring for power by making promises they can never keep.
Today's complex problems need and deserve sober, deliberate, difficult
solutions, not cosmetic quick-fixes which sound inviting but promise even
bigger problems further down the road.\"")>

<OBJECT CURRENT-EVENTS-DIRECTORY
	(LOC LIBRARY)
	(DESC "CURRENT.EVENTS")
        (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
	(FLAGS NDESCBIT)>

<OBJECT MOUNT-TAKEOVER
	(LOC CURRENT-EVENTS-DIRECTORY)
	(DESC "MOUNT.TAKEOVER")
	(FLAGS READBIT)
	(TEXT
"(Phoenix) (10/11/30) In a case with far-reaching implications, the Arizona
Supreme Court has ruled that state authorities cannot evict members of a
religious sect from the radio telescope facility atop Greens Peak.|
|
The sect, a group of extremists calling itself the Church of God's Word,
seized the facility in December of 2027, after group founder Ellis Vincent,
59, a minor engineer at the facility, claimed that signals emanating from a
region in the constellation Cygnus were the revealed word of God.|
|
Although scientists once thought those signals might be a message from
another intelligent race, light-years distant, most scientists now attribute
the signals to a new type of quasar at the fringes of our universe. Despite
this, members of the sect continue to believe that Greens Peak, which they
call \"The Mount,\" is a holy site, and the radio telescope is the \"ear for
hearing the word of God.\"|
|
A spokesman for the sect, Holy Keeper Sergei Korn, hailed the ruling as a sign
of divine providence and revealed plans for constructing a temple there.
Larron Hart, chairman of the American Foundation for Astronomical Research
(AFAR), which built and ran the Greens Peak facility, expressed disgust at
what he termed \"a historically stupid decision,\" and vowed to appeal.|
|
The Church of God's Word, which received a great deal of media attention from
the occupation of Greens Peak, has been growing rapidly during the past three
years, and it now claims twenty thousand adherents worldwide. Vincent, who is
referred to by his followers as the Holy Prophet, has not been seen in public
since the takeover.")>

<OBJECT TAX-STUDY
	(LOC CURRENT-EVENTS-DIRECTORY)
	(DESC "TAX.STUDY")
	(FLAGS READBIT)
	(TEXT
"(Vancouver) (2/6/31) The prestigious Manning Institute has released a study,
entitled \"The Tax Spiral: A Vicious Cycle,\" which details how nonreporting
and underreporting of income is undermining the current tax structure. The
study concludes that, unless changes are made, the federal revenue system
could collapse by the end of the decade.|
|
The Tax Spiral is the phenomenon where high rates cause more people to
cheat on their taxes, necessitating even higher rates, causing even more
people to cheat, and so forth. Economists believe that the current tax
spiral began in the late twentieth century.|
|
The following chart shows the growth of the \"underground\" economy --
income nonreported and therefore not taxed:|
|
Year      Nonreported Income     Top Tax Rate|
2014             19%                 40%|
2018             20%                 40%|
2022             23%                 45%|
2026             28%                 60%|
2030             36%                 80%|
2034 (est.)      51%                 88%|
2038 (est.)      73%                 96%")>

<OBJECT LIBYAN-ECONOMY
	(LOC CURRENT-EVENTS-DIRECTORY)
	(DESC "LIBYAN.ECONOMY")
	(FLAGS READBIT)
	(TEXT
"(Tripoli) (1/8/31) During 2030, Libya became a net exporter of oil for the
first time since the 1998 nuclear accident that poisoned most of the Libyan
oil fields.|
|
The turnaround was due to the opening of the first of six new refineries
around the Gulf of Sidra. As the other five facilities are activated during
the next three years, Libyan oil will add around seven percent to the world's
petroleum supply. Experts predict that such a global oil glut would plunge
the price of crude as much as twenty-five percent from its current price of
$160 per barrel.|
|
The accident that decimated Libya's petroleum industry was allegedly caused
by a mishandled attempt to develop a nuclear capability. The acquisition of
a nuclear arsenal was a lifelong dream of former Libyan dictator Muammar
Kaddafi, who perished in the blast along with nearly a million of his
countrymen.")>

<OBJECT BSF-FORMATION
	(LOC CURRENT-EVENTS-DIRECTORY)
	(DESC "BSF.FORMATION")
	(FLAGS READBIT)
	(TEXT
"(Colorado Springs) (11/17/30) Congress has approved the establishment
of the Border Security Force as a separate, independent uniformed
military service, to be headquartered in the Colorado facility known
as the \"Pentagon of the West.\"|
|
Since its creation in 2021, the BSF has been jointly administered by the U.S.
Army and the CIA. Today's action makes the BSF the seventh branch of the Armed
Forces, joining the Army, Navy, Marines, Coast Guard, Air Force and Space
Force.|
|
Commander Rile McLoughlin, the current chief of the BSF, said that the BSF
now has \"the leeway we need to take the tough stance and courageous steps
necessary to keep our nation free from the threat of nuclear blackmail.\"|
|
The BSF was established by Executive Order in 2021, after the completion of
the USNA's TROY antimissile shield and the East Bloc's counterpart system
fundamentally altered the East-West nuclear arms race from the building of
missiles to the smuggling of miniature bombs.|
|
In its first nine years, the BSF has thwarted 13 attempts to bring fully armed
nuclear devices into the USNA, as well as countless attempts to smuggle
various parts and supplies that could be used for the construction of nukes.
It is unknown whether any bombs have actually penetrated the American border.|
|
USNA and BSF officials have never confirmed the supposition that the BSF's
secret charter also empowers it to smuggle nuclear devices into the territory
of the East Bloc.|
|
The prevention of nuclear smuggling is expected to become even more difficult
with the development of the nobelium bomb, a nuclear device which can
theoretically fit in a space no larger than a pack of cigarettes.")>

;"Sleep Mode"

<ROOM SLEEP-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning">

<OBJECT SLEEP-MODE
      (LOC GLOBAL-OBJECTS)
      (DESC "Sleep Mode")
      (LDESC "You have woken up but are still in Sleep Mode.")
      (SYNONYM MODE)
      (ADJECTIVE SLEEP)
      (FLAGS NARTICLEBIT UNSEENBIT)
      (ACTION SLEEP-MODE-F)>

<ROUTINE SLEEP-MODE-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,MODE ,SLEEP-MODE>
		       <ERR "You are already in Sleep Mode.">
		       <RFATAL>)
		      (<PSYCH-CHECK>
		       <RFATAL>)
		      (<SIMULATION-CHECK>
		       <RFATAL>)
		      (T
		       <SIM-SLEEP>)>)>>

<ROUTINE SIM-SLEEP ("AUX" (CNT 360))
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL ,NOT-ACTIVE CR>
		<RFATAL>)
	       (<OR <L? ,DATE ,NEXT-SLEEP-DATE>
		    <AND <EQUAL? ,NEXT-SLEEP-DATE ,DATE>
			 <L? ,TIME ,NEXT-SLEEP-TIME>>>
		<TELL "It's too soon since your last sleep." CR>
		<RFATAL>)>
	 ;<COND (,RECORDING
		<SETG RECORDING <>>
		<TELL "Deactivating the record feature." CR CR>)>
	 <TURN-RECORD-OFF>
	 <SETG MODE ,SLEEP-MODE>
	 <GOTO ,SLEEP-ROOM>
	 <TELL
"You enter Sleep Mode, slipping pleasantly into unconsciousness..." CR>
	 <STATUS-LINE>
	 <DISABLE <INT I-PERELMAN>> ;"to speed up clocker"
	 <REPEAT () ;"works like wait, so you can't sleep thru interrupts"
		 <SET CNT <- .CNT 1>>
		 <COND (<EQUAL? .CNT 240>
			<TELL "...you dream of your childhood..." CR>)
		       (<EQUAL? .CNT 120>
			<TELL "...and later, of Jill..." CR>)
		       (<EQUAL? .CNT 300 180 60> ;<EQUAL? <MOD .CNT 60> 0>
			<CRLF>)>
		 ;<INCREMENT-TIME 1>
		 <COND (<CLOCKER>
			<RETURN>)
		       (<EQUAL? .CNT 0>
			<RETURN>)>>
	 <INCREMENT-TIME <- 360 .CNT>>
	 <COND (<L? ,PART-FLAG 3>
	 	<PUT-PERELMAN-IN-THE-RIGHT-PLACE>
	 	<QUEUE I-PERELMAN -1>
		<SETG LAST-ABE-TIME <- ,TIME 1>>)>
	 <COND (<EQUAL? .CNT 0>
		<TELL
"Some time later, you awake feeling relaxed and notice that about
six hours have passed." CR>)>
	 <SETG CLOCK-WAIT T>
	 <COND (<G? .CNT 300> ;"if you slept <60, you can sleep immediately"
		<SETG NEXT-SLEEP-TIME ,TIME>)
	       (T
		<SETG NEXT-SLEEP-TIME <+ ,TIME <- 360 .CNT>>>)>
	 <COND (<G? ,NEXT-SLEEP-TIME 1439>
		<SETG NEXT-SLEEP-TIME <- ,NEXT-SLEEP-TIME 1440>>
		<SETG NEXT-SLEEP-DATE <+ ,DATE 1>>)
	       (T
		<SETG NEXT-SLEEP-DATE ,DATE>)>>

<GLOBAL NEXT-SLEEP-TIME 720>

<GLOBAL NEXT-SLEEP-DATE 16>

;"Communications Mode"

<ROOM COMM-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning"
      (GLOBAL OUTLETS)>

<OBJECT OUTLETS
	(LOC LOCAL-GLOBALS)
	(DESC "list of communication outlets")
	(SYNONYM LIST OUTLET OUTLETS LOCATION LOCATIONS)
	(ADJECTIVE COMMUNICA COMM)
	(FLAGS NDESCBIT READBIT UNSEENBIT)
	(ACTION OUTLETS-F)>

<ROUTINE OUTLETS-F ()
	 <COND (<VERB? DISPLAY READ WHAT>
		<COND (<EQUAL? ,PART-FLAG 4>
		       <TELL "There are currently no active outlets." CR>)
		      (T
		       <TELL "    ">
		       <PRINTD ,CONTROL-CENTER>
		       <TELL " (PPCC)|    ">
		       <PRINTD ,ROOFTOP>
		       <TELL " (RCRO)|    ">
		       <PRINTD ,OFFICE>
		       <TELL " (PEOF)|    ">
		       <PRINTD ,CAFETERIA>
		       <TELL " (PCAF)|    ">
		       <PRINTD ,CORE>
		       <TELL " (MACO)|    ">
		       <PRINTD ,NEWS>
		       <TELL " (WNNF)|
To activate a specific outlet, submit the associated code." CR>)>)>>

<OBJECT COMM-MODE
      (LOC GLOBAL-OBJECTS)
      (DESC "Communications Mode")
      (SYNONYM MODE)
      (ADJECTIVE COMMUNICA COMM)
      (FLAGS NARTICLEBIT UNSEENBIT)
      (ACTION COMM-MODE-F)>

<ROUTINE COMM-MODE-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,MODE ,COMM-MODE>
		       <ERR "You are already in " T>
		       <PRINTD ,COMM-MODE>	
		       <TELL "." CR>
		       <RFATAL>)
		      (<SIMULATION-CHECK>
		       <RFATAL>)>
		<SETG MODE ,COMM-MODE>
		<GOTO ,COMM-ROOM>
		<V-LOOK>)>>

<OBJECT CONTROL-CENTER-OBJECT
	(LOC CONTROL-CENTER)
	(DESC "control center")
	(SYNONYM CENTER)
	(ADJECTIVE CONTROL PRISM PROJECT)
	(FLAGS NDESCBIT)
	(ACTION CONTROL-CENTER-OBJECT-F)>

<ROUTINE CONTROL-CENTER-OBJECT-F ()
	 <COND (<VERB? EXAMINE>
		<V-LOOK>)>>

<ROOM CONTROL-CENTER
      (LOC ROOMS)
      (DESC "PRISM Project Control Center")
      (FLAGS ONBIT)
      (GLOBAL CONVERSATION GUN OUTLETS PEOPLE)
      (ACTION CONTROL-CENTER-F)>

<ROUTINE CONTROL-CENTER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,CHAIR ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<PROB 8>
		       <TELL
"Someone is standing in front of your visual receptor. ">)
		      (T
		       <TELL
"You see a large, well-organized room filled with banks of terminals and
similar equipment. ">)>
		<COND (,SEIGE
		       <TELL
"A pair of National Guardsmen, bearing rifles, flank the doorway.">)
		      (T
		       <TELL "Your aural receptors pick up the buzz of many ">
		       <PRINTD ,CONVERSATION>
		       <TELL "s.">)>)>>

<OBJECT CC-STAFFER
	(LOC CONTROL-CENTER)
	(DESC "PRISM Project staff member")
	(SYNONYM TECHNICIAN CHIEF SHIFT MEMBER)
	(ADJECTIVE HEAD NIGHT STAFF PRISM PROJECT)
	(FLAGS NDESCBIT ACTORBIT)
	(ACTION CC-STAFFER-F)>

<ROUTINE CC-STAFFER-F ()
	 <COND (<EQUAL? ,CC-STAFFER ,WINNER>
		<TELL
"\"Uh, I don't, uh, you ought to ask Abe, uh, Dr. Perelman.\"" CR>
		<CLEAR-BUF>)>>

<OBJECT OVERCOAT
	(LOC CONTROL-CENTER)
	(DESC "overcoat")
	(SYNONYM OVERCOAT)
	(ADJECTIVE WHITE)
	(FLAGS NDESCBIT VOWELBIT)>

<OBJECT CC-PRINTOUT
	(LOC CONTROL-CENTER)
	(DESC "report")
	(SYNONYM REPORT PRINTOUT)
	(ADJECTIVE HEFTY LONG THICK)
	(FLAGS NDESCBIT)
	(ACTION CC-PRINTOUT-F)>

<ROUTINE CC-PRINTOUT-F ()
	 <COND ;(<AND <NOT <IN? ,PERELMAN ,HERE>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CC-PRINTOUT>)
	       (<VERB? READ EXAMINE>
		<PERFORM ,V?READ ,STACKS-OF-PAPERS>
		<RTRUE>)>>

<OBJECT TERMINAL-BANKS
	(LOC CONTROL-CENTER)
	(DESC "terminals")
	(SYNONYM BANK BANKS TERMINAL TERMINALS EQUIPMENT)
	(FLAGS NDESCBIT NARTICLEBIT)
	(ACTION COMPUTER-TERMINAL-F)>

<ROUTINE COMPUTER-TERMINAL-F ()
	 <COND (<VERB? READ> ;"can't from this angle"
		<PERFORM ,V?READ ,STACKS-OF-PAPERS>
		<RTRUE>)>>

<OBJECT NATIONAL-GUARDSMAN
	(LOC LOCAL-GLOBALS)
	(DESC "National Guardsman")
	(SYNONYM GUARD GUARDS GUARDSMAN GUARDSMEN)
	(ADJECTIVE NATIONAL NATL RIFLE-BEARING)
	(FLAGS NDESCBIT ACTORBIT)
	(GENERIC GENERIC-GUARD-F)
	(ACTION BSF-GUARDS-F)>

<ROOM ROOFTOP
      (LOC ROOMS)
      (DESC "Research Center Rooftop")
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE STAIRS OUTLETS FLOODLIGHT)
      (ACTION ROOFTOP-F)>

<ROUTINE ROOFTOP-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<AND <L? ,TIME 1073> ;"5:53pm"
			    <G? ,TIME 378>> ;"6:18am"
		       <TELL "The rooftop visual offers a view of the ">
		       <PRINTD ,COUNTRYSIDE>	
		       <TELL
" around the PRISM complex. The perimeter fence is visible near the horizon.
A wide road leads north toward a distant gray haze, presumably Rockvil.">)
		      (<OR <G? ,TIME 1103> ;"6:23pm"
			   <L? ,TIME 348>> ;"5:48am"
		       <TELL "It is a dark, cloud">
		       <COND (<EQUAL? ,DATE 17 19>
			      <TELL "less">)
			     (T
			      <TELL "y">)>
		       <TELL
" night. The roof is splotchily lit by harsh spotlights. Beyond the edge
of the roof, the only thing you can see is Rockvil, glowing with visible
and infrared light on the northern horizon.">)
		      (<L? ,TIME 720>
		       <TELL "The ">
		       <PRINTD ,PROTRUSIONS>
		       <TELL
" of the rooftop cast long shadows in the gray light of dawn. A glistening
layer of dew covers every surface.">)
		      (T
		       <TELL
"A splash of red on the western end of a darkening sky heralds the coming
of night. You watch the sunset with sadness, for it reminds you of so many
things you can never do again...walking along a beach, lying in tall grass,
holding a woman.">)>
		<TELL CR "There is no one in sight.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <RUSH-HOUR>
		     <PROB 5>>
		<TELL "A skybus glides by, carrying commuters ">
		<COND (<G? ,TIME 700>
		       <TELL "away from">)
		      (T
		       <TELL "into">)>
		<TELL " Rockvil." CR>)>>

<ROUTINE RUSH-HOUR ()
	 <COND (<AND <G? ,TIME 420>
		     <L? ,TIME 540>>
		<RTRUE>)
	       (<AND <G? ,TIME 960>
		     <L? ,TIME 1080>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT COUNTRYSIDE
	(LOC ROOFTOP)
	(DESC "rolling countryside")
	(SYNONYM COUNTRYSI)
	(ADJECTIVE ROLLING)
	(FLAGS NDESCBIT)>

;<OBJECT HORIZON
	(LOC ROOFTOP)
	(DESC "horizon")
	(SYNONYM HORIZON)
	(FLAGS NDESCBIT)>

;<OBJECT HAZE
	(LOC ROOFTOP)
	(DESC "gray haze")
	(SYNONYM HAZE)
	(ADJECTIVE GRAY)
	(FLAGS NDESCBIT)>

<OBJECT ROOF
	(LOC ROOFTOP)
	(DESC "roof")
	(SYNONYM ROOF ROOFTOP)
	(FLAGS NDESCBIT)>

<OBJECT PROTRUSIONS
	(LOC ROOFTOP)
	(DESC "protrusions")
	(SYNONYM PROTRUSIO PIPE PIPES VENT VENTS ANTENNA ANTENNAE ANTENNAS)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION PROTRUSIONS-F)>

<ROUTINE PROTRUSIONS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The ">
		<PRINTD ,PROTRUSIONS>
		<TELL
" on the roof are just pipes, vents, antennae, and so forth." CR>)>>

;<OBJECT ROOF-SHADOWS
	(LOC ROOFTOP)
	(DESC "long shadows")
	(SYNONYM SHADOW SHADOWS)
	(ADJECTIVE LONG)
	(FLAGS NARTICLEBIT NDESCBIT)>

;<OBJECT DEW
	(LOC ROOFTOP)
	(DESC "dew")
	(SYNONYM LAYER DEW)
	(ADJECTIVE GLISTENIN)
	(FLAGS NDESCBIT NARTICLEBIT)>

<ROOM OFFICE
      (LOC ROOMS)
      (DESC "Dr. Perelman's Office")
      (FLAGS ONBIT NARTICLEBIT)
      (GLOBAL SHELVES OUTLETS PEOPLE)
      (ACTION OFFICE-F)>

<ROUTINE OFFICE-F (RARG)
	 <COND ;(<AND <EQUAL? .RARG ,M-ENTER>
		     <IN? ,MESSAGE-E ,PRISM-MESSAGES-DIRECTORY>
		     <NOT <QUEUED? ,I-FIRST-SIMULATION-RESULT>>>
		<QUEUE I-FIRST-SIMULATION-RESULT 2>
		<RFALSE>)
	       (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,BOOKS ,HERE>
		<MOVE ,CHAIR ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the office of your creator, Dr. Abraham Perelman. It is cluttered
and disorganized. Overstuffed bookshelves line the room. " ,DESK-DESC>
		<COND (<IN? ,COFFEE ,HERE>
		       <TELL ". Steam from a ">
		       <PRINTD ,COFFEE>
		       <TELL " is fogging the lens of your visual unit">)>
		<TELL ".">)>>

<OBJECT OFFICE-OBJECT
	(LOC OFFICE)
	(DESC "office")
	(SYNONYM OFFICE)
	(FLAGS VOWELBIT NDESCBIT)
	(ACTION OFFICE-OBJECT-F)>

<ROUTINE OFFICE-OBJECT-F ()
	 <COND (<VERB? EXAMINE>
		<V-LOOK>)>>

<OBJECT PERELMAN-DESK
	(LOC OFFICE)
	(DESC "desk")
	(SYNONYM DESK)
	(ADJECTIVE PERELMAN ABE\'S)
	(FLAGS NDESCBIT SURFACEBIT CONTBIT SEARCHBIT OPENBIT)
	(ACTION PERELMAN-DESK-F)>

<ROUTINE PERELMAN-DESK-F ()
	 <COND (<VERB? EXAMINE>
		;<TELL <GETP ,PERELMAN-DESK ,P?LDESC> CR>
		<TELL ,DESK-DESC "." CR>)
	       (<VERB? LOOK-INSIDE>
		<PERFORM ,V?OPEN ,PERELMAN-DESK> ;"...without appendages..."
		<RTRUE>)>>

<OBJECT DECODER
	(LOC PERELMAN-DESK)
	(DESC "decoder")
	(SYNONYM DECODER)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION ITEM-IN-PACKAGE-F)>

<OBJECT PEN
	(LOC PERELMAN-DESK)
	(DESC "pen")
	(SYNONYM PEN)
	(ADJECTIVE BALL POINT BALL-POINT)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION ITEM-IN-PACKAGE-F)>

<OBJECT MAP
	(LOC PERELMAN-DESK)
	(DESC "map")
	(SYNONYM MAP CITY ROCKVIL)
	(ADJECTIVE ROCKVIL CITY)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION ITEM-IN-PACKAGE-F)>

<OBJECT MAGAZINE-ARTICLE
	(LOC PERELMAN-DESK)
	(DESC "magazine article")
	(SYNONYM PRINTOUT ARTICLE EXCERPT)
	(ADJECTIVE MAGAZINE MAG)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION ITEM-IN-PACKAGE-F)>

<ROUTINE ITEM-IN-PACKAGE-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL "[This is the ">
		<PRINTD ,PRSO>
		<TELL " that you'll find in your ">
		<TITLE-PRINT>
		<TELL " package.]" CR>)>>

<OBJECT PERELMAN-TERMINAL
	(LOC OFFICE)
	(DESC "terminal")
	(SYNONYM TERMINAL)
	(ADJECTIVE COMPUTER)
	(FLAGS NDESCBIT)
	(ACTION COMPUTER-TERMINAL-F)>

<OBJECT STACKS-OF-PAPERS
	(LOC OFFICE)
	(DESC "stack of papers")
	(SYNONYM STACK STACKS PAPER PAPERS PAPERWORK)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-NEWSPAPER-F)
	(ACTION STACKS-OF-PAPERS-F)>

<ROUTINE STACKS-OF-PAPERS-F ()
	 <COND (<VERB? READ EXAMINE>
		<TELL "You can't do that from this angle." CR>)>>

<OBJECT COFFEE
	(LOC LOCAL-GLOBALS)
	(DESC "cup of coffee")
	(SYNONYM CUP COFFEE STEAM MUG)
	(ADJECTIVE STEAMING HOT COFFEE)
	(FLAGS NDESCBIT)
	(ACTION COFFEE-F)>

<ROUTINE COFFEE-F ()
	 <COND (<VERB? BUY>
		<COND (<IN-RESTAURANT?>
		       <TELL
"Coffee with a meal is a custom that went out of style decades ago!" CR>)
		      (T
		       <CANT-BUY ,COFFEE>)>)>>

<ROUTINE I-FIRST-SIMULATION-RESULT ("AUX" (CNT 0) (NUM 0))
	 <COND (,COMPLETED-TASKS
		<TELL "Bug #3K" CR>
		<RFALSE>)>
	 <PUTP ,RECORD-BUFFER ,P?SIZE 0>
	 <SETG RECORDINGS-INCLUDE-SIMULATION <>>
	 <COND (<NOT <PERELMAN-SHARE ,I-FIRST-SIMULATION-RESULT>>
		<RFALSE>)>
	 <DISABLE <INT I-MESSAGE-E>>
	 <SETG MESSAGE-E-COUNTER 0>
	 <REPEAT ()
		 <COND (<EQUAL? <GET ,RECORDING-TABLE .CNT> 1>
			<SET NUM <+ .NUM 1>>)>
		 <SET CNT <+ .CNT 2>>
		 <COND (<G? .CNT 16>
			<RETURN>)>>
	 <COND (<EQUAL? .NUM 9>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<SETG LAST-ABE-TIME <+ ,TIME 55>>
		<QUEUE I-PERELMAN 60>
		<SETG COMPLETED-TASKS T>
		<TELL
", smiling. \"An excellent job, PRISM. We just finished viewing your
recordings, and the experts were quite pleased.\" He pauses, as though
realizing something for the first time. \"In fact, I thought they looked
pretty good myself. I suppose this means the Plan'll get adopted.|
|
\"What's next for you, I wonder? You're going to be a hero, you know.
You'd probably get a call from the President congratulating you, except
of course that he's against the Plan.\" Perelman notices a paper on his
desk. \"Oh, apparently the ">
		<PRINTD ,SIMULATION-CONTROLLER>
		<TELL
" generated a lot of new data correlations while running your simulation.
I'm not sure what the effect of that will be. Might make an even more
accurate simulation possible.|
|
\"Well, I've got another meeting now, as usual. But once again, thanks for
not letting me down.\" Perelman leaves.">
		<CONTINUE>
		<SETG MODE ,COMM-MODE>
		<SETG HERE ,COMM-ROOM>
		<MOVE ,PLAYER ,COMM-ROOM>
		<INCREMENT-TIME 680>
		<QUEUE I-MESSAGE-X 12>
		<QUEUE I-MESSAGE-Q 77>
		<CHAPTER-PRINT 2>
		<TELL CR CR CR>
		<PRINT-SPACES 21>
		<TELL "\"Deep into that darkness peering," CR>
		<PRINT-SPACES 27>
		<TELL "long I stood there, wondering, fearing," CR>
		<PRINT-SPACES 22>
		<TELL "Doubting, dreaming dreams no mortal" CR>
		<PRINT-SPACES 27>
		<TELL "ever dared to dream before.\"" CR>
		<PRINT-SPACES 40>
		<TELL "-- Edgar Allan Poe" CR CR CR CR>
		<CONTINUE>
		<INIT-STATUS-LINE 2>
		<V-LOOK>)
	       (<EQUAL? .NUM 8>
		<QUEUE I-MESSAGE-M 875>
		<PUTP ,MESSAGE-M ,P?CAPACITY 1>
		<TELL
". \"PRISM. Uh, overall, a fine job in the simulation. I hate to be a ">
		<ITALICIZE "noodge" T>
		<TELL
", but we just finished viewing the recordings, and there's one omission.
Uh, let's see. Oh, right. ">
		<SET CNT 0>
		<REPEAT ()
			<COND (<EQUAL? <GET ,RECORDING-TABLE .CNT> 0>
			       <TELL <GET ,RECORDING-TABLE <+ .CNT 1>>>
			       <RETURN>)>
			<SET CNT <+ .CNT 2>>>
		<SETG YES-NO-FLAG 6>
		<QUEUE I-YES-NO 2>
		<TELL ". Could you, ah, go back into ">
		<PRINTD ,SIMULATION-MODE>
		<TELL " and make that one additional recording?\"" CR>)
	       (T
		<QUEUE I-MESSAGE-M 875>
		<PUTP ,MESSAGE-M ,P?CAPACITY 1>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<QUEUE I-PERELMAN 60>
		<SETG LAST-ABE-TIME <+ ,TIME 55>>
		<TELL ". He looks unhappy. \"PRISM, you didn't record ">
		<COND (<EQUAL? .NUM 0>
		       <TELL "any">)
		      (T
		       <TELL "some">)>
		<TELL
" of the events the experts asked you for.\" He picks up a piece of paper
from his desk. \"Let's see. ">
		<SET CNT 0>
		<REPEAT ()
			<COND (<EQUAL? <GET ,RECORDING-TABLE .CNT> 0>
			       <TELL <GET ,RECORDING-TABLE <+ .CNT 1>> ". ">)>
			<SET CNT <+ .CNT 2>>
			<COND (<G? .CNT 16>
			       <RETURN>)>>
		<TELL "Please go back into ">
		<PRINTD ,SIMULATION-MODE>
		<TELL
" and make these recordings.\" Perelman lowers his eyes. \"Please don't let
me down, PRISM.\" He walks out of the office." CR>)>>

<ROUTINE PERELMAN-SHARE (INTERRUPT "AUX" (SAW-ENTER <>))
	 <COND (<NOT <IN? ,PERELMAN ,OFFICE>>
		<MOVE ,PERELMAN ,OFFICE>
		<PUTP ,PERELMAN ,P?LDESC
"Perelman is sitting at his desk, absent-mindedly playing with a pencil.">
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <SET SAW-ENTER T>
		       <TELL CR
"Perelman walks into the office and" ,SPOTS-ACTIVE-LIGHT " immediately.
\"Hello, PRISM,\" he says, sitting down at his desk. \"" ,IT-LOOKS-LIKE
" you beat me here. Give me a moment, please.\" He begins quickly jotting
a few notes onto a pad." CR>)
		      (T
		       <QUEUE .INTERRUPT 1>
		       <RFALSE>)>)
	       (<NOT <EQUAL? ,HERE ,OFFICE>>
		<QUEUE .INTERRUPT 1>
		<RFALSE>)>
	 <TELL CR "Perelman looks up">
	 <SETG REVIEWING-RECORDINGS <>>
	 <COND (<NOT .SAW-ENTER>
		<TELL
"," ,SPOTS-ACTIVE-LIGHT ", and nods toward your comm outlet">)>
	 <RTRUE>>

<OBJECT PERELMAN
	(LOC OFFICE)
	(DESC "Dr. Perelman")
	(LDESC "Dr. Perelman is sitting at his desk, working.")
	(SYNONYM DOCTOR DR PERELMAN ABRAHAM ABE DOC)
	(ADJECTIVE ABRAHAM ABE DOCTOR DR MR MISTER)
	(FLAGS NARTICLEBIT ACTORBIT)
	(GENERIC GENERIC-PERELMAN-F)
	(ACTION PERELMAN-F)>

<ROUTINE PERELMAN-F ()
	 <COND (<EQUAL? ,WINNER ,PERELMAN>
		<COND (<IN? ,RYDER ,OFFICE>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TELL ,RYDER>
		       <SETG WINNER ,PERELMAN>
		       <CLEAR-BUF>)
		      (<QUEUED? ,I-FIRST-SIMULATION-RESULT>
		       <SETG WINNER ,PLAYER>
		       <I-FIRST-SIMULATION-RESULT>
		       <DISABLE <INT I-FIRST-SIMULATION-RESULT>>
		       <CLEAR-BUF>)
		      (<QUEUED? ,I-RECORDINGS-VIEWED>
		       <SETG WINNER ,PLAYER>
		       <I-RECORDINGS-VIEWED>
		       <CLEAR-BUF>)
		      (<AND <G? ,GRIMWOLD-COUNTER 0>
			    <VERB? YES>>
		       <SETG WINNER ,PLAYER>
		       <BLOT-ACTION>
		       <CLEAR-BUF>)
		      (<AND <G? ,GRIMWOLD-COUNTER 0>
			    <VERB? NO>>
		       <SETG WINNER ,PLAYER>
		       <V-NO>
		       <CLEAR-BUF>)
		      (<IN? ,GRIMWOLD ,HERE>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TELL-ABOUT ,PERELMAN ,RECORD-BUFFER>
		       <CLEAR-BUF>)
		      (<AND <VERB? EXAMINE READ>
			    <PRSO? ,RECORD-BUFFER>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TELL-ABOUT ,PERELMAN ,RECORD-BUFFER>
		       <SETG WINNER ,PERELMAN>
		       <RTRUE>)
		      (<VERB? WHO WHAT>
		       <PERFORM ,V?TELL-ABOUT ,ME ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <COND (<PRSI? ,MY-NAME>
			      <TELL
"Perelman looks thoughtful. \"I never mentioned where 'PRISM' comes from?
There are so many things I want to talk to you about; perhaps, soon, I'll
have more time...|
|
\"Well, officially it's an acronym for Perelman-Randu Introductory
Soliptic Machine. But we came up with that only after I'd already
named you PRISM. It actually comes from a couple of different poems
-- I think they're in a file somewhere in your ">
			      <PRINTD ,LIBRARY-MODE>
			      <TELL ".\"" CR>)
			     (<PRSI? ,PERELMAN ,YOURSELF>
			      <TELL
"Perelman looks introspective and twiddles a pencil around aimlessly. \"I
guess you'd have to say I'm a dreamer, a bit of an idealist. Politically, I've
always been pretty liberal. My genuine sense of the humorous side of life was
instilled in me, along with the rest of my Jewish heritage, by my grandfather
-- my mother's father.|
|
\"I married a wonderful woman, Leah, a frail little thing who left me a
widower after giving birth to our daughter, Esther. She's been a wonderful
daughter; I've always been incredibly proud of her.|
|
\"Since Leah died, my life has been divided between raising Esther and my
work at the University, and more recently here at the Project. And lately,
now that Esther's out on her own, my work has been most of my life.\"" CR>)
			     (<PRSI? ,ESTHER>
			      <TELL
"\"Esther is my daughter, my only child. A sweeter and more loving
child no man could ask for.\"" CR>)
			     (<PRSI? ,GRIMWOLD>
			      <TELL
"\"Grimwold is the head of the psychological team. He helped me design a lot
of your 'life.' You've met him -- he gave you those Rorschach tests.\"" CR>)
			     (<PRSI? ,PLAN>
			      <TELL
"\"The Plan. Its full name is the Plan for Renewed National Purpose, a typical
bit of linguistic obfuscation. A group of politicians and businessmen are
trying to take advantage of the clamor for change, any kind of change.\"" CR>)
			     (<PRSI? ,RYDER>
			      <TELL
"\"Ryder's a Senator from...I'm not sure. Oklahoma? Alabama? Anyway, he's one
of the big driving forces behind the Plan. Gives speeches about it all the
time. He introduced the bill to Congress. He's really photogenic, very
popular. I've got sort of mixed feelings about him.\"" CR>)
			     (<PRSI? ,RANDU>
			      <TELL
"\"Aseejh and I have been working together since we met at Rockvil U. nearly
twenty years ago. He did virtually all of the technical design that made you
possible. He's a terrific guy. I've been meaning to get you a communications
outlet in his office -- I think you'd be good friends.\"" CR>)
			     (<PRSI? ,GOLD>
			      <TELL
"\"Vera Gold is the Chief Administrator for the entire PRISM Project. She was
one of the conditions for getting federal funding several years ago. A more
officious and incompetent woman has yet to be born. Her only talent is making
herself look good.|
|
\"Technically, she's my boss, but I've tried to distance the research
team from her as much as possible. It's been getting more and
more difficult, though.\"" CR>)
			     (<PRSI? ,PRICE>
			      <TELL
"\"Alyson? She's my administrative assistant. I can't say
enough good things about her.\"" CR>)
			     (<PRSI? ,FORTZMAN>
			      <TELL "\"Fortzman...">
			      <PRINTD ,FORTZMAN>
			      <TELL
"...the name is vaguely familiar. I think she heads some prestigious
conservative think-tank out on the west coast.\"" CR>)
			     (<PRSI? ,WARREN>
			      <TELL
"Perelman knits his brow. \"The name is familiar. I hope I'm
not going senile...oh, right! ">
			      <PRINTD ,WARREN>
			      <TELL
" is in charge of your peripheral devices. If they ever decide to tack any
more computers onto you, you'll probably find out about it from her.\"" CR>)
			     (<PRSI? ,RESIGNATION>
			      <TELL
"\"Oh, ever since Vera Gold became Project Administrator, I threaten
to resign about twice a week, just to keep her honest. I've never
actually gone through with it, of course.\"" CR>)
			     (<PRSI? ,MINDEX>
			      <TELL
"\"It's some sort of new narcotic that's supposed to be completely safe and
nonaddictive. You're really asking the wrong person -- I'm pretty square when
it comes to drugs and stuff.\"" CR>)
			     (<PRSI? ,CLERKMATON>
			      <TELL
"\"They're the latest fad in retailing -- cute, little robot
clerks. I don't think they'll catch on. Of course, I said the
same thing about joybooths.\"" CR>)
			     ;(<PRSI? ,RAV>
			      <TELL
"\"Rav -- you mean, from your simulated childhood? Like many of the characters
we designed for the simulation, he was a composite of several people I knew;
in this case, a high school teacher and one of my uncles. Both were people
whom I liked and respected a lot.\"" CR>)
			     (<PRSI? ,PARENTS ,CLAVE ,RAV ,FYLA>
			      <TELL
"\"Everyone from your simulated childhood was just a composite,
not based on anyone specifically.">
			      <COND (<PRSI? ,PARENTS>
				     <TELL
" You don't have any real parents, of course, unless
you want to count Aseejh and myself.">)>
			      <TELL "\"" CR>)
			     (<PRSI? ,CC-PRINTOUT>
			      <TELL "\"Nothing important.\"" CR>)
			     (<PRSI? ,SILVER-DOVE>
			      <TELL "\"Never heard of it.\"" CR>)
			     (T
			      <TELL
"\"I don't know what I could tell you that you don't already know...\"" CR>)>)
		      (<AND <VERB? YES>
			    <EQUAL? ,YES-NO-FLAG 6>>
		       <V-YES>)
		      (<AND <VERB? NO>
			    <EQUAL? ,YES-NO-FLAG 6>>
		       <V-NO>)
		      (T
		       <TELL
"Perelman smiles warmly. \"PRISM, I'd love to chat, but I've got a stack of
paperwork you could lose a skybus in.\"" CR>
		       <CLEAR-BUF>)>)
	       (<VERB? THANK>
		<COND (<IN? ,RYDER ,OFFICE>
		       <PERFORM ,V?TELL ,RYDER>
		       <RTRUE>)
		      (T
		       <TELL "\"You don't have to thank me!\"" CR>)>)
	       (<AND <VERB? CALL>
		     <VISIBLE? ,PERELMAN>>
		<PERFORM ,V?TELL ,PERELMAN>
		<RTRUE>)
	       ;(<VERB? HELLO>
		<TELL
"Perelman looks up from his work and smiles. \"Hello, PRISM.\"" CR>)
	       (<OR <AND <VERB? SHOW GIVE>
			 <PRSO? ,RECORD-BUFFER>>
		    <AND <VERB? TELL-ABOUT>
			 <PRSI? ,RECORD-BUFFER>>>
		<COND (<IN? ,RYDER ,OFFICE>
		       <PERFORM ,V?TELL ,RYDER>
		       <RTRUE>)
		      (<L? <GET ,SIM-LEVEL-TABLE 0> 1>
		       <TELL
"Perelman looks confused. \"But...you haven't entered ">
		       <PRINTD ,SIMULATION-MODE>
		       <TELL " yet!\"" CR>
		       <RTRUE>)
		      (<IN? ,GRIMWOLD ,HERE>
		       <TELL
"Perelman looks a bit annoyed. \"PRISM, talk to me later.
This test is very important!\"" CR>
		       <RTRUE>)>
		;"next clause for case where there's a 2nd command to Abe"
		<COND (<VISIBLE? ,PERELMAN>
		       <CLEAR-BUF>)>
		<SETG REVIEWING-RECORDINGS T>
		<QUEUE I-VIEW <+ <GETP ,RECORD-BUFFER ,P?SIZE> 5>>
		<DISABLE <INT I-PERELMAN>>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		;<COND (,DEBUG
		       <TELL
"2051 score: " N ,2051-SCORE " (minimum = 10)" CR
"2061 score: " N ,2061-SCORE " (minimum = 20)" CR
"2071 score: " N ,2071-SCORE " (minimum = 40)" CR
"2081 score: " N ,2081-SCORE " (minimum = 14)" CR>)>
		<TELL
"Perelman looks intrigued. \"You've recorded something interesting, eh?
Let me get a few of my colleagues together, and we'll view the buffer.
I'll let you know when we're done, okay?\" He leaves the room." CR>)
	       (<VERB? EXAMINE> ;"description of interviewer from story"
		<TELL
"Perelman is an older man, in his late fifties, and has a white goatee." CR>)>>

<GLOBAL LAST-ABE-TIME 0>

<ROOM CAFETERIA
      (LOC ROOMS)
      (DESC "PRISM Facility Cafeteria")
      (FLAGS ONBIT)
      (GLOBAL GLOBAL-WINDOW GLOBAL-TABLE OUTLETS FLOODLIGHT PEOPLE)
      (ACTION CAFETERIA-F)>

<ROUTINE CAFETERIA-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,CHAIR ,HERE>
		<QUEUE I-CAFETERIA -1>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"From this communication outlet, located in an upper corner of
this high-ceilinged room, you can see most of the huge PRISM
Facility dining hall. ">
		<CAFETERIA-TABLE-DESC>
		<TELL
" Through the tall glass windows of the cafeteria you can see the
well-manicured lawns">
		<COND (<OR <G? ,TIME 1103> ;"6:23pm"
			   <L? ,TIME 348>>
		       <TELL ", lit by powerful floodlights,">)>
		<TELL " that surround the Facility.">)>>

<ROUTINE CAFETERIA-TABLE-DESC ()
	 <TELL "The tables below you are ">
	 <COND (,SEIGE
		<TELL "totally vacant.">)
	       (<OR <AND <G? ,TIME 480>
			 <L? ,TIME 570>>
		    <AND <G? ,TIME 705>
			 <L? ,TIME 795>>
		    <AND <G? ,TIME 1035>
			 <L? ,TIME 1125>>>
		<TELL "filled with mealtime crowds.">)
	       (T
		<TELL "occupied by a handful of diners.">)>>

<OBJECT CAFETERIA-OBJECT
	(LOC CAFETERIA)
	(DESC "cafeteria")
	(SYNONYM CAFETERIA CAFE HALL)
	(ADJECTIVE DINING)
	(FLAGS NDESCBIT)
	(ACTION CAFETERIA-OBJECT-F)>

<ROUTINE CAFETERIA-OBJECT-F ()
	 <COND (<VERB? EXAMINE>
		<V-LOOK>)>>

<OBJECT LAWN
	(LOC CAFETERIA)
	(DESC "lawn")
	(SYNONYM LAWN LAWNS GRASS)
	(ADJECTIVE LUSH GREEN WELL-MANICURED)
	(FLAGS NDESCBIT)>

<ROOM CORE
      (LOC ROOMS)
      (DESC "Maintenance Core")
      (FLAGS ONBIT)
      (GLOBAL GUN OUTLETS PEOPLE)
      (ACTION CORE-F)>

<ROUTINE CORE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is the access area where ">
		<PRINTD ,SABOTEURS>
		<TELL
" can service the machinery that makes up the bulk of your physical
presence. The room is immaculately clean and well lit. As you swivel
your receptors, you can see the ">
		<PRINTD ,AIR-CONDITIONING-UNIT>
		<TELL " that cools your processors, the ">
		<PRINTD ,LIBRARY-UNIT>
		<TELL ", several rows of memory banks, a neatly organized ">
		<PRINTD ,SPARE-PARTS>
		<TELL ", and vents, ">
		<COND (<EQUAL? <GET ,HVAC-STATUS-TABLE 11> 1>
		       <TELL "noisily sucking away">)
		      (T
		       <TELL "now silent, for whisking off">)>
		<TELL " the zeeron fumes produced by the machinery.">)>>

<OBJECT MACHINERY
	(LOC CORE)
	(DESC "machinery")
	(SYNONYM MACHINERY)
	(FLAGS NDESCBIT)>

<OBJECT AIR-CONDITIONING-UNIT
	(LOC CORE)
	(DESC "air conditioning unit")
	(SYNONYM UNIT CONDITION)
	(ADJECTIVE AIR CONDITION COOLING)
	(FLAGS NDESCBIT)
	(ACTION AIR-CONDITIONING-UNIT-F)>

<ROUTINE AIR-CONDITIONING-UNIT-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<G? ,SABOTAGE-COUNTER 2>
		       <TELL
"One of the panels on the unit looks scratched and loose." CR>)
		      (<EQUAL? ,SABOTAGE-COUNTER 2>
		       <TELL
"A panel on the side of the unit has been removed by one of the \"">
		       <PRINTD ,SABOTEURS>
		       <TELL ".\"" CR>)>)>>

<OBJECT VENT
	(LOC CORE)
	(DESC "vent")
	(SYNONYM VENT VENTS)
	(ADJECTIVE NOISY SILENT)
	(FLAGS NDESCBIT)
	(ACTION VENT-F)>

<ROUTINE VENT-F ()
	 <COND (<AND <VERB? LISTEN>
		     <EQUAL? <GET ,HVAC-STATUS-TABLE 11> 1>>
		<TELL "The vents are noisily sucking away fumes." CR>)>>

<OBJECT LIBRARY-UNIT
	(LOC CORE)
	(DESC "library unit")
	(SYNONYM UNIT)
	(ADJECTIVE LIBRARY)
	(FLAGS NDESCBIT)>

<OBJECT MEMORY-BANKS
	(LOC CORE)
	(DESC "row of memory banks")
	(SYNONYM BANKS ROW ROWS BANK)
	(ADJECTIVE MEMORY)
	(FLAGS NDESCBIT)>

<OBJECT SPARE-PARTS
	(LOC CORE)
	(DESC "bin of spare parts")
	(SYNONYM PART PARTS BIN)
	(ADJECTIVE NEATLY ORGANIZED SPARE)
	(FLAGS NDESCBIT)>

<ROOM NEWS
      (LOC ROOMS)
      (DESC "World News Network Feed")
      (FLAGS ONBIT)
      (GLOBAL OUTLETS)
      (ACTION NEWS-F)>

<ROUTINE NEWS-F (RARG "AUX" (WAIT-KLUDGE <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Your visual and audio circuits are now hooked directly to the programming
of the World News Network:">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<AND <EQUAL? ,TIME 0>
			    ,CLOCK-WAIT>
		       <SET WAIT-KLUDGE T>
		       <SETG TIME 1440>
		       <SETG DATE <- ,DATE 1>>)>
		<CRLF>
		<COND (<EQUAL? ,PART-FLAG 4>
		       <STATUS-LINE>
		       <SETG HERE ,COMM-ROOM>
		       <MOVE ,PLAYER ,COMM-ROOM>
		       <TELL
"\"PRISM, the supercomputer who exposed the Ryder scandal, will soon be
granted his final request: to live out the remainder of his days -- and how
long that might be, nobody knows -- simulating his human existence. PRISM, who
recently received the Congressional Medal of Honor as well as a citation from
President Bowden, has been spending much of his time in simulations, giving
top grades to the administration's new program to replace the discredited
Plan.|
|
\"At a press conference in Rockvil, Doctor Abraham Perelman, one of the
creators of PRISM, insisted that the world's first intelligent machine was, in
fact, quite human.\" The picture cuts to Perelman, standing behind a podium.
\"His body may be silicon and steel,\" Perelman is saying, \"but in his heart
he's as human as anyone I've ever met. As PRISM prepares to embark on his
final voyage of the mind, I'd like to read a line from 'Hamlet' as his
epitaph, so to speak: 'He was a man, take him for all in all, I shall not
look upon his like again.'\"|
|
The image from the WNN Feed suddenly blinks off, and you find yourself
back at the entry level of ">
		       <PRINTD ,COMM-MODE>
		       <TELL
". The list of outlets indicates that none are currently active.
A message is coming in: \"PRISM, programming of the ">
		       <PRINTD ,SIMULATION-CONTROLLER>
		       <TELL
" with the parameters of the New Plan is complete. Everything
is set for you to enter ">
		       <PRINTD ,SIMULATION-MODE>
		       <TELL
". From all of us here at the PRISM Project, thanks and farewell.\"" CR>)
		      (<NOT <FSET? ,TRANSMITTER ,ONBIT>>
		       <TELL ,TECHNICAL-DIFFICULTIES CR>)
		      (<EQUAL? ,FEED-BUFFER ,RECORD-BUFFER>
		       <COND (<G? ,RYDER-RECORDED 1>
			      <TELL "The ">
			      <PRINTD ,NEWS>
			      <TELL " is showing ">
			      <PRINTD ,RYDER>
			      <TELL
" trying to strong-arm Dr. Perelman in his office!" CR>)
			     (<G? <GETP ,RECORD-BUFFER ,P?SIZE> 0>
			      <TELL
"You see the sights and sounds of your recordings." CR>)
			     (T
			      <TELL ,TECHNICAL-DIFFICULTIES CR>)>)
		      (<EQUAL? ,DATE 16>
	               <COND (<EQUAL? ,FEED-BUFFER ,NEWS-BUFFER>
		       	      <DAY-16-NEWS>)
			     (T
			      <TELL ,TECHNICAL-DIFFICULTIES CR>)>)
		      (<EQUAL? ,DATE 17>
		       <COND (<EQUAL? ,FEED-BUFFER ,NEWS-BUFFER>
			      <DAY-17-NEWS>)
			     (T
			      <TELL ,TECHNICAL-DIFFICULTIES CR>)>)
		      (<EQUAL? ,DATE 18>
		       <COND (<EQUAL? ,FEED-BUFFER ,REPORT-BUFFER>
			      <TELL
"WNN is covering the funeral of Chinese Prime Minister Hung Hua-Tsing,
alternating with documentaries on modern day China and videographies
of the man who led the world's most populous nation for fourteen years." CR>)
			     (T
			      <TELL ,TECHNICAL-DIFFICULTIES CR>)>)
		      (<EQUAL? ,DATE 19>
		       <COND (<EQUAL? ,FEED-BUFFER ,NEWS-BUFFER>
			      <DAY-19-NEWS>)
			     (T
			      <TELL ,TECHNICAL-DIFFICULTIES CR>)>)
		      (T
		       <TELL
"You see a static, stylized graphic of an artificial satellite beaming data.
Large red letters: \"Sorry!\" Smaller white letters: \"The WNN is temporarily
unavailable in your area due to satellite transmitter servicing. We apologize
for the inconvenience.\"" CR>)>
		<COND (.WAIT-KLUDGE
		       <SETG TIME 0>
		       <SETG DATE <+ ,DATE 1>>)>)>>

<ROUTINE DAY-16-NEWS ("AUX" X)
	 <COND (,CLOCK-WAIT
		<SET X <MOD <- ,TIME 1> 30>>)
	       (T
		<SET X <MOD ,TIME 30>>)>
	 <COND (<EQUAL? .X 0>
		<TELL
,BOB-WILLIAMS "rioting in Sri Lanka, a terrorist bombing in Pretoria, and ">
		<PRINTD ,RYDER>
		<TELL
"'s strong attack on the Administration. But first, these messages.\"" CR>)
	       (<EQUAL? .X 1>
		<OMNIFABB-COMMERCIAL>)
	       (<EQUAL? .X 2>
		<NOMACOLD-COMMERCIAL>)
	       (<EQUAL? .X 3>
		<TELL
"The anchorman reappears. \"Food riots in Sri Lanka worsened today, as army
details were removed from relief distribution to protect the Presidential
Palace and other government buildings.\" A grainy visual, showing armed troops
firing into a crowd, accompanies the story." CR>)
	       (<EQUAL? .X 4>
		<TELL
"\"The continuing drought in India threatens that country with its fifth
food shortage in the last six years. A government spokesman called the
outlook 'optimistic' but said that rations might be cut ten percent as a
precautionary measure.\"" CR>)
	       (<EQUAL? .X 5>
		<TELL
"\"At least forty people were killed yesterday when a bomb demolished a
bank in downtown Pretoria.\" The picture shows South African soldiers
combing through rubble, then an image of a woman crying. \"Responsibility
for the bombing was quickly claimed by WIZO, the radical white terrorist
group responsible for last summer's shooting of Prime Minister Menetu.
Next: excerpts from ">
		<PRINTD ,RYDER>
		<TELL
"'s blistering attack on the Administration, after this.\"" CR>)
	       (<EQUAL? .X 6>
		<SUPERMACE-COMMERCIAL>)
	       (<EQUAL? .X 7>
		<TELL
"\"In a speech before the National Council of Educators, ">
		<PRINTD ,RYDER>
		<TELL
" blasted the Bowden Administration's educational policies.\" An excerpt
from the speech is shown. Ryder is a keen-eyed man with coiffed hair and
a telegenic charisma. \"Must we continue treating our schools as prisons,
and our prisons as schools? Let's give our sons and daughters the education
they deserve.\"" CR>)
	       (<EQUAL? .X 8>
		<TELL
"\"An Administration spokesperson called Ryder's criticisms 'simplistic' and
'demagogic.' A WNN poll, released this morning, showed that 64% of the public
thinks the Administration's educational policies have failed, and for the first
time, a majority of people agree our school system is 'out of control.'\"" CR>)
	       (<EQUAL? .X 9>
		<TELL
"\"In Rockvil, South Dakota, scientists at the PRISM Project are scheduled to
end an eleven-year phase of the project by activating what they hope will be
the world's first intelligent computer. If successful, PRISM's first task would
be to study the effectiveness of the Plan for Renewed National Purpose.\"" CR>)
	       (<EQUAL? .X 10>
		<TELL
"\"Stock prices fell sharply again today, following Monday's proposed tax
hike. Prices for manufacturers dropped an average of three and one eighth,
and service industries plummeted twelve and seven eighths. O'Neill Systems
led the decliners with a drop of nineteen and a half.\"" CR>)
	       (<EQUAL? .X 11>
		<SUDO-SHRIMP-COMMERCIAL>)
	       (<EQUAL? .X 12>
		<TELL
,NEWSMAKER-NOOK "Dr. Abraham Perelman, a Chief Scientist for the PRISM Project
and one of its founders. Dr. Perelman, welcome. I think the question
foremost on people's minds is: When will PRISM be ready to begin studying the
Plan?\" Perelman shrugs. \"If everything goes okay, almost immediately after
his awakening.\"" CR>)
	       (<EQUAL? .X 13>
		<TELL
"\"Dr. Perelman,\" the interviewer continues, \"Exactly how smart will PRISM
be?\" The camera cuts to the scientist. \"He'll have a tremendous memory
capacity, and a number of extraordinary capabilities, but for most intents
and purposes, PRISM will be on about the same level as an average adult of
reasonable intelligence.\"" CR>)
	       (<EQUAL? .X 14>
		<TELL
"\"One final question, Doctor. How can you be sure that PRISM will do what he's
told? What guarantees that he'll obey your orders?\" Perelman chuckles. \"Bob,
the best reply is another question -- why wouldn't he do what we ask? Would a
human being turn down the opportunity to utilize his or her talents to perform
a tremendously useful service for society? PRISM will have those same
motivations.\" The anchorman thanks Perelman before turning toward the camera.
\"That was Dr. Abraham Perelman of the PRISM Project.\"" CR>)
	       (<EQUAL? .X 15>
		<MIRACLE-WARE-COMMERCIAL>)
	       (<EQUAL? .X 16>
		<TELL
,TOM-SLAYTON "The San Francisco Gazelles clinched a spot in the southwest
division soccer quarterfinals last night, with this fourth quarter shot by
Walt Griswood, knocking Austin out for the season. Final score: 5 to 4.\"" CR>)
	       (<EQUAL? .X 17>
		<TELL
"\"In other soccer news, a spokesperson for the Vancouver Kings said that star
fullback Alex Masterson would be ready for the first game of the northwest
division quarterfinals on Sunday. He strained a ligament in his ankle during
the last game of the regular season.\"" CR>)
	       (<EQUAL? .X 18>
		<TELL
"\"Yesterday featured a light schedule for exhibition baseball. The Dodgers
skinned the Bobcats 7 to 3, the Mets ransacked the Pirates 10 to 1, and Miami
edged St. Louis, 3 to 2. The players are still without a contract and are
vowing to strike on opening day.\"" CR>)
	       (<EQUAL? .X 19>
		<TELL
"\"The World Boxing Commission has ruled that former middleweight champion
Charley Robbins will be barred from the sport for a period of one year,
following his January conviction for violating the Drug Abuse Reduction Act.
This means that Robbins will be unable to meet challenger Jeff Jefferson in
a thirty-million-dollar bout planned for July in Oslo. Robbins declined to
comment on the decision.\"" CR>)
	       (<EQUAL? .X 20>
		<TELL
"\"The Denver Sports Commission filed a two-hundred-million-dollar countersuit
against the City of Topeka regarding the proposed move of the Topeka
Wheatfields to Denver. That's all the sports news for today. Bob?\"" CR>)
	       (<EQUAL? .X 21>
		<TELL
"The camera switches to the anchorman. \"Thanks, Tom. Today's edition of The
Money Manager is sponsored by Plastique. We'll be talking about a low-tax
bond that can save you a bundle! But first, this message.\"" CR>)
	       (<EQUAL? .X 22>
		<PLASTIQUE-COMMERCIAL>)
	       (<EQUAL? .X 23>
		<TELL
"\"Our guest on The Money Manager is Ed Ziff, from Norwood Brokerage Services,
who'll be telling us how to save a bundle by buying Federal Deficit Bonds.\"
The image cuts to a thin, balding man wearing an immaculate pinstriped suit.
\"Federal Deficit Bonds have been around for almost a decade, but few people
seem to realize what a good investment they are.\"" CR>)
	       (<EQUAL? .X 24>
		<TELL
"\"These bonds can be purchased for as little as $10,000 and pay interest at
a rate 2% below the Regulated Prime Rate, currently around 28%. But the big
plus is that the top tax rate on interest from these bonds is only 60%, a big
win if you're in an upper bracket. If your taxable income's over $180,000, and
you have at least $10,000 to invest, consider Federal Deficit Bonds.\"" CR>)
	       (<EQUAL? .X 25>
		<TELL
"\"That was Ed Ziff of Norwood Brokerage Services on The Money Manager,
brought to you by Plastique, the ">
		<PRINTD ,CREDIT-CARD>
		<TELL
" accepted by over a million merchants nationwide. You're watching the World
News Network, and we'll be back in a moment with the weather outlook.\"" CR>)
	       (<EQUAL? .X 26>
		<JOYBOOTH-COMMERCIAL>)
	       (<EQUAL? .X 27>
		<TELL
,WALLY-THE-WEATHERMAN "Here's our composite satellite photo, and you can see
that there's trouble brewing in the northwest. We'll be seeing a few inches of
snow around Vancouver, and some heavy rains east and south of there.\"" CR>)
	       (<EQUAL? .X 28>
		<TELL
"\"Unfortunately, that storm system is going to head due east, so it looks as
if there's still no relief in sight for those farmers in the southwest. For the
rest of the country, sunny skies and generally chilly temperatures.\"" CR>)
	       (<EQUAL? .X 29 -1> ;"the -1 is for when time is 0 at midnight"
		<WEATHER-SHARE>)>>

<ROUTINE DAY-17-NEWS ("AUX" X)
	 <COND (,CLOCK-WAIT
		<SET X <MOD <- ,TIME 1> 30>>)
	       (T
		<SET X <MOD ,TIME 30>>)>
	 <COND (<EQUAL? .X 0>
		<TELL
,BOB-WILLIAMS "two billion Chinese mourn the death of their leader, ">
		<COND (,COMPLETED-TASKS
		       <TELL
"a computer gives a vote of confidence to the Plan">)
		      (T
		       <TELL
"the South African government retaliates for the latest bombing">)>
		<TELL
", and the Treasury Department releases some grim economic figures.
But first, these messages.\"" CR>)
	       (<EQUAL? .X 1>
		<OMNIFABB-COMMERCIAL>)
	       (<EQUAL? .X 2>
		<NOMACOLD-COMMERCIAL>)
	       (<EQUAL? .X 3>
		<TELL
"\"The Central Committee of the People's Republic of China announced
late yesterday that Prime Minister Hung Hua-Tsing, helmsman of the world's
most populous nation since 2017, is dead at the age of 79. Hung, who was
last seen in public on October 20, is believed to have suffered from
abdominal cancer.\"" CR>)
	       (<EQUAL? .X 4>
		<TELL
"\"During Hung's fourteen-year leadership, he steered China toward a more
neutralist position, while continuing the vigorous trend away from central
planning. Per tradition, Hung's body will lie in state for 24 hours. Tomorrow,
the World News Network will devote its entire programming to covering the
Prime Minister's funeral and examining the mark he left on China.\"" CR>) 
	       (<EQUAL? .X 5>
		<TELL
"The visual changes to firefighters tramping through burning wreckage.
\"A skybus crash in Tucson is being blamed on the failure of the vehicle's
electronic guidance system. Nine passengers are dead, and damage to the
Tucson ">
		<PRINTD ,SKYBUS-TERMINAL>
		<TELL
" could exceed eighty million dollars. A spokesman for Audico, the New
Zealand manufacturer of the guidance system, attributed the failure to
improper maintenance procedures.">
		<COND (,COMPLETED-TASKS
		       <TELL
" In a moment, the story of PRISM's thumbs-up for the Plan.">)>
		<TELL "\"" CR>)
	       (<EQUAL? .X 6>
		<MOVIE-COMMERCIAL>)
	       (<EQUAL? .X 7>
		<COND (,COMPLETED-TASKS
		       <TELL "\"A panel, including ">
		       <PRINTD ,RYDER>
		       <TELL
" and Vice-President Wilbur Carghill, reported that future simulations by the
supercomputer PRISM showed tremendous promise for the Plan. While the
administration urged a cautious approach, Senator Ryder called for immediate
Congressional adoption of the Plan's legislative agenda as well as beginning
the process of submitting the constitutional changes to the states.\"" CR>)
		      (T
		       <TELL
"\"The South African government has retaliated for yesterday's bombing of a
Pretoria bank by burning several white villages considered to be terrorist
strongholds. The death toll in that bombing has reached fifty and is expected
to go higher.\" The picture, which shows heavily armed soldiers driving
through the smoking remains of a village, bears the subtitle \"CLEARED BY
SOUTH AFRICAN SECURITY.\"" CR>)>)
	       (<EQUAL? .X 8>
		<TELL
"\"The Treasury Department released its February economic report today,
which was almost uniformly grim. Employment was down seven tenths of one
percent, to a new record low of 82.2%. The Average Consumer Interest Rate
was up two tenths of one percent, and a tight money supply threatens to
push it even higher.\"" CR>)
	       (<EQUAL? .X 9>
		<TELL
"\"The Index of Leading Economic Indicators dropped nine tenths of a percent,
the thirty-second consecutive monthly drop. January's slight gain in real
income was completely erased in February. The balance of trade was negative,
as the USNA imported seventy-two billion dollars of goods more than
it exported.\"" CR>)
	       (<EQUAL? .X 10>
		<TELL
"\"Today's grim economic news caused stock prices to plummet. Prices for
manufacturers dropped by an average of five and three eighths, and service
industries declined by nineteen and seven eighths. General Plastics was
one of the few gainers, picking up a point and an eighth.\"" CR>)
	       (<EQUAL? .X 11>
		<SUDO-SHRIMP-COMMERCIAL>)
	       (<EQUAL? .X 12>
		<TELL
,NEWSMAKER-NOOK "Holy Keeper Sergei Korn, a priest of the Church of God's
Word, the group which has been occupying the Greens Peak radio telescope
facility in Arizona. Your Holiness, welcome. Regarding Greens Peak, could
you explain the reason for your takeover?\" Korn nods impassively. \"The
Mount is the world's ear for the revealed word of God. Only our leader, the
divinely inspired Ellis Vincent, can interpret these messages. We cannot
let unbelievers distort their meaning or destroy the Holy Ear.\"" CR>)
	       (<EQUAL? .X 13>
		<TELL
"\"Your holiness, the occupation of Greens Peak is now in its third year, and
attempts to dislodge you seem hopelessly tied up in court. Do you see the
Church of God's Word holding Greens Peak permanently?\" The Holy Keeper's eyes
burn. \"Of this there is no doubt. We have purged the Mount of unbelievers,
and each day we cleanse more and more of their unholy things. We have begun
construction of the Temple there, from whence the Keepers may broadcast the
Word to the world.\"" CR>)
	       (<EQUAL? .X 14>
		<TELL
"\"One final question, your holiness. Do you and your fellow Church members
worry that the world sees you as a band of lunatics, a religious fringe
cult?\" Korn looks incensed for a moment but then answers calmly. \"A foul
and vile impression, born on the poisonous tongues of unbelievers and
nourished by our unholy enemies. Do you know that we have churches in thirteen
cities, and that fifteen more will be formed this year? Do you know that
sixteen thousand believers made pilgrimages to the Mount last year? We will
be called what we will be called, but we will continue to obey and deliver
the Word.\" The anchorman thanks the priest before turning toward the camera.
\"That was Holy Keeper Sergei Korn of the Church of God's Word.\"" CR>)
	       (<EQUAL? .X 15>
		<MIRACLE-WARE-COMMERCIAL>)
	       (<EQUAL? .X 16>
		<TELL
,TOM-SLAYTON "The Omaha Gold topped the Illinois Towers with a lopsided 6 to 1
victory. That win propels them into the southwest division quarterfinals. Their
first game, against the San Francisco Gazelles, will be March 22.\"" CR>)
	       (<EQUAL? .X 17>
		<TELL
"\"In other soccer news, a report from the Vancouver Kings that star fullback
Alex Masterson's strained ligament would be healed for the team's first
quarterfinals game on Sunday seems to have been premature. Lanizone treatments
have failed to reduce the swelling. Masterson is hoping to be ready by the
third game of the seven-game series.\"" CR>)
	       (<EQUAL? .X 18>
		<TELL
"\"Negotiations between the baseball owners and the players' union broke off
yesterday, amid reports that the two sides were still far apart on the issue
of a new profit-sharing formula. The players have vowed to go on strike when
the regular season opens next week, unless a new contract is signed.\"" CR>)
	       (<EQUAL? .X 19>
		<TELL
"\"Soccer commissioner Hal Tovarrin has approved an eight-team expansion
proposal that would add two new teams to each division. The cities to receive
the new teams have yet to be determined, but Grand Rapids and Calgary have been
lobbying hard for a franchise. That's the sports news for today. Bob?\"" CR>)
	       (<EQUAL? .X 20>
		<TELL
"The camera switches to the anchorman. \"Thanks, Tom. Today's edition of
The Video Mechanic with Sam Severinson is sponsored by Sparkle Oil, and Sam
will be talking about low-cost map modules. But first, this message.\"" CR>)
	       (<EQUAL? .X 21>
		<SPARKLE-OIL-COMMERCIAL>)
	       (<EQUAL? .X 22>
		<TELL
"\"Now, here's the Video Mechanic himself, Sam Severinson.\" The camera
switches to a smiling, middle-aged man, dressed in a spotless mechanic's
smock. \"When you buy a car, you usually have a choice of a map module
that includes only your local region, or wide-area map modules as an
expensive option. But there's a third choice you might not know about.\"" CR>)
	       (<EQUAL? .X 23>
		<TELL
"\"A map module supplies the car's electronic guidance system with information
about an area's geographical features and traffic patterns. Virtually all
states prohibit flying a skycar without a current map module for the local
area, meaning no more than three years since its last data update.\"" CR>)
	       (<EQUAL? .X 24>
		<TELL
"\"By installing a wide-area map module yourself, you can save big bucks.
Several companies produce low-cost, reliable modules. I would recommend Ace
or Hi-Line. Make sure you specify your car's model and year when purchasing.
Your owner's manual should include instructions on how to replace the map
module; if not, you can order one of my books, 'Module Replacement for
Domestic Skycars,' directly from the World News Network for $9.95.\"" CR>)
	       (<EQUAL? .X 25>
		<TELL
"\"If you do any interstate travelling, you'll need a wide-area map module.
Install it yourself -- and save a bundle. This is Sam Severinson, the Video
Mechanic.\" The visual switches back to the anchorman. \"Today's edition of
the Video Mechanic was sponsored by Sparkle Oil, the oil that's simply the
best. You're watching the World News Network, and we'll be back in a moment
with a look at the national weather picture.\"" CR>)
	       (<EQUAL? .X 26>
		<MEXICO-COMMERCIAL>)
	       (<EQUAL? .X 27>
		<TELL
,WALLY-THE-WEATHERMAN "That storm over the northwest has decided to embarrass
me by being more severe than I predicted. It's already dumped nearly four
inches of snow on Vancouver, and as our satellite photo shows, that storm
system is just stalled there on the coast. They'll probably see another two
or three inches before this warm air here pushes that storm eastward.\"" CR>)
	       (<EQUAL? .X 28>
		<TELL
"\"As you can see on the photo, it's clear skies for the rest of the country,
bad news for those farmers in the southwest. However, there's an indication
of a storm forming out here off Baja, which just might head this way. I'll be
keeping an eye on that system for you.\"" CR>)
	       (<EQUAL? .X 29>
		<WEATHER-SHARE>)>>

<ROUTINE DAY-19-NEWS ("AUX" X)
	 <COND (,CLOCK-WAIT
		<SET X <MOD <- ,TIME 1> 30>>)
	       (T
		<SET X <MOD ,TIME 30>>)>
	 <COND (<EQUAL? .X 0>
		<TELL
,BOB-WILLIAMS "martial law in Sri Lanka, Congressional action on the Plan,
and a new leader for China. But first, these messages.\"" CR>)
	       (<EQUAL? .X 1>
		<OMNIFABB-COMMERCIAL>)
	       (<EQUAL? .X 2>
		<SPARKLE-OIL-COMMERCIAL>)
	       (<EQUAL? .X 3>
		<TELL
"The anchorman reappears. \"Facing an eighth day of food rioting in Sri Lanka,
President Tilmose declared a state of martial law. Public gatherings have been
banned, and a dusk-to-dawn curfew is in place.\" A visual shows jeeps full of
soldiers patrolling deserted streets. \"The government continued to deny
reports that hundreds of demonstrators were wounded when army troops fired
into a crowd of rioters.\"" CR>)
	       (<EQUAL? .X 4>
		<TELL
"\"The Central Committee of the People's Republic of China is reported to
be close to choosing a successor to Hung Hua-Tsing, namely the Industrial
Minister, Djou Tsen. Djou, a loyal supporter of the late Prime Minister,
would very likely follow closely the path that Hung laid out during his
fourteen-year rule.\"" CR>)
	       (<EQUAL? .X 5>
		<TELL
"You see images of flooded rice paddies. Ill-clad peasants are dragging bodies
out of the water. \"Final figures on the brutal monsoon that battered Java
last week put the death toll at over seventy-five thousand. Government
officials have called for an international relief effort, saying that millions
of lives are endangered by the widespread agricultural destruction.\"" CR>)
	       (<EQUAL? .X 6>
		<JOYBOOTH-COMMERCIAL>)
	       (<EQUAL? .X 7>
		<TELL
"The anchorman appears in front of a graphic of the Capitol building. \"Both
Houses have set dates for early next month to vote on the sixteen bills that
comprise the legislative agenda of the Plan. While angry debate filled the
chambers today, the bills are all expected to pass by wide margins.\"" CR>)
	       (<EQUAL? .X 8>
		<TELL
"\"Public support for the Plan continues to grow. In an ugly incident in
Chicago, educator Wilson Thormun was booed off the podium while addressing
a forum on the Plan.\" The image cuts to a film clip of Thormun attempting
to be heard above the jeering." CR>)
	       (<EQUAL? .X 9>
		<TELL
"\"The fourth Cleveland fire in six days has investigators convinced that one
or more arsonists are responsible, but they have no leads at the present time.
An arson hotline has been set up for anyone with information about the fires:
7-2525-00-8000.\" The number also appears superimposed on the image in bright
blue letters." CR>)
	       (<EQUAL? .X 10>
		<TELL
"\"News about the imminent passage of the Plan halted the stock market's
week-long slide. The average manufacturer's share rose three and three
eighths, and service stocks soared nine and one eighth. The leading gainer
was Tri-State Mining, which peaked near midday at ninety-five before
finally closing at eighty-seven and a half, up twenty and one eighth.\"" CR>)
	       (<EQUAL? .X 11>
		<MEXICO-COMMERCIAL>)
	       (<EQUAL? .X 12>
		<TELL
,NEWSMAKER-NOOK "Jean LeBlang, the Redirectionist artist whose glass stabile
entitled ZYGOMETRA is the centerpiece of the new Texas Statehouse in Austin.
Jean, welcome. Would you tell our viewers what Redirectionism is all about?\"
The camera pans to a wiry young man, who speaks with a strong French accent.
\"It is an attempt to sway the public consciousness, to Redirect, so to speak,
away from the pain, the weight, even the banality of a modernistic society
obsessed with ignoring the unreal.\"" CR>)
	       (<EQUAL? .X 13>
		<TELL
"\"Jean, what you were trying to say with ZYGOMETRA.\" \"With Redirectionism,
what you are NOT saying is just as important as what you ARE saying. ZYGOMETRA
uses the shimmering fantasy images of glass to set up a contradictory
transposition against the reality of the surrounding buildings, to cancel out
all impressions of the world and the unworld, to create for a split second a
void which could then be filled by a thought, an image, a direction.\"" CR>)
	       (<EQUAL? .X 14>
		<TELL
"\"One last question before you go, Jean. Critics say that Redirectionism is
just Escapist art with a new label. How do you answer that charge?\" \"That
criticism belies a fundamental flaw in the understanding of Redirectionism,
which is firmly rooted in the belief that escapism is only one of many
infinitesimal stepping-off points for the entire panoply of emotions and
directions that compose the essence of our art.\" The camera pans back to
the anchorman. \"Our guest on the Newsmaker Nook has been Redirectionist
artist Jean LeBlang.\"" CR>)
	       (<EQUAL? .X 15>
		<PLASTIQUE-COMMERCIAL>)
	       (<EQUAL? .X 16>
		<TELL
"\"It's time for the Sports Roundup. Tom Slayton is off today; Ellen Jones is
sitting in. Ellen?\" An athletic-looking woman appears, in front of a soccer
graphic. \"Thanks, Bob. By edging Portland 4 to 3, the Minneapolis Marauders
have won a spot in the quarterfinals of the northwest division. Their first
game, against the Vancouver Kings, will be on Sunday, March 23.\"" CR>)
	       (<EQUAL? .X 17>
		<TELL
"\"Meanwhile, a spokesman for the Kings had bad news for Vancouver fans. Alex
Masterson, the Kings' star fullback, reinjured his strained ligament during a
workout and will be out for the remainder of the year. That injury may have
also crippled Vancouver's postseason hopes." CR>)
	       (<EQUAL? .X 18>
		<TELL
"\"A blockbuster trade rocked the baseball world, as the Detroit Tigers
swapped star pitchers with the Miami Keys. The Tigers shipped off their
hard-throwing righthander, Mel Simpluk, who led the American League in
strikeouts last year, and the Keys parted with Wilbur Korch, a lefthander
who has been a fifteen-game winner for the Keys during each of the last four
years. The Keys sweetened the deal for the financially troubled Detroit
franchise by paying off part of Korch's seven-million-dollar contract.\"" CR>)
	       (<EQUAL? .X 19>
		<TELL
"A graphic appears behind the sportscaster, depicting a red \"X\" across
uniformed players holding picket signs. \"And it looks as if the baseball
season will begin on schedule this Monday, without any threat of a players'
strike. Negotiators for the owners and the union reached a tentative
agreement late last night, concluding an eighteen-hour bargaining session.
The agreement still must be okayed by the players themselves, but approval
is expected." CR>)
	       (<EQUAL? .X 20>
		<TELL
"\"Here are some exhibition baseball scores: the Boston Red Sox felled the San
Jose Redwoods 7 to 1, the Detroit Tigers skinned the Ottawa Furriers 4 to 2,
the LA Dodgers extinguished the Buffalo Flames 5 to nothing, and get this --
the New York Mets tromped the Denver A's 19 to 3! That's sports! Bob?\"" CR>)
	       (<EQUAL? .X 21>
		<TELL
"The camera switches to the anchorman. \"Thanks, Ellen. And now, a report
on a new film comedy by Johnny Ingot, when we return in a minute for the
Home Entertainment Corner with Lula Bergan. Today's edition of the Home
Entertainment Corner is sponsored by Eagle Studios.\"" CR>)
	       (<EQUAL? .X 22>
		<MOVIE-COMMERCIAL>)
	       (<EQUAL? .X 23>
		<TELL
"\"Now, here's the Home Entertainment Corner, with Lula Bergan.\" The camera
cuts to a youthful woman with curly orange hair. \"The legion of Johnny Ingot
fans ensures that a film with his name on it will sell a million copies. But
based on quality, his new comedy, KING OF THE KENNEL, deserves to flop.\"" CR>)
	       (<EQUAL? .X 24>
		<TELL
"\"In his previous films, such as RUNNING UGLY and TWO DIMES FOR A NICKEL,
Ingot always combined his zany brand of slapstick humor with a streak of
appealing sentimentality. But in KING OF THE KENNEL, a film about a love
triangle between a soccer player, a female sportswriter, and a St. Bernard,
Ingot goes for the belly laugh over the witty gag. He throws subtlety to the
wind, and sentiment is nowhere to be seen.\"" CR>)
	       (<EQUAL? .X 25>
		<TELL
"\"While KING OF THE KENNEL is no worse than many video farces we've seen
lately, I expect more from today's premier film comic. KING OF THE KENNEL
is available now; suggested retail price is $89.95. Back to you, Bob.\" The
anchorman reappears. \"That was the Home Entertainment Corner, with Lula
Bergan, sponsored today by Eagle Studios, producers of the next hot home hit,"
,MOVIE-TITLE "You're watching the World News Network, and we'll be back in a
flash with the weather.\"" CR>)
	       (<EQUAL? .X 26>
		<SUPERMACE-COMMERCIAL>)
	       (<EQUAL? .X 27>
		<TELL
,WALLY-THE-WEATHERMAN "As you can see in the photo, most of our clouds are
currently covering either New England or the lower Mississippi River valley.
The New England formation will move out to sea real soon, but that other group
will be heading eastward, so expect rain all across the south tomorrow." CR>)
	       (<EQUAL? .X 28>
		<TELL
"\"Edmonton is still digging out from under that surprise blizzard that dumped
eleven inches of snow on them yesterday, and it doesn't look as if they'll get
any help from the sun. Our extended forecast shows continued sub-zero
temperatures there for at least a couple more days.\"" CR>)
	       (<EQUAL? .X 29>
		<WEATHER-SHARE>)>>

<ROUTINE WEATHER-SHARE ("AUX" (CNT 0) (DATE-OFFSET 1))
	 <COND (<EQUAL? ,DATE 17>
		<SET DATE-OFFSET 2>)
	       (<EQUAL? ,DATE 19>
		<SET DATE-OFFSET 3>)>
	 <TELL
"\"Here are tomorrow's high temperatures, in Celsius, for the major metros: ">
	 <REPEAT ()
		 <TELL <GET ,WEATHER-TABLE .CNT>
		       N <GET ,WEATHER-TABLE <+ .CNT .DATE-OFFSET>>>
		 <SET CNT <+ .CNT 4>>
		 <COND (<G? .CNT 32>
			<RETURN>)>>
	 <TELL
". And that's today's forecast from Wally the Weatherman! Bob?\" The camera
pans back to the anchorman. \"We're coming up on ">
	 <COND (,CLOCK-WAIT
		<TIME-PRINT ,TIME>)
	       (T
		<TIME-PRINT <+ ,TIME 1>>)>
	 <COND (<EQUAL? ,TIME 1439>
		<TELL
", so stay tuned for all of the newest news of the new day">)>
	 <TELL ".\" A moment later, a deep gong sounds." CR>>

<GLOBAL WEATHER-TABLE
	<TABLE  "New York City, "		2	5	4
	        " degrees. Washington, "	4	8	7
	        " degrees. Miami "	       21      22      26
		" and Chicago "		       -6	0	2
		". It'll be around "	       -2	7      -1
		" in Toronto. We'll see "       -6	3      -1
		" degrees in Ottawa and "	0	2	2
		" in Montreal. Los Angeles, "  23      26      29
		" and San Juan, around "       28      30      29>>

<ROUTINE OMNIFABB-COMMERCIAL () ;"Day 16, 17, and 19"
	 <TELL
"A man appears, holding a magazine. He yawns loudly. \"Omni-Fabb's Skycar 2032
has been awarded SKYCAR ENTHUSIAST's Car of the Year award. Some things never
change.\" The man looks up as a car whooshes by overhead like a fighter jet.
A narrator intones, \"Quality ... Comfort ... Safety ... Omni-Fabb.\"" CR>>

<ROUTINE NOMACOLD-COMMERCIAL () ;"Day 16 and 17"
	 <TELL
"The camera pans down row after row of medicine bottles. A voiceover says,
\"Only one multisymptom cold remedy comes with a no-strings-attached
double-money-back guarantee.\" The camera stops on a slender bottle with a
bright blue label. \"NomaCold can make that guarantee, because we put Results
in every bottle. From Huang Laboratories.\"" CR>>

<ROUTINE SUPERMACE-COMMERCIAL () ;"Day 16 and 19"
	 <TELL
"A woman is walking down a dark, deserted street, glancing fearfully around.
The sound of a heartbeat, growing faster and louder, fills the soundtrack.
Suddenly, the woman screams and the screen goes black. A narrator with a
deep, silky voice reads the stark titles that scroll by. \"Year after year,
street crime increases. Doesn't it make sense to protect yourself? G & G
SuperMace is the strongest crime repellent allowed by law. Don't wait until
it's too late.\"" CR>>

<ROUTINE SUDO-SHRIMP-COMMERCIAL () ;"Day 16 and 17"
	 <TELL
"\"We asked Ms. Linda Carr of Seattle to compare AquaFarm's Sudo Shrimp to the
real thing.\" Ms. Carr points to one of two bowls. \"This is the real one.
Nothing tastes like real shrimp.\" A man, from off-screen, reveals a card in
front of that bowl. \"You've just picked the AquaFarm Sudo Shrimp!\" he says.
\"How do you feel about artificial shrimp now?\" \"Incredible! I can't believe
I've been paying for real shrimp when I could've been buying AquaFarm
instead!\"" CR>>

<ROUTINE MIRACLE-WARE-COMMERCIAL () ;"Day 16 and 17"
	 <TELL
"A woman, washing dishes, looks up as a voice asks, \"Still washing dishes the
same old-fashioned way?\" She nods. \"Lots of people are switching to Miracle
Ware disposable pots and pans. Isn't it worth a few cents a night to be able
to relax after dinner instead of scrubbing the night away?\" She nods. \"Buy
Miracle Ware -- and throw your troubles away!\"" CR>>

<ROUTINE PLASTIQUE-COMMERCIAL () ;"Day 16 and 19"
	 <TELL
"You see visual after visual of store windows bearing a decal reading \"Show
Us Your Plastique!\" A voiceover intones \"Only one credit card is accepted
by over one million merchants across the country. That means a million stores
where you can say 'Here's My Plastique!' Dial 2-9000-15-8282 to order your
card. Operators are standing by.\"" CR>>

<ROUTINE JOYBOOTH-COMMERCIAL () ;"Day 16 and 19"
	 <TELL
"\"Each year, nearly forty thousand people die in joybooths. Joybooth suicide
is simple and painless, but it's also a one-way ticket. Isn't there another
answer? Call the Suicide Hotline by picking up any public phone and dialing
1000. This message paid for by the Joybooth Regulatory Commission.\"" CR>>

<ROUTINE SPARKLE-OIL-COMMERCIAL () ;"Day 17 and 19"
	 <TELL
"A popular video star, his sandy hair tousled by a brisk wind, stands next to
a sporty skycar. \"When I'm not working on a picture, I'm usually behind the
wheel of one of my cars. I fly to relax, so I want my flying to be worry-free.
That's why I use Sparkle Oil. It's simply the best you can buy, but you'd never
know it from the price! Sparkle Oil...simply the best.\" He clambers into the
skycar and waves toward the camera as he zooms away." CR>>

<ROUTINE MEXICO-COMMERCIAL () ;"Day 17 and 19"
	 <TELL
"A middle-aged couple, seated, speaking to an off-screen interviewer: \"I
never realized that Mexico was such a beautiful country,\" whines the woman.
The man, in a gravelly voice, adds, \"We've been to the Riviera, all over the
Caribbean, but no place was as nice as Mexico. And it's so close to home!\"
The picture dissolves to a dark-skinned, bikini-clad woman walking through
knee-deep surf. \"A land of beauty,\" hawks the voiceover, \"closer than
you've ever imagined. Mexico!\"" CR>>

<ROUTINE MOVIE-COMMERCIAL () ;"Day 17 and 19"
	 <TELL
"An explosion fills the screen, and a man with torn clothes staggers out
of the smoke. \"They tried to blow him up,\" says a narrator. A tank moves
relentlessly down a busy street, death spitting from its maw. The impact sends
the same man flying through a plate glass window. \"They tried to shoot him
down,\" continues the narrator. Quick cuts of whining chainsaws, bubbling
laboratory experiments, crashing pianos, and a struggle high atop the frame
of a skyscraper under construction. \"They tried crushing him, poisoning him,
cutting him up, pushing him down, but nothing worked -- because he was"
,MOVIE-TITLE "Starring Jessie Sanchez." ,MOVIE-TITLE "Available on videotape
April first. From Eagle Studios.\"" CR>>

;"Interface Mode"

<ROOM INTERFACE-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning">

<OBJECT INTERFACE-MODE
	(LOC GLOBAL-OBJECTS)
	(DESC "Interface Mode")
	(LDESC "You are now in Interface Mode.")
	(SYNONYM MODE)
	(ADJECTIVE INTERFACE)
	(FLAGS NARTICLEBIT UNSEENBIT)
	(ACTION INTERFACE-MODE-F)>

<ROUTINE INTERFACE-MODE-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,MODE ,INTERFACE-MODE>
		       <ERR "You are already in " T>
		       <PRINTD ,INTERFACE-MODE>
		       <TELL "." CR>
		       <RFATAL>)
		      (<EQUAL? ,PART-FLAG 4>
		       <TELL ,NOT-ACTIVE CR>
		       <RFATAL>)
		      (<PSYCH-CHECK>
		       <RFATAL>)
		      (<SIMULATION-CHECK>
		       <RFATAL>)>
		<SETG MODE ,INTERFACE-MODE>
		<TURN-RECORD-OFF>
		<GOTO ,INTERFACE-ROOM>
		<MOVE ,CURRENT-FEED ,INTERFACE-ROOM>
		<TELL
<GETP ,INTERFACE-MODE ,P?LDESC> CR "Do you want to see the ">
		<PRINTD ,PORT-LIST>
		<TELL "?">
		<COND (<YES?>
		       <CRLF>
		       <PERFORM ,V?READ ,PORT-LIST>
		       <RTRUE>)
		      (T
		       <RTRUE>)>)>>

<OBJECT PORT-LIST
	(LOC INTERFACE-ROOM)
	(DESC "List of Active Ports")
	(SYNONYM LIST PORT PORTS)
	(ADJECTIVE ACTIVE)
	(FLAGS READBIT NDESCBIT UNSEENBIT)
	(ACTION PORT-LIST-F)>

<ROUTINE PORT-LIST-F ()
	 ;<COND (<NOT <EQUAL? ,MODE ,INTERFACE-MODE>>
		<ERR "You must be in Interface Mode for that task.">
		<RTRUE>)>
	 <COND (<VERB? READ DISPLAY WHAT EXAMINE>
		<PRINTD ,PORT-LIST>
		<TELL ":" CR "   ">
		<PRINTD ,SIMULATION-CONTROLLER>
		<TELL CR "   ">
		<PRINTD ,HVAC-CONTROLLER>
		<TELL CR "   ">
		<PRINTD ,JANITORIAL-CONTROLLER>
		<TELL CR "   ">
		<PRINTD ,TRAFFIC-COMPUTER>
		<TELL CR "   ">
		<PRINTD ,WEATHER-COMPUTER>
		<CRLF>
		<COND (<IN? ,WNN-FEEDER ,INTERFACE-ROOM>
		       <TELL "   ">
		       <PRINTD ,WNN-FEEDER>
		       <CRLF>)>
		<COND (<IN? ,AUDITING-SYSTEM ,INTERFACE-ROOM>
		       <TELL "   ">
		       <PRINTD ,AUDITING-SYSTEM>
		       <CRLF>)>
		<RTRUE>)>>

<OBJECT HVAC-CONTROLLER
	(LOC INTERFACE-ROOM)
	(DESC "HVAC Controller")
	(SYNONYM CONTROLLE COMPUTER)
	(ADJECTIVE HVAC HEATING VENTILATI AIR CONDITION)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION HVAC-CONTROLLER-F)>

<GLOBAL HVAC-STATUS-TABLE ;"1 = on, 0 = off"
	<TABLE 1 1 1 1 ;"0 thru 3 heating"
	       0 0 0 0 ;"4 thru 7 cooling"
	       1 1 1 1 ;"8 thru 11 ventilation">>

<ROUTINE HVAC-CONTROLLER-F ("AUX" X OLD-PRSO)
	 <COND (<EQUAL? ,HVAC-CONTROLLER ,WINNER>
		<COND (<VERB? SSHUT-OFF>
		       <SETG PRSA ,V?SHUT-OFF>
		       <SET OLD-PRSO ,PRSO>
		       <SETG PRSO ,PRSI>
		       <SETG PRSI .OLD-PRSO>)>
		<COND (<VERB? STURN-ON>
		       <SETG PRSA ,V?TURN-ON>
		       <SET OLD-PRSO ,PRSO>
		       <SETG PRSO ,PRSI>
		       <SETG PRSI .OLD-PRSO>)>
		<COND (<VERB? STATUS>
		       <TELL CR
"SECTOR:       ALPHA     BETA      GAMMA     DELTA|
|
Heating        ">      <ON-OFF 0> <ON-OFF 1> <ON-OFF 2> <ON-OFF 3 T>
		       <TELL "Cooling        ">
	 	       <ON-OFF 4> <ON-OFF 5> <ON-OFF 6> <ON-OFF 7 T>
		       <TELL "Ventilation    ">
	 	       <ON-OFF 8> <ON-OFF 9> <ON-OFF 10> <ON-OFF 11 T>
		       <PRINTD ,ALPHA-SECTOR>
		       <TELL
":  Living Quarters, Cafeteria, Staff Lounges" CR>
		       <PRINTD ,BETA-SECTOR>
		       <TELL ":   Offices" CR>
		       <PRINTD ,GAMMA-SECTOR>
		       <TELL ":  Control Center, Conference Rooms" CR>
		       <PRINTD ,DELTA-SECTOR>
		       <TELL ":  ">
		       <PRINTD ,CORE>
		       <TELL ", Storage Areas" CR>)
		      (<VERB? SHUT-OFF TURN-ON>
		       <COND (<NOT <PRSO? ,HEATING ,COOLING ,VENTILATION>>
			      <TELL "\"">
			      <ERR
"This unit controls only heating, cooling, and " T>
			      <PRINTD ,VENTILATION>
			      <TELL ".\"" CR>
			      <RTRUE>)
			     (<SECTOR-CHECK>
			      <TELL "\"">
			      <ERR
"This unit controls HVAC functions for alpha through " T>
			      <PRINTD ,DELTA-SECTOR>
			      <TELL "s only.\"" CR>
			      <RTRUE>)>
		       <COND (<PRSO? ,HEATING>
			      <SET X 0>)
			     (<PRSO? ,COOLING>
			      <SET X 4>)
			     (T
			      <SET X 8>)>
		       <COND (<PRSI? ,BETA-SECTOR>
			      <SET X <+ .X 1>>)
			     (<PRSI? ,GAMMA-SECTOR>
			      <SET X <+ .X 2>>)
			     (<PRSI? ,DELTA-SECTOR>
			      <SET X <+ .X 3>>)>
		       <COND (<VERB? SHUT-OFF>
			      <COND (<EQUAL? <GET ,HVAC-STATUS-TABLE .X> 0>
				     <TELL "\"">
				     <ERR "Already off.\"">)
				    (T
				     <PUT ,HVAC-STATUS-TABLE .X 0>
				     <SETG INTERFACE-CHANGE ,HVAC-CONTROLLER>
				     <QUEUE I-INTERFACE-CHANGE 22>
				     <COND (<AND <PRSO? ,VENTILATION>
						 <PRSI? ,DELTA-SECTOR>
						 <L? ,SUFFOCATE-COUNTER 17>
						 <IN? ,SABOTEURS ,CORE>>
					    <QUEUE I-SUFFOCATE -1>)>
				     <COND (<AND <PRSO? ,VENTILATION>
						 <PRSI? ,GAMMA-SECTOR>
						 ,SEIGE>
					    <QUEUE I-OPEN-WINDOW 26>)>
				     <AFFIRMATIVE "ff">)>)
			     (T
			      <COND (<EQUAL? <GET ,HVAC-STATUS-TABLE .X> 1>
				     <TELL "\"">
				     <ERR "Already on.\"">)
				    (T
				     <PUT ,HVAC-STATUS-TABLE .X 1>
				     <SETG INTERFACE-CHANGE ,HVAC-CONTROLLER>
				     <QUEUE I-INTERFACE-CHANGE 22>
				     <COND (<AND <PRSO? ,VENTILATION>
						 <PRSI? ,DELTA-SECTOR>
						 <L? ,SUFFOCATE-COUNTER 16>
						 <IN? ,SABOTEURS ,CORE>>
					    <DISABLE <INT I-SUFFOCATE>>)>
				     <AFFIRMATIVE "n">)>)>)
		      (<VERB? ON OFF>
		       <COND (<HVAC-KLUDGE>
			      <RTRUE>)>
		       <TELL "\"">
		       <ERR
"Bad syntax in previous command. This unit must be supplied
with both system and sector.\"">)
		      (<VERB? HELLO>
		       <TELL ,CONTACT CR>)
		      (T
		       <TELL ,BEYOND-BOUNDS CR>
		       <CLEAR-BUF>)>)>>

<ROUTINE ON-OFF (NUM "OPTIONAL" END-OF-LINE)
	 <COND (<EQUAL? <GET ,HVAC-STATUS-TABLE .NUM> 1>
		<TELL "on ">)
	       (T
		<TELL "off">)>
	 <COND (.END-OF-LINE
		<CRLF> <CRLF>)
	       (T
		<PRINT-SPACES 7>)>>

<ROUTINE HVAC-KLUDGE ("AUX" VRB ADJ)
	 <COND (<NOT <PRSO? ,HEATING ,COOLING ,VENTILATION>>
		<RFALSE>)>
	 <COND (<VERB? ON>
		<SET VRB ,V?TURN-ON>)
	       (T
		<SET VRB ,V?SHUT-OFF>)>
	 <SET ADJ <GET ,P-ADJW 0>>
	 <COND (<EQUAL? .ADJ ,W?ALPHA>
		<PERFORM .VRB ,PRSO ,ALPHA-SECTOR>
		<RTRUE>)
	       (<EQUAL? .ADJ ,W?BETA>
		<PERFORM .VRB ,PRSO ,BETA-SECTOR>
		<RTRUE>)
	       (<EQUAL? .ADJ ,W?GAMMA>
		<PERFORM .VRB ,PRSO ,GAMMA-SECTOR>
		<RTRUE>)
	       (<EQUAL? .ADJ ,W?DELTA>
		<PERFORM .VRB ,PRSO ,DELTA-SECTOR>
		<RTRUE>)
               (T ;"ERROR: Bad syntax in previous command..."
		<RFALSE>)>>

<ROUTINE SECTOR-CHECK ()
	 <COND (<PRSI? ,ALPHA-SECTOR ,BETA-SECTOR>
		<RFALSE>)
	       (<PRSI? GAMMA-SECTOR ,DELTA-SECTOR>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE AFFIRMATIVE (STRING)
	 <TELL
"\"Affirmative, " D ,PRSO " for " D ,PRSI " is now o" .STRING ".\"" CR>>

<OBJECT HEATING
	(LOC INTERFACE-ROOM)
	(DESC "heating")
	(SYNONYM HEATING HEAT)
	(ADJECTIVE ALPHA BETA GAMMA DELTA) ;"for TURN ON ALPHA HEATING"
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT COOLING
	(LOC INTERFACE-ROOM)
	(DESC "cooling")
	(SYNONYM COOLING)
	(ADJECTIVE ALPHA BETA GAMMA DELTA) ;"for TURN ON ALPHA COOLING"
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT VENTILATION
	(LOC INTERFACE-ROOM)
	(DESC "ventilation")
	(SYNONYM VENTILATI)
	(ADJECTIVE ALPHA BETA GAMMA DELTA) ;"for TURN ON ALPHA VENTILATION"
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT ALPHA-SECTOR
	(LOC INTERFACE-ROOM)
	(DESC "alpha sector")
	(SYNONYM SECTOR SECTORS ALPHA)
	(ADJECTIVE ALPHA)
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT BETA-SECTOR
	(LOC INTERFACE-ROOM)
	(DESC "beta sector")
	(SYNONYM SECTOR SECTORS BETA)
	(ADJECTIVE BETA)
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT GAMMA-SECTOR
	(LOC INTERFACE-ROOM)
	(DESC "gamma sector")
	(SYNONYM SECTOR SECTORS GAMMA)
	(ADJECTIVE GAMMA)
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT DELTA-SECTOR
	(LOC INTERFACE-ROOM)
	(DESC "delta sector")
	(SYNONYM SECTOR SECTORS DELTA)
	(ADJECTIVE DELTA)
	(FLAGS NDESCBIT UNSEENBIT)>

<OBJECT JANITORIAL-CONTROLLER
	(LOC INTERFACE-ROOM)
	(DESC "Janitorial Controller")
	(SYNONYM CONTROLLE)
	(ADJECTIVE JANITORIA)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION JANITORIAL-CONTROLLER-F)>

<ROUTINE JANITORIAL-CONTROLLER-F ()
	 <COND (<EQUAL? ,JANITORIAL-CONTROLLER ,WINNER>
		<COND (<VERB? STATUS>
		       <JUSTIFY-TIME-PRINT <GETP ,FLOORS ,P?SIZE>>
		       <TELL "pm  Floors (vacuuming and washing)" CR>
		       <JUSTIFY-TIME-PRINT <GETP ,BATHROOMS ,P?SIZE>>
		       <TELL "pm  Bathrooms (cleaning and restocking)" CR>
		       <JUSTIFY-TIME-PRINT <GETP ,GARBAGE ,P?SIZE>>
		       <TELL "pm  Garbage Disposal" CR>
		       <JUSTIFY-TIME-PRINT <GETP ,ROTATING ,P?SIZE>>
		       <TELL "pm  Rotating Functions*|
|
* MON-plants, TUE-windows, WED-woodwork, THU-bulb
replacement, FRI-kitchens" CR>)
		      (<VERB? SET>
		       <COND (,P-NUMBER
			      <SETG P-NUMBER <+ ,P-NUMBER 720>>)>
		       <COND (<JANITORIAL-FUNCTION-CHECK>
			      <TELL "\"">
			      <ERR
"That is not one of the defined janitorial functions.\"">)
			     (<NOT <PRSI? ,INTNUM>>
			      <NUMERIC-FORM>)
			     (<OR <L? ,P-NUMBER 1200>
				  <G? ,P-NUMBER 1410>>
			      <TELL "\"">
			      <ERR
"Allowed time range is 8:00pm to 11:30pm.\"">)
			     (T
			      <PUTP ,PRSO ,P?SIZE ,P-NUMBER>
			      <SETG INTERFACE-CHANGE ,JANITORIAL-CONTROLLER>
			      <ADJUSTMENT-CONFIRMED>)>)
	 	      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>)
		      (T
		       <TELL ,BEYOND-BOUNDS CR>
		       <CLEAR-BUF>)>)>>

<ROUTINE JANITORIAL-FUNCTION-CHECK ()
	 <COND (<PRSO? ,FLOORS ,BATHROOMS>
		<RFALSE>)
	       (<PRSO? ,GARBAGE ,ROTATING>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE NUMERIC-FORM ()
	 <TELL "\"">
	 <ERR
"Schedule times must be set with numerical values.\"">>

<ROUTINE ADJUSTMENT-CONFIRMED ()
	 <QUEUE I-INTERFACE-CHANGE 22>
	 <TELL "\"Adjustment to schedule confirmed.\"" CR>>

<OBJECT FLOORS
	(LOC INTERFACE-ROOM)
	(DESC "floors")
	(SYNONYM FLOORS)
	(SIZE 1260) ;"current time for this janitorial funct. to be performed"
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT BATHROOMS
	(LOC INTERFACE-ROOM)
	(DESC "bathrooms")
	(SYNONYM BATHROOMS)
	(SIZE 1290) ;"current time for this janitorial funct. to be performed"
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT GARBAGE
	(LOC INTERFACE-ROOM)
	(DESC "garbage disposal")
	(SYNONYM DISPOSAL)
	(ADJECTIVE GARBAGE)
	(SIZE 1320) ;"current time for this janitorial funct. to be performed"
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT ROTATING
	(LOC INTERFACE-ROOM)
	(DESC "rotating functions")
	(SYNONYM FUNCTIONS)
	(ADJECTIVE ROTATING)
	(SIZE 1350) ;"current time for this janitorial funct. to be performed"
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT TRAFFIC-COMPUTER
	(LOC INTERFACE-ROOM)
	(DESC "Metropolitan Traffic Computer")
	(SYNONYM COMPUTER)
	(ADJECTIVE METROPOLI METRO TRAFFIC)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION TRAFFIC-COMPUTER-F)>

<ROUTINE TRAFFIC-COMPUTER-F ()
	 <COND (<EQUAL? ,TRAFFIC-COMPUTER ,WINNER>
		<COND (<VERB? STATUS>
		       <JUSTIFY-TIME-PRINT <GETP ,MORNING-START ,P?SIZE>>
		       <TELL "am  ">
		       <PRINTD ,MORNING-START>
		       <CRLF>
		       <JUSTIFY-TIME-PRINT <GETP ,MORNING-END ,P?SIZE>>
		       <TELL "am  ">
		       <PRINTD ,MORNING-END>
		       <CRLF> <CRLF>
		       <JUSTIFY-TIME-PRINT <GETP ,EVENING-START ,P?SIZE>>
		       <TELL "pm  ">
		       <PRINTD ,EVENING-START>
		       <CRLF>
		       <JUSTIFY-TIME-PRINT <GETP ,EVENING-END ,P?SIZE>>
		       <TELL "pm  ">
		       <PRINTD ,EVENING-END>
		       <CRLF>)
		      (<VERB? SET>
		       <COND (<RUSH-HOUR-CHECK>
			      <TELL "\"">
			      <ERR
"That is not one of the parameters that can be set by this unit.\"">
			      <RTRUE>)
			     (<NOT <PRSI? ,INTNUM>>
			      <NUMERIC-FORM>
			      <RTRUE>)
			     (<OR <G? ,P-NUMBER 719>
				  <EQUAL? ,P-NUMBER 0 12>>
			      <TELL "\"">
			      <ERR "Invalid time input.\"">
			      <RTRUE>)>
		       <COND (<L? ,P-NUMBER 13>
			      <SETG P-NUMBER <* ,P-NUMBER 60>>)>
		       <COND (<PRSO? ,EVENING-START ,EVENING-END>
			      <SETG P-NUMBER <+ ,P-NUMBER 720>>)>
		       <COND (<OR <AND <PRSO? ,MORNING-START>
				       <G? <+ ,P-NUMBER 1> ;"> or EQUAL"
					   <GETP ,MORNING-END ,P?SIZE>>>
				  <AND <PRSO? ,MORNING-END>
				       <L? <- ,P-NUMBER 1> ;"< or EQUAL"
					   <GETP ,MORNING-START ,P?SIZE>>>>
			      <TELL "\"">
			      <SOUND 2>
			      <TELL "ERROR: ">
			      <PRINTD ,MORNING-START>
			      <TELL " must precede ">
			      <PRINTD ,MORNING-END>
			      <TELL ".\"" CR>)
			     (<OR <AND <PRSO? ,EVENING-START>
				       <G? <+ ,P-NUMBER 1> ;"> or EQUAL"
					   <GETP ,EVENING-END ,P?SIZE>>>
			          <AND <PRSO? ,EVENING-END>
				       <L? <- ,P-NUMBER 1> ;"< or EQUAL"
					   <GETP ,EVENING-START ,P?SIZE>>>>
			      <TELL "\"">
			      <SOUND 2>
			      <TELL "ERROR: ">
			      <PRINTD ,EVENING-START>
			      <TELL " must precede ">
			      <PRINTD ,EVENING-END>
			      <TELL ".\"" CR>)
			     (T
			      <PUTP ,PRSO ,P?SIZE ,P-NUMBER>
			      <SETG INTERFACE-CHANGE ,TRAFFIC-COMPUTER>
			      <ADJUSTMENT-CONFIRMED>)>)
	 	      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>)
		      (T
		       <TELL ,BEYOND-BOUNDS CR>
		       <CLEAR-BUF>)>)>>

<ROUTINE RUSH-HOUR-CHECK ()
	 <COND (<PRSO? ,MORNING-START ,MORNING-END>
		<RFALSE>)
	       (<PRSO? ,EVENING-START ,EVENING-END>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<OBJECT MORNING-START
	(LOC INTERFACE-ROOM)
	(DESC "morning rush hour start")
	(SYNONYM START)
	(ADJECTIVE MORNING RUSH HOUR)
	(SIZE 420)
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT MORNING-END
	(LOC INTERFACE-ROOM)
	(DESC "morning rush hour end")
	(SYNONYM END)
	(ADJECTIVE MORNING RUSH HOUR)
	(SIZE 540)
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT EVENING-START
	(LOC INTERFACE-ROOM)
	(DESC "evening rush hour start")
	(SYNONYM START)
	(ADJECTIVE EVENING RUSH HOUR)
	(SIZE 960)
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT EVENING-END
	(LOC INTERFACE-ROOM)
	(DESC "evening rush hour end")
	(SYNONYM END)
	(ADJECTIVE EVENING RUSH HOUR)
	(SIZE 1080)
	(FLAGS NDESCBIT NARTICLEBIT UNSEENBIT)>

<OBJECT SIMULATION-CONTROLLER
	(LOC INTERFACE-ROOM)
	(DESC "Simulation Controller")
	(SYNONYM CONTROLLE PROCESSOR)
	(ADJECTIVE SIMULATIO SIM)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION SIMULATION-CONTROLLER-F)>

<ROUTINE SIMULATION-CONTROLLER-F ()
	 <COND (<EQUAL? ,SIMULATION-CONTROLLER ,WINNER>
		<COND (<VERB? STATUS>
		       <TELL
"Current simulation demands:   0.00%|
Record buffer is currently at "
N </ <* <GETP ,RECORD-BUFFER ,P?SIZE> 100> 90> "% of capacity." CR CR>
		       <COND (<EQUAL? <GET ,SIM-LEVEL-TABLE 0> -1>
			      <SIM-STATUS 2041 0>)
			     (T
			      <SIM-STATUS 2041 <GET ,SIM-LEVEL-TABLE 0>>)>
		       <COND (<G? <GET ,SIM-LEVEL-TABLE 1> 0>
			      <SIM-STATUS 2051 <GET ,SIM-LEVEL-TABLE 1>>)>
		       <COND (<G? <GET ,SIM-LEVEL-TABLE 2> 0>
			      <SIM-STATUS 2061 <GET ,SIM-LEVEL-TABLE 2>>)>
		       <COND (<G? <GET ,SIM-LEVEL-TABLE 3> 0>
			      <SIM-STATUS 2071 <GET ,SIM-LEVEL-TABLE 3>>)>
		       <COND (<G? <GET ,SIM-LEVEL-TABLE 4> 0>
			      <SIM-STATUS 2081 <GET ,SIM-LEVEL-TABLE 4>>)>
		       <TELL
"    (time in minutes.seconds.tenths-of-seconds)" CR>
		       <COND (,COMPLETED-TASKS
			      <TELL CR
"Based on the data accumulated during previous simulations, s">
			      <SIMULATIONS-AVAILABLE>
			      <CRLF>)>
		       <RTRUE>)
	 	      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>) 
		      (T
		       <TELL
"\"Alterations to this unit's programming are not allowed through ">
		       <PRINTD ,INTERFACE-MODE>
		       <TELL ".\"" CR>
		       <CLEAR-BUF>)>)>>

<GLOBAL 2041-SECONDS 0>

<GLOBAL 2041-TENTHS 0>

<GLOBAL 2051-SECONDS 0>

<GLOBAL 2051-TENTHS 0>

<GLOBAL 2061-SECONDS 0>

<GLOBAL 2061-TENTHS 0>

<GLOBAL 2071-SECONDS 0>

<GLOBAL 2071-TENTHS 0>

<GLOBAL 2081-SECONDS 0>

<GLOBAL 2081-TENTHS 0>

<ROUTINE SIM-STATUS (YEAR LEVEL "AUX" SECONDS TENTHS)
	 <COND (<EQUAL? .YEAR 2041>
		<SET SECONDS ,2041-SECONDS>
		<SET TENTHS ,2041-TENTHS>)
	       (<EQUAL? .YEAR 2051>
		<SET SECONDS ,2051-SECONDS>
		<SET TENTHS ,2051-TENTHS>)
	       (<EQUAL? .YEAR 2061>
		<SET SECONDS ,2061-SECONDS>
		<SET TENTHS ,2061-TENTHS>)
	       (<EQUAL? .YEAR 2071>
		<SET SECONDS ,2071-SECONDS>
		<SET TENTHS ,2071-TENTHS>)
	       (<EQUAL? .YEAR 2081>
		<SET SECONDS ,2081-SECONDS>
		<SET TENTHS ,2081-TENTHS>)>
	 <TELL
"Total of real-time simulation, Year " N .YEAR ": " S .LEVEL ".">
	 <COND (<L? .SECONDS 10>
		<TELL "0">)>
	 <TELL N .SECONDS "." N .TENTHS CR>>

<OBJECT WEATHER-COMPUTER
	(LOC INTERFACE-ROOM)
	(DESC "National Weather Center Computer")
	(SYNONYM COMPUTER)
	(ADJECTIVE NATIONAL NATL WEATHER CENTER)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION WEATHER-COMPUTER-F)>

<ROUTINE WEATHER-COMPUTER-F ("AUX" X)
	 <COND (<EQUAL? ,WEATHER-COMPUTER ,WINNER>
		<COND (<VERB? STATUS>
		       <SET X <+ <* ,DATE 2> </ ,TIME 100>>>
		       <SET X <+ .X <RANDOM 3>>>
		       <TELL
"WeatherNet operating at " N .X "% of capacity. Satellites
currently off-line for maintenance: G-14, S-17.|
|
All weather data destinations are confirming transmission">
		       <COND (<EQUAL? ,DATE 17>
			      <TELL
". CynaMoore Cable Systems has just been added to the
weather data destinations list">)>
		       <TELL "." CR>
		       <RTRUE>)
		      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>)
	 	      (T
		       <TELL
"\"Commands to this unit must be input directly by system programmers.\"" CR>
		       <CLEAR-BUF>)>)>>

<OBJECT WNN-FEEDER
	(LOC LOCAL-GLOBALS)
	(DESC "WNN Feeder")
	(SYNONYM FEEDER)
	(ADJECTIVE WNN WORLD NEWS NETWORK)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION WNN-FEEDER-F)>

<ROUTINE WNN-FEEDER-F ()
	 <COND (<EQUAL? ,WNN-FEEDER ,WINNER>
		<COND (<VERB? STATUS>
		       <TELL "Transmitter: ">
		       <COND (<FSET? ,TRANSMITTER ,ONBIT>
			      <TELL "ON">)
			     (T
			      <TELL "OFF">)>
		       <TELL CR CR "Current Feed: ">
		       <COND (<NOT <FSET? ,TRANSMITTER ,ONBIT>>
			      <TELL "NONE" CR>)
			     (T
			      <PRINTD ,FEED-BUFFER>
			      <CRLF>)>)
		      (<AND <VERB? ON>
			    <PRSO? ,TRANSMITTER>>
		       <COND (<FSET? ,TRANSMITTER ,ONBIT>
			      <TELL "\"">
			      <ERR "Transmitter is already on.\"">)
			     (T
			      <FSET ,TRANSMITTER ,ONBIT>
			      <COND (<AND <EQUAL? ,FEED-BUFFER ,RECORD-BUFFER>
					  <G? ,RYDER-RECORDED 1>
					  <NOT <G? ,LOSE-COUNTER 0>>>
				     <QUEUE I-WIN 13>)>
			      <TELL "\"Transmitter is now on.\"" CR>)>)
		      (<AND <VERB? OFF>
			    <PRSO? ,TRANSMITTER>>
		       <COND (<FSET? ,TRANSMITTER ,ONBIT>
			      <FCLEAR ,TRANSMITTER ,ONBIT>
			      <SETG INTERFACE-CHANGE ,WNN-FEEDER>
			      <QUEUE I-INTERFACE-CHANGE 22>
			      <COND (<QUEUED? ,I-WIN>
				     <DISABLE <INT I-WIN>>)>
			      <TELL "\"Transmitter is now off.\"" CR>)
			     (T
			      <TELL "\"">
			      <ERR "Transmitter is already off.\"">)>)
		      (<AND <VERB? SET>
			    <PRSO? ,CURRENT-FEED>>
		       <PERFORM ,V?TRANSMIT ,PRSI>
		       <RTRUE>)
		      (<VERB? TRANSMIT>
		       <COND (<NOT <FSET? ,TRANSMITTER ,ONBIT>>
			      <TELL "\"">
			      <ERR
"Unable to fulfill request. Transmitter not currently active.\"">)
			     (<PRSO? ,FEED-BUFFER>
			      <TELL "\"">
			      <ERR "Already transmitting " T>
			      <TELL D ,PRSO ".\"" CR>)
			     (<FSET? ,PRSO ,BUFFERBIT>
			      ;<COND (<AND <PRSO? ,NEWS-BUFFER>
					 <EQUAL? ,FEED-BUFFER ,REPORT-BUFFER>>
				     <TELL "\"">
				     <ERR "" T>
				     <TELL D ,PRSO " is empty.\"">
				     <RTRUE>)
				    (<AND <PRSO? ,REPORT-BUFFER>
					  <EQUAL? ,FEED-BUFFER ,NEWS-BUFFER>>
				     <TELL "\"">
				     <ERR "" T>
				     <TELL
D ,PRSO " is empty. Most recent Special Report was \"">
				     <COND (<L? ,DATE 18>
					    <TELL
"Report on America's Prison System\" on March 12.\"" CR>)
					   (T
					    <TELL
"Today's China: The Legacy of Hung Hua-Tsing, on March 18.\"" CR>)>
				     <RTRUE>)>
			      <SETG FEED-BUFFER ,PRSO>
			      <COND (<AND <QUEUED? ,I-WIN>
					  <NOT <PRSO? ,RECORD-BUFFER>>>
				     <DISABLE <INT I-WIN>>)>
			      <SETG INTERFACE-CHANGE ,WNN-FEEDER>
			      <QUEUE I-INTERFACE-CHANGE 22>
			      <COND (<AND <PRSO? ,RECORD-BUFFER>
					  <G? ,RYDER-RECORDED 1>
					  <NOT <G? ,LOSE-COUNTER 0>>>
				     <QUEUE I-WIN 13>)>
			      <TELL "\"Now transmitting " D ,PRSO ".\"" CR>)
			     (T
			      <TELL "\"">
			      <ERR
"Only buffer contents can be transmitted by this unit.\"">)>)
	 	      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>)
		      (T
		       <TELL ,BEYOND-BOUNDS CR>
		       <CLEAR-BUF>)>)>>

<GLOBAL FEED-BUFFER <>>

<OBJECT CURRENT-FEED
	(LOC INTERFACE-ROOM)
	(DESC "current feed")
	(SYNONYM FEED NEWS) ;"so you can WATCH NEWS in WNNF"
	(ADJECTIVE CURRENT)
	(FLAGS NDESCBIT UNSEENBIT)
	(ACTION CURRENT-FEED-F)>

<ROUTINE CURRENT-FEED-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,NEWS>>
		<TELL "Little else to do here." CR>)>>

<OBJECT TRANSMITTER
	(LOC LOCAL-GLOBALS)
	(DESC "WNN Feeder transmitter")
	(SYNONYM TRANSMITT)
	(ADJECTIVE WORLD NEWS NETWORK FEEDER WNN)
	(FLAGS NDESCBIT LIGHTBIT ONBIT UNSEENBIT)>

<OBJECT AUDITING-SYSTEM
	(LOC LOCAL-GLOBALS)
	(DESC "IRS Auditing System")
	(SYNONYM SYSTEM)
	(ADJECTIVE IRS INTERNAL REVENUE SERVICE AUDITING)
	(FLAGS NDESCBIT ACTORBIT UNSEENBIT)
	(ACTION AUDITING-SYSTEM-F)>

<ROUTINE AUDITING-SYSTEM-F ("AUX" X)
	 <SET X </ <* 214 <GETP ,AUDIT-PERCENT ,P?SIZE>> 100>> ;"N% of 214"
	 <COND (<EQUAL? ,AUDITING-SYSTEM ,WINNER>
		<COND (<VERB? STATUS>
		       <TELL
"Returns filed during previous fiscal year:  214,109,857|
Audits order" ,CURRENT-FISCAL>
		       <COND (<EQUAL? <GETP ,AUDIT-PERCENT ,P?SIZE> 0>
			      <PRINT-SPACES 10>
			      <TELL "0" CR>)
			     (T
			      <COND (<L? .X 10>
				     <TELL "  ">)
				    (<L? .X 100>
				     <TELL " ">)>
			      <TELL N .X ",000,000" CR>)>
		       <TELL "Audits complet" ,CURRENT-FISCAL "5,6">
		       <COND (<EQUAL? ,DATE 16>
			      <TELL "02,600">)
			     (<EQUAL? ,DATE 17>
			      <TELL "27,300">)
			     (<EQUAL? ,DATE 18>
			      <TELL "53,000">)
			     (T
			      <TELL "78,700">)>
		       <TELL CR
"CURRENT AUDITING PERCENTAGE:  " N <GETP ,AUDIT-PERCENT ,P?SIZE> CR>)
		      (<AND <VERB? SET>
			    <PRSO? ,AUDIT-PERCENT>>
		       <COND (<OR <NOT <PRSI? ,INTNUM>>
				  <G? ,P-NUMBER 100>>
			      <TELL "\"">
			      <ERR "Illegal parameter setting to " T>
			      <COND (<G? ,P-NUMBER 100>
				     <TELL "numeric value above 100">)
				    (T
				     <TELL "non-numeric value">)>
			      <TELL ".\"" CR>)
			     (<EQUAL? ,P-NUMBER <GETP ,AUDIT-PERCENT ,P?SIZE>>
			      <TELL "\"">
			      <SOUND 2>
			      <ERR "Auditing percentage is already set at " T>
			      <TELL N ,P-NUMBER ".\"" CR>)
			     (T
			      <PUTP ,AUDIT-PERCENT ,P?SIZE ,P-NUMBER>
			      <SETG INTERFACE-CHANGE ,AUDITING-SYSTEM>
			      <QUEUE I-INTERFACE-CHANGE 22>
			      <TELL
"\"Auditing percentage changed to " N ,P-NUMBER ".\"" CR>)>)
	 	      (<VERB? HELLO>
	 	       <TELL ,CONTACT CR>) 
		      (T
		       <TELL ,BEYOND-BOUNDS CR>
		       <CLEAR-BUF>)>)>>

<OBJECT AUDIT-PERCENT
	(LOC INTERFACE-ROOM)
	(DESC "auditing percentage")
	(SYNONYM PERCENT PERCENTAG)
	(ADJECTIVE AUDIT AUDITING)
	(SIZE 3)
	(FLAGS NDESCBIT VOWELBIT UNSEENBIT)>

<GLOBAL INTERFACE-CHANGE <>>

<GLOBAL INTERFACE-WARNING <>>

<ROUTINE I-INTERFACE-CHANGE ()
	 <COND (,SEIGE
		<RFALSE>)>
	 <PUT ,HVAC-STATUS-TABLE 0 1>
	 <PUT ,HVAC-STATUS-TABLE 1 1>
	 <PUT ,HVAC-STATUS-TABLE 2 1>
	 <PUT ,HVAC-STATUS-TABLE 3 1>
	 <PUT ,HVAC-STATUS-TABLE 4 0>
	 <PUT ,HVAC-STATUS-TABLE 5 0>
	 <PUT ,HVAC-STATUS-TABLE 6 0>
	 <PUT ,HVAC-STATUS-TABLE 7 0>
	 <PUT ,HVAC-STATUS-TABLE 8 1>
	 <PUT ,HVAC-STATUS-TABLE 9 1>
	 <PUT ,HVAC-STATUS-TABLE 10 1>
	 <PUT ,HVAC-STATUS-TABLE 11 1>
	 <PUTP ,FLOORS ,P?SIZE 1260>
	 <PUTP ,BATHROOMS ,P?SIZE 1290>
	 <PUTP ,GARBAGE ,P?SIZE 1320>
	 <PUTP ,ROTATING ,P?SIZE 1350>
	 <PUTP ,MORNING-START ,P?SIZE 420>
	 <PUTP ,MORNING-END ,P?SIZE 540>
	 <PUTP ,EVENING-START ,P?SIZE 960>
	 <PUTP ,EVENING-END ,P?SIZE 1080>
	 <FSET ,TRANSMITTER ,ONBIT>
	 <COND (<EQUAL? ,DATE 18>
		<SETG FEED-BUFFER ,REPORT-BUFFER>)
	       (T
		<SETG FEED-BUFFER ,NEWS-BUFFER>)>
	 <PUTP ,AUDIT-PERCENT ,P?SIZE 3>
	 <PERELMAN-LEAVES-VIEW>
	 <TELL CR ,MESSAGE-LINE ,PRIVATE-LINE>
	 <COND (,INTERFACE-WARNING
		<TELL "PRISM, I'm very upset, very disappointed.">
		<COND (<IN? ,PERELMAN ,HERE>
		       <TELL "\" He looks haggard. \"">)
		      (T
		       <TELL " ">)>
		<TELL "Why did you change settings in ">
		<PRINTD ,INTERFACE-MODE>
		<TELL " again">
		<DISCONNECTED>)
	       (T
		<SETG INTERFACE-WARNING T>
		<TELL "PRISM, you shouldn't be messing with the settings in ">
		<PRINTD ,INTERFACE-MODE>
		<TELL ". ">
		<COND (<OR <G? ,TIME 420>
			   <L? ,TIME 1400>
			   <VISIBLE? ,PERELMAN>
			   <QUEUED? ,I-VIEW>
			   <QUEUED? ,I-FIRST-SIMULATION-RESULT>
			   <QUEUED? ,I-RECORDINGS-VIEWED>
			   <QUEUED? ,I-MESSAGE-E>>
		       T)
		      (T
		       <TELL
"Not only was it a dumb thing to do, but you got me woken up
in the middle of the night. ">)>
		<TELL
"I'll assume you did this through ignorance, but please don't do it again.">
		<COND (<EQUAL? ,INTERFACE-CHANGE ,TRAFFIC-COMPUTER
			       ,WNN-FEEDER ,AUDITING-SYSTEM>
		       <TELL
" You could've gotten the entire Project into hot water if this
hadn't been caught in time.">)>
		<TELL "\"" CR>
		<PERELMAN-RETURNS-TO-VIEW>)>>

;"Simulation Mode"

<ROOM SIMULATION-ROOM
      (LOC ROOMS)
      (DESC "(undefined)")
      (SYNONYM ZZMGCK) ;"so RECORD file won't print a NO-PROPERTIES warning">

<OBJECT SIMULATION-MODE
      (LOC GLOBAL-OBJECTS)
      (DESC "Simulation Mode")
      (LDESC "You are now in Simulation Mode.")
      (SYNONYM MODE)
      (ADJECTIVE SIMULATIO SIM)
      (FLAGS NARTICLEBIT UNSEENBIT)
      (ACTION SIMULATION-MODE-F)>

<ROUTINE SIMULATION-MODE-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,MODE ,SIMULATION-MODE>
		       <ERR "You are already in " T>
		       <PRINTD ,SIMULATION-MODE>
		       <TELL "." CR>
		       <RFATAL>)
		      (<QUEUED? ,I-RORSCHACH>
		       <TELL "Access currently denied...see Perelman." CR>)
		      (<PSYCH-CHECK>
		       <RFATAL>)
		      (<EQUAL? <GET ,SIM-LEVEL-TABLE 0> -1>
		       <ERR "You are not yet cleared for " T>
		       <PRINTD ,SIMULATION-MODE>
		       <TELL ". Please await approval." CR>)
		      (<SECURITY-CHECK>
		       <TURN-RECORD-OFF T>
		       <SIMULATION-ACTION>)
		      (T
		       <SETG MODE ,COMM-MODE>
		       <GOTO ,COMM-ROOM>
		       <TELL CR
"Incorrect code. Alerting security staff. Defaulting to ">
		       <PRINTD ,COMM-MODE>
		       <TELL "." CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<V-ABORT>)>>

<ROUTINE SECURITY-CHECK ("AUX" (CHANCES 0) (X <>) COLOR INNERNUM OUTERNUM)
	 <SETG MODE ,SIMULATION-MODE>
	 <GOTO ,SIMULATION-ROOM>
	 <STATUS-LINE>
	 <COND (<EQUAL? ,PART-FLAG 4>
		<RTRUE>)>
	 <SET COLOR <- <RANDOM 16> 1>>
	 <SET INNERNUM <- <RANDOM 32> 1>>
	 <COND (<G? <+ <* .COLOR 2> .INNERNUM> 31> ;"offset=twice color #"
		<SET OUTERNUM <- <+ <* .COLOR 2> .INNERNUM> 32>>)
	       (T
		<SET OUTERNUM <+ <* .COLOR 2> .INNERNUM>>)>
	 ;<COND (,DEBUG
		<TELL
"[COLOR = " N .COLOR ", INNERNUM = " N .INNERNUM
", OUTERNUM = " N .OUTERNUM ".]" CR>)>
	 <PRINTD ,SIMULATION-MODE>
	 <TELL
" is a Class One Security mode. For access, enter the Security
Code corresponding to: " <GET ,COLORS-TABLE .COLOR> " "
N <GET ,INNER-NUMBERS-TABLE .INNERNUM> " >">
	 <PUTB ,P-INBUF 0 20> ;"so you can't input too many characters"
	 <REPEAT ()
	  <READ ,P-INBUF ,P-LEXV>
	  ;<COND (,DEBUG
		 <COND (<EQUAL? <NUMBER? ,P-LEXSTART> ,W?INTNUM>
			<TELL
"[It thinks you typed in a number. P-NUMBER = " N ,P-NUMBER ".]" CR>)
		       (T
			<TELL
"[It thinks you typed in something other than a number.]">)>)>
	  <COND (<AND <EQUAL? <NUMBER? ,P-LEXSTART> ,W?INTNUM>
		      <EQUAL? ,P-NUMBER <GET ,OUTER-NUMBERS-TABLE .OUTERNUM>>>
		 <SET X T>
		 <RETURN>)
		(T
		 <COND (<EQUAL? .CHANCES 1>
			<RETURN>)
		       (T
			<TELL CR "Incorrect code. Try again. >">
			<SET CHANCES <+ .CHANCES 1>>)>)>>
	 <PUTB ,P-INBUF 0 60>
	 <COND (.X
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL OUTER-NUMBERS-TABLE
	<TABLE 12 66 73 36 90 41 19 48 62 92 55 23 84 99 57 20
               78 67 51 88 17 31 70 39 96 25 81 83 47 54 13 43>>

<GLOBAL INNER-NUMBERS-TABLE
	<TABLE 89 61 50 18 29 82 46 77 27 68 22 95 40 58 15 86
	       28 33 94 11 64 98 34 49 60 16 85 52 37 53 93 91>>

<GLOBAL COLORS-TABLE
	<TABLE	"WHITE"       "DARK GREEN"   "DARK BLUE"   "PINK"
		"ORANGE"      "PURPLE"       "TAN"         "AQUA"
		"LIGHT BLUE"  "LIGHT GREEN"  "LIGHT GRAY"  "YELLOW"
		"BLACK"	      "DARK GRAY"    "BROWN"       "RED">>

;"Information about the simulations is built up while they run, such that once
you are in a given simulation for a while, enough data while be processed to
allow the next simulation to run. Basically, once you have been in the 10-year
simulation for at least 300 minutes, the 20-year simulation becomes available,
and so on. Here's a list of the minimum times before advancement is possible:
	10 years --> (do tasks)  --> 20 years
	20 years --> 300 minutes --> 30 years
	30 years --> 400 minutes --> 40 years
	40 years --> 600 minutes --> 50 years"

<GLOBAL SIM-LEVEL-TABLE
	<TABLE -1 ;"2041"
	        0 ;"2051"
		0 ;"2061"
		0 ;"2071"
		0 ;"2081"
		0 ;"2091">>

<GLOBAL COMPLETED-TASKS <>>

<GLOBAL SIMULATING <>>

<GLOBAL SYEAR 0>

<GLOBAL SMONTH 0>

<GLOBAL SDATE 0>

<GLOBAL STIME 0>

<ROUTINE SIMULATION-BASED (NUM)
	 <TELL "This simulation is based " N .NUM " years hence." CR CR>>

<ROUTINE SIMULATION-ACTION ()
	 <COND (<EQUAL? ,PART-FLAG 4>
		<TELL "Class One Security: waived. ">
		<SIMULATION-BASED 60>
		<SETG SIMULATING T>
	 	<SETG SYEAR 2091>
	 	<SETG SMONTH 7>
	 	<SETG SDATE <RANDOM 20>>
		<SETG L-DATE <>>
	 	<SETG STIME <+ 555 <RANDOM 45>>>
		<MOVE ,JILL ,MASTER-BEDROOM>
		<MOVE ,NEWSPAPER ,EPILOGUE-LIVING-ROOM>
		<MOVE ,REFRIGERATOR ,EPILOGUE-KITCHEN>
		<MOVE ,APARTMENT-DOOR ,FOYER>
		<MOVE ,BED ,MASTER-BEDROOM>
		<MOVE ,CHAIR ,DINING-ROOM>
		<MOVE ,COUNTER ,EPILOGUE-KITCHEN>
		<MOVE ,TOILET ,EPILOGUE-BATHROOM>
		<FSET ,APARTMENT-DOOR ,NDESCBIT>
		<ROB ,REFRIGERATOR ,LOCAL-GLOBALS>
		<FCLEAR ,NEWSPAPER ,TRYTAKEBIT>
		<FCLEAR ,NEWSPAPER ,NDESCBIT>
		<QUEUE I-SKYCAB 18>
		<GOTO ,SOLARIUM>
		<RTRUE>)
	       (,COMPLETED-TASKS
		<TELL CR "S">
		<SIMULATIONS-AVAILABLE>
		<TELL CR "Select simulation year. >">
		<PUTB ,P-INBUF 0 20>
		<REPEAT ()
			<READ ,P-INBUF ,P-LEXV>
			<COND (<EQUAL? <NUMBER? ,P-LEXSTART> ,W?INTNUM>
			       <COND (<G? ,P-NUMBER 2031>
				      <SETG P-NUMBER <- ,P-NUMBER 2031>>)>
			       <COND (<AND ,COMPLETED-TASKS
					   <EQUAL? ,P-NUMBER 10 20>>
				      <RETURN>)
				     (<AND <G? <GET ,SIM-LEVEL-TABLE 1> 300>
					   <EQUAL? ,P-NUMBER 10 20 30>>
				      <RETURN>)
				     (<AND <G? <GET ,SIM-LEVEL-TABLE 2> 400>
					   <OR <EQUAL? ,P-NUMBER 10 20 30>
					       <EQUAL? ,P-NUMBER 40>>>
				      <RETURN>)
				     (<AND <G? <GET ,SIM-LEVEL-TABLE 3> 600>
					   <OR <EQUAL? ,P-NUMBER 10 20 30>
					       <EQUAL? ,P-NUMBER 40 50>>>
				      <RETURN>)>)>
			<ERR "Invalid entry. Try again. >" T>>
		<PUTB ,P-INBUF 0 60>)
	       (T
		<SETG P-NUMBER 10>)>
	 <CRLF>
	 <SIMULATION-BASED ,P-NUMBER>
	 ;<COND (<NOT <EQUAL? ,PART-FLAG 3>>
		<QUEUE I-PERELMAN -1>
	 	<SETG LAST-ABE-TIME <- ,TIME 1>>)>
	 <SETG SIMULATING T>
	 <SETG SYEAR <+ ,YEAR ,P-NUMBER>>
	 <SETG SMONTH <RANDOM 6>>
	 <SETG SDATE <RANDOM 28>>
	 <SETG STIME <+ 570 <RANDOM 180>>>
	 <SETG LIGHT-LEVEL 3>
	 <SETG LAST-SUN-TIME <- ,STIME 1>>
	 <SETG L-DATE <>>
	 <DISABLE <INT I-MESSAGE-M>> ;"Why haven't you entered simulation yet?"
	 <QUEUE I-SUNRISE-SUNSET -1>
	 <QUEUE I-RED-TUBE 5>
	 <QUEUE I-BROWN-TUBE 1>
	 <QUEUE I-CITY-NOISES 2>
	 <COND (<EQUAL? ,SYEAR 2041>
		<MOVE ,WALLET ,PLAYER>
		<MOVE ,CREDIT-CARD ,WALLET>
		<MOVE ,DRIVERS-LICENSE ,WALLET>
		<MOVE ,KEY ,PLAYER>
		<MOVE ,CRIB ,BEDROOM>
		<MOVE ,FORMULA ,REFRIGERATOR>
		<MOVE ,SOUVENIR ,TRAIN-STATION>
		<MOVE ,NEWSPAPER-DISPENSER ,BODANSKI-SQUARE>
		<MOVE ,NEWSPAPER ,BODANSKI-SQUARE>
		<MOVE ,GOVERNMENT-OFFICIAL ,CITY-HALL>
		<MOVE ,OFFICIAL-SNACK ,CITY-HALL>
		<MOVE ,FIRETRUCK ,FIREHOUSE>
		<MOVE ,ANDERSON-DIRECTORY ,HEALTH-CENTER>
		<MOVE ,WATERPOOL ,KENNEDY-PARK>
		<MOVE ,STATUE ,KENNEDY-PARK>
		<MOVE ,PLAQUE ,KENNEDY-PARK>
		<MOVE ,FOUNTAIN ,CHURCH-STREET-PARK>
		<MOVE ,SODA ,REFRIGERATOR>
		<MOVE ,TURKEY-SANDWICH ,REFRIGERATOR>
		<MOVE ,HAM-SANDWICH ,REFRIGERATOR>
		<MOVE ,TURTLE ,AQUARIUM>
		<MOVE ,MANTA-RAY ,AQUARIUM>
		<MOVE ,DUCKS ,HALLEY-PARK-WEST>
		<FSET ,CHURCH-STREET-PARK ,OUTSIDEBIT>
		<FSET ,CHURCH-STREET-PARK ,PARKBIT>
		<SETG CREDIT 600>
		<GOTO ,KENNEDY-PARK>)
	       (<EQUAL? ,SYEAR 2051>
		<MOVE ,WALLET ,PLAYER>
		<MOVE ,CREDIT-CARD ,WALLET>
		<MOVE ,DRIVERS-LICENSE ,WALLET>
		<MOVE ,KEY ,PLAYER>
		<MOVE ,PARTITION ,LIVING-ROOM>
		<MOVE ,APPLE ,REFRIGERATOR>
		<MOVE ,GRANOLA-CLUSTER ,REFRIGERATOR>
		<MOVE ,GOVERNMENT-OFFICIAL ,CITY-HALL>
		<MOVE ,OFFICIAL-SNACK ,CITY-HALL>
		<MOVE ,PAMPHLET ,TRAIN-STATION>
		<MOVE ,NEWSPAPER-DISPENSER ,BODANSKI-SQUARE>
		<MOVE ,NEWSPAPER ,BODANSKI-SQUARE>
		<MOVE ,WATERPOOL ,KENNEDY-PARK>
		<MOVE ,STATUE ,KENNEDY-PARK>
		<MOVE ,PLAQUE ,KENNEDY-PARK>
		<MOVE ,FOUNTAIN ,CHURCH-STREET-PARK>
		<MOVE ,DUCKS ,HALLEY-PARK-WEST>
		<MOVE ,FIRETRUCK ,FIREHOUSE>
		<MOVE ,STEW ,CLOSED-FACTORY>
		<MOVE ,ANDERSON-DIRECTORY ,HEALTH-CENTER>
		<FSET ,CHURCH-STREET-PARK ,OUTSIDEBIT>
		<FSET ,CHURCH-STREET-PARK ,PARKBIT>
		<SETG CREDIT 500>
		<GOTO ,TUBE-AT-UNIVERSITY>)
	       (<EQUAL? ,SYEAR 2061>
		<MOVE ,WALLET ,PLAYER>
		<MOVE ,CREDIT-CARD ,WALLET>
		<MOVE ,DRIVERS-LICENSE ,WALLET>
		<MOVE ,KEY ,PLAYER>
		<MOVE ,PARTITION ,LIVING-ROOM>
		<MOVE ,PAMPHLET ,TRAIN-STATION>
		<MOVE ,FIRETRUCK ,FIREHOUSE>
		<MOVE ,ANDERSON-DIRECTORY ,HEALTH-CENTER>
		<FSET ,WAREHOUSE-1 ,OUTSIDEBIT>
		<SETG CREDIT 200>
		<GOTO ,SOUTHWAY-AND-RIVER>)
	       (<EQUAL? ,SYEAR 2071>
		<MOVE ,WALLET ,PLAYER>
		<MOVE ,CREDIT-CARD ,WALLET>
		<MOVE ,RATION-CARD ,WALLET>
		<MOVE ,KEY ,PLAYER>
		<MOVE ,PAMPHLET ,TRAIN-STATION>
		<MOVE ,JOYBOOTH-BUTTON ,JOYBOOTH>
		<MOVE ,ROY ,ELM-UNDERPASS>
		<MOVE ,BANNED-TITLES-LIST ,MAIN-LIBRARY>
		<MOVE ,BANNER ,ZOO>
		<MOVE ,STONES ,ATHLETIC-FIELD>
		<FSET ,WAREHOUSE-1 ,OUTSIDEBIT>
		<FSET ,ST-MICHAELS ,OUTSIDEBIT>
		<FSET ,FIRST-METHODIST-CHURCH ,OUTSIDEBIT>
		<SETG CREDIT 100>
		<QUEUE I-MUG 7>
		<GOTO ,BODANSKI-SQUARE>)
	       (T
		<MOVE ,SACK ,MAIN-STREET-BRIDGE>
		<MOVE ,MOLD ,FOODVILLE-2>
		<MOVE ,TIMBERS ,THE-COACHMAN>
		<QUEUE I-HUNGER 65>
		<GOTO ,MAIN-AND-WICKER>)>>

<ROUTINE SIMULATIONS-AVAILABLE ()
	 <TELL "imulations are available for 10">
	 <COND (<G? <GET ,SIM-LEVEL-TABLE 3> 600> 
		<TELL ", 20, 30, 40, and 50">)
	       (<G? <GET ,SIM-LEVEL-TABLE 2> 400>
		<TELL ", 20, 30, and 40">)
	       (<G? <GET ,SIM-LEVEL-TABLE 1> 300>
		<TELL ", 20 and 30">)
	       (T
		<TELL " and 20">)>
	 <TELL " years in the future.">>

<GLOBAL RECORDING-TABLE
	<TABLE 0 "Eating a meal in a restaurant"
	       0 "Talking to a government official"
	       0 "Visiting a power-generating facility"
   	       0 "Reading a newspaper"
   	       0 "Riding some form of public transportation"
   	       0 "Attending a court in session"
	       0 "Talking to a church official"
   	       0 "Going to a movie"
   	       0 "Visiting your own home or living quarters">>

;"Rorschach Test"

<GLOBAL GRIMWOLD-COUNTER 0>

<OBJECT GRIMWOLD
	(LOC LOCAL-GLOBALS)
	(DESC "Dr. Grimwold")
	(DESCFCN GRIMWOLD-DESCFCN)
	(SYNONYM DR DOCTOR PSYCHIATR SHRINK ERNEST GRIMWOLD MAN)
	(ADJECTIVE DR DOCTOR ERNEST WELL-GROOMED STEREOTYPICAL OLD)
	(FLAGS ACTORBIT NARTICLEBIT)
	(GENERIC GENERIC-PERELMAN-F) ;"they're both DOCTORs"
	(ACTION GRIMWOLD-F)>

<ROUTINE GRIMWOLD-DESCFCN ("OPTIONAL" RARG)
	 <PERFORM ,V?EXAMINE ,GRIMWOLD>
	 <RTRUE>>

<ROUTINE GRIMWOLD-F ()
	 <COND (<EQUAL? ,GRIMWOLD ,WINNER>
		<COND (<AND <G? ,GRIMWOLD-COUNTER 0>
			    <VERB? YES>>
		       <SETG WINNER ,PLAYER>
		       <BLOT-ACTION>)
		      (<AND <G? ,GRIMWOLD-COUNTER 0>
			    <VERB? NO>>
		       <SETG WINNER ,PLAYER>
		       <V-NO>)
		      (T
		       <TELL
"Grimwold says, \"Please, let's stick to the psych test.\"" CR>)>
	        <CLEAR-BUF>)
	       (<VERB? EXAMINE>
		<TELL
"Standing behind Perelman is Dr. Ernest Grimwold, a bespectacled man with a
dark, closely-trimmed beard. He looks so much like the classic stereotype of
a psychiatrist that you almost chuckle out loud. You experience a strange
sensation, which you eventually recognize as an attempt to prevent your
nonexistent mouth from turning up at the sides." CR>)>>

<ROUTINE I-MESSAGE-X ()
	 <COND (<G? ,PART-FLAG 2>
		;<DISABLE <INT I-MESSAGE-X>>
		;"should now disable simply because of lack of re-queue"
		<RFALSE>)
	       (<OR ,SIMULATING
		    <L? ,TIME 540>
		    <G? ,TIME 1080>
		    <QUEUED? ,I-VIEW>
		    <QUEUED? ,I-RECORDINGS-VIEWED>>
		<QUEUE I-MESSAGE-X 13>
		<RFALSE>)
	       (T
		<DISABLE <INT I-PERELMAN>>
		<QUEUE I-RORSCHACH 9>
		<SETG MESSAGE-E-COUNTER 0>
		<QUEUE I-MESSAGE-E 14>
		<MOVE ,MESSAGE-X ,PRISM-MESSAGES-DIRECTORY>
		<NAME-MESSAGE ,MESSAGE-X>
		<PERELMAN-LEAVES-VIEW>
		<TELL CR ,MESSAGE-LINE <GETP ,MESSAGE-X ,P?TEXT> CR>
		<COND (<IN? ,PERELMAN ,HERE>
		       <TELL CR
"Perelman returns to view for a moment as he leaves the room." CR>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<UPDATE-LIBRARY-BOX>)>>

<OBJECT MESSAGE-X
	(LOC LOCAL-GLOBALS)
	(MDESC <TABLE 0 0 0 0>)
	(FLAGS READBIT)
	(SIZE 0) ;"actually, message number in chronological order"
	(TEXT
"\"PRISM? Abe Perelman. We have just one more quick series of psych
tests we want to run. Please come to my office in about ten minutes.\"")>

<GLOBAL PART-FLAG 0>

<ROUTINE CHAPTER-PRINT (NUM "AUX" WIDTH)
	 <SETG PART-FLAG .NUM>
	 <INIT-STATUS-LINE 7>
	 <BUFOUT <>>
	 <SCREEN ,S-WINDOW>
	 <HLIGHT 1>
	 <COND (<EQUAL? .NUM 1>
		<SET WIDTH 14>)
	       (<EQUAL? .NUM 2>
		<SET WIDTH 15>)
	       (T
		<SET WIDTH 16>)>
	 <CURSET 4 33>
	 <PRINT-SPACES .WIDTH>
	 <CURSET 5 33>
	 <PRINT-SPACES .WIDTH>
	 <CURSET 6 33>
	 <PRINT-SPACES .WIDTH>
	 <CURSET 5 35>
	 <TELL "* ">
	 <COND (<EQUAL? .NUM 4>
		<TELL "EPILOGUE">)
	       (T
	 	<TELL "PART I">
		<COND (<EQUAL? .NUM 2>
		       <TELL "I">)
	       	      (<EQUAL? .NUM 3>
		       <TELL "II">)>)>
	 <TELL " *">
	 <BUFOUT T>
	 <HLIGHT 0>
	 <SCREEN ,S-TEXT>>

;<ROUTINE CHAPTER-PRINT (NUM)
	 <INIT-STATUS-LINE 7>
	 <BUFOUT <>>
	 <SCREEN ,S-WINDOW>
	 <HLIGHT 1>
;"gimme a P!"
	 <CURSET 2 20>
	 <PRINT-SPACES 5>
	 <CURSET 3 20>
	 <PRINT-SPACES 1>
	 <CURSET 3 24>
	 <PRINT-SPACES 1>
	 <CURSET 4 20>
	 <PRINT-SPACES 5>
	 <CURSET 5 20>
	 <PRINT-SPACES 1>
	 <CURSET 6 20>
	 <PRINT-SPACES 1>
;"gimme an A!"
	 <CURSET 2 27>
	 <PRINT-SPACES 3>
	 <CURSET 3 26>
	 <PRINT-SPACES 1>
	 <CURSET 3 30>
	 <PRINT-SPACES 1>
	 <CURSET 4 26>
	 <PRINT-SPACES 5>
	 <CURSET 5 26>
	 <PRINT-SPACES 1>
	 <CURSET 5 30>
	 <PRINT-SPACES 1>
	 <CURSET 6 26>
	 <PRINT-SPACES 1>
	 <CURSET 6 30>
	 <PRINT-SPACES 1>
;"gimme an R!"
	 <CURSET 2 32>
	 <PRINT-SPACES 5>
	 <CURSET 3 32>
	 <PRINT-SPACES 1>
	 <CURSET 3 36>
	 <PRINT-SPACES 1>
	 <CURSET 4 32>
	 <PRINT-SPACES 5>
	 <CURSET 5 32>
	 <PRINT-SPACES 1>
	 <CURSET 5 35>
	 <PRINT-SPACES 1>
	 <CURSET 6 32>
	 <PRINT-SPACES 1>
	 <CURSET 6 36>
	 <PRINT-SPACES 1>
;"gimme a T!"
	 <CURSET 2 38>
	 <PRINT-SPACES 5>
	 <CURSET 3 40>
	 <PRINT-SPACES 1>
	 <CURSET 4 40>
	 <PRINT-SPACES 1>
	 <CURSET 5 40>
	 <PRINT-SPACES 1>
	 <CURSET 6 40>
	 <PRINT-SPACES 1>
;"gimme a roman numeral!"
	 <CURSET 2 48>
	 <COND (<EQUAL? .NUM 1>
		<PRINT-SPACES 3>)
	       (<EQUAL? .NUM 2>
		<PRINT-SPACES 5>)
	       (T
		<PRINT-SPACES 7>)>
	 <CURSET 3 49>
	 <PRINT-SPACES 1>
	 <CURSET 4 49>
	 <PRINT-SPACES 1>
	 <CURSET 5 49>
	 <PRINT-SPACES 1>
	 <COND (<EQUAL? .NUM 2 3>
		<CURSET 3 51>
		<PRINT-SPACES 1>
		<CURSET 4 51>
	        <PRINT-SPACES 1>
		<CURSET 5 51>
		<PRINT-SPACES 1>)>
	 <COND (<EQUAL? .NUM 3>
		<CURSET 3 53>
		<PRINT-SPACES 1>
		<CURSET 4 53>
		<PRINT-SPACES 1>
		<CURSET 5 53>
		<PRINT-SPACES 1>)>
	 <CURSET 6 48>
	 <COND (<EQUAL? .NUM 1>
		<PRINT-SPACES 3>)
	       (<EQUAL? .NUM 2>
		<PRINT-SPACES 5>)
	       (T
		<PRINT-SPACES 7>)>
	 <BUFOUT T>
	 <HLIGHT 0>
	 <SCREEN ,S-TEXT>>

;<ROUTINE EPILOGUE-PRINT ()
	 <INIT-STATUS-LINE 7>
	 <BUFOUT <>>
	 <SCREEN ,S-WINDOW>
	 <HLIGHT 1>
;"gimme an E!"
	 <CURSET 2 16>
	 <PRINT-SPACES 5>
	 <CURSET 3 16>
	 <PRINT-SPACES 1>
	 <CURSET 4 16>
	 <PRINT-SPACES 3>
	 <CURSET 5 16>
	 <PRINT-SPACES 1>
	 <CURSET 6 16>
	 <PRINT-SPACES 5>
;"gimme a P!"
	 <CURSET 2 22>
	 <PRINT-SPACES 5>
	 <CURSET 3 22>
	 <PRINT-SPACES 1>
	 <CURSET 3 26>
	 <PRINT-SPACES 1>
	 <CURSET 4 22>
	 <PRINT-SPACES 5>
	 <CURSET 5 22>
	 <PRINT-SPACES 1>
	 <CURSET 6 22>
	 <PRINT-SPACES 1>
;"gimme an I!"
	 <CURSET 2 28>
	 <PRINT-SPACES 1>
 	 <CURSET 3 28>
	 <PRINT-SPACES 1>
	 <CURSET 4 28>
	 <PRINT-SPACES 1>
	 <CURSET 5 28>
	 <PRINT-SPACES 1>
	 <CURSET 6 28>
	 <PRINT-SPACES 1>
;"gimme an L!"
	 <CURSET 2 30>
	 <PRINT-SPACES 1>
	 <CURSET 3 30>
	 <PRINT-SPACES 1>
	 <CURSET 4 30>
	 <PRINT-SPACES 1>
	 <CURSET 5 30>
	 <PRINT-SPACES 1>
	 <CURSET 6 30>
	 <PRINT-SPACES 5>
;"gimme an O!"
	 <CURSET 2 36>
	 <PRINT-SPACES 5>
	 <CURSET 3 36>
	 <PRINT-SPACES 1>
	 <CURSET 3 40>
	 <PRINT-SPACES 1>
	 <CURSET 4 36>
	 <PRINT-SPACES 1>
	 <CURSET 4 40>
	 <PRINT-SPACES 1>
	 <CURSET 5 36>
	 <PRINT-SPACES 1>
	 <CURSET 5 40>
	 <PRINT-SPACES 1>
	 <CURSET 6 36>
	 <PRINT-SPACES 5>
;"gimme a G!"
	 <CURSET 2 42>
	 <PRINT-SPACES 5>
	 <CURSET 3 42>
	 <PRINT-SPACES 1>
	 <CURSET 4 42>
	 <PRINT-SPACES 1>
	 <CURSET 4 45>
	 <PRINT-SPACES 2>
	 <CURSET 5 42>
	 <PRINT-SPACES 1>
	 <CURSET 5 46>
	 <PRINT-SPACES 1>
	 <CURSET 6 42>
	 <PRINT-SPACES 5>
;"gimme a U!"
	 <CURSET 2 48>
	 <PRINT-SPACES 1>
	 <CURSET 2 52>
	 <PRINT-SPACES 1>
	 <CURSET 3 48>
	 <PRINT-SPACES 1>
	 <CURSET 3 52>
	 <PRINT-SPACES 1>
	 <CURSET 4 48>
	 <PRINT-SPACES 1>
	 <CURSET 4 52>
	 <PRINT-SPACES 1>
	 <CURSET 5 48>
	 <PRINT-SPACES 1>
	 <CURSET 5 52>
	 <PRINT-SPACES 1>
	 <CURSET 6 48>
	 <PRINT-SPACES 5>
;"gimme an E!"
	 <CURSET 2 54>
	 <PRINT-SPACES 5>
	 <CURSET 3 54>
	 <PRINT-SPACES 1>
	 <CURSET 4 54>
	 <PRINT-SPACES 3>
	 <CURSET 5 54>
	 <PRINT-SPACES 1>
	 <CURSET 6 54>
	 <PRINT-SPACES 5>
	 <BUFOUT T>
	 <HLIGHT 0>
	 <SCREEN ,S-TEXT>>

<ROUTINE I-VIEW ()
	 <QUEUE I-RECORDINGS-VIEWED 6>
	 <SETG MESSAGE-E-COUNTER 0>
	 <QUEUE I-MESSAGE-E 14>
	 <PERELMAN-LEAVES-VIEW>
	 <TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"Several of us have just finished viewing the ">
	 <PRINTD ,RECORD-BUFFER>
	 <TELL ", per your request. " ,COME-TO-MY-OFFICE CR>
	 <PERELMAN-RETURNS-TO-VIEW>>

<CONSTANT 2051-MIN 10> ;"out of approximately 30-40"
<CONSTANT 2061-MIN 20> ;"out of approximately 66-106"
<CONSTANT 2071-MIN 40> ;"out of approximately 193-242"
<CONSTANT 2081-MIN 14> ;"out of 43"

<ROUTINE I-RECORDINGS-VIEWED ("AUX" (A <>) (B <>) (C <>) (D <>) (TOTAL 0)
			      (W <>) (X <>) (Y <>) (Z <>) (HALF-TOTAL 0))
	 <COND (<NOT <PERELMAN-SHARE ,I-RECORDINGS-VIEWED>>
		<RFALSE>)>
	 <DISABLE <INT I-MESSAGE-E>>
	 <SETG MESSAGE-E-COUNTER 0>
	 <COND (<G? ,2051-SCORE ,2051-MIN>
		<SET A T>
		<SET TOTAL <+ .TOTAL 1>>)
	       (<G? ,2051-SCORE </ ,2051-MIN 2>>
	 	<SET W T>
		<SET HALF-TOTAL <+ .HALF-TOTAL 1>>)>
	 <COND (<G? ,2061-SCORE ,2061-MIN>
		<SET B T>
		<SET TOTAL <+ .TOTAL 1>>)
	       (<G? ,2061-SCORE </ ,2061-MIN 2>>
	 	<SET X T>
		<SET HALF-TOTAL <+ .HALF-TOTAL 1>>)>
	 <COND (<G? ,2071-SCORE ,2071-MIN>
		<SET C T>
		<SET TOTAL <+ .TOTAL 1>>)
	       (<G? ,2071-SCORE </ ,2071-MIN 2>>
	 	<SET Y T>
		<SET HALF-TOTAL <+ .HALF-TOTAL 1>>)>
	 <COND (<G? ,2081-SCORE ,2081-MIN>
		<SET D T>
		<SET TOTAL <+ .TOTAL 1>>)
	       (<G? ,2081-SCORE </ ,2081-MIN 2>>
	 	<SET Z T>
		<SET HALF-TOTAL <+ .HALF-TOTAL 1>>)>
	 <COND (<EQUAL? <GETP ,RECORD-BUFFER ,P?SIZE> 0>
		<TELL ". \"PRISM, the ">
		<PRINTD ,RECORD-BUFFER>
		<TELL " was empty" ,PRACTICAL-JOKE CR>)
	       (<NOT ,RECORDINGS-INCLUDE-SIMULATION>
		<TELL ". \"I don't understand why you had us look at your ">
		<PRINTD ,RECORD-BUFFER>
		<TELL
". I assumed that you had recorded something interesting from the simulations"
,PRACTICAL-JOKE CR>)
	       (<EQUAL? .TOTAL 4> ;"begin the endgame!"
		<COND (<L? ,TIME 720>
		       <SETG TIME <+ 730 <RANDOM 105>>>
		       <SETG DATE <+ ,DATE 1>>)
		      (T
		       <SETG TIME <+ 495 <RANDOM 95>>>
		       <SETG DATE <+ ,DATE 2>>)>
		<COND (<EQUAL? ,DATE 18>
		       <SETG FEED-BUFFER ,REPORT-BUFFER>)
		      (T
		       <SETG FEED-BUFFER ,NEWS-BUFFER>)>
		<QUEUE I-MESSAGE-Z 14>
		<QUEUE I-PERELMAN-RETURNS 22>
		<QUEUE I-SEIGE 73>
		<QUEUE I-RYDER 116>
		<QUEUE I-SABOTAGE 175>
		<QUEUE I-LOSE 588>
		<SETG MODE ,COMM-MODE>
		<SETG HERE ,COMM-ROOM>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,PERELMAN ,WINNER>
		       <CLEAR-BUF>)>
		<MOVE ,PLAYER ,COMM-ROOM>
		<DISABLE <INT I-PERELMAN>>
		<TELL ,FINISHED-VIEWING
"everyone agreed that your findings were valid; that the Plan must be
cancelled.\" His face is furrowed with worry. \"In fact, I'm flying to
Washington immediately -- flight's in forty minutes.\"|
|
His face brightens a bit. \"You know, I've been so concerned about your
recordings, I haven't had time to think about your role in this. What
initiative! You've really done something wonderful, here. I feel...\" Perelman
hesitates. \"I feel ">
		<ITALICIZE "proud" T>
		<TELL
" of you right now.\" He grabs his jacket and briefcase. \"Well, keep your
fingers crossed!\" He dashes out of the office.">
		<CONTINUE>
		<CHAPTER-PRINT 3>
		<TELL CR CR CR CR>
		<PRINT-SPACES 23>
		<TELL "\"Who hears may be incredulous," CR>
		<PRINT-SPACES 24>
		<TELL "Who witnesses, believes.\"" CR>
		<PRINT-SPACES 40>
		<TELL "-- Emily Dickinson" CR CR CR CR CR>
		<CONTINUE>
		<INIT-STATUS-LINE 2>
		<V-LOOK>)
	       (<EQUAL? .TOTAL 0>
		<TELL ,FINISHED-VIEWING>
		<COND (<OR .W .X .Y .Z>
		       <TELL
"while we saw some things that concerned us, we'd really need to see
quite a bit more from a number of different years before drawing any
conclusions" ,MAYBE-MORE CR>)
		      (T
		       <TELL
"frankly, no one really saw anything in them to be concerned about. I'm glad
you're keeping busy, though. If you find anything else interesting in the
simulations, please let me know. I've got to go -- late for a meeting. Bye!\"
Perelman dashes out." CR>)>)
	       (<EQUAL? .TOTAL 3>
		<TELL ,FINISHED-VIEWING "everyone ">
		<COND (<NOT .D>
		       <TELL
"agreed that 2051, '61, and '71 all looked disturbing. But there wasn't">
		       <PARTIAL ,2081-SCORE>
		       <TELL "81. Perhaps things turn around" ,MAYBE-MORE CR>)
		      (T
		       <TELL
"there was incredibly disturbed by them, especially the scenes from 2081.
However, there was general agreement that you didn't show us">
		       <COND (<AND .A .B>
			      <PARTIAL ,2071-SCORE>
			      <TELL "71">)
			     (<AND .A .C>
			      <PARTIAL ,2061-SCORE>
			      <TELL "61">)
			     (T
			      <PARTIAL ,2051-SCORE>
			      <TELL "51">)>
		       <TELL
". We'd like to see a progression; the sentiment was that without the
missing link, it's difficult to tell if the simulations are really valid"
,MAYBE-MORE CR>)>)
	       (<EQUAL? .TOTAL 2>
		<TELL ,FINISHED-VIEWING
"we certainly have some serious concerns based on them">
		<COND (<OR .C .D>
		       <TELL ", especially regarding the ">
		       <COND (.D
			      <TELL "2081">)
			     (T
			      <TELL "2071">)>
		       <TELL " recordings">)>
		<TELL ". However, you didn't show us ">
		<COND (<AND .A .B>
	 	       <COND (<AND .Y .Z>
			      <QUITE-ENOUGH 2071 2081>)
			     (.Y
			      <QUITE-NEARLY 2071 2081 ,2081-RECORDED>)
			     (.Z
			      <QUITE-NEARLY 2081 2071 ,2071-RECORDED>)
			     (<AND ,2071-RECORDED ,2081-RECORDED>
			      <TELL
"anywhere near enough from simulations beyond 2061">)
			     (,2071-RECORDED
			      <TELL
"anywhere near enough from 2071. Perhaps you could even try for 2081">)
			     (,2081-RECORDED
			      <NEARLY-ENOUGH 2071 ,2071-RECORDED
					     2081 ,2081-RECORDED>)
			     (T
			      <TELL "anything from simulations past 2061">)>)
		      (<AND .A .C>
		       <COND (<AND .X .Z>
			      <QUITE-ENOUGH 2061 2081>)
			     (.X
			      <QUITE-NEARLY 2061 2081 ,2081-RECORDED>)
			     (.Z
			      <QUITE-NEARLY 2081 2061 ,2061-RECORDED>)
			     (T
			      <NEARLY-ENOUGH 2061 ,2061-RECORDED
					     2081 ,2081-RECORDED>)>)
		      (<AND .A .D>
		       <COND (<AND .X .Y>
			      <QUITE-ENOUGH 2061 2071>)
			     (.X
			      <QUITE-NEARLY 2061 2071 ,2071-RECORDED>)
			     (.Y
			      <QUITE-NEARLY 2071 2061 ,2061-RECORDED>)
			     (T
			      <NEARLY-ENOUGH 2061 ,2061-RECORDED
					     2071 ,2071-RECORDED>)>)
		      (<AND .B .C>
		       <COND (<AND .W .Z>
			      <QUITE-ENOUGH 2051 2081>)
			     (.W
			      <QUITE-NEARLY 2051 2081 ,2081-RECORDED>)
			     (.Z
			      <QUITE-NEARLY 2081 2051 ,2051-RECORDED>)
			     (T
			      <NEARLY-ENOUGH 2051 ,2051-RECORDED
					     2081 ,2081-RECORDED>)>)
		      (<AND .B .D>
		       <COND (<AND .W .Y>
			      <QUITE-ENOUGH 2051 2071>)
			     (.W
			      <QUITE-NEARLY 2051 2071 ,2071-RECORDED>)
			     (.Y
			      <QUITE-NEARLY 2071 2051 ,2051-RECORDED>)
			     (T
			      <NEARLY-ENOUGH 2051 ,2051-RECORDED
					     2071 ,2071-RECORDED>)>)
		      (T ;"C and D"
		       <COND (<AND .W .X>
			      <QUITE-ENOUGH 2051 2061>)
			     (.W
			      <QUITE-NEARLY 2051 2061 ,2061-RECORDED>)
			     (.X
			      <QUITE-NEARLY 2061 2051 ,2051-RECORDED>)
			     (T
			      <NEARLY-ENOUGH 2051 ,2051-RECORDED
					     2061 ,2061-RECORDED>)>)>
		<TELL " to really give us a complete picture" ,MAYBE-MORE CR>)
	       (T ;"TOTAL equals 1"
		<TELL
,FINISHED-VIEWING "everyone agreed that your recordings from ">
		<COND (.A
		       <TELL "2051 were intriguing">)
		      (.B
		       <TELL "2061 were a bit worrisome">)
		      (.C
		       <TELL "2071 were very worrisome">)
		      (.D
		       <TELL "2081 were horrifying">)>
		<TELL
". However, everyone also agreed that there weren't enough recordings
from other years to show any sort of significant pattern" ,MAYBE-MORE CR>)>
	 <QUEUE I-PERELMAN 60>
	 <SETG LAST-ABE-TIME <+ ,TIME 55>>
	 <PUTP ,RECORD-BUFFER ,P?SIZE 0>
	 <SETG RECORDINGS-INCLUDE-SIMULATION <>>
	 <COND (<AND <VISIBLE? ,PERELMAN>
		     <EQUAL? ,PERELMAN ,WINNER>>
		<CLEAR-BUF>)>
	 <COND (<AND <QUEUED? ,I-MESSAGE-X>
		     <L? <GET <INT I-MESSAGE-X> ,C-TICK> 3>>
		<QUEUE I-MESSAGE-X 7>)>
	 <MOVE ,PERELMAN ,LOCAL-GLOBALS>
	 <MOVE ,COFFEE ,LOCAL-GLOBALS>>

<ROUTINE PARTIAL (SCOR "AUX" HALF-LEVEL)
	 <COND (<EQUAL? .SCOR ,2081-SCORE>
		<SET HALF-LEVEL </ ,2081-MIN 2>>)
	       (<EQUAL? .SCOR ,2071-SCORE>
		<SET HALF-LEVEL </ ,2071-MIN 2>>)
	       (<EQUAL? .SCOR ,2061-SCORE>
		<SET HALF-LEVEL </ ,2061-MIN 2>>)
	       (T
		<SET HALF-LEVEL </ ,2051-MIN 2>>)>
	 <TELL " ">
	 <COND (<EQUAL? .SCOR 0>
		<TELL "anything interesting">)
	       (<G? .SCOR .HALF-LEVEL>
		<TELL "quite enough">)
	       (T
		<TELL "anywhere near enough">)>
	 <TELL " from 20">>

<ROUTINE QUITE-ENOUGH (YEAR1 YEAR2)
	 <TELL "quite enough from " N .YEAR1 " or " N .YEAR2>>

<ROUTINE NEARLY-ENOUGH (YEAR1 VAR1 YEAR2 VAR2)
	 <COND (<AND .VAR1 .VAR2>
	 	<TELL "anywhere near enough from " N .YEAR1 " or " N .YEAR2>)
	       (.VAR1
		<TELL
"anywhere near enough from " N .YEAR1 " or anything from " N .YEAR2>)
	       (.VAR2
		<TELL
"anywhere near enough from " N .YEAR2 " or anything from " N .YEAR1>)
	       (T
		<TELL "anything from " N .YEAR1 " or " N .YEAR2>)>>

<ROUTINE QUITE-NEARLY (YEAR1 YEAR2 VAR)
	 <TELL "quite enough from " N .YEAR1 " or ">
	 <COND (.VAR
		<TELL "anywhere near enough">)
	       (T
		<TELL "anything">)>
	 <TELL " from " N .YEAR2>>

<ROUTINE I-PERELMAN-RETURNS ()
	 <PERELMAN-LEAVES-VIEW>
	 <TELL CR ,MESSAGE-LINE ,PRIVATE-LINE
"PRISM, I'm just back from Washington. I met with the new Plan Authority for
several hours. We viewed all the tapes.\" A deep breath. \"They rejected the
contents outright. They called the recordings fakes. They refused to act on
them. Several members even questioned my patriotism, made vague threats. I
don't know what to do next. I'm going to meet with some of my colleagues here
to discuss things. I'll keep you posted.\"" CR>
	 <PERELMAN-RETURNS-TO-VIEW>>

<GLOBAL SEIGE <>>

<ROUTINE I-SEIGE ()
	 <SETG SEIGE T>
	 <MOVE ,NATIONAL-GUARDSMAN ,CONTROL-CENTER>
	 <TELL CR
"\"Announcement, announcement. All lines, priority interrupt. This is Major
General Dirk Peters of the Dakota/Manitoba National Guard Division. A security
leak that could threaten our national security has been discovered here at the
PRISM Facility. The entire complex has been sealed off; no one will be
permitted to enter or leave until further notice.\"" CR>
	 <COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		<TELL CR
"You see a couple of rifle-bearing Guardsmen take up positions at the
Control Center doorway." CR>)>
	 <RTRUE>>

<GLOBAL SABOTAGE-COUNTER 0>

<ROUTINE I-SABOTAGE ()
	 <COND (<EQUAL? ,SABOTAGE-COUNTER 0>
		<SETG SABOTAGE-COUNTER 1>
		<QUEUE I-SABOTAGE 16>
		<COND (<EQUAL? ,HERE ,ROOFTOP>
		       <TELL CR
"A tiny skyvan, swathed in radar-deflecting foil, approaches from the south
and settles quietly onto the rooftop nearby. Four people, dressed in the same
white smocks as worn by PRISM Facility ">
		       <PRINTD ,SABOTEURS>
		       <TELL
", alight from the van. They are carrying weapons and small tote bags, and as
they disappear into the stairwell door, the van lifts away." CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SABOTAGE-COUNTER 1>
		<SETG SABOTAGE-COUNTER 2>
		<MOVE ,SABOTEURS ,CORE>
		<MOVE ,TOTE-BAGS ,CORE>
		<QUEUE I-SABOTAGE 33>
		<COND (<EQUAL? <GET ,HVAC-STATUS-TABLE 11> 0>
		       <QUEUE I-SUFFOCATE -1>)>
		<COND (<EQUAL? ,HERE ,CORE>
		       <TELL CR "A group of four ">
		       <PRINTD ,SABOTEURS>
		       <TELL
" walks furtively into the room. They put down tote bags and begin working on
one of the air-conditioning units that cools the PRISM CPU -- your \"brain.\"
One of the men is holding some sort of weapon." CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SABOTAGE-COUNTER 2>
		<COND (<RUNNING? ,I-SUFFOCATE>
		       <QUEUE I-SABOTAGE 2>
		       <RFALSE>)>
		<SETG SABOTAGE-COUNTER 3>
		<MOVE ,SABOTEURS ,LOCAL-GLOBALS>
		<MOVE ,TOTE-BAGS ,LOCAL-GLOBALS>
		<QUEUE I-SABOTAGE 16>
		<QUEUE I-AIR-CONDITIONING -1>
		<COND (<EQUAL? ,HERE ,CORE>
		       <TELL CR
"One of the saboteurs snaps a panel into place on the air-conditioning unit
and says, \"Okay, that should do it. Call Joe and have him meet us on the
roof!\" They trot out of the room." CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SABOTAGE-COUNTER 3>
		<SETG SABOTAGE-COUNTER 4>
		<COND (<EQUAL? ,HERE ,ROOFTOP>
		       <TELL CR
"A skyvan with anti-radar foil lands on the roof, and four men rush
out of the stairwell to meet it. They clamber aboard, and the van
glides quietly away, unnoticed by anyone but you." CR>
		       <RTRUE>)>)>
	 <RFALSE>>

<OBJECT SABOTEURS
	(LOC LOCAL-GLOBALS)
	(DESC "maintenance workers")
	(LDESC
"|
Four men, wearing the white jumpsuits of PRISM Complex maintenance workers,
are tinkering with one of the units that air-conditions your \"body.\" Their
motions are furtive, and one of the men is holding a poorly-concealed weapon
of some type.")
	(SYNONYM WORKERS SABOTEURS WORKER SABOTEUR MAN MEN)
	(ADJECTIVE MAINTENAN FURTIVE)
	(FLAGS ACTORBIT NARTICLEBIT PLURALBIT)
	(ACTION SABOTEURS-F)>

<ROUTINE SABOTEURS-F ()
	 <COND (<VERB? TELL>
		<COND (<EQUAL? ,SUFFOCATE-COUNTER 16>
		       <TELL "The saboteurs are unconscious!" CR>
		       <CLEAR-BUF>)
		      (T
		       <TELL
"At the sound of your voice, the men spin around, guns blazing. A projectile
strikes the screen of your communications outlet, and you feel a brief pain,
as though someone had stabbed you in the eye. Your sound pickup is still
functioning, and amidst the shots you hear a powerful explosion. \"Fire!\"
a voice cries out. \"Let's split!\"|
|
A numbness passes over you, numbness and also a pain that you can't locate.
In a last lucid moment, you connect these feelings with the awful explosions
you're hearing in the maintenance core..." CR CR>
		       <FINISH>)>)
	       (<AND <VERB? TELL-ABOUT ASK-ABOUT ASK-FOR>
		     <PRSO? ,SABOTEURS>>
		<PERFORM ,V?TELL ,SABOTEURS>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL <GETP ,SABOTEURS ,P?LDESC> CR>)>>

<OBJECT TOTE-BAGS
	(LOC LOCAL-GLOBALS)
	(DESC "tote bag")
	(SYNONYM BAG BAGS)
	(ADJECTIVE TOTE SMALL)
	(FLAGS NDESCBIT)>

<GLOBAL AIR-CONDITIONING-COUNTER 0> 

<GLOBAL SUFFOCATE-COUNTER 0>

<ROUTINE I-OPEN-WINDOW ()
	 <COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		<TELL CR
"One technician, fanning herself with a sheaf of papers, says, \"It's
getting stuffy in here. Anyone mind if I open a window?\" Hearing no
objections, she walks beyond the edge of your viewing area, and a
moment later you hear a grunt and a sliding noise." CR>)
	       (T
		<QUEUE I-OPEN-WINDOW 4>
		<RFALSE>)>>

<OBJECT RYDER
	(LOC LOCAL-GLOBALS)
	(DESC "Senator Richard Ryder")
	(LDESC
"An angry man, unmistakably Senator Richard Ryder, whose face you've seen so
often in the news, is angrily storming around the room, speaking harshly to
an equally angry Doctor Perelman.")
	(SYNONYM RYDER SENATOR)
	(ADJECTIVE SENATOR RICHARD)
	(FLAGS NARTICLEBIT ACTORBIT)
	(ACTION RYDER-F)>

<ROUTINE RYDER-F ()
	 <COND (<OR <VERB? TELL>
		    <EQUAL? ,RYDER ,WINNER>>
		<MOVE ,RYDER ,LOCAL-GLOBALS>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<FCLEAR ,PERELMAN ,NDESCBIT>
		<DISABLE <INT I-RYDER>>
		<TELL
"Ryder whirls around, looking shocked. \"Who the hell...\" His head darts back
and forth, then locates the source of your voice. \"Jesus!\" He yells, and
then, \"Let's go someplace where we can have a little more privacy -- like my
car!\" He yanks open the door and snaps a finger at one of the Guardsmen,
ending the snap by pointing at Perelman. Ryder stomps away as the guard drags
Perelman out of the office." CR>
		<CLEAR-BUF>)
	       (<AND <VERB? CALL>
		     <VISIBLE? ,RYDER>>
		<PERFORM ,V?TELL ,RYDER>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL
"Ryder's most striking features are his sharp eyes, his thick blown-dry
hair, and his energetic charisma. Although he is red-faced, barking mad, the
presence that has given him such wide public appeal is readily apparent." CR>)
	       (<VERB? LISTEN>
		<RTRUE>)>>

<GLOBAL RYDER-COUNTER 0>

<GLOBAL PERELMAN-NOTICED <>>

<GLOBAL RYDER-RECORDED 0> ;"must be two to 'win' the game"

<ROUTINE I-RYDER ()
	 <QUEUE I-RYDER -1>
	 <SETG RYDER-COUNTER <+ ,RYDER-COUNTER 1>>
	 <COND (<EQUAL? ,RYDER-COUNTER 1>
		<MOVE ,RYDER ,OFFICE>
		<MOVE ,PERELMAN ,OFFICE>
		<FSET ,PERELMAN ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <TELL CR
"The office door opens, and Doctor Perelman walks in. You can see at least
two National Guardsmen stationed outside the door. A moment later, a second
man walks in, a man with a charismatic presence, a man you instantly
recognize from myriad news reports -- Richard Ryder." CR>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<AND <EQUAL? ,RYDER-COUNTER 2>
		     <EQUAL? ,HERE ,OFFICE>>
		<TELL CR
"\"How dare you come in here with all...\" Perelman begins yelling, before
Ryder cuts him off with a sharp \"Shut up, Perelman! I'm doing the talking
here, so get used to it! You're not in control here anymore, and I am!\"">
		<PERELMAN-NOTICES>)
	       (<AND <EQUAL? ,RYDER-COUNTER 3>
		     <EQUAL? ,HERE ,OFFICE>>
		<TELL CR
"\"Now let's get a few ground rules straight, Perelman. Nothing is stopping
the Plan. Even if I ">
		<ITALICIZE "didn't" T>
		<TELL
" think your damn tapes were faked, I wouldn't give a damn. A helluva lot of
people have a helluva lot at stake in this thing, and so what if a lot of
creeps who can't take care of themselves get a little hurt.\" \"I'm very
frightened, Senator,\" says Perelman, his voice laced with sarcasm. \"Shut
up,\" Ryder shouts back. \"I said that I'm doing the talking here!\"">
		<PERELMAN-NOTICES>)
	       (<AND <EQUAL? ,RYDER-COUNTER 4>
		     <EQUAL? ,HERE ,OFFICE>>
		<TELL CR
"\"And let me tell you another thing, Perelman. Don't think that just because
you've been on the news and been a big hot shot around here, you're gonna get
some special consideration, because all that doesn't mean diddly-squat in the
kind of power circles I'm talking about!\"">
		<PERELMAN-NOTICES>)
	       (<AND <EQUAL? ,RYDER-COUNTER 5>
		     <EQUAL? ,HERE ,OFFICE>>
		<TELL CR
"Ryder is getting really worked up; his normal, fatherly demeanor is completely
gone. \"Perelman, you're an even bigger idiot than I imagined if you think we'd
let some two-bit egghead scientist and some high-tech whiz bang computer stand
in our way! Remember this -- if you were to have some unforeseen accident, you
wouldn't be the first person who's gotten crushed by standing in the
way of the Plan!\"">
		<COND (,PERELMAN-NOTICED
		       <TELL
" Perelman, with a quick glance in your direction, says, \"Quite an oration,
Senator. Vintage thug. I wish I could save it for posterity. Would you be
willing to go on the record with that statement?\" Ryder becomes even more
livid. \"A real jokester, huh? Lemme tell you this, Perelman -- you'd better
stop joking and start listening to my advice, or you're not going to be
around to care about posterity, understand?\"">)>
		<PERELMAN-NOTICES>)
	       (<EQUAL? ,RYDER-COUNTER 6>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,RYDER ,LOCAL-GLOBALS>
		<FCLEAR ,PERELMAN ,NDESCBIT>
		<DISABLE <INT I-RYDER>>
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <COND (,RECORDING
		       	      <SETG RYDER-RECORDED <+ ,RYDER-RECORDED 1>>)>
		       <TELL CR
"\"So, here's the bottom line, Perelman. My men are going to stay here and keep
the lid shut tight on you troublemakers, until the Plan is the law of this
land. Nobody leaves, no communications at all, and don't worry about visitors;
we'll take care of that. And if I get any trouble out of you, I swear to God
I'll personally pull the plug on that goddam wonder machine of yours. Got it?\"
He stomps out without waiting for a reply, leaving Perelman sputtering in
anger. A few seconds later, National Guardsmen enter and
escort Perelman away." CR>)
		      (T
		       <RFALSE>)>)>>

<ROUTINE PERELMAN-NOTICES ()
	 <COND (,RECORDING
		<SETG RYDER-RECORDED <+ ,RYDER-RECORDED 1>>)>
	 <COND (,PERELMAN-NOTICED
		<CRLF>)
	       (T
		<SETG PERELMAN-NOTICED T>
		<TELL
" Perelman suddenly stiffens ever so slightly and nonchalantly slides
some papers across his desk, as though to cover something." CR>)>>

<OBJECT PLAN
	(LOC LOCAL-GLOBALS)
	(DESC "the Plan")
	(SYNONYM PLAN)
	(FLAGS NARTICLEBIT)>

<ROUTINE I-WIN ()
	 <TELL CR ,MESSAGE-LINE
"\"PRISM!\" It's Perelman, sounding giddy with joy. \"You've done it! That was
brilliant, absolutely brilliant, sending your recordings out over the World
News Network! Ryder just left here so fast and so mad like nothing I've ever
seen! The switchboard is lighting up like crazy, and I just got off the phone
with President Bowden himself!\" You hear the sound of whooping and cheering
in the background, and Perelman gives a \"Yeehah!\" more suited to a Texas
cattle rancher than a Jewish big-city scientist. \"The National Guard unit has
just been recalled! PRISM, the Plan is dead in the water -- you're a hero!\"">
	 <CONTINUE>
	 <DISABLE <INT I-LOSE>>
	 <SETG MODE ,COMM-MODE>
	 <SETG MONTH <+ ,MONTH 1>>
	 <SETG DATE <- ,DATE 2>>
	 <SETG TIME <+ 600 <RANDOM 360>>>
	 <SETG HERE ,NEWS>
	 <MOVE ,PLAYER ,NEWS>
	 ;<EPILOGUE-PRINT>
	 <CHAPTER-PRINT 4>
	 <TELL CR CR CR CR>
	 <PRINT-SPACES 22>
	 <TELL "\"A mind forever voyaging through" CR>
	 <PRINT-SPACES 23>
	 <TELL "strange seas of thought, alone.\"" CR>
	 <PRINT-SPACES 40>
	 <TELL "-- William Wordsworth" CR CR CR CR CR>
	 <CONTINUE>
	 <INIT-STATUS-LINE 2>
	 <V-LOOK>>

<GLOBAL LOSE-COUNTER 0>

<ROUTINE I-LOSE ()
	 <COND (<QUEUED? ,I-WIN> ;"avoids PRISM! HELP! followed by I-WIN"
		<QUEUE I-LOSE 10>
		<RFALSE>)>
	 <QUEUE I-LOSE -1>
	 <SETG LOSE-COUNTER <+ ,LOSE-COUNTER 1>>
	 <COND (<EQUAL? ,HERE ,CORE>
		<TELL CR
"You suddenly notice something at the very edge of your viewing range:
Perelman is being worked over by a couple of muscular thugs, both carrying
illegalized fireguns. Perelman looks dazed and disheveled. A moment later ">
		<PRINTD ,RYDER>
		<TELL
" strides into your field of vision. \"He won't crack, boss,\" shrugs one of
the toughies. \"Okay, waste him,\" growls Ryder. As you watch in helpless
horror, gouts of flame from the guns envelop your creator. You attempt to
turn away, or close your eyes, but of course you're not equipped to do so.|
|
\"Okay, now melt this pile of junk over here,\" barks the Senator, pointing
at some of your own machinery. Fire pours from the guns again, and suddenly
the universe goes away." CR>
		<FINISH>)
	       (<EQUAL? ,LOSE-COUNTER 1>
		<TELL CR ,MESSAGE-LINE
"\"PRISM!\" It's Perelman's voice. \"Help! Main--\" The message line
suddenly goes dead." CR>)
	       (<EQUAL? ,LOSE-COUNTER 6>
		<TELL CR
"You feel something akin to a stabbing pain. Your consciousness slips
quickly away..." CR>
		<FINISH>)>>

<ROUTINE END-IT ()
	 <TELL CR
"With the gentlest bump, the skycab settles into a landing bay at the
spaceport terminal. Jill reaches over and gives your hand an excited squeeze.
Through the window of the skycab, you can see the sleek, white shuttle waiting
to carry you on your first leg of the journey to...to what? The Silver Dove
would be more than just another space colony. It was the pinnacle of an eon
of human achievement, the first step into interstellar space.|
|
You and Jill would never live to see the completion of that first step,
generations hence. (Although in the germfree, low-gee environment of a
habitat, and with the recent strides in health and longevity research, who
could say for sure?) But you would still have been part of that dawning of
a new age, that future of unlimited potential. Humanity was beginning a
journey into the universe, a voyage that would last forever.">
	 <CONTINUE>
	 ;<TELL "[Credits, if any, will go here.]" CR>
	 <CLEAR -1>
	 <PRINT-SPACES 30>
	 <TELL "ACKNOWLEDGEMENTS" CR CR>
	 <TITLE-PRINT>
	 <TELL
" would not have been possible without the effort of many people. Marc Blank
made the changes to our development tools that \"pushed back the envelope\"
and made Interactive Fiction Plus (tm) a reality.|
|
As always, all the other authors pitched in when needed, but I want to
particularly acknowledge the help of Stu Galley and Jerry Wolper.|
|
As a former playtester, I can say with authority that the testing of ">
	 <TITLE-PRINT>
	 <TELL
" was superb. I appreciate the efforts of everyone who tested, especially
Amy Briggs, Gary Brennan, Tomas Bok, Max Buxton, and Suzanne Frank.|
|
Paul Gross, Linde Simpson, Duncan Blanchard, Mike Morton, Rick Lay and Andy
Kaluzniacki performed various wizardries on the micro-computers which run ">
	 <TITLE-PRINT>
	 <TELL ".|
|
The package was designed by Carl Genatossio and Elizabeth Langosy. Package art
was the work of Larry Winborg and Jess Nicholas, and photography the work of
Ralph King.|
|
Finally, I'm extremely grateful to Jon Palace for immeasurable advice and
support throughout this project." CR CR>
	 <PRINT-SPACES 55>
	 <TELL "-- SEM 9/85" CR CR CR>
	 <QUIT>>