

	.FUNCT	ROCKVILLE-CENTRE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"The name of this plaza tells it all. The "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"well-maintained"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2051,2061 \?ELS14
	PRINTI	"aging"
	JUMP	?CND8
?ELS14:	CALL2	SCORE,11
	PRINTI	"crumbling"
?CND8:	PRINTI	" portico of City Hall stretches along the west side of the plaza, and Dunbar's lies on the southeast corner. Park Street leads north and south. Main Street and Centre Street both begin here, leading eastward and northeastward, respectively."
	RTRUE	


	.FUNCT	DUNBARS-ENTER-F
	GRTR?	STIME,1260 /?THN6
	LESS?	STIME,600 \?ELS5
?THN6:	CALL2	CLOSED-PRINT,STR?15
	RFALSE	
?ELS5:	EQUAL?	SYEAR,2071 \?ELS9
	CALL2	SCORE,122
	PRINTI	"A security guard stops you at the doorway, scrutinizing you with a haughty sneer. ""Do you have an appointment?"""
	CALL1	YES?
	ZERO?	STACK /?ELS14
	CRLF	
	PRINTI	""""
?PRG17:	PRINTI	"The name on that appointment?"""
	CRLF	
	CRLF	
	PRINTI	">"
	READ	P-INBUF,P-LEXV
	GETB	P-LEXV,P-LEXWORDS
	ZERO?	STACK \?REP18
	PRINTI	"""Sorry, I missed that. "
	JUMP	?PRG17
?REP18:	PRINTI	"""I'm sorry, sir. There's no appointment in that name."""
	JUMP	?CND12
?ELS14:	PRINTI	"""Next time, please call for an appointment beforehand."""
?CND12:	PRINTI	" The guard leads you firmly away from the building before leaving."
	CRLF	
	RFALSE	
?ELS9:	RETURN	DUNBARS


	.FUNCT	DUNBARS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"You have entered a"
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"n upscale"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	PRINTI	" swank"
	JUMP	?CND10
?ELS16:	EQUAL?	SYEAR,2061 \?CND10
	PRINTI	" very swank"
?CND10:	PRINTI	" department store, "
	EQUAL?	SYEAR,2041 \?ELS27
	PRINTI	"crowded despite its rather steep prices"
	JUMP	?CND25
?ELS27:	EQUAL?	SYEAR,2051 \?ELS31
	PRINTI	"an elegant boutique with a wealthy clientele"
	JUMP	?CND25
?ELS31:	PRINTI	"catering exclusively to the wealthy elite"
?CND25:	EQUAL?	SYEAR,2061 \?ELS40
	PRINTI	". Racks in this part of the store are filled with plainer garments"
	JUMP	?CND38
?ELS40:	PRINTI	". Racks all around you are stocked with the latest fashions"
?CND38:	PRINTI	". The exit to the street is northwest."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	CALL	CLOSING-TIME,1260,STR?17,STR?18,ROCKVIL-CENTRE
	RSTACK	


	.FUNCT	DUNBARS-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,DUNBARS \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS16
	EQUAL?	HERE,ROCKVIL-CENTRE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DUNBARS \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	PRINTR	"Dunbar's, a venerable shop, specializes in fashions for both sexes."


	.FUNCT	RACKS-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTR	"The clothes are diverse and fashionable, and quite steeply priced."
?ELS10:	EQUAL?	SYEAR,2051 \?ELS14
	PRINTR	"The clothes are quite stylish, and virtually all out of your price range."
?ELS14:	PRINTR	"The clothes in the few racks near you are mostly in the drab browns and olives worn by the lower classes. Over in the restricted areas of the store, you can spot racks laden with stylish clothes in the violets and golds favored by Churchmen and other landowners."


	.FUNCT	CLOTHES-F,GARMENT
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,DUNBARS \?ELS10
	FSET?	SWEATER,TRYTAKEBIT \?THN16
	IN?	SCARF,LOCAL-GLOBALS /?ELS15
?THN16:	CALL1	CLOTHES-BUDGET
	RSTACK	
?ELS15:	EQUAL?	SYEAR,2041 \?ELS22
	SET	'GARMENT,SWEATER
	PRINTI	"You look through many racks, finding nothing you like, and finally select a brightly colored myalon sweater that fits you perfectly"
	JUMP	?CND20
?ELS22:	SET	'GARMENT,VEST
	PRINTI	"After wincing at the prices, you pick out a thin, imitation wool vest"
?CND20:	CALL	TOO-POOR,120,GARMENT
	ZERO?	STACK \TRUE
	EQUAL?	SYEAR,2041 \?ELS34
	MOVE	SWEATER,PLAYER
	FCLEAR	SWEATER,NDESCBIT
	FCLEAR	SWEATER,TRYTAKEBIT
	JUMP	?CND32
?ELS34:	MOVE	VEST,PLAYER
	FCLEAR	VEST,NDESCBIT
	FCLEAR	VEST,TRYTAKEBIT
?CND32:	PRINTI	". A clerk removes the anti-theft tag from the garment"
	CALL2	DEBIT,120
	PRINTR	"."
?ELS10:	EQUAL?	HERE,HEIMAN-VILLAGE,ROCKVIL-MALL \?ELS42
	LESS?	STIME,480 /?THN46
	GRTR?	STIME,1380 \?ELS45
?THN46:	PRINTR	"Every store is closed for the night."
?ELS45:	FSET?	SWEATER,TRYTAKEBIT \?THN52
	FSET?	VEST,TRYTAKEBIT \?THN52
	IN?	SCARF,LOCAL-GLOBALS /?CND43
?THN52:	CALL1	CLOTHES-BUDGET
	RTRUE	
?CND43:	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	PRINTI	"You enter a clothing store, but they have little that suits your taste. You finally pick out a conservative male scarf"
	CALL	TOO-POOR,39,SCARF
	ZERO?	STACK /?CND56
	CRLF	
	PRINTR	"You meekly leave the store."
?CND56:	MOVE	SCARF,PLAYER
	CALL2	DEBIT,39
	PRINTR	"."
?ELS42:	CALL2	CANT-BUY,CLOTHES
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?WEAR,V?TAKE \?ELS66
	EQUAL?	HERE,DUNBARS \?ELS71
	FSET?	CLOTHES,TRYTAKEBIT \?ELS71
	PRINTR	"You haven't paid for them."
?ELS71:	PRINTR	"You're already wearing your clothes!"
?ELS66:	EQUAL?	PRSA,V?TAKE-OFF,V?REMOVE \?ELS81
	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS86
	PRINTR	"You remove your clothes for a minute, but there's a bit of a chill in the air, so you decide to put them back on."
?ELS86:	PRINTR	"You'd be arrested if you removed your clothes in public!"
?ELS81:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DUNBARS \?ELS99
	CALL	PERFORM,V?EXAMINE,RACKS
	RTRUE	
?ELS99:	CALL	PERFORM,V?EXAMINE,ME
	RTRUE	


	.FUNCT	SWEATER-F
	EQUAL?	PRSA,V?BUY \?ELS5
	CALL	PERFORM,V?BUY,CLOTHES
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?TAKE \?ELS7
	FSET?	SWEATER,TRYTAKEBIT \?ELS7
	CALL	PERFORM,V?TAKE,CLOTHES
	RTRUE	
?ELS7:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	SWEATER,TRYTAKEBIT /FALSE
	PRINTR	"It is a bright and colorful sweater, made of myalon."


	.FUNCT	VEST-F
	EQUAL?	PRSA,V?BUY \?ELS5
	CALL	PERFORM,V?BUY,CLOTHES
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?TAKE \?ELS7
	FSET?	VEST,TRYTAKEBIT \?ELS7
	CALL	PERFORM,V?TAKE,CLOTHES
	RTRUE	
?ELS7:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	VEST,TRYTAKEBIT /FALSE
	PRINTR	"The vest is of thin imitation wool."


	.FUNCT	SCARF-F
	EQUAL?	PRSA,V?BUY \?ELS5
	CALL	PERFORM,V?BUY,CLOTHES
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The scarf is simple and conservatively styled."


	.FUNCT	CITY-HALL-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"The city's seat of government is an old concrete-slab building dating back to the late twentieth century. "
	EQUAL?	SYEAR,2071 \?CND8
	CALL2	SCORE,11
	PRINTI	"The interior is decrepit; it looks as though no maintenance has been performed here for years. "
?CND8:	PRINTI	"The only exit is east."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	CLOSING-TIME,1080,STR?19,STR?18,ROCKVIL-CENTRE
	RSTACK	


	.FUNCT	CITY-HALL-ENTER-F
	GRTR?	STIME,600 \?ELS5
	LESS?	STIME,1080 \?ELS5
	RETURN	CITY-HALL
?ELS5:	CALL2	CLOSED-PRINT,STR?20
	RFALSE	


	.FUNCT	CITY-HALL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,CITY-HALL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \FALSE
	EQUAL?	HERE,ROCKVIL-CENTRE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL2	DO-WALK,P?WEST
	RSTACK	


	.FUNCT	BENCH-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	IN?	GOVERNMENT-OFFICIAL,HERE \FALSE
	PRINTI	"A "
	PRINTD	GOVERNMENT-OFFICIAL
	PRINTR	" is sitting on the bench."


	.FUNCT	GOVERNMENT-OFFICIAL-F
	EQUAL?	PRSA,V?TELL /?THN6
	EQUAL?	GOVERNMENT-OFFICIAL,WINNER \?ELS5
?THN6:	SET	'PRSO,GOVERNMENT-OFFICIAL
	MOVE	OFFICIAL-SNACK,LOCAL-GLOBALS
	CALL1	BRIEF-CHAT
	EQUAL?	SYEAR,2041 \?ELS10
	ZERO?	RECORDING /?CND11
	PUT	RECORDING-TABLE,2,1
?CND11:	PRINTI	"cheerily comments on how well things in the city are running, and how rewarding his job has been lately"
	PRINT	OFFICIAL-LEAVES
	CRLF	
	JUMP	?CND8
?ELS10:	CALL2	SCORE,136
	PRINTI	"grumpily complains that most of his department has been laid off as city services are cut back. Suddenly he notices the time, looks frightened, and rushes away."
	CRLF	
?CND8:	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?SIT-NEXT-TO \FALSE
	CALL	PERFORM,V?SIT,BENCH
	RTRUE	


	.FUNCT	SNACK-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINT	IT-LOOKS-LIKE
	PRINTR	" some kind of large donut or cupcake."
?ELS5:	EQUAL?	PRSA,V?EAT,V?TAKE \FALSE
	PRINTR	"It's not yours."


	.FUNCT	MAIN-AND-KENNEDY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the heart of the downtown area, flanked by classical glass-and-steel skyscrapers. The skybus terminal "
	EQUAL?	SYEAR,2071 \?ELS10
	CALL2	SCORE,12
	PRINTI	"on the northwest corner has been closed for several years, following an unprofitable experiment to sell the skybus system to a private company"
	JUMP	?CND8
?ELS10:	PRINTI	"is on the northwest corner"
?CND8:	PRINTI	". To the southwest is an entrance to "
	EQUAL?	SYEAR,2061 \?ELS21
	PRINTI	"a "
	PRINTD	CONSTRUCTION-OBJECT
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2071 \?ELS25
	PRINTI	"luxury townhouses"
	JUMP	?CND19
?ELS25:	PRINTI	"Kennedy Park"
?CND19:	PRINTI	"."
	CRLF	
	CRLF	
	CALL	PERFORM,V?EXAMINE,INFOTECH-BUILDING
	CRLF	
	PRINT	SILICORP-DESCRIPTION
	PRINTI	" From this intersection, Main Street runs east and west, and Kennedy Street can take you north or south."
	RTRUE	


	.FUNCT	SILICORP-BUILDING-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,MAIN-AND-KENNEDY \?ELS5
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS9
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINT	SILICORP-DESCRIPTION
	CRLF	
	RTRUE	


	.FUNCT	INFOTECH-BUILDING-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,MAIN-AND-KENNEDY \?ELS5
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS9
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The skyscraper on the northeast corner is one of Rockvil's most famous landmarks, the "
	PRINTD	INFOTECH-BUILDING
	PRINTI	". This 130-story office tower is the tallest building in the city and the "
	EQUAL?	SYEAR,2061 \?ELS20
	PRINTI	"fifth"
	JUMP	?CND18
?ELS20:	EQUAL?	SYEAR,2071 \?ELS24
	PRINTI	"third"
	JUMP	?CND18
?ELS24:	PRINTI	"sixth"
?CND18:	PRINTR	" tallest in the world."


	.FUNCT	SKYBUS-TERMINAL-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,12
	PRINT	BOARDED-OVER
	CRLF	
	RFALSE	
?ELS5:	RETURN	SKYBUS-TERMINAL


	.FUNCT	SKYBUS-TERMINAL-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS8
	PRINTI	"This is part of the Commuter Skybus System (CSS), built during the 2010's by the now-defunct Federal Energy Independence Agency. "
	JUMP	?CND6
?ELS8:	EQUAL?	SYEAR,2061 \?CND6
	CALL2	SCORE,123
	PRINTI	"This station, built long ago by government funds, looks run-down and in need of repair. "
?CND6:	PRINTI	"Skybuses depart from this terminal for many suburban points. The "
	PRINTD	BOARDING-PLATFORM
	PRINTI	"s lie to the northwest, and the exit to the street is southeast. A stairway leads downward."
	RTRUE	


	.FUNCT	BOARDING-PLATFORM-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,SKYBUS-TERMINAL \?ELS10
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS10:	FSET?	HERE,TUBEBIT \FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \FALSE
	EQUAL?	HERE,SKYBUS-TERMINAL \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL1	V-WALK-AROUND
	RSTACK	


	.FUNCT	SKYBUS-F
	EQUAL?	PRSA,V?THROUGH \?ELS5
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?FIND,V?EXAMINE,V?WAIT-FOR \?ELS7
	PRINTR	"You'd have to be on the skybus boarding platforms for that!"
?ELS7:	CALL1	MOBY-VERB?
	ZERO?	STACK \FALSE
	CALL2	CANT-SEE,SKYBUS
	RSTACK	


	.FUNCT	SKYBUS-TERMINAL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,SKYBUS-TERMINAL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,MAIN-AND-KENNEDY \?ELS14
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?UP
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \FALSE
	EQUAL?	HERE,SKYBUS-TERMINAL \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	


	.FUNCT	TOWNHOUSE-F
	EQUAL?	SYEAR,2071 /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,TOWNHOUSE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \FALSE
	EQUAL?	HERE,MAIN-AND-KENNEDY \?ELS14
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS14:	EQUAL?	HERE,ELM-AND-KENNEDY \?ELS16
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS16:	EQUAL?	HERE,ELM-AND-PARK \FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	


	.FUNCT	KENNEDY-PARK-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	PRINTI	"The entrances to the townhouses are all locked."
	CRLF	
	RFALSE	
?ELS5:	RETURN	KENNEDY-PARK


	.FUNCT	KENNEDY-PARK-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041,2051 \?ELS10
	FSET	KENNEDY-PARK,NARTICLEBIT
	PUTP	KENNEDY-PARK,P?SDESC,STR?25
	RTRUE	
?ELS10:	FCLEAR	KENNEDY-PARK,NARTICLEBIT
	PUTP	KENNEDY-PARK,P?SDESC,STR?26
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2061 \?ELS19
	CALL2	SCORE,13
	PRINTI	"There is a construction project in progress here:"
	CRLF	
	CALL	PERFORM,V?READ,GLOBAL-SIGN
	PRINTI	"The project is still in the early stages, with trees being torn up on one end of the site, and digging for the foundation going on at the other end."
	RTRUE	
?ELS19:	PRINTI	"This is a small, downtown park with gates leading northeast, southeast, and southwest. There is a sprawling, free-form waterpool surrounding a statue of John F. Kennedy in the center of the park."
	RTRUE	


	.FUNCT	WATERPOOL-F
	EQUAL?	PRSA,V?SWIM,V?BOARD,V?THROUGH \?ELS5
	PRINTR	"Swimming in public fountains is illegal."
?ELS5:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \FALSE
	PRINTR	"You look into the waters of the pool, hoping to find some coins, or perhaps an unusual fish. However, you discover nothing of interest."


	.FUNCT	STATUE-F
	EQUAL?	PRSA,V?READ \?ELS5
	CALL	PERFORM,V?READ,PLAQUE
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"There is a small bronze plaque at the base of the statue."


	.FUNCT	ELM-AND-PARK-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the intersection of the north-south Park Street and the east-west Elm Street. A "
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	"cluster of townhouses"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2061 \?ELS14
	PRINTD	CONSTRUCTION-OBJECT
	JUMP	?CND8
?ELS14:	PRINTI	"park entrance"
?CND8:	PRINTI	" is on the northeast corner, and large, old-fashioned edifices occupy the other three corners of the intersection."
	RTRUE	


	.FUNCT	COURTHOUSE-ENTER-F
	GRTR?	STIME,990 /?THN6
	LESS?	STIME,570 \?ELS5
?THN6:	CALL2	CLOSED-PRINT,STR?28
	RFALSE	
?ELS5:	RETURN	COURTHOUSE


	.FUNCT	COURTHOUSE-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"The "
	PRINTD	COURTHOUSE-OBJECT
	PRINTI	" is of the same vintage as the other governmental buildings in the area, dating from around 1990 or so. An exit leads southeast."
	GRTR?	STIME,570 \FALSE
	LESS?	STIME,1080 \FALSE
	CRLF	
	CRLF	
	PRINTI	"The court is in session. "
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	"A woman is being tried for petty theft"
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2051 \?ELS25
	CALL2	SCORE,14
	PRINTI	"Two men face the death penalty for attempted rape"
	JUMP	?CND19
?ELS25:	EQUAL?	SYEAR,2061 \?ELS29
	CALL2	SCORE,15
	PRINTI	"An Asian-American juvenile has just been handed a life sentence for violating the Uniform Morality Code"
	JUMP	?CND19
?ELS29:	EQUAL?	SYEAR,2071 \?CND19
	CALL2	SCORE,16
	PRINTI	"Twenty pathetic, emaciated people are being tattooed for upcoming Execution Matches for cheating on their Food Allowance"
?CND19:	PRINTI	"."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,990,STR?29,STR?30,ELM-AND-PARK
	RSTACK	


	.FUNCT	COURTHOUSE-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,COURTHOUSE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,COURTHOUSE \?ELS21
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,COURTHOUSE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	POLICE-STATION-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,ELM-AND-PARK \?ELS10
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,POLICE-STATION-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,POLICE-STATION \?ELS21
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,POLICE-STATION \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	POLICE-STATION-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the headquarters for all the city's precinct stations. The building is at least "
	SUB	SYEAR,1966
	PRINTN	STACK
	PRINTI	" years old"
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	", but has obviously been recently renovated"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2061,2071 \?CND8
	PRINTI	", and is obviously "
	EQUAL?	SYEAR,2071 \?CND17
	PRINTI	"badly "
?CND17:	PRINTI	"in need of renovation"
?CND8:	PRINTI	". Behind the reception desk, "
	EQUAL?	SYEAR,2041,2051 \?ELS28
	PRINTI	"crowded "
	JUMP	?CND26
?ELS28:	EQUAL?	SYEAR,2071 \?CND26
	PRINTI	"empty "
?CND26:	PRINTI	"jail cells are visible. The desk officer looks at you expectantly. The only exit is northeast."
	RTRUE	


	.FUNCT	POLICEMAN-F
	EQUAL?	POLICEMAN,WINNER \?ELS5
	PRINTI	"""Unless you've got a crime to report, scram."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?TELL-ABOUT \FALSE
	EQUAL?	PRSI,CRIMINAL,CRIME \FALSE
	PRINTR	"The officer recites a rapid sing-song about the various forms and official channels and procedures and personnel required for the reporting of a crime."


	.FUNCT	I-JAIL
	CALL2	SCORE,17
	CALL2	JIGS-UP,STR?32
	RSTACK	


	.FUNCT	BLANKET-F
	EQUAL?	PRSA,V?PUT-ON \?ELS5
	EQUAL?	PRSI,ME \?ELS5
	CALL	PERFORM,V?BOARD,BLANKET
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \?ELS9
	PRINTR	"The blanket is torn and crawling with bugs."
?ELS9:	EQUAL?	PRSA,V?CLIMB-ON,V?LIE-DOWN,V?BOARD /?THN14
	EQUAL?	PRSA,V?WEAR \FALSE
?THN14:	PRINTR	"You change your mind when some particularly wiggly bugs crawl onto you."


	.FUNCT	POST-OFFICE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2061,2071 \?ELS5
	CALL	QUEUE,I-POST-OFFICE,-1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is an old "
	PRINTD	POST-OFFICE-OBJECT
	PRINTI	", probably built back in the days when ""mail"" usually meant letters and packages delivered by human messengers. "
	EQUAL?	SYEAR,2041,2051 \?ELS16
	GRTR?	STIME,480 \?ELS19
	LESS?	STIME,1020 \?ELS19
	PRINTI	"A "
	EQUAL?	SYEAR,2041 \?ELS26
	PRINTI	"couple"
	JUMP	?CND24
?ELS26:	PRINTI	"line"
?CND24:	PRINTI	" of people are waiting at the counter"
	JUMP	?CND14
?ELS19:	PRINTI	"The windows are all closed for the night"
	JUMP	?CND14
?ELS16:	EQUAL?	SYEAR,2061 \?ELS44
	GRTR?	STIME,600 \?ELS44
	LESS?	STIME,960 /?THN41
?ELS44:	EQUAL?	SYEAR,2071 \?ELS40
	GRTR?	STIME,900 \?ELS40
	LESS?	STIME,960 \?ELS40
?THN41:	CALL2	SCORE,124
	PRINTI	"A long queue of people with resigned expressions are waiting at the solitary open window"
	JUMP	?CND14
?ELS40:	PRINTI	"The windows along the counter are all closed. One bears a crude, handwritten sign that reads ""Open daily, "
	EQUAL?	SYEAR,2061 \?ELS55
	PRINTI	"10a"
	JUMP	?CND53
?ELS55:	PRINTI	"3p"
?CND53:	PRINTI	"m to 4pm"""
?CND14:	PRINTI	". A doorway leads out to the northwest."
	RTRUE	


	.FUNCT	POST-OFFICE-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,POST-OFFICE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,POST-OFFICE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,POST-OFFICE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	SOUTHWAY-AND-PARK-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	CARD-CATALOG-CARD,LOCAL-GLOBALS
	FCLEAR	PARKVIEW-DOOR,OPENBIT
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Southway bends sharply at this intersection, leading east and southwest. Park Street begins here and heads north. There are "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"new "
	JUMP	?CND10
?ELS12:	PRINTI	"aging "
?CND10:	PRINTI	"buildings on the northeast and western corners, and "
	EQUAL?	SYEAR,2041 /?CND21
	PRINTI	"even "
?CND21:	PRINTI	"older-looking buildings to the northwest and southeast"
	CALL1	GROCERY-STORE-DESC
	PRINTI	", spans the southern side of the street."
	RTRUE	


	.FUNCT	GROCERY-STORE-DESC
	PRINTI	". A grocery store, its "
	EQUAL?	SYEAR,2041 \?ELS7
	PRINTI	"brightly lit window heaped with food"
	RTRUE	
?ELS7:	EQUAL?	SYEAR,2051 \?ELS11
	PRINTI	"window filled with food"
	RTRUE	
?ELS11:	EQUAL?	SYEAR,2061 \?ELS15
	CALL2	SCORE,18
	PRINTI	"dimly-lit windows revealing sparse stacks of cans"
	RTRUE	
?ELS15:	CALL2	SCORE,19
	PRINTI	"grimy windows barely transparent enough to reveal a large sign reading ""Rations for "
	MOD	SDATE,3
	ZERO?	STACK \?ELS24
	PRINTI	"1's, 2's and 3's"
	JUMP	?CND22
?ELS24:	MOD	SDATE,3
	EQUAL?	STACK,1 \?ELS28
	PRINTI	"4's, 5's and 6's"
	JUMP	?CND22
?ELS28:	PRINTI	"7's, 8's, 9's and 10's"
?CND22:	PRINTI	" today"""
	RTRUE	


	.FUNCT	MAIN-LIBRARY-ENTER-F
	EQUAL?	SYEAR,2041,2051 \?ELS9
	GRTR?	STIME,510 \?ELS9
	LESS?	STIME,1320 /?THN6
?ELS9:	EQUAL?	SYEAR,2061 \?ELS11
	GRTR?	STIME,600 \?ELS11
	LESS?	STIME,1260 /?THN6
?ELS11:	EQUAL?	SYEAR,2071 \?ELS5
	GRTR?	STIME,750 \?ELS5
	LESS?	STIME,990 \?ELS5
?THN6:	RETURN	MAIN-LIBRARY
?ELS5:	CALL2	CLOSED-PRINT,STR?36
	RFALSE	


	.FUNCT	MAIN-LIBRARY-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,MAIN-LIBRARY \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,MAIN-LIBRARY-OBJECT,HERE
	ZERO?	STACK /?ELS14
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS14:	ZERO?	SIMULATING \FALSE
	CALL	PERFORM,V?THROUGH,LIBRARY-MODE
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,MAIN-LIBRARY \?ELS23
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \?ELS29
	EQUAL?	HERE,MAIN-LIBRARY \?ELS29
	CALL1	V-LOOK
	RSTACK	
?ELS29:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,MAIN-LIBRARY \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"The library is filled with a stale odor: the smell of decaying books."


	.FUNCT	MAIN-LIBRARY-F,RARG,TIME
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	MOVE	BOOKS,HERE
	MOVE	CARD-CATALOG-CARD,GLOBAL-OBJECTS
	PUTP	SPEAR-CARRIER,P?SDESC,STR?37
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"This is the main branch of the Rockvil Public Library system, "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"crowded but quiet"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051,2061 \?ELS16
	PRINTI	"not too crowded and very quiet"
	JUMP	?CND10
?ELS16:	PRINTI	"deserted, dusty, and silent as a tomb. The smell of decaying, rotting books is overpowering. The only thing in sight that doesn't seem hoary with age is a list hanging on one wall"
?CND10:	PRINTI	". The librarian is standing near the "
	PRINTD	CARD-CATALOG
	PRINTI	". The only exit is southeast."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \?ELS31
	SET	'TIME,990
	JUMP	?CND29
?ELS31:	EQUAL?	SYEAR,2061 \?ELS33
	SET	'TIME,1260
	JUMP	?CND29
?ELS33:	SET	'TIME,1320
?CND29:	CALL	SHOP-CLOSES,TIME,STR?38,STR?39,SOUTHWAY-AND-PARK
	RSTACK	


	.FUNCT	BANNED-TITLES-LIST-F
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	CALL2	SCORE,121
	PRINTR	"It's the latest comprehensive list of banned books, tapes, and programs, issued by the Morality Bureau of the government. The list is huge but some of the titles jump out at you: Thoreau's ""Walden,"" Kafka's ""The Trial,"" Orwell's ""Animal Farm,"" Kennedy's ""Profiles in Courage,"" Bernstein's ""Mass,"" Schell's ""Fate of the Earth,"" Maribendu's ""Weep, My Child,"" and Hathaway's ""Inner Workings of the Church."" Even Rav's book, ""A Child's Vision,"" is on the list."


	.FUNCT	CARD-CATALOG-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	PRINTR	"""Card catalog"" is an anachronistic term -- this isn't an old-fashioned catalog with drawers of cards; it's computerized."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \?ELS9
	PRINTI	"Pretty typical computerized "
	PRINTD	CARD-CATALOG
	PRINTR	" for locating titles."
?ELS9:	EQUAL?	PRSA,V?READ \FALSE
	PRINTR	"It would take days to read all the entries in the catalog."


	.FUNCT	CARD-CATALOG-CARD-F
	CALL	PERFORM,V?OPEN,CARD-CATALOG
	RTRUE	


	.FUNCT	LIBRARY-ACCOUNT-F
	EQUAL?	PRSA,V?ASK-FOR \FALSE
	EQUAL?	PRSO,SPEAR-CARRIER \FALSE
	EQUAL?	HERE,MAIN-LIBRARY \FALSE
	PRINTI	"The librarian has you fill out several forms. After filing them, she whispers that your card should arrive in the mail within "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"a month"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2071 \?ELS16
	PRINTI	"a year"
	JUMP	?CND10
?ELS16:	PRINTI	"several months"
?CND10:	PRINTR	"."


	.FUNCT	FOODVILLE-1-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2071 \?CND6
	SET	'CLERK-WAITING,FALSE-VALUE
	CALL	QUEUE,I-FOODVILLE,1
?CND6:	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS10
	CALL1	FOODVILLE-DESC
	PRINTI	"north, and the exit to the car lot is southwest."
	RTRUE	
?ELS10:	EQUAL?	RARG,M-END \FALSE
	CALL1	FOODVILLE-CLOSES
	RSTACK	


	.FUNCT	FOODVILLE-ENTER-F,X=1
	EQUAL?	SYEAR,2041,2051 \?ELS3
	GRTR?	STIME,1320 /?THN6
	LESS?	STIME,480 \?ELS3
?THN6:	SET	'X,FALSE-VALUE
	JUMP	?CND1
?ELS3:	EQUAL?	SYEAR,2061 \?ELS9
	GRTR?	STIME,1140 /?THN12
	LESS?	STIME,600 \?ELS9
?THN12:	SET	'X,FALSE-VALUE
	JUMP	?CND1
?ELS9:	EQUAL?	SYEAR,2071 \?CND1
	GRTR?	STIME,960 /?THN18
	LESS?	STIME,700 \?CND1
?THN18:	SET	'X,FALSE-VALUE
?CND1:	ZERO?	X /?ELS24
	EQUAL?	HERE,MAIN-AND-WICKER \?ELS30
	RETURN	FOODVILLE-2
?ELS30:	RETURN	FOODVILLE-1
?ELS24:	EQUAL?	SYEAR,2071 \?ELS34
	PRINTI	"According to a note on the door, the Foodville is only open from 11:30am until 4:00 in the afternoon."
	CRLF	
	RFALSE	
?ELS34:	CALL2	CLOSED-PRINT,STR?40
	RFALSE	


	.FUNCT	FOODVILLE-DESC
	PRINTI	"This is a large "
	PRINTD	SUPERMARKET
	PRINTI	", "
	EQUAL?	SYEAR,2041 \?ELS7
	PRINTI	"brightly lit and stocked with aisle after aisle of slickly packaged food"
	JUMP	?CND5
?ELS7:	EQUAL?	SYEAR,2051 \?ELS11
	PRINTI	"reasonably clean and well-stocked with food"
	JUMP	?CND5
?ELS11:	EQUAL?	SYEAR,2061 \?ELS15
	CALL2	SCORE,18
	PRINTI	"and it is beginning to show its age. The shelves are sparsely filled with plain, badly labelled tins"
	JUMP	?CND5
?ELS15:	CALL2	SCORE,19
	PRINTI	"and it is literally crumbling. The shelves are empty, and the interior is uniformly filthy"
?CND5:	PRINTI	". The exit to the street is "
	RTRUE	


	.FUNCT	FOODVILLE-CLOSES,TIME,NEW-LOC
	EQUAL?	SYEAR,2041,2051 \?ELS3
	SET	'TIME,1320
	JUMP	?CND1
?ELS3:	EQUAL?	SYEAR,2061 \?ELS5
	SET	'TIME,1140
	JUMP	?CND1
?ELS5:	EQUAL?	SYEAR,2071 \?ELS7
	SET	'TIME,960
	JUMP	?CND1
?ELS7:	SET	'TIME,1500
?CND1:	EQUAL?	HERE,FOODVILLE-1 \?ELS12
	SET	'NEW-LOC,SOUTHWAY-AND-PARK
	JUMP	?CND10
?ELS12:	SET	'NEW-LOC,MAIN-AND-WICKER
?CND10:	CALL	CLOSING-TIME,TIME,STR?17,STR?41,NEW-LOC
	RSTACK	


	.FUNCT	NOTE-F
	EQUAL?	SYEAR,2071 /FALSE
	CALL1	MOBY-VERB?
	ZERO?	STACK \FALSE
	CALL2	CANT-SEE,NOTE
	RSTACK	


	.FUNCT	SUPERMARKET-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,SOUTHWAY-AND-PARK \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	EQUAL?	HERE,MAIN-AND-WICKER \?ELS16
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS20
	EQUAL?	HERE,FOODVILLE-1 \?ELS25
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS25:	EQUAL?	HERE,FOODVILLE-2 \?ELS27
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \?ELS33
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS38
	CALL1	V-LOOK
	RSTACK	
?ELS38:	EQUAL?	SYEAR,2081 \FALSE
	CALL	PERFORM,V?EXAMINE,BUILDING
	RTRUE	
?ELS33:	EQUAL?	PRSA,V?SMELL \?ELS42
	EQUAL?	SYEAR,2081 \?ELS42
	PRINTR	"A nauseating, rancid odor hangs in the air."
?ELS42:	EQUAL?	PRSA,V?WASH \FALSE
	EQUAL?	SYEAR,2071,2081 \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	SOY-PATTY-F
	EQUAL?	PRSA,V?EAT \?ELS5
	MOVE	SOY-PATTY,LOCAL-GLOBALS
	PRINTR	"About the only good thing to say is that it was filling."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \?ELS9
	CALL2	SCORE,126
	PRINTR	"Dehydrated soy patties such as these are about the only things that have been available from ration centers for months. This one looks even more dry and tasteless than usual."
?ELS9:	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS18
	EQUAL?	SYEAR,2071 \?ELS18
	PRINTR	"You can't buy one; you could use your ration card, though..."
?ELS18:	CALL2	CANT-BUY,SOY-PATTY
	RSTACK	


	.FUNCT	I-FOODVILLE
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 /?CND1
	SET	'CLERK-WAITING,FALSE-VALUE
	RFALSE	
?CND1:	ZERO?	CLERK-WAITING /?ELS8
	CRLF	
	PRINTI	"The clerk says, ""Listen, joker. I don't have all day."" He motions to a bouncer, who grabs you roughly by the collar and tosses you out on the street."
	CRLF	
	CRLF	
	EQUAL?	HERE,FOODVILLE-1 \?ELS16
	CALL2	GOTO,SOUTHWAY-AND-PARK
	RSTACK	
?ELS16:	CALL2	GOTO,MAIN-AND-WICKER
	RSTACK	
?ELS8:	SET	'CLERK-WAITING,TRUE-VALUE
	CALL	QUEUE,I-FOODVILLE,2
	CRLF	
	PRINTI	"A bored clerk asks for your "
	PRINTD	RATION-CARD
	PRINTR	"."


	.FUNCT	SOUTHWAY-UNDERPASS-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Here, Southway passes under the old "
	PRINTD	HIGHWAY
	PRINTI	". A "
	PRINTD	FIREHOUSE-OBJECT
	PRINTI	" sits off to the northwest in the shadow of the elevated highway. A car lot lies to the southeast. Southway continues northeast into the city"
	EQUAL?	SYEAR,2071 \?ELS16
	PRINTI	", but is blocked to the southwest by the collapse of part of the highway."
	RTRUE	
?ELS16:	PRINTI	" and southwest into the suburbs."
	RTRUE	


	.FUNCT	FIREHOUSE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is an old "
	PRINTD	FIREHOUSE-OBJECT
	PRINTI	", "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"but it is equipped with the latest models of "
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051,2061 \?ELS16
	PRINTI	"equipped with some aging "
	JUMP	?CND10
?ELS16:	CALL2	SCORE,127
	PRINTI	"equipped with a single dilapidated "
?CND10:	EQUAL?	SYEAR,2071 \?ELS25
	PRINTD	FIRECOPTER
	JUMP	?CND23
?ELS25:	PRINTI	"firetrucks and "
	PRINTD	FIRECOPTER
	PRINTI	"s"
?CND23:	PRINTI	". Southway lies to the southeast."
	RTRUE	


	.FUNCT	FIREHOUSE-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,FIREHOUSE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \FALSE
	EQUAL?	HERE,FIREHOUSE \?ELS21
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	


	.FUNCT	FIRETRUCK-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	EQUAL?	SYEAR,2071 \?ELS8
	PRINTI	"It's"
	JUMP	?CND6
?ELS8:	PRINTI	"They're"
?CND6:	PRINTI	" bright yellow, like most firefighting vehicles"
	EQUAL?	SYEAR,2061,2071 \?CND17
	PRINTI	", but the metal is rusting through in many points"
?CND17:	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?BOARD \FALSE
	PRINTI	"A firefighter sees you and yells, ""Hey, gettaway from there,"" and escorts you out of the firehouse."
	CRLF	
	CRLF	
	CALL2	GOTO,SOUTHWAY-UNDERPASS
	RSTACK	


	.FUNCT	ELM-AND-UNIVERSITY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"University Avenue forks off to the northwest, meandering into the campus which spans the north side of Elm Street here. A tall apartment complex is on the south side of the street. The top of some steps indicate "
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	"a former"
	JUMP	?CND8
?ELS10:	PRINTI	"an"
?CND8:	PRINTI	" entrance to the Tubes."
	RTRUE	


	.FUNCT	UNIVERSITY-HEIGHTS-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	CALL	GLOBAL-IN?,UNIVERSITY-HEIGHTS-OBJECT,HERE
	ZERO?	STACK /?ELS5
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS9
	EQUAL?	HERE,ELM-AND-UNIVERSITY \?ELS14
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS14:	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,UNIVERSITY-HEIGHTS \?ELS25
	CALL1	V-LOOK
	RSTACK	
?ELS25:	PRINTD	UNIVERSITY-HEIGHTS
	PRINTR	" is a tall apartment complex."


	.FUNCT	UNIVERSITY-HEIGHTS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	BUZZERS,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	CALL	DESCRIBE-APARTMENT-VESTIBULE,STR?49,STR?50
	RSTACK	


	.FUNCT	ELM-UNDERPASS-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Elm Street passes under an elevated roadway, a relic of the last century's "
	PRINTD	HIGHWAY
	PRINTI	" system. A Chinese restaurant fills the space under the highway to the south, and a bar is nestled under the roadway north of here. Elm leads eastward, to downtown, and westward toward the suburbs."
	EQUAL?	SYEAR,2071 \FALSE
	CALL2	SCORE,20
	CRLF	
	CRLF	
	PRINTI	"An "
	PRINTD	ROY
	PRINTI	", perhaps Roy himself, is scrubbing graffiti off the window of the restaurant. The graffiti reads ""Chinks Get Lost""."
	RTRUE	


	.FUNCT	ROY-F
	EQUAL?	ROY,WINNER \FALSE
	CALL2	SCORE,20
	PRINTI	"""No time for talking, sorry."" He shakes his head sadly. ""Is a dishonor. Three times this year already they break my window. Now this."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	ROYS-PAGODA-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,RESTAURANT-OBJECT
	RFALSE	
?ELS5:	RETURN	ROYS-PAGODA


	.FUNCT	ROYS-PAGODA-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?53
	MOVE	RESTAURANT-TABLE,HERE
	MOVE	CHAIR,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"This is a small Chinese restaurant, "
	EQUAL?	SYEAR,2071,2061 \?ELS12
	PRINTI	"with a scattering of patrons"
	JUMP	?CND10
?ELS12:	PRINTI	"crowded with students"
?CND10:	PRINTI	". There is an exit to the north."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2041 /FALSE
	GRTR?	STIME,1200 \FALSE
	CRLF	
	PRINTI	"A waiter, pointing frantically at the clock, urges you politely but insistently through the door."
	CRLF	
	CRLF	
	CALL2	GOTO,ELM-UNDERPASS
	RSTACK	


	.FUNCT	EZZIS-BAR-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,BAR-OBJECT
	RFALSE	
?ELS5:	RETURN	EZZIS-BAR


	.FUNCT	EZZIS-BAR-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?54
	MOVE	BEER,LOCAL-GLOBALS
	MOVE	BAR-STOOL,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	"This club, which has clearly seen better days, is almost empty"
	JUMP	?CND8
?ELS10:	PRINTI	"This noisy lounge "
	EQUAL?	SYEAR,2061 \?ELS19
	PRINTI	"was once"
	JUMP	?CND17
?ELS19:	PRINTI	"is"
?CND17:	PRINTI	" a favorite hangout for students from the nearby college"
?CND8:	PRINT	STOOL-DESC
	PRINTI	"The only exit is south."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	CALL2	CURFEW-CLOSE,ELM-UNDERPASS
	RSTACK	


	.FUNCT	EZZIS-BAR-EXIT-F
	CALL2	HELD?,BEER
	ZERO?	STACK /?ELS5
	PRINT	BARTENDER-YELLS
	CRLF	
	RFALSE	
?ELS5:	RETURN	ELM-UNDERPASS


	.FUNCT	STUDENT-UNION-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,63
	PRINT	BOARDED-OVER
	CRLF	
	RFALSE	
?ELS5:	RETURN	STUDENT-UNION


	.FUNCT	LECTURE-HALL-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,63
	PRINT	BOARDED-OVER
	CRLF	
	RFALSE	
?ELS5:	RETURN	LECTURE-HALL


	.FUNCT	DORM-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	PRINTI	"Some of the boards over the entrance have been pried away, and you could probably squeeze through. However, you hesitate, because it's so dangerous to enter deserted buildings these days. Do you still want to enter?"
	CALL1	YES?
	ZERO?	STACK /FALSE
	CALL2	SCORE,21
	CALL2	JIGS-UP,STR?56
	RFALSE	
?ELS5:	RETURN	DORM


	.FUNCT	ROCKVIL-UNIVERSITY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are on University Avenue in the center of a "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"bustling"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2051 \?ELS14
	PRINTI	"crowded but calm"
	JUMP	?CND8
?ELS14:	EQUAL?	SYEAR,2061 \?ELS18
	PRINTI	"nearly deserted"
	JUMP	?CND8
?ELS18:	CALL2	SCORE,63
	PRINTI	"closed"
?CND8:	PRINTI	" urban campus. "
	EQUAL?	SYEAR,2071 \?ELS29
	PRINTI	"Closed, boarded buildings lie to the west, northeast, and southeast"
	JUMP	?CND27
?ELS29:	PRINTI	"There is a dormitory complex on the western side of the road, and other buildings to the northeast and southeast"
?CND27:	PRINTI	". The street continues north and south."
	RTRUE	


	.FUNCT	CAMPUS-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,ELM-AND-UNIVERSITY,LECTURE-HALL \?ELS10
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS10:	EQUAL?	HERE,DORM \?ELS12
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS12:	EQUAL?	HERE,HALLEY-AND-UNIVERSITY \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	EQUAL?	HERE,STUDENT-UNION \?ELS16
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \FALSE
	EQUAL?	HERE,ROCKVIL-UNIVERSITY \?ELS27
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS27:	EQUAL?	HERE,DORM,STUDENT-UNION,LECTURE-HALL \?ELS31
	PRINTR	"There's no way to leave the campus from here."
?ELS31:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	


	.FUNCT	DORM-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"You have entered one building in the dormitory complex, the very same dorm where you once lived for several terms when you were a student at the University. Many doors open onto a nearby lounge. "
	EQUAL?	SYEAR,2061 \?ELS10
	PRINTI	"The building is silent as a tomb"
	JUMP	?CND8
?ELS10:	PRINTI	"Loud music filters through the walls"
	ZERO?	DORM-RAID-FLAG \?CND8
	PRINTI	", and the odor of mindex hangs in the air"
?CND8:	PRINTI	". The street lies to the east."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2051 \FALSE
	ZERO?	DORM-RAID-FLAG \FALSE
	CALL2	SCORE,23
	SET	'DORM-RAID-FLAG,TRUE-VALUE
	SET	'ELAPSED-TIME,10
	CRLF	
	PRINTI	"Suddenly, the front door slams open, and dozens of uniformed officers burst into the building. They force their way into room after room, and through the nearby doorways you can see the police ransacking every room. Several students are hustled outside into a waiting police van. A higher-ranking officer passes by, and you can hear him saying something about ""confiscated drugs"" and ""arrest will make a good example."" A few minutes later, the raid is over, and the dorm is buzzing with subdued "
	PRINTD	CONVERSATION
	PRINTR	"s."


	.FUNCT	DORM-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,DORM \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS16
	EQUAL?	HERE,DORM \?ELS21
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?SMELL \?ELS27
	EQUAL?	SYEAR,2041,2051 \?ELS27
	CALL	PERFORM,V?SMELL,MINDEX
	RTRUE	
?ELS27:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DORM \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	EQUAL?	SYEAR,2071 \FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	


	.FUNCT	LOUNGE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,DORM \?ELS5
	CALL2	DO-WALK,P?IN
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	SYEAR,2041,2051 \FALSE
	CALL	PERFORM,V?SMELL,MINDEX
	RTRUE	


	.FUNCT	LECTURE-HALL-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,ROCKVIL-UNIVERSITY \?ELS10
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,LECTURE-HALL-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,LECTURE-HALL \?ELS21
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,LECTURE-HALL \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	EQUAL?	SYEAR,2071 \FALSE
	CALL2	DO-WALK,P?SE
	RSTACK	


	.FUNCT	LECTURE-HALL-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SEAT,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a "
	EQUAL?	SYEAR,2061 \?CND10
	PRINTI	"decaying "
?CND10:	PRINTI	"lecture hall with several hundred seats, surrounded by several smaller classrooms and professors' offices. An exit leads northwest."
	RTRUE	


	.FUNCT	LECTURE-HALL-ITEM-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	HERE,LECTURE-HALL \FALSE
	PRINTR	"Those areas are restricted to University personnel."


	.FUNCT	STUDENT-UNION-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,STUDENT-UNION \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,STUDENT-UNION-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,STUDENT-UNION \?ELS21
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,STUDENT-UNION \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	EQUAL?	SYEAR,2071 \FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	


	.FUNCT	STUDENT-UNION-ITEM-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	HERE,STUDENT-UNION \FALSE
	PRINTR	"That area is restricted to student use."


	.FUNCT	ELM-AND-KENNEDY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is an intersection with streets heading in the four cardinal directions. There is a"
	EQUAL?	SYEAR,2061 \?ELS10
	PRINTI	"n entrance to a "
	PRINTD	CONSTRUCTION-OBJECT
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2071 \?ELS14
	PRINTI	" complex of high-security townhouses"
	JUMP	?CND8
?ELS14:	PRINTI	" park entrance"
?CND8:	PRINTI	" on the northwest corner and a hospital on the southwest corner. To the southeast lies a shopping mall, and a large, old building with an impressive facade can be entered to the northeast."
	RTRUE	


	.FUNCT	HOSPITAL-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?59
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Rockvil General Hospital is an old but prestigious facility"
	EQUAL?	SYEAR,2061 \?ELS12
	CALL2	SCORE,24
	PRINTI	", catering almost exclusively to wealthy patients"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2071 \?CND10
	CALL2	SCORE,25
	PRINTI	", which was the center of some brief rioting last year when two injured serfs died at the Admitting Entrance after being refused entry for class reasons"
?CND10:	PRINTI	". A nurse sits at the admitting desk. The exit is northeast, and a hallway leads southwest to the annex."
	RTRUE	


	.FUNCT	HOSPITAL-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,HOSPITAL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,ELM-AND-KENNEDY \?ELS14
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,HOSPITAL,HOSPITAL-ANNEX \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HOSPITAL,HOSPITAL-ANNEX \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	ANNEX-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,HOSPITAL \?ELS10
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS10:	EQUAL?	HERE,HOSPITAL-ANNEX \?ELS12
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS12:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,HOSPITAL-ANNEX \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HOSPITAL-ANNEX \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	HOSPITAL-ANNEX-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"new, modern"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2051 \?ELS14
	PRINTI	"fairly modern"
	JUMP	?CND8
?ELS14:	PRINTI	"well-maintained"
?CND8:	PRINTI	" wing of Rockvil General Hospital. The street lies to the southwest, and a breezeway leads northeast into the old building."
	RTRUE	


	.FUNCT	SOUTHWAY-AND-KENNEDY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Kennedy Street, from the north, ends here in a ""T"" with Southway. On the northwest corner is a"
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"n opening in a temporary wooden fence"
	JUMP	?CND8
?ELS10:	PRINTI	" tall, ugly office tower. The words ""First Continent Bank Building"" hang in large metal letters over the entrance"
?CND8:	PRINTI	", and a car lot fills the northeast corner. A row of old brick triple-deckers, "
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	"recently"
	JUMP	?CND19
?ELS21:	PRINTI	"once"
?CND19:	PRINTI	" renovated, lines the southern side of the street."
	RTRUE	


	.FUNCT	CONSTRUCTION-SITE-1-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS5
	RETURN	CONSTRUCTION-SITE-1
?ELS5:	CALL1	OFFICE-BUILDING-ENTER-F
	RFALSE	


	.FUNCT	CONSTRUCTION-SITE-1-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"A high-rise building is under construction here. "
	EQUAL?	LIGHT-LEVEL,3 \?CND8
	PRINTI	"The chopping of blades is deafening as "
	PRINTD	DERRICOPTERS
	PRINTI	"s lift bundles of "
	PRINTD	BEAMS
	PRINTI	" to the top of the structure. "
?CND8:	PRINTI	"A sign reads:"
	CRLF	
	CALL	PERFORM,V?READ,GLOBAL-SIGN
	PRINTI	"An opening in the perimeter fence leads southeast."
	RTRUE	


	.FUNCT	DERRICOPTERS-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	EQUAL?	LIGHT-LEVEL,3 \?ELS10
	PRINTI	"These are huge "
	PRINTD	DERRICOPTERS
	PRINTR	"s, befitting a construction project of this size."
?ELS10:	PRINTI	"The "
	PRINTD	DERRICOPTERS
	PRINTR	"s lie idle at the edge of the site."
?ELS5:	EQUAL?	PRSA,V?LISTEN \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	PRINTI	"The "
	PRINTD	DERRICOPTERS
	PRINTR	"s are deafeningly loud."


	.FUNCT	SOUTHWAY-AND-RIVER-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"Here at River Street, Southway ends its long trip from the western suburbs. South of here, the street bends toward the river. To the southwest are some brick houses, and a car lot occupies the northwest corner. All along the east side of the street "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"is a huge "
	PRINTD	CONSTRUCTION-OBJECT
	PRINTI	"."
	RTRUE	
?ELS12:	PRINTI	"is the featureless, cliff-like facade of "
	PRINTD	HEIMAN-WORLD-OBJECT
	PRINTI	"."
	EQUAL?	SYEAR,2061,2071 \FALSE
	CALL2	SCORE,26
	PRINTI	" Little, if anything, has been done to restore the top several floors, gutted by fire about "
	EQUAL?	SYEAR,2061 \?ELS32
	PRINTI	"five"
	JUMP	?CND30
?ELS32:	PRINTI	"fifteen"
?CND30:	PRINTI	" years ago.

That fire, which cost several thousand lives, revealed a severe deficiency of built-in fire control systems, but the courts threw out all suits since the building was built after the deregulation of the construction industry in '38, and the developer never falsely represented the building's safety systems."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	GETP	SOUTHWAY-AND-RIVER,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	SOUTHWAY-AND-RIVER,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS49
	PUTP	SOUTHWAY-AND-RIVER,P?SCENE,101
	CALL2	SCORE,27
	CRLF	
	PRINTR	"In an alley between two buildings, you spot two Church policemen shooting an old woman with silenced guns. They drag her out of view."
?ELS49:	GETP	SOUTHWAY-AND-RIVER,P?SCENE
	ADD	STACK,33
	PUTP	SOUTHWAY-AND-RIVER,P?SCENE,STACK
	RFALSE	


	.FUNCT	CONSTRUCTION-SITE-2-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	PUTP	CONSTRUCTION-SITE-2,P?SDESC,STR?26
	FCLEAR	CONSTRUCTION-SITE-2,NARTICLEBIT
	RTRUE	
?ELS10:	FSET	CONSTRUCTION-SITE-2,NARTICLEBIT
	PUTP	CONSTRUCTION-SITE-2,P?SDESC,STR?62
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS19
	PRINTI	"The work in this huge site is still in the foundation phase. A sign reads:"
	CRLF	
	CALL	PERFORM,V?READ,GLOBAL-SIGN
	PRINTI	"You can leave the site to the west or southwest."
	RTRUE	
?ELS19:	EQUAL?	SYEAR,2051 \?ELS25
	PRINTI	"This is the second of developer Salvador Heiman's ""cities within a city."" Rumors say that it wasn't built as well as the older "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	" next door, and indeed, it already shows some minor cracks from settling. Exits from the vast lobby lead west and southwest."
	RTRUE	
?ELS25:	EQUAL?	SYEAR,2061 \?ELS31
	CALL2	SCORE,28
	PRINTI	"This is a run-down Indoor City. The second of its kind, it was completed in 2042. The only lighting in the lobby comes from the tall entrance doors to the west and southwest."
	RTRUE	
?ELS31:	CALL2	SCORE,29
	PRINTI	"This old Indoor City has become exactly what its critics predicted it would become: a vast indoor slum. You would be well advised to use the exits that lie to the west and southwest."
	RTRUE	


	.FUNCT	ROCKVIL-MALL-ENTER-F
	EQUAL?	SYEAR,2041,2051,2061 \?ELS9
	GRTR?	STIME,480 \?ELS9
	LESS?	STIME,1320 /?THN6
?ELS9:	EQUAL?	SYEAR,2071 \?ELS5
	GRTR?	STIME,720 \?ELS5
	LESS?	STIME,1080 \?ELS5
?THN6:	RETURN	ROCKVIL-MALL
?ELS5:	CALL2	CLOSED-PRINT,STR?63
	RFALSE	


	.FUNCT	ROCKVIL-MALL-F,RARG,TIME
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"This"
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	" busy"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2071 \?CND8
	PRINTI	" deserted"
?CND8:	PRINTI	" shopping mall is a renovated computer factory. There are many stores"
	EQUAL?	SYEAR,2071 \?ELS21
	PRINTI	", most of them closed, and stark joybooths marked with the symbol of the Church form a row along the eastern side of the mall"
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2041 \?CND19
	PRINTI	", and Dizzard Joybooths line the eastern side of the mall"
?CND19:	PRINTI	". There are exits to the northwest, northeast, and south."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \?ELS34
	SET	'TIME,1080
	JUMP	?CND32
?ELS34:	SET	'TIME,1320
?CND32:	CALL	CLOSING-TIME,TIME,STR?64,STR?18,ELM-AND-KENNEDY
	RSTACK	


	.FUNCT	MALL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,ROCKVIL-MALL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,ELM-AND-KENNEDY \?ELS14
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS14:	EQUAL?	HERE,ELM-AND-RIVER \?ELS16
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \FALSE
	EQUAL?	HERE,ROCKVIL-MALL \?ELS25
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	


	.FUNCT	JOYBOOTH-ENTER-F
	EQUAL?	SYEAR,2041,2071 \?ELS5
	RETURN	JOYBOOTH
?ELS5:	EQUAL?	SYEAR,2051 \?CND8
	CALL2	SCORE,30
	PRINTI	"You remember vaguely that the eastern side of the Mall once contained many joybooths, but of course they were banned years ago. "
?CND8:	PRINTI	"There's nothing in that direction "
	EQUAL?	SYEAR,2051 \?CND15
	PRINTI	"now "
?CND15:	PRINTI	"-- just a featureless wall."
	CRLF	
	RFALSE	


	.FUNCT	JOYBOOTH-F,RARG,TIME
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SEAT,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"You are in a Dizzard-brand joybooth, the most expensive but generally considered the most well-programmed line of booths"
	JUMP	?CND8
?ELS10:	PRINTI	"You are in one of the new, free, Church-sponsored joybooths"
?CND8:	PRINTI	". The room is small, barely a meter across, with gray carpeted walls, "
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	"a slot for "
	PRINTD	CREDIT-CARD
	PRINTI	"s"
	JUMP	?CND19
?ELS21:	PRINTI	"a "
	PRINTD	JOYBOOTH-BUTTON
?CND19:	PRINTI	", a headset, and a plain, built-in seat."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \?ELS36
	SET	'TIME,1080
	JUMP	?CND34
?ELS36:	SET	'TIME,1320
?CND34:	CALL	CLOSING-TIME,TIME,STR?64,STR?18,ELM-AND-KENNEDY
	RSTACK	


	.FUNCT	JOYBOOTH-EXIT-F
	FSET?	HEADSET,WORNBIT \?ELS5
	PRINTI	"You'll have to remove the headset first."
	CRLF	
	SET	'P-IT-OBJECT,HEADSET
	RFALSE	
?ELS5:	RETURN	ROCKVIL-MALL


	.FUNCT	JOYBOOTH-OBJECT-F
	EQUAL?	SYEAR,2051,2061 \?ELS5
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,JOYBOOTH-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS9
	EQUAL?	HERE,JOYBOOTH \?ELS14
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS14:	CALL	GLOBAL-IN?,JOYBOOTH-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS20
	EQUAL?	HERE,ROCKVIL-MALL \?ELS25
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS25:	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,JOYBOOTH \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"The booths are emblazoned with the symbol of the Church."


	.FUNCT	JOYBOOTH-BUTTON-F
	EQUAL?	PRSA,V?PUSH \FALSE
	CALL2	QUEUED?,I-JOYBOOTH-RECHARGE
	ZERO?	STACK /?ELS10
	PRINTR	"A light flashes for a moment: ""Recharging. Unit not in operation."""
?ELS10:	FSET?	HEADSET,WORNBIT \?ELS14
	CALL2	SCORE,31
	SET	'ELAPSED-TIME,30
	CALL	QUEUE,I-JOYBOOTH-RECHARGE,60
	LOC	PLAYER
	EQUAL?	SEAT,STACK \?CND15
	FSET	SEAT,ONBIT
?CND15:	PRINTR	"The walls of the joybooth recede, and you find yourself in an arena, garbed in magnificent gladiator's armor. In one hand you hold a long whip, in the other a mace. The ground around you is literally soggy with blood.

You barely notice as the headset probes into the recesses of your mind, uncovering hidden thoughts, nurturing certain emotions. An unclad, unwashed barbarian suddenly stumbles into the arena before you, and at once your mind is filled with unthinking hatred toward this...this thing, this animal.

The roar of the mob pierces your hatred, the roar of thousands, screaming for their hero. You can hear many things in those screams; the screams of women lusting for your manhood, the screams of men jealous of your power, the screams of everyone for the blood of the barbarian animal

as adrenalin surges through your chest as the creature picks up a battered sword and shield from the ground. In a flash, the battle begins, and like most animals, the creature has amazing strength. His blows land on your armor, but you shake them off like a true hero. Summoning an inner strength, drawing upon your anger for this filthy beast, you sink the spikes of the mace deep into the creature's flesh. The bellowing of the crowd becomes deafening, shaking the ground, resounding through the arena, pounding you, pounding

the blood pounding in your ears, your breath short and excited, you slowly notice the tiny booth around you. Although disappointed that the fantasy has ended, you feel somehow refreshed, emotionally nourished; the rare taste of victory in a life of defeat."
?ELS14:	PRINTR	"Nothing happens."


	.FUNCT	I-JOYBOOTH-RECHARGE
	RFALSE	


	.FUNCT	HEADSET-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	CALL	PERFORM,V?WEAR,HEADSET
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?PUT-ON \FALSE
	EQUAL?	PRSI,HEAD \FALSE
	CALL	PERFORM,V?WEAR,HEADSET
	RTRUE	


	.FUNCT	ELM-AND-RIVER-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Elm Street begins here and crosses the downtown area to the west. Along the eastern side of River Street stands the vast "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	" building. You can enter "
	PRINTD	ROCKVIL-MALL
	PRINTI	" to the southwest, or the old "
	PRINTD	STOCK-EXCHANGE
	PRINTI	" building to the northwest. "
	EQUAL?	SYEAR,2071 \?ELS16
	PRINTI	"A former Tube entrance occupies"
	JUMP	?CND14
?ELS16:	PRINTI	"An entrance to a "
	PRINTD	TUBE-STATION
	PRINTI	" graces"
?CND14:	PRINTI	" one corner of the intersection."
	RTRUE	


	.FUNCT	STOCK-EXCHANGE-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS9
	GRTR?	STIME,360 \?ELS9
	LESS?	STIME,1320 /?THN6
?ELS9:	EQUAL?	SYEAR,2051,2061,2071 \?ELS5
	GRTR?	STIME,420 \?ELS5
	LESS?	STIME,1320 \?ELS5
?THN6:	RETURN	STOCK-EXCHANGE
?ELS5:	CALL2	CLOSED-PRINT,STR?65
	RFALSE	


	.FUNCT	STOCK-EXCHANGE-F,RARG
	EQUAL?	RARG,M-END \FALSE
	CALL	CLOSING-TIME,1320,STR?67,STR?18,ELM-AND-KENNEDY
	RSTACK	


	.FUNCT	STOCK-EXCHANGE-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,STOCK-EXCHANGE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,ELM-AND-RIVER \?ELS14
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,STOCK-EXCHANGE \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,STOCK-EXCHANGE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	MAIN-AND-RIVER-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"This is a typical four-way intersection between Main and River Streets. An entranceway through the massive walls of "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	" fills the southeast corner of the street, and a "
	EQUAL?	SYEAR,2071 \?CND10
	PRINTI	"former "
?CND10:	PRINTI	"health care facility occupies the northeast corner.

To the southwest is 80 River Street, a "
	EQUAL?	SYEAR,2041 \?ELS19
	PRINTI	"brand new"
	JUMP	?CND17
?ELS19:	EQUAL?	SYEAR,2051 \?ELS23
	PRINTI	"fairly modern"
	JUMP	?CND17
?ELS23:	PRINTI	"forties-style"
?CND17:	PRINTI	" plastalloy and glass "
	PRINTD	CHUN-BUILDING
	EQUAL?	SYEAR,2041 \?CND32
	PRINTI	", with many floors still unoccupied according to the billboard over the entrance"
?CND32:	PRINTI	". The fourth corner, the northwest, is the site of Perez Towers, a luxury apartment building."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2051 \FALSE
	GETP	MAIN-AND-RIVER,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	MAIN-AND-RIVER,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS47
	PUTP	MAIN-AND-RIVER,P?SCENE,101
	CALL2	SCORE,33
	CRLF	
	PRINTR	"Several BSF officers trot out of a nearby building and climb into an unmarked BSF van which drives away."
?ELS47:	GETP	MAIN-AND-RIVER,P?SCENE
	ADD	STACK,50
	PUTP	MAIN-AND-RIVER,P?SCENE,STACK
	RFALSE	


	.FUNCT	PEREZ-TOWERS-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,MAIN-AND-RIVER \?ELS5
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTD	PEREZ-TOWERS
	PRINTR	" is a luxury apartment building."


	.FUNCT	HEIMAN-VILLAGE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"This massive complex is a revolutionary and controversial concept in urban development, the ""city within a city."" Apartments of every size, schools, offices, stores, and city services, all can be found under this one gigantic roof. Exits from the Village lead northwest, west, and east."
	ZERO?	DESCRIBE-VILLAGE \FALSE
	SET	'DESCRIBE-VILLAGE,TRUE-VALUE
	CRLF	
	CRLF	
	PRINTI	"Proponents of this type of city-microcosm say that it makes the desirable urban lifestyle available to the middle class, saves energy and commuting time, and shields people from the crime and pollution of the city streets.

Critics call it an urban cocoon, creating a sterile, isolated environment and eliminating the need to deal with the urban problems which make isolation so desirable."
	CRLF	
	CRLF	
	PRINTD	HEIMAN-VILLAGE
	PRINTI	", in the few years it has been open, has proved to be a tremendous commercial success, and more communities of the type are being planned."
	RTRUE	
?ELS10:	EQUAL?	SYEAR,2051 \?ELS23
	PRINTI	"This is a landmark in urban development, the first and most famous Indoor City. It has been extremely popular, allowing the middle class an opportunity to live in the city. Indoor Cities are being planned in many locations. You can leave the lobby of "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	" to the east, west, or northwest."
	RTRUE	
?ELS23:	EQUAL?	SYEAR,2061 \?ELS29
	CALL2	SCORE,28
	PRINTI	"This oldest of the Indoor Cities looks typically ill-maintained. The only lighting in the lobby comes from the tall entrance doors to the east, west and northwest."
	RTRUE	
?ELS29:	CALL2	SCORE,29
	PRINTI	"The oldest Indoor City has succumbed to the fate its critics foresaw: a roofed-in urban ghetto for masses of faceless serfs. You would be well advised to use the exits that lie to the east, west, or northwest."
	RTRUE	


	.FUNCT	HEIMAN-VILLAGE-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,HEIMAN-VILLAGE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,CHURCH-STREET-PARK \?ELS14
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,HEIMAN-VILLAGE \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HEIMAN-VILLAGE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	HEIMAN-WORLD-OBJECT-F
	EQUAL?	SYEAR,2041 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,HEIMAN-WORLD-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,SOUTHWAY-AND-RIVER \?ELS14
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS14:	EQUAL?	HERE,BEND \?ELS16
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	EQUAL?	HERE,CONSTRUCTION-SITE-2 \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CONSTRUCTION-SITE-2 \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CHURCH-STREET-CITY-OBJECT-F
	EQUAL?	SYEAR,2041,2051 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,CHURCH-STREET-CITY-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,MAIN-AND-CHURCH \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	EQUAL?	HERE,HEIMAN-VILLAGE \?ELS16
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS22
	EQUAL?	HERE,CHURCH-STREET-PARK \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CHURCH-STREET-PARK \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CHURCH-STREET-PARK-EXIT-F
	EQUAL?	SYEAR,2041,2051 \?ELS3
	EQUAL?	PRSO,P?SOUTH \?ELS6
	PRINTI	"The tracks are fenced off."
	CRLF	
	RFALSE	
?ELS6:	PRINTI	"There's no exit on that side of the park."
	CRLF	
	RFALSE	
?ELS3:	PRINTI	"There's no exit from the lobby in that direction."
	CRLF	
	RFALSE	


	.FUNCT	CHURCH-STREET-PARK-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041,2051 \?ELS10
	PUTP	CHURCH-STREET-PARK,P?SDESC,STR?68
	RTRUE	
?ELS10:	PUTP	CHURCH-STREET-PARK,P?SDESC,STR?69
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041,2051 \?ELS19
	PRINTI	"This is the oldest existing park in the city, and has not been well kept up. "
	PRINT	FOUNTAIN-DESC
	PRINTI	" The park has a reputation for being very unsafe after dark, due to the proximity to the poor section of town just across the tracks to the south. Church Street begins at the entrance to the park and leads north, and a side entrance to "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	" forms the western boundary of the park."
	RTRUE	
?ELS19:	CALL2	SCORE,34
	PRINTI	"This Indoor City is a fairly recent one, and almost by definition, therefore, a fairly low-quality structure. A tunnel leads west toward "
	PRINTD	HEIMAN-VILLAGE
	PRINTI	", and the main entrance to this IC is from the north."
	RTRUE	


	.FUNCT	FOUNTAIN-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINT	FOUNTAIN-DESC
	CRLF	
	RTRUE	


	.FUNCT	MAIN-AND-CHURCH-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"You are at the corner of bustling Main Street and quiet Church Street. There "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"is construction in progress"
	JUMP	?CND8
?ELS10:	PRINTI	"are nondescript buildings"
?CND8:	PRINTI	" on the northwestern and southwestern corners. A conventional apartment building occupies the southeast corner, and an entrance to Midland Cemetery forms the fourth corner. "
	EQUAL?	SYEAR,2041,2051 \?ELS23
	PRINTI	"Some greenery is visible down Church Street to the south."
	RTRUE	
?ELS23:	PRINTI	"A particularly blockish Indoor City towers over Church Street south of here."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	GETP	MAIN-AND-CHURCH,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	MAIN-AND-CHURCH,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS38
	PUTP	MAIN-AND-CHURCH,P?SCENE,101
	CALL2	SCORE,35
	CRLF	
	PRINTR	"You hear shots from a nearby building. Seconds later, Security Police carry a bleeding man out of the building and into a waiting skyvan. A woman runs out of the building, screaming. One of the officers kicks her in the stomach and clubs her across the skull as she falls. Nonchalantly, the policeman climbs into the skyvan, which rises away."
?ELS38:	GETP	MAIN-AND-CHURCH,P?SCENE
	ADD	STACK,50
	PUTP	MAIN-AND-CHURCH,P?SCENE,STACK
	RFALSE	


	.FUNCT	CONSTRUCTION-SITE-3-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS5
	RETURN	CONSTRUCTION-SITE-3
?ELS5:	CALL1	OFFICE-BUILDING-ENTER-F
	RFALSE	


	.FUNCT	CONSTRUCTION-SITE-4-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS5
	RETURN	CONSTRUCTION-SITE-4
?ELS5:	CALL1	APARTMENT-ENTER-F
	RFALSE	


	.FUNCT	CHURCH-STREET-APARTMENTS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	BUZZERS,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	CALL	DESCRIBE-APARTMENT-VESTIBULE,STR?70,STR?71
	RSTACK	


	.FUNCT	I-HUNGER
	ZERO?	HUNGER-WARNING /?ELS5
	CALL2	SCORE,40
	CRLF	
	CALL2	JIGS-UP,STR?74
	RSTACK	
?ELS5:	CALL2	SCORE,40
	SET	'HUNGER-WARNING,TRUE-VALUE
	CALL	QUEUE,I-HUNGER,47
	CRLF	
	PRINTR	"Hunger overwhelms you for a moment. Your head clears, but your stomach still aches from days without food."


	.FUNCT	MAIN-AND-WICKER-F,RARG,?TMP1
	EQUAL?	RARG,M-ENTER \?ELS5
	IN?	UNSHAVEN-MAN,MAIN-AND-WICKER \?ELS5
	MOVE	UNSHAVEN-MAN,LOCAL-GLOBALS
	CALL2	HELD?,BORDELLO-AD
	ZERO?	STACK \FALSE
	MOVE	BORDELLO-AD,LOCAL-GLOBALS
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS14
	EQUAL?	SYEAR,2081 \?ELS19
	CALL2	SCORE,36
	PRINTI	"The street runs from west to east, where a bridge is visible. A crude sign is posted just west of here. Another road leads south into a different section of town, where smoke billows upward from scattered fires. Buildings all along the street look typically looted and deserted; a grocery store, its large plate glass window shattered, is on the southwest corner. On the southeast corner is the burnt-out shell of a building, and an overgrown cemetery lies to the north. As usual, all the telephone poles have been chopped down for firewood."
	RTRUE	
?ELS19:	PRINTI	"Wicker Drive, which begins here, heads south under a railroad bridge. Main Street leads west toward the center of the city and east across a bridge over the river"
	CALL1	GROCERY-STORE-DESC
	PRINTI	", occupies the southwest corner and a restaurant stands amid a large car lot on the southeast corner. There is an entrance to the cemetery to the north."
	RTRUE	
?ELS14:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2051 \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	EQUAL?	L-HERE,MAIN-AND-WICKER /FALSE
	GETP	MAIN-AND-WICKER,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	MAIN-AND-WICKER,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS36
	PUTP	MAIN-AND-WICKER,P?SCENE,101
	MOVE	UNSHAVEN-MAN,HERE
	MOVE	BORDELLO-AD,UNSHAVEN-MAN
	CRLF	
	PRINTI	"An "
	PRINTD	UNSHAVEN-MAN
	PRINTI	" looks bored as he hands out cheaply-printed "
	PRINTD	BORDELLO-AD
	PRINTR	"s."
?ELS36:	GETP	MAIN-AND-WICKER,P?SCENE
	ADD	STACK,25
	PUTP	MAIN-AND-WICKER,P?SCENE,STACK
	RFALSE	


	.FUNCT	UNSHAVEN-MAN-F
	EQUAL?	UNSHAVEN-MAN,WINNER \?ELS5
	EQUAL?	PRSA,V?GIVE \?ELS12
	EQUAL?	PRSO,BORDELLO-AD /?THN9
?ELS12:	EQUAL?	PRSA,V?SGIVE \?ELS8
	EQUAL?	PRSI,BORDELLO-AD \?ELS8
?THN9:	SET	'WINNER,PLAYER
	CALL	PERFORM,V?TAKE,BORDELLO-AD
	JUMP	?CND6
?ELS8:	PRINTI	"He replies with a few monosyllabic grunts."
	CRLF	
?CND6:	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?ASK-FOR \FALSE
	EQUAL?	PRSI,BORDELLO-AD \FALSE
	CALL	PERFORM,V?TAKE,BORDELLO-AD
	RTRUE	


	.FUNCT	BORDELLO-AD-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	FSET?	BORDELLO-AD,TRYTAKEBIT \?ELS5
	FCLEAR	BORDELLO-AD,TRYTAKEBIT
	FCLEAR	BORDELLO-AD,NDESCBIT
	MOVE	UNSHAVEN-MAN,LOCAL-GLOBALS
	MOVE	BORDELLO-AD,PLAYER
	SET	'FOLLOW-FLAG,9
	CALL	QUEUE,I-UNFOLLOW,2
	PUTP	SPEAR-CARRIER,P?SDESC,STR?77
	PRINTI	"You take the last photocopy from the "
	PRINTD	UNSHAVEN-MAN
	PRINTR	" and glance at it. When you look up, he is gone."
?ELS5:	EQUAL?	PRSA,V?EXAMINE,V?READ \?ELS13
	FSET?	BORDELLO-AD,TRYTAKEBIT \?ELS13
	PRINTR	"You'll have to take one of the ads first."
?ELS13:	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	CALL2	SCORE,37
	PRINTR	"   GIRLS!  GIRLS!  GIRLS!

Mona's Pleasure Parlor has it all!!
   * Massage Parlor
   * Topless Club
   * Escort Agency
   * Bordello
   * XXX Videos
   * Accessory Shop and more!
In Eastbank, on the corner of River
and Franklin."


	.FUNCT	RAILROAD-TRACKS-F
	EQUAL?	HERE,CHURCH-STREET-PARK \?ELS5
	EQUAL?	SYEAR,2061,2071 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,RAILROAD-TRACKS
	RSTACK	
?ELS5:	EQUAL?	HERE,WAREHOUSE-1 \?ELS9
	EQUAL?	SYEAR,2041,2051 \?ELS9
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS9
	CALL2	CANT-SEE,RAILROAD-TRACKS
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?CROSS \FALSE
	EQUAL?	HERE,WICKER-AND-PIER \?ELS18
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS18:	EQUAL?	HERE,MAIN-AND-WICKER,CHURCH-STREET-PARK \?ELS20
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS20:	EQUAL?	HERE,BEND \?ELS22
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS22:	EQUAL?	HERE,WICKER-AND-RIVER \?ELS24
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS24:	EQUAL?	HERE,WAREHOUSE-1 \?ELS26
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS26:	PRINTR	"That would be dangerous and foolhardy."


	.FUNCT	RAILROAD-BRIDGE-F
	EQUAL?	PRSA,V?WALK-UNDER,V?CROSS \FALSE
	EQUAL?	HERE,MAIN-AND-WICKER \?ELS10
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS10:	EQUAL?	HERE,BEND \?ELS12
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS12:	EQUAL?	HERE,WICKER-AND-RIVER \?ELS14
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS14:	CALL2	DO-WALK,P?NW
	RSTACK	


	.FUNCT	STREET-BRIDGE-F
	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS5
	EQUAL?	HERE,RIVER-STREET-BRIDGE,MAIN-STREET-BRIDGE \?ELS10
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS10:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?CROSS,V?WALK-TO,V?THROUGH \?ELS16
	EQUAL?	HERE,RIVER-STREET-BRIDGE,MAIN-STREET-BRIDGE \?ELS21
	EQUAL?	PRSA,V?CROSS \?ELS26
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS26:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	EQUAL?	HERE,MAIN-AND-WICKER \?ELS32
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS32:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?LOOK-UNDER \FALSE
	PRINTR	"The Little Missouri flows under the bridge."


	.FUNCT	MAIN-AND-CHURCH-ENTER-F
	EQUAL?	SYEAR,2081 \?ELS5
	CALL2	SCORE,38
	CALL2	JIGS-UP,STR?78
	RFALSE	
?ELS5:	RETURN	MAIN-AND-CHURCH


	.FUNCT	FOODVILLE-2-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2081 /?ELS5
	EQUAL?	SYEAR,2071 \?CND8
	SET	'CLERK-WAITING,FALSE-VALUE
	CALL	QUEUE,I-FOODVILLE,1
?CND8:	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS12
	EQUAL?	SYEAR,2081 \?ELS17
	CALL2	SCORE,39
	PRINTI	"This grocery has been thoroughly looted; the shelves are all bare. The floor is strewn with broken glass, and a rancid odor pervades the store. The only exit leads back out to the street corner northeast of here."
	RTRUE	
?ELS17:	CALL1	FOODVILLE-DESC
	PRINTI	"northeast."
	RTRUE	
?ELS12:	EQUAL?	RARG,M-END \FALSE
	CALL1	FOODVILLE-CLOSES
	RSTACK	


	.FUNCT	MOLD-F
	EQUAL?	PRSA,V?EAT \?ELS5
	CALL2	SCORE,40
	PRINTR	"Because of your half-crazed state, perhaps brought on by several days without food, you seriously consider eating the mold. In a lucid moment, though, you realize how disgusting and dangerous that would be."
?ELS5:	EQUAL?	PRSA,V?SMELL \?ELS9
	PRINTR	"You have just discovered the source of the rancid odor."
?ELS9:	EQUAL?	PRSA,V?TAKE \FALSE
	FSET?	MOLD,TRYTAKEBIT \FALSE
	FCLEAR	MOLD,TRYTAKEBIT
	FSET	MOLD,TOUCHBIT
	MOVE	MOLD,PLAYER
	PRINTR	"You scoop up the putrid-smelling mold."


	.FUNCT	THE-COACHMAN-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,RESTAURANT-OBJECT
	RFALSE	
?ELS5:	RETURN	THE-COACHMAN


	.FUNCT	THE-COACHMAN-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2081 /?ELS5
	SET	'MEAL-STATUS,1
	SET	'MAITRE-COUNTER,0
	SET	'WAITER-COUNTER,0
	MOVE	SPEAR-CARRIER,HERE
	CALL2	INT,I-MEAL
	PUT	STACK,0,0
	MOVE	RESTAURANT-TABLE,HERE
	MOVE	CHAIR,HERE
	IN?	CREDIT-CARD,SPEAR-CARRIER \?CND8
	MOVE	CREDIT-CARD,LOCAL-GLOBALS
?CND8:	PUTP	SPEAR-CARRIER,P?SDESC,STR?80
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS12
	EQUAL?	SYEAR,2081 \?ELS17
	CALL2	SCORE,41
	PRINTI	"This burned-out shell of a building was once a famous restaurant back in the civilized days. The "
	PRINTD	TIMBERS
	PRINTI	" shiver as you walk through the ashes."
	RTRUE	
?ELS17:	PRINTI	"You are in a large, well-known restaurant"
	EQUAL?	SYEAR,2071 \?ELS28
	CALL2	SCORE,42
	PRINTI	", opulent in the extreme, and known to be restricted to the highest ecclesiastics of the Church"
	JUMP	?CND26
?ELS28:	EQUAL?	SYEAR,2061 \?CND26
	CALL2	SCORE,43
	PRINTI	", a favorite of wealthy Churchmen"
?CND26:	PRINTI	". The car lot and street lie to the northwest."
	RTRUE	
?ELS12:	EQUAL?	RARG,M-END \?ELS38
	EQUAL?	SYEAR,2071 \?ELS38
	CRLF	
	PRINTI	"The maitre d' spots you, and gestures a velvet-swathed arm toward a bouncer waiting in the shadows. ""Throw this animal back out on the street,"" he sniffs. The bouncer grabs your collar, and shoves you through the doorway."
	CRLF	
	CRLF	
	CALL2	GOTO,MAIN-AND-WICKER
	RSTACK	
?ELS38:	EQUAL?	RARG,M-END \?ELS44
	EQUAL?	SYEAR,2081 \?ELS44
	RANDOM	100
	LESS?	50,STACK /?ELS44
	CRLF	
	CALL	PERFORM,V?MOVE,TIMBERS
	RTRUE	
?ELS44:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2081 /FALSE
	CALL2	RESTAURANT-CLOSES,MAIN-AND-WICKER
	ZERO?	STACK \TRUE
	CALL1	PARTY-OF-ONE
	ZERO?	STACK \TRUE
	RFALSE


	.FUNCT	TIMBERS-F
	EQUAL?	PRSA,V?TOUCH,V?MOVE \FALSE
	CALL2	JIGS-UP,STR?81
	RSTACK	


	.FUNCT	RESTAURANT-TABLE-F
	EQUAL?	PRSA,V?SIT,V?BOARD \FALSE
	LOC	PLAYER
	EQUAL?	RESTAURANT-TABLE,STACK \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,ROYS-PAGODA /FALSE
	GRTR?	MEAL-STATUS,2 \?ELS16
	MOVE	PLAYER,RESTAURANT-TABLE
	PRINTR	"You resume your seat."
?ELS16:	PRINTR	"You'll have to wait for the maitre d' to seat you."


	.FUNCT	MENU-F
	EQUAL?	HERE,BURGER-MEISTER \?ELS5
	EQUAL?	SYEAR,2071 \?ELS10
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS10
	CALL2	CANT-SEE,MENU
	RSTACK	
?ELS10:	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTI	"The menuboard lists "
	CALL1	FAST-FOOD-MENU
	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?ASK-NO-ONE-FOR,V?EXAMINE,V?READ \FALSE
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	


	.FUNCT	FAST-FOOD-MENU
	EQUAL?	SYEAR,2061 \?ELS5
	CALL2	SCORE,73
	PRINTI	"soy and kelp burgers, a variety of algae products, and beer. All beef dishes on the menuboard have been crudely covered over"
	RTRUE	
?ELS5:	PRINTI	"beef burgers, less-expensive kelp burgers and soy burgers, and beer"
	RTRUE	


	.FUNCT	MEAL-F
	EQUAL?	SYEAR,2081 \?ELS5
	EQUAL?	PRSA,V?TAKE,V?EXAMINE \?ELS5
	EQUAL?	HERE,FOODVILLE-2 \?ELS5
	CALL2	CANT-SEE,MEAL
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?BUY \?ELS9
	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS14
	EQUAL?	SYEAR,2081 \?ELS19
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS19:	LOC	PLAYER
	EQUAL?	STACK,RESTAURANT-TABLE /?ELS23
	PRINTR	"You'll have to wait until you're seated."
?ELS23:	EQUAL?	MEAL-STATUS,3 \?ELS27
	CALL1	I-MEAL
	RSTACK	
?ELS27:	PRINTI	"You've already "
	EQUAL?	MEAL-STATUS,6 \?ELS34
	PRINTI	"eaten"
	JUMP	?CND32
?ELS34:	PRINTI	"ordered"
?CND32:	PRINTR	"."
?ELS14:	EQUAL?	HERE,ROYS-PAGODA \?ELS44
	SET	'ELAPSED-TIME,22
	ZERO?	RECORDING /?CND45
	PUT	RECORDING-TABLE,0,1
?CND45:	PRINTI	"You order a bowl of Hot and Sour soup and some assorted appetizers. The food arrives promptly, steaming hot, delicately spiced, delicious. Afterward, your check arrives with a typical fortune cookie and a plate of lychee nuts. The fortune reads: """
	EQUAL?	SYEAR,2041 \?ELS53
	PRINTI	"Prosperity does not equal happiness"
	JUMP	?CND51
?ELS53:	EQUAL?	SYEAR,2051 \?ELS57
	PRINTI	"Today's leak is tomorrow's flood"
	JUMP	?CND51
?ELS57:	EQUAL?	SYEAR,2061 \?ELS61
	PRINTI	"Buddha welcomes even the poorest man"
	JUMP	?CND51
?ELS61:	PRINTI	"It is always darkest before dawn"
?CND51:	PRINTI	"."" You pay with your "
	PRINTD	CREDIT-CARD
	LESS?	CREDIT,30 \?CND70
	PRINTR	", but the waiter returns a minute later with your card and says, ""Sorry, not enough balance to pay for meal. You pay next time you come."""
?CND70:	CALL2	DEBIT,30
	PRINTR	"."
?ELS44:	EQUAL?	HERE,BURGER-MEISTER \?ELS78
	EQUAL?	SYEAR,2071 /?ELS78
	SET	'ELAPSED-TIME,12
	ZERO?	RECORDING /?CND81
	PUT	RECORDING-TABLE,0,1
?CND81:	EQUAL?	SYEAR,2041 \?ELS87
	PRINTI	"The line you picked moves quickly, putting you in a cheerful mood, and you decide to splurge and buy a beef burger."
	JUMP	?CND85
?ELS87:	PRINTI	"Your line moves slowly. The person in front of you orders a quarter-pound soyburger, and it looks halfway decent, so when you reach the counter you decide to order one also."
?CND85:	PRINTI	" It arrives a moment later"
	CALL	TOO-POOR,20,MEAL
	ZERO?	STACK \TRUE
	CALL2	DEBIT,20
	MOVE	PLAYER,GLOBAL-TABLE
	PRINTI	". You sit down at one of the tiny tables to devour it. It's "
	EQUAL?	SYEAR,2061 \?ELS107
	PRINTI	"edible"
	JUMP	?CND105
?ELS107:	PRINTI	"juicy and delicious"
?CND105:	PRINTR	"."
?ELS78:	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS117
	FSET?	GROCERIES,TOUCHBIT \?ELS122
	PRINTR	"You've already bought enough groceries to last the week."
?ELS122:	EQUAL?	SYEAR,2041,2051 \?ELS126
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?82
	SET	'ELAPSED-TIME,12
	PRINTI	"You wander down the aisles, filling the small cart with various items. You select the shortest checkout line"
	CALL	TOO-POOR,73,MEAL
	ZERO?	STACK \TRUE
	MOVE	GROCERIES,PLAYER
	FSET	GROCERIES,TOUCHBIT
	SET	'P-IT-OBJECT,GROCERIES
	CALL2	DEBIT,73
	PRINTR	". A clerk bags your groceries and hands you the bag."
?ELS126:	EQUAL?	SYEAR,2061 \?ELS135
	PRINTR	"You wander down the aisles, but the food is so sparse and unappetizing that you decide not to buy anything."
?ELS135:	EQUAL?	SYEAR,2071 \?ELS139
	PRINTR	"You can only get food these days using your ration card."
?ELS139:	CALL2	CANT-SEE,MEAL
	RSTACK	
?ELS117:	PRINTR	"You can't get a meal here!"
?ELS9:	EQUAL?	PRSA,V?WAIT-FOR \?ELS149
	IN?	CREDIT-CARD,SPEAR-CARRIER \?ELS154
	CALL2	V-WAIT,30
	RSTACK	
?ELS154:	EQUAL?	HERE,THE-COACHMAN,SIMONS \?ELS156
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	
?ELS156:	CALL	PERFORM,V?WAIT-FOR,GOLD
	RTRUE	
?ELS149:	EQUAL?	PRSA,V?EAT,V?TAKE \?ELS160
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 /?THN166
	EQUAL?	HERE,BURGER-MEISTER,ROYS-PAGODA \?ELS165
?THN166:	PRINTR	"You can't take food you haven't paid for!"
?ELS165:	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS171
	EQUAL?	MEAL-STATUS,6 \?ELS176
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	
?ELS176:	EQUAL?	MEAL-STATUS,4,5 \?ELS178
	PRINTR	"It hasn't arrived yet."
?ELS178:	PRINTR	"You haven't ordered yet."
?ELS171:	CALL2	CANT-SEE,MEAL
	RSTACK	
?ELS160:	EQUAL?	PRSA,V?EXAMINE \?ELS188
	CALL1	IN-RESTAURANT?
	ZERO?	STACK /?ELS188
	PRINTR	"The food is prepared in another room."
?ELS188:	EQUAL?	PRSA,V?EXAMINE \?ELS194
	EQUAL?	HERE,CAFETERIA \?ELS194
	PRINTR	"You can't see much from this high vantage point."
?ELS194:	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 /?ELS200
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS200
	CALL2	CANT-SEE,MEAL
	RSTACK	
?ELS200:	EQUAL?	SYEAR,2071 \?ELS204
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS204
	CALL2	CANT-SEE,MEAL
	RSTACK	
?ELS204:	EQUAL?	PRSA,V?WAIT-FOR \FALSE
	EQUAL?	HERE,THE-COACHMAN,SIMONS \?ELS213
	IN?	CREDIT-CARD,SPEAR-CARRIER \?ELS218
	CALL2	V-WAIT,20
	RSTACK	
?ELS218:	CALL	PERFORM,V?READ,MENU
	RTRUE	
?ELS213:	CALL	PERFORM,V?WAIT-FOR,FORTZMAN
	RTRUE	


	.FUNCT	I-MEAL,OLD-WINNER
	EQUAL?	HERE,THE-COACHMAN,SIMONS \FALSE
	IN?	CREDIT-CARD,SPEAR-CARRIER \?ELS8
	MOVE	CREDIT-CARD,PLAYER
	LESS?	CREDIT,65 \?ELS13
	CRLF	
	PRINTI	"The waiter returns with your card, informing you that you have insufficient funds to cover the meal. He escorts you out of the restaurant."
	CRLF	
	CRLF	
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL2	DO-WALK,P?OUT
	SET	'WINNER,OLD-WINNER
	RETURN	WINNER
?ELS13:	ZERO?	RECORDING /?CND18
	PUT	RECORDING-TABLE,0,1
?CND18:	SET	'MEAL-STATUS,6
	CALL2	INCREMENT-TIME,12
	CRLF	
	PRINTI	"The waiter places "
	EQUAL?	SYEAR,2041 \?ELS26
	PRINTI	"your soybean salad on the table. A generous portion, and quite tasty; you quickly devour it"
	JUMP	?CND24
?ELS26:	PRINTI	"your kelp fillet in front of you. You eat the entire dish, and while it was tasty, you still feel that it wasn't worth the price"
?CND24:	CALL2	DEBIT,65
	PRINTR	"."
?ELS8:	EQUAL?	MEAL-STATUS,4 \?ELS36
	INC	'WAITER-COUNTER
	CALL	QUEUE,I-MEAL,1
	EQUAL?	WAITER-COUNTER,4 \?ELS41
	CRLF	
	PRINTR	"The waiter clears his throat. ""If you're unable to produce your credit card, I'd be glad to ask the maitre d' over here to assist you."""
?ELS41:	EQUAL?	WAITER-COUNTER,6 \?ELS45
	CRLF	
	PRINTI	"The waiter, looking quite annoyed, leaves the tableside. A moment later, the maitre d' arrives and shows you out of the restaurant."
	CRLF	
	CRLF	
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL2	DO-WALK,P?OUT
	SET	'WINNER,OLD-WINNER
	RETURN	2
?ELS45:	SET	'P-IT-OBJECT,SPEAR-CARRIER
	CRLF	
	PRINTI	"The waiter is standing at your table, waiting for your "
	PRINTD	CREDIT-CARD
	PRINTR	"."
?ELS36:	LOC	PLAYER
	EQUAL?	STACK,RESTAURANT-TABLE \?ELS57
	SET	'P-IT-OBJECT,SPEAR-CARRIER
	SET	'MEAL-STATUS,4
	CRLF	
	PRINTI	"The waiter hands you a "
	LESS?	STIME,690 \?ELS62
	PRINTI	"breakfast"
	JUMP	?CND60
?ELS62:	GRTR?	STIME,960 \?ELS66
	PRINTI	"dinner"
	JUMP	?CND60
?ELS66:	PRINTI	"lunch"
?CND60:	PRINTI	" menu, and after perusing the meat prices you settle on a"
	EQUAL?	SYEAR,2041 \?ELS77
	PRINTI	" nice, reasonably priced soybean salad"
	JUMP	?CND75
?ELS77:	PRINTI	"n overpriced kelp fillet, the cheapest item on the menu"
?CND75:	PRINTI	". The waiter jots down your order, and reminds you of the restaurant's policy of payment in advance."
	CRLF	
	CALL	QUEUE,I-MEAL,1
	RSTACK	
?ELS57:	CALL	QUEUE,I-MEAL,1
	RFALSE	


	.FUNCT	PARTY-OF-ONE
	EQUAL?	MEAL-STATUS,1 \FALSE
	CRLF	
	GRTR?	MAITRE-COUNTER,8 \?ELS10
	PRINTI	"""I'm afraid you'll have to leave,"" says the maitre d'. ""There's no loitering here."" He escorts you to the door."
	CRLF	
	CRLF	
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS10:	INC	'MAITRE-COUNTER
	PRINTR	"""Party of one?"" sniffs the maitre d'."


	.FUNCT	GROCERIES-F
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?ELS5
	PRINTR	"Just a bagful of typical groceries."
?ELS5:	EQUAL?	PRSA,V?OPEN \?ELS9
	PRINTR	"The bag is open."
?ELS9:	EQUAL?	PRSA,V?EAT \?ELS13
	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS18
	MOVE	GROCERIES,LOCAL-GLOBALS
	PRINTI	"You select one item, a small bag of potato snacks, and eat that. You "
	EQUAL?	HERE,KITCHEN /?CND21
	SET	'HERE,KITCHEN
	MOVE	PLAYER,KITCHEN
	PRINTI	"go to the kitchen and "
?CND21:	PRINTR	"put the rest of the groceries away."
?ELS18:	PRINTR	"Better to wait until you get home and use the groceries for dinner."
?ELS13:	EQUAL?	PRSA,V?PUT \?ELS33
	EQUAL?	PRSI,KITCHEN-OBJECT \?ELS33
	CALL	PERFORM,V?PUT-AWAY,GROCERIES
	RTRUE	
?ELS33:	EQUAL?	PRSA,V?PUT-AWAY \?ELS37
	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS42
	PRINTI	"You "
	EQUAL?	HERE,KITCHEN /?CND45
	MOVE	PLAYER,KITCHEN
	SET	'HERE,KITCHEN
	PRINTI	"enter the kitchen and "
?CND45:	MOVE	GROCERIES,LOCAL-GLOBALS
	PRINTR	"put the groceries neatly away."
?ELS42:	PRINTR	"Wait until you get home."
?ELS37:	EQUAL?	PRSA,V?PUT \?ELS57
	EQUAL?	PRSI,GROCERIES \?ELS57
	PRINTI	"The bag is full; besides, that's a dumb place to keep"
	CALL2	ARTICLE,PRSO
	PRINTR	"."
?ELS57:	EQUAL?	PRSA,V?BUY \FALSE
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	


	.FUNCT	MAIN-STREET-BRIDGE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2081 \?ELS5
	CALL	QUEUE,I-WILD-DOGS,-1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2081 \?ELS14
	CALL2	SCORE,44
	PRINTI	"This once-proud bridge is now rusted and neglected. To the west, the road enters the city. An intersection is visible in that direction."
	RTRUE	
?ELS14:	PRINTI	"You have reached the center of the bridge which carries Main Street across the river. Westward brings you back into the city, and east of here are the wealthier suburbs of the east bank."
	CALL2	RIVER-FIRE,STR?49
	RSTACK	


	.FUNCT	MAIN-STREET-BRIDGE-EXIT-F
	EQUAL?	SYEAR,2081 \?ELS3
	CALL2	INT,I-WILD-DOGS
	PUT	STACK,0,0
	CALL2	SCORE,45
	CALL2	JIGS-UP,STR?83
	RFALSE	
?ELS3:	CALL1	SUBURBS-ENTER-F
	RFALSE	


	.FUNCT	SACK-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL2	SCORE,46
	PRINTR	"The sack is soaked with blood and shows traces of the wild fruits that grow beyond the city. Judging by how the sack has been clawed to pieces, it would seem that the owner was killed by wild animals rather than humans."


	.FUNCT	BARKING-F
	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"The barking is off to the east. It seems to be getting louder."


	.FUNCT	CEMETERY-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	EQUAL?	SYEAR,2081 \?ELS10
	CALL2	SCORE,47
	PRINTI	"Once a lovely old cemetery, the land is now overgrown and the "
	PRINTD	HEADSTONES
	PRINTI	" toppled and vandalized. Snarled bushes and trees provide countless hiding places for thieves and cutthroats."
	RTRUE	
?ELS10:	PRINTI	"Midland Cemetery occupies one of the nicest pieces of land in the city, atop the rolling bluffs of the west bank. The cemetery dates back to the time of the original St. Michael's building, and some of the gravestones are two hundred years old. "
	EQUAL?	SYEAR,2071 \?ELS21
	CALL2	SCORE,48
	PRINTI	"Many of the stones have been etched with ugly graffiti, like ""PAP,"" a derogatory term for Catholics, and ""JEEBOO,"" an epithet for any nonmember of the Church. Near the main gate of the cemetery, to the west, the land has been bulldozed but is now overgrown with weeds, indicating a construction project that was begun but then abandoned. O"
	JUMP	?CND19
?ELS21:	PRINTI	"The main gate of the cemetery is west of here, and o"
?CND19:	PRINTI	"ther gates lie to the south, southwest, and northwest."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2081 \FALSE
	CRLF	
	PRINTI	"With a rustle of leaves, someone leaps out of concealment. You barely catch a glimpse of a grizzled man wearing a torn imi-denim outfit before a fist cracks you across the face, and you pass out as you begin rolling down the hillside. "
	FSET?	CEMETERY,ONBIT \?ELS40
	CALL2	JIGS-UP,STR?86
	RSTACK	
?ELS40:	PRINTI	"Sometime later, you come to..."
	CRLF	
	CRLF	
	FSET	CEMETERY,ONBIT
	SET	'MUGGED,TRUE-VALUE
	CALL	ROB,PLAYER,LOCAL-GLOBALS
	CALL2	INCREMENT-TIME,23
	CALL2	GOTO,MAIN-AND-WICKER
	RSTACK	


	.FUNCT	CEMETERY-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,CEMETERY \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,MAIN-AND-WICKER \?ELS14
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS14:	EQUAL?	HERE,MAIN-AND-CHURCH \?ELS16
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS16:	EQUAL?	HERE,CHURCH-ENTRANCE \?ELS18
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS22
	EQUAL?	HERE,CEMETERY \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CEMETERY \?ELS38
	CALL1	V-LOOK
	RSTACK	
?ELS38:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	HEADSTONES-F
	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	EQUAL?	SYEAR,2071 \?ELS10
	CALL	PERFORM,V?READ,GRAFFITI
	RTRUE	
?ELS10:	EQUAL?	SYEAR,2081 \?ELS12
	PRINTR	"Virtually all the stones have been broken and toppled."
?ELS12:	PRINTR	"The stones bear the usual epitaphs, names, and dates. Some of the stones are dated from the middle of the nineteenth century."


	.FUNCT	CHURCH-ENTRANCE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2071 \?ELS10
	PUTP	CHURCH-ENTRANCE,P?SDESC,STR?87
	RTRUE	
?ELS10:	PUTP	CHURCH-ENTRANCE,P?SDESC,STR?88
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are on Church Street, just east of"
	CALL1	ST-MICHAELS-DESC
	PRINTI	" The street continues north and south"
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	", and "
	PRINTD	CONSTRUCTION-OBJECT
	PRINTI	"s lie to the northwest and southwest"
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2051 \?ELS27
	PRINTI	". Another church building, probably a rectory, lies to the northwest, and an ordinary high-rise apartment is southwest of here"
	JUMP	?CND19
?ELS27:	EQUAL?	SYEAR,2061 \?ELS31
	PRINTI	". Another church building to the northwest is also closed. Southwest of here is an indistinguishable apartment block"
	JUMP	?CND19
?ELS31:	PRINTI	". To the northwest is a ruined structure of some type, and to the southwest is a luxury apartment tower"
?CND19:	PRINTI	". The main entrance to Midland Cemetery is east of here."
	RTRUE	


	.FUNCT	ST-MICHAELS-DESC
	PRINTI	" a large"
	EQUAL?	SYEAR,2061 \?ELS7
	CALL2	SCORE,49
	PRINTI	" church with boarded doors and windows. Anti-Catholic graffiti defaces the facade."
	RTRUE	
?ELS7:	EQUAL?	SYEAR,2071 \?ELS11
	PRINTI	" vacant lot."
	RTRUE	
?ELS11:	PRINTI	", opulent church displaying the architecture of the twentieth century."
	RTRUE	


	.FUNCT	ST-MICHAELS-ENTER-F
	EQUAL?	SYEAR,2061 \?ELS5
	CALL2	SCORE,49
	PRINT	BOARDED-OVER
	CRLF	
	RFALSE	
?ELS5:	RETURN	ST-MICHAELS


	.FUNCT	CONSTRUCTION-SITE-5-ENTER-F
	EQUAL?	SYEAR,2061 \?ELS5
	PRINTI	"The building is closed, its doorways and windows boarded over."
	CRLF	
	RFALSE	
?ELS5:	RETURN	CONSTRUCTION-SITE-5


	.FUNCT	ST-MICHAELS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	CHURCH-OFFICIAL,LOCAL-GLOBALS
	EQUAL?	SYEAR,2071 \?ELS10
	MOVE	RUSTY-CROSS,HERE
	FCLEAR	ST-MICHAELS,NARTICLEBIT
	PUTP	ST-MICHAELS,P?SDESC,STR?89
	RTRUE	
?ELS10:	FSET	ST-MICHAELS,NARTICLEBIT
	PUTP	ST-MICHAELS,P?SDESC,STR?90
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS14
	EQUAL?	SYEAR,2071 \?ELS19
	PRINTI	"You are in a large, vacant lot, strewn with rubble. The only way out of the lot is a small opening in the rubble to the east."
	RTRUE	
?ELS19:	PRINTI	"This is a large church with an obviously wealthy congregation. Although this building is over a century old, it is not the original St. Michael's, but is built on the site of the even older original church. The way out is to the east."
	RTRUE	
?ELS14:	EQUAL?	RARG,M-END \FALSE
	CALL1	ELDER-MOVE
	RSTACK	


	.FUNCT	RUSTY-CROSS-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	FSET?	RUSTY-CROSS,TRYTAKEBIT \?ELS5
	FCLEAR	RUSTY-CROSS,TRYTAKEBIT
	FSET	RUSTY-CROSS,TOUCHBIT
	MOVE	RUSTY-CROSS,PLAYER
	PRINTI	"You pick up the metal object. "
	PRINT	IT-LOOKS-LIKE
	PRINTR	" an old, rusting cross."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The cross is ornamental, of the sort once worn by priests. It has rusted to the point of fragility."


	.FUNCT	CONSTRUCTION-SITE-5-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	PUTP	CONSTRUCTION-SITE-5,P?SDESC,STR?26
	RTRUE	
?ELS10:	EQUAL?	SYEAR,2051 \?ELS12
	PUTP	CONSTRUCTION-SITE-5,P?SDESC,STR?92
	RTRUE	
?ELS12:	PUTP	CONSTRUCTION-SITE-5,P?SDESC,STR?93
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS19
	PRINTI	"An old building, possibly a rectory owned by the church to the south, is being renovated"
	JUMP	?CND17
?ELS19:	EQUAL?	SYEAR,2071 \?ELS23
	PRINTI	"Barely discernible through the ash and broken glass are signs that this was once a church building of some kind"
	JUMP	?CND17
?ELS23:	PRINTI	"This is part of the St. Michael's complex"
?CND17:	PRINTI	". You can leave to either the northeast or southeast."
	RTRUE	


	.FUNCT	RECTORY-OBJECT-F
	EQUAL?	SYEAR,2041,2071 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,RECTORY-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?WALK-TO \?ELS9
	EQUAL?	HERE,CONSTRUCTION-SITE-5 \?ELS14
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS14:	EQUAL?	HERE,CHURCH-ENTRANCE \?ELS18
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	EQUAL?	HERE,CONSTRUCTION-SITE-5 \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CONSTRUCTION-SITE-5 \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	MIDLAND-AND-CHURCH-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Church Street, from the south, ends at this corner. A"
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	" "
	PRINTD	RAILROAD-YARD
	PRINTI	", no longer used but part of the "
	PRINTD	RAILROAD-MUSEUM
	PRINTI	","
	JUMP	?CND8
?ELS10:	PRINTI	"n abandoned "
	PRINTD	RAILROAD-YARD
?CND8:	PRINTI	" spans the northern side of Midland. There is "
	EQUAL?	SYEAR,2041 \?ELS25
	PRINTI	"construction"
	JUMP	?CND23
?ELS25:	EQUAL?	SYEAR,2051 \?ELS29
	PRINTI	"a church rectory"
	JUMP	?CND23
?ELS29:	EQUAL?	SYEAR,2061 \?ELS33
	PRINTI	"a closed church building"
	JUMP	?CND23
?ELS33:	PRINTI	"a wreck of a building"
?CND23:	PRINTI	" on the southwest corner, and to the southeast is an entrance to Midland Cemetery. Midland Avenue heads eastward into the cemetery."
	RTRUE	


	.FUNCT	HEALTH-CENTER-OBJECT-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	CANT-SEE,HEALTH-CENTER-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS7
	EQUAL?	HERE,HEALTH-CENTER \?ELS12
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS12:	EQUAL?	HERE,MAIN-AND-RIVER \?ELS16
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS7:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS20
	EQUAL?	HERE,HEALTH-CENTER \?ELS25
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HEALTH-CENTER \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	HEALTH-CENTER-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2071 \?ELS10
	PUTP	HEALTH-CENTER,P?SDESC,STR?95
	RTRUE	
?ELS10:	PUTP	HEALTH-CENTER,P?SDESC,STR?96
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS17
	PRINTI	"The Anderson Health Center is one of the country's oldest and most reputable private health maintenance organizations. A directory in the lobby directs members to various departments on the many floors of the center"
	JUMP	?CND15
?ELS17:	EQUAL?	SYEAR,2051 \?ELS21
	CALL2	SCORE,50
	PRINTI	"The Anderson Health Care center is a respected, member-owned HMO which has consistently refused to follow the trend of providing inferior health care to those unable to afford the best procedures"
	JUMP	?CND15
?ELS21:	EQUAL?	SYEAR,2061 \?ELS25
	CALL2	SCORE,51
	PRINTI	"This once-superb medical facility has fallen upon hard times, as its wealthy members have abandoned it in favor of better facilities, and the remaining, poorer members were unable to maintain the previous levels of health care"
	JUMP	?CND15
?ELS25:	CALL2	SCORE,52
	PRINTI	"This building once housed the Anderson Health Care Center, which was among the last facilities to continue offering medical care to serfs. After finally succumbing to financial realities, the structure has now become an overcrowded, unsanitary home-of-last-resort for the poorest of the poor"
?CND15:	PRINTI	". There are exits southwest, to the street, and north, to a"
	EQUAL?	SYEAR,2071 \?CND34
	PRINTI	"n abandoned"
?CND34:	PRINTI	" car lot."
	RTRUE	


	.FUNCT	ANDERSON-DIRECTORY-F
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTI	"The directory merely tells which floor the various departments of the "
	PRINTD	HEALTH-CENTER-OBJECT
	PRINTR	" are located on."


	.FUNCT	SKYCAR-LOT-3-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a"
	EQUAL?	SYEAR,2071 \?CND8
	PRINTI	"n abandoned"
?CND8:	PRINTI	" multistory car lot "
	EQUAL?	SYEAR,2071 \?CND15
	PRINTI	"that was once used "
?CND15:	PRINTI	"for the Anderson Health Center "
	EQUAL?	SYEAR,2071 \?CND22
	PRINTI	"that once occupied the building "
?CND22:	PRINTI	"that can be entered to the south. The exit to the street is northwest."
	RTRUE	


	.FUNCT	MIDLAND-AND-RIVER-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Eastbound Midland Avenue forms a ""T"" with River Street at this intersection. To the northeast is a"
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"n old but magnificently preserved structure"
	JUMP	?CND8
?ELS10:	PRINTI	" graceful structure of marble and glass, bearing the black radar dish symbol of the "
	PRINTI	"Church"
	EQUAL?	SYEAR,2051 \?CND8
	PRINTI	" of God's Word"
?CND8:	PRINTI	". "
	PRINT	ALI-BUILDING-DESC
	PRINTI	", and a car lot occupies the southeast corner."
	RTRUE	


	.FUNCT	ALI-BUILDING-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINT	ALI-BUILDING-DESC
	PRINTR	"."


	.FUNCT	TRAIN-STATION-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS9
	GRTR?	STIME,660 \?ELS9
	LESS?	STIME,1260 /?THN6
?ELS9:	EQUAL?	SYEAR,2051,2061,2071 \?ELS5
?THN6:	RETURN	TRAIN-STATION
?ELS5:	CALL2	CLOSED-PRINT,STR?99
	RFALSE	


	.FUNCT	TRAIN-STATION-OBJECT-F
	EQUAL?	SYEAR,2041 /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,TRAIN-STATION-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,BODANSKI-SQUARE \?ELS14
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS14:	EQUAL?	HERE,MIDLAND-AND-RIVER \?ELS16
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,TRAIN-STATION-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	EQUAL?	HERE,TRAIN-STATION \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,TRAIN-STATION \?ELS38
	CALL1	V-LOOK
	RSTACK	
?ELS38:	PRINTI	"The "
	PRINTD	TRAIN-STATION-OBJECT
	PRINTR	" is a magnificently preserved national landmark."


	.FUNCT	TRAIN-STATION-EXIT-F
	EQUAL?	SYEAR,2041 \?ELS3
	PRINT	NO-TICKET
	CRLF	
	RFALSE	
?ELS3:	PRINTI	"Only high Church officials are allowed into the inner areas."
	CRLF	
	RFALSE	


	.FUNCT	TRAIN-STATION-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	FSET?	TICKET,NDESCBIT \?CND11
	MOVE	TICKET,HERE
?CND11:	PUTP	TRAIN-STATION,P?SDESC,STR?100
	RTRUE	
?ELS10:	PUTP	TRAIN-STATION,P?SDESC,STR?101
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS17
	EQUAL?	SYEAR,2041 \?ELS22
	PRINTI	"The former North Central Station is a magnificent building from the earliest part of the twentieth century. Unused for years, it has been restored as a national landmark. The newsstands have been converted to souvenir stands, and tourists stream through the station to buy tickets for a fifteen minute ride on an authentic electric railroad train, which can be boarded to the east. You can leave the station to the northwest or southwest."
	RTRUE	
?ELS22:	PRINTI	"The regional central headquarters of the Church"
	EQUAL?	SYEAR,2051 \?CND29
	CALL2	SCORE,53
	PRINTI	" of God's Word, built on the site of an old "
	PRINTD	TRAIN-STATION-OBJECT
	PRINTI	","
?CND29:	PRINTI	" is an architectural splendor; light spills down from above, giving the illusion that the countenance of God is gazing down upon a visitor in full force and fury. A huge image of a radar dish, symbol of the Church, hangs above the inner sanctums to the east, and impressively tall arched doorways lead out to the northwest and southwest."
	RTRUE	
?ELS17:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2041 \FALSE
	CALL	CLOSING-TIME,1260,STR?102,STR?18,BODANSKI-SQUARE
	RSTACK	


	.FUNCT	SOUVENIR-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,TRAIN-STATION \?ELS10
	PRINTR	"You know better than to waste your money on junk like that."
?ELS10:	PRINTR	"There aren't any souvenirs for sale here!"
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The souvenirs are typically cheap, overpriced, train-related trinkets."


	.FUNCT	PAMPHLET-F
	EQUAL?	PRSA,V?READ \FALSE
	EQUAL?	SYEAR,2051 \?ELS10
	CALL2	SCORE,54
	PRINTR	"""A BRIEF HISTORY OF THE CHURCH OF GOD'S WORD

The Church of God's Word is the vision of a great man, a man named Ellis Vincent. He alone, of all the scientists on the Mount who heard the signals, recognized them for what they were, the Word of God.

The Holy Prophet was ridiculed and persecuted for his beliefs, but he had the strength that comes from knowing the Truth, and Followers began to hear those Truths and flock around him. They grew in numbers and in strength, and when the Evil Scientists of the Mount attempted to bar Vincent from the instruments there, he and his Followers rose up and smote the Evil Scientists.

And so it came to pass, in 2025, that the Temple was founded on the Mount, and the Instrument of the Word was devoted entirely to listening to God's Word. Vincent interpreted the Words for his Followers, who broadcast the Message around the world, and branches of the Church appeared in many cities.

When Vincent finally became very old, and God began to beckon his servant to his side, he taught the wisest of his Followers how to interpret the Word, so that the world would continue to understand the Word after he was gone. These Followers became the High Priests of the Church, who to this day continue to pass along God's Word."""
?ELS10:	EQUAL?	SYEAR,2061 \?ELS14
	CALL2	SCORE,55
	PRINTR	"""Hear and obey the Word of God.

Ever since the brave crusade of the Holy Prophet Vincent against the evil sinners of the Mount, the priests of the Church of God's Word have been the sacred guardians of God's Mouth, passing along His Word as sent down from the heavens.

The Lord Most High has been growing angry at His flock -- angry that there are some who do not heed His Word. He is sending a sign, a fiery star that will soon burn in our nighttime skies, to warn us that all created in His image must become brethren of His Church. The punishment for not doing so will be swift and cruel, and directed not just against the sinners but against all of mankind, such that all will suffer for the sins of the few.

Our Father and Creator is demanding, but He is also generous and kind. When the day arrives that all men have joined His Church and heed His Word, he will bring down upon the Earth an epoch of such peace and beauty as the world has not seen since Eden. The choice He gives us is simple: Turn away and suffer, or Follow and live to see Heaven on Earth."""
?ELS14:	CALL2	SCORE,56
	PRINTR	"""   --- New Pronouncements from The Mount ---

Our Father in Heaven is pleased with the progress the Church is making toward Purifying His flock, and assures the Faithful that the day of deliverance is soon.

He has instructed that new Worship Camps for the Unpure be opened in every part of His favorite nation. He has instructed that these be filled with more of the Beasts in Human Form, who have not joined the Church, or who are not considered fit to join the Church, so that they may be purified and sent to meet Him.

He has instructed that only the officials of the Church may hold governmental posts, in order to speed His work and facilitate the dawning of the new Eden. He has, in his generosity, increased the number of slaves a Churchman may own, from twenty-five to fifty.

This is the Word of God; blessed be His name."""


	.FUNCT	RACK-F
	EQUAL?	SYEAR,2041 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,PAMPHLET-RACK
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?PUT \?ELS9
	EQUAL?	PRSI,PAMPHLET-RACK \?ELS9
	EQUAL?	PRSO,PAMPHLET \?ELS16
	FCLEAR	PAMPHLET,TOUCHBIT
	MOVE	PAMPHLET,HERE
	PRINTR	"Done."
?ELS16:	PRINTR	"The rack is for Church literature."
?ELS9:	EQUAL?	PRSA,V?LOOK-INSIDE,V?EXAMINE \FALSE
	FSET?	PAMPHLET,TOUCHBIT \?ELS29
	PRINTR	"It's empty."
?ELS29:	GETP	PAMPHLET,P?FDESC
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	CENTRE-AND-KENNEDY-F,RARG,?TMP1
	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	GETP	CENTRE-AND-KENNEDY,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	CENTRE-AND-KENNEDY,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS12
	PUTP	CENTRE-AND-KENNEDY,P?SCENE,101
	CALL2	SCORE,57
	CRLF	
	PRINTR	"Across the street, a beggar attempts to approach a wealthy couple, and is beaten into unconsciousness by bodyguards."
?ELS12:	GETP	CENTRE-AND-KENNEDY,P?SCENE
	ADD	STACK,25
	PUTP	CENTRE-AND-KENNEDY,P?SCENE,STACK
	RFALSE	


	.FUNCT	HUANG-HALL-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,CENTRE-AND-KENNEDY \?ELS10
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS10:	EQUAL?	HERE,HALLEY-AND-PARK \?ELS12
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS12:	EQUAL?	HERE,HALLEY-PARK-EAST \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,HUANG-HALL-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS20
	EQUAL?	HERE,HUANG-HALL \?ELS25
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HUANG-HALL \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	PRINTR	"The exterior of the hall is plain and boxy."


	.FUNCT	HUANG-HALL-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This multipurpose hall "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"was built by a grant from the Huang Foundation, with the stipulation that it be used primarily for artistic and cultural events. It is also"
	JUMP	?CND8
?ELS10:	PRINTI	"is"
?CND8:	PRINTI	" used for conventions, trade shows, and even an occasional sporting event. The current activity seems to be "
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	"a publishers' convention"
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2051 \?ELS25
	CALL2	SCORE,58
	PRINTI	"a jewelry and fur show"
	JUMP	?CND19
?ELS25:	EQUAL?	SYEAR,2061 \?ELS29
	CALL2	SCORE,59
	PRINTI	"the graduation festivities for the largest BSF Academy class ever"
	JUMP	?CND19
?ELS29:	CALL2	SCORE,60
	PRINTI	"preparations for the televised, annual Executioners Awards"
?CND19:	PRINTI	". You can exit to the "
	EQUAL?	SYEAR,2071 \?ELS42
	PRINTI	"east or west."
	RTRUE	
?ELS42:	PRINTI	"north, east, or west."
	RTRUE	


	.FUNCT	HALLEY-AND-PARK-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are on Park Street, at the eastern terminus of Halley Drive. North of here, Park Street descends into a tunnel under "
	EQUAL?	SYEAR,2071 \?CND8
	CALL2	SCORE,61
	PRINTI	"the estates that were once "
?CND8:	PRINTI	"Halley Park. "
	EQUAL?	SYEAR,2071 /?CND15
	PRINTI	"The park can be entered to the northeast or northwest. "
?CND15:	PRINTD	HALLEY-MUSEUM
	EQUAL?	SYEAR,2061,2071 \?CND20
	CALL2	SCORE,62
	PRINTI	", once the city's pride but now closed for the last several years,"
?CND20:	PRINTI	" fronts the intersection to the southwest, and Huang Hall can be entered to the east."
	RTRUE	


	.FUNCT	HALLEY-MUSEUM-ENTER-F
	EQUAL?	SYEAR,2071,2061 \?ELS5
	CALL2	SCORE,62
	PRINT	BOARDED-OVER
	CRLF	
	RFALSE	
?ELS5:	GRTR?	STIME,600 \?ELS9
	LESS?	STIME,1290 \?ELS9
	RETURN	HALLEY-MUSEUM
?ELS9:	CALL2	CLOSED-PRINT,STR?108
	RFALSE	


	.FUNCT	HALLEY-MUSEUM-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	EQUAL?	SYEAR,2041 \?ELS8
	PRINTI	"Nearly seventy-five"
	JUMP	?CND6
?ELS8:	PRINTI	"Nearly eighty-five"
?CND6:	PRINTI	" years old, "
	PRINTD	HALLEY-MUSEUM
	PRINTI	" is the pride of Rockvil. The museum specializes in classical art, but has exhibits on science and engineering, natural and human history, and modern art as well. The museum is"
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTI	", as usual, very"
	JUMP	?CND19
?ELS21:	EQUAL?	SYEAR,2051 \?CND19
	CALL2	SCORE,129
	PRINTI	" not very"
?CND19:	PRINTI	" crowded. The street lies to the northeast."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	CLOSING-TIME,1290,STR?109,STR?18,HALLEY-AND-PARK
	RSTACK	


	.FUNCT	HALLEY-AND-UNIVERSITY-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"University Avenue begins here, winding southwards into the "
	EQUAL?	SYEAR,2071 \?ELS10
	CALL2	SCORE,63
	PRINTI	"grounds of what was once "
	PRINTD	ROCKVIL-UNIVERSITY
	JUMP	?CND8
?ELS10:	PRINTI	"college"
?CND8:	PRINTI	". Along the north side of the street is "
	EQUAL?	SYEAR,2071 \?ELS21
	CALL2	SCORE,62
	PRINTI	"a high brick wall forming the perimeter of the estates that were built when Halley Park was carved up a few years ago"
	JUMP	?CND19
?ELS21:	PRINTI	"Halley Park"
?CND19:	PRINTI	". Just to the west is the highway entrance."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2051 \FALSE
	GETP	HALLEY-AND-UNIVERSITY,P?SCENE
	EQUAL?	STACK,100 \FALSE
	PUTP	HALLEY-AND-UNIVERSITY,P?SCENE,101
	MOVE	CHURCH-SKYCOPTER,HERE
	ADD	ELAPSED-TIME,1
	CALL	QUEUE,I-CHURCH-SKYCOPTER,STACK
	CALL2	SCORE,64
	CRLF	
	PRINTR	"A skycopter, with a loudspeaker disguised as a radar dish hanging below it, drifts slowly by overhead, announcing some sort of prayer meeting."


	.FUNCT	CHURCH-SKYCOPTER-F
	EQUAL?	PRSA,V?LISTEN \?ELS5
	MOVE	CHURCH-SKYCOPTER,LOCAL-GLOBALS
	CALL2	INT,I-CHURCH-SKYCOPTER
	PUT	STACK,0,0
	CALL2	SCORE,64
	PRINTR	"""The Church of God's Word invites you to a prayer meeting tonight at..."" The skycopter drifts out of range before you can hear the time or location."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Suspended from the skycopter is a speaker modelled to resemble the symbol of the Church."


	.FUNCT	I-CHURCH-SKYCOPTER
	PRINTI	"The skycopter, heading away, disappears from view."
	CRLF	
	MOVE	CHURCH-SKYCOPTER,LOCAL-GLOBALS
	RFALSE	


	.FUNCT	INTERCHANGE-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,INTERCHANGE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,INTERCHANGE-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,INTERCHANGE \?ELS21
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,INTERCHANGE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	NO-ENTRANCE-TO-PARK-F
	PRINTI	"There's no entrance to the "
	EQUAL?	SYEAR,2071 \?ELS5
	PRINTI	"estates"
	JUMP	?CND3
?ELS5:	PRINTI	"park"
?CND3:	PRINTI	" in that direction."
	CRLF	
	RFALSE	


	.FUNCT	HALLEY-PARK-EAST-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	EQUAL?	HERE,HUANG-HALL,AQUARIUM \?ELS8
	PRINT	CANT-GO
	CRLF	
	RFALSE	
?ELS8:	CALL2	SCORE,65
	PRINT	SHOT-ON-SIGHT
	CRLF	
	RFALSE	
?ELS5:	RETURN	HALLEY-PARK-EAST


	.FUNCT	HALLEY-PARK-WEST-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,65
	PRINT	SHOT-ON-SIGHT
	CRLF	
	RFALSE	
?ELS5:	RETURN	HALLEY-PARK-WEST


	.FUNCT	HALLEY-PARK-WEST-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the western half of Halley Park, bordered on the north by a car lot, on the northwest and west by the zoo, and on the south by Halley Drive. A "
	EQUAL?	SYEAR,2061 \?ELS10
	CALL2	SCORE,66
	PRINTI	"dried-up pond bed"
	JUMP	?CND8
?ELS10:	PRINTI	"small duck pond"
?CND8:	PRINTI	" fills the center of the park. Near the zoo entrance is an entrance leading down to the Tubes."
	RTRUE	


	.FUNCT	DUCKS-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"The ducks are some common variety, probably mallards."
?ELS5:	EQUAL?	PRSA,V?KICK,V?TAKE \FALSE
	PRINTR	"The ducks scatter, quacking noisily."


	.FUNCT	DUCK-POND-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	EQUAL?	SYEAR,2061 \?ELS10
	CALL2	SCORE,66
	PRINTR	"It is dry and filled with debris."
?ELS10:	EQUAL?	SYEAR,2041 \?ELS17
	PRINTI	"Many"
	JUMP	?CND15
?ELS17:	PRINTI	"A few"
?CND15:	PRINTR	" ducks are swimming around in the waters of the pond."
?ELS5:	EQUAL?	PRSA,V?LOOK-INSIDE \?ELS27
	EQUAL?	SYEAR,2061 \?ELS32
	CALL	PERFORM,V?EXAMINE,DUCK-POND
	RTRUE	
?ELS32:	PRINTR	"The water is pretty murky, so you can't see much."
?ELS27:	EQUAL?	PRSA,V?THROW,V?PUT \?ELS38
	EQUAL?	PRSI,DUCK-POND \?ELS38
	EQUAL?	SYEAR,2061 \?ELS45
	CALL	PERFORM,V?THROUGH,DUCK-POND
	RTRUE	
?ELS45:	MOVE	PRSO,LOCAL-GLOBALS
	FSET?	PRSO,PLURALBIT \?ELS50
	PRINTI	"They sink"
	JUMP	?CND48
?ELS50:	PRINTI	"It sinks"
?CND48:	PRINTR	" into the depths of the pond."
?ELS38:	EQUAL?	PRSA,V?SWIM,V?THROUGH,V?BOARD \FALSE
	EQUAL?	SYEAR,2061 \?ELS65
	PRINTR	"The pond is just a dried-out patch!"
?ELS65:	PRINTR	"Swimming in public ponds is illegal."


	.FUNCT	HALLEY-PARK-EAST-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2061 \?ELS8
	CALL2	SCORE,67
	PRINTI	"A pedestal in the center of the park, defaced with multicolored graffiti, indicates where a now-missing statue once rose"
	JUMP	?CND6
?ELS8:	PRINTI	"A statue of Francisco Halley, founder of Rockvil, rises in the center of the park"
?CND6:	PRINTI	". To the north is the Aquarium and south of here is boxy Huang Hall. Other exits from the park lead east, northwest, and southwest. The larger section of Halley Park lies to the west."
	RTRUE	


	.FUNCT	HALLEY-STATUE-F
	EQUAL?	SYEAR,2061 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,HALLEY-STATUE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?WHO \?ELS9
	PRINTR	"Francisco Halley is considered the founder of Rockvil."
?ELS9:	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	CALL	PERFORM,V?READ,PEDESTAL
	RTRUE	


	.FUNCT	ZOO-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"The Rockvil Zoological Garden is a moderately sized zoo,"
	EQUAL?	SYEAR,2041,2051 \?CND8
	PRINTI	" but it is well-designed, featuring natural habitats"
?CND8:	PRINTI	" nestled between "
	EQUAL?	SYEAR,2071 \?ELS17
	PRINTI	"barren"
	JUMP	?CND15
?ELS17:	PRINTI	"grassy"
?CND15:	PRINTI	" hills. The main entrance lies to the north"
	EQUAL?	SYEAR,2071 \?ELS30
	CALL2	SCORE,68
	SET	'P-IT-OBJECT,BANNER
	PRINTI	". Affluent estates, recently built on the site of Halley Park, form the southeastern boundary of the zoo.

Several of the nearby cages are empty, with cheaply-made ""EXTINCT"" signs bolted over the animal names and descriptions."
	GRTR?	STIME,840 \FALSE
	LESS?	STIME,900 \FALSE
	CALL2	SCORE,69
	CRLF	
	CRLF	
	PRINTI	"You can hear squeals of pain from the Monkey Cage, where the daily torturing of the apes is going on for the amusement of zoo visitors."
	RTRUE	
?ELS30:	PRINTI	", with other exits leading east and southeast. You can just make out the old elevated interstate, forming the western border of the zoo."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2061 \FALSE
	ZERO?	ZOO-FLAG \FALSE
	RANDOM	100
	LESS?	40,STACK /FALSE
	SET	'ZOO-FLAG,TRUE-VALUE
	CALL2	SCORE,70
	CRLF	
	PRINTR	"At a nearby cage, a group of children are taunting, one might even say torturing, a small animal, using rocks and pointy sticks."


	.FUNCT	CAGES-F
	EQUAL?	SYEAR,2041,2051 \?ELS5
	EQUAL?	HERE,ZOO \?ELS5
	PRINTR	"There are no cages here; only natural habitats."
?ELS5:	EQUAL?	PRSA,V?THROUGH \?ELS11
	PRINTR	"The cages are all locked, of course."
?ELS11:	EQUAL?	PRSA,V?EXAMINE \?ELS15
	EQUAL?	SYEAR,2071 \?ELS15
	PRINTR	"Several of the cages are empty."
?ELS15:	EQUAL?	PRSA,V?LOOK-INSIDE \?ELS21
	EQUAL?	SYEAR,2071 \?ELS26
	CALL	PERFORM,V?EXAMINE,CAGES
	RTRUE	
?ELS26:	CALL	PERFORM,V?EXAMINE,ANIMAL
	RTRUE	
?ELS21:	EQUAL?	PRSA,V?UNLOCK,V?OPEN \FALSE
	PRINTR	"Surely you realize that such an action would wreak civic havoc! Fortunately, the cages are securely bolted."


	.FUNCT	ANIMAL-F
	EQUAL?	HERE,ROCKVIL-STADIUM \?ELS5
	EQUAL?	SYEAR,2071 /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,ANIMAL
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?TOUCH \?ELS9
	PRINTR	"You can't get close enough to the animals to pet them."
?ELS9:	EQUAL?	PRSA,V?FEED \?ELS13
	PRINTI	"You pick up a few stray bits of popcorn off the ground and toss it into several of the cages. "
	EQUAL?	SYEAR,2041,2051 \?ELS20
	PRINTR	"The animals look well fed, however, and ignore the popcorn."
?ELS20:	PRINTR	"The animals, which look starved, greedily wolf down the pitifully few kernels."
?ELS13:	EQUAL?	PRSA,V?GIVE \?ELS28
	FSET?	PRSO,EATBIT \?ELS28
	CALL	PERFORM,V?FEED,ANIMAL
	RTRUE	
?ELS28:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The animals look "
	EQUAL?	SYEAR,2061 \?ELS37
	PRINTI	"thin and hungry"
	JUMP	?CND35
?ELS37:	EQUAL?	SYEAR,2071 \?ELS41
	CALL2	SCORE,69
	PRINTI	"starved and beaten, particularly the apes"
	JUMP	?CND35
?ELS41:	EQUAL?	SYEAR,2061 \?ELS48
	PRINTI	"reasonably"
	JUMP	?CND46
?ELS48:	PRINTI	"happy and"
?CND46:	PRINTI	" well-fed"
?CND35:	PRINTR	"."


	.FUNCT	ZOO-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,ZOO \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,ZOO-ENTRANCE \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,ZOO \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,ZOO \?ELS34
	CALL1	V-LOOK
	RSTACK	
?ELS34:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	BANNER-F
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	CALL2	SCORE,69
	PRINTR	"""Monkey Torturing -- 2:00pm Daily at the Monkey Cage"""


	.FUNCT	SKYCAR-LOT-4-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a huge parking lot for "
	EQUAL?	SYEAR,2071 /?CND8
	PRINTI	"Halley Park to the south and southeast, "
?CND8:	PRINTI	"the Aquarium to the east and the zoo to the west. The exit to the street is northeast"
	EQUAL?	SYEAR,2071 \?CND15
	PRINTI	". To the south and southeast are gates leading into "
	PRINTD	HALLEY-ESTATES-OBJECT
?CND15:	PRINTI	"."
	RTRUE	


	.FUNCT	AQUARIUM-AND-PARK-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"South of this intersection, Park Street descends into a tunnel under "
	EQUAL?	SYEAR,2071 \?ELS10
	CALL2	SCORE,61
	PRINTI	"the Halley Park estates"
	JUMP	?CND8
?ELS10:	PRINTI	"Halley Park"
?CND8:	PRINTI	". The Aquarium can be entered on the southeast corner, and a skycar service center occupies the northwest corner. To the southwest is a large car lot, and to the northeast, amidst a small car lot, is a "
	EQUAL?	SYEAR,2071 \?ELS23
	PRINTI	"dingy-looking bar."
	RTRUE	
?ELS23:	PRINTI	"fast food restaurant."
	RTRUE	


	.FUNCT	AQUARIUM-ENTER-F
	EQUAL?	SYEAR,2041 \?ELS9
	GRTR?	STIME,600 \?ELS9
	LESS?	STIME,1320 /?THN6
?ELS9:	EQUAL?	SYEAR,2051 \?ELS11
	GRTR?	STIME,600 \?ELS11
	LESS?	STIME,1200 /?THN6
?ELS11:	EQUAL?	SYEAR,2061 \?ELS13
	GRTR?	STIME,660 \?ELS13
	LESS?	STIME,1080 /?THN6
?ELS13:	EQUAL?	SYEAR,2071 \?ELS5
	GRTR?	STIME,720 \?ELS5
	LESS?	STIME,1020 \?ELS5
?THN6:	RETURN	AQUARIUM
?ELS5:	CALL2	CLOSED-PRINT,STR?117
	RFALSE	


	.FUNCT	AQUARIUM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,HALLEY-PARK-EAST \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	EQUAL?	HERE,SKYCAR-LOT-4 \?ELS12
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS12:	EQUAL?	HERE,AQUARIUM-AND-PARK \?ELS14
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS14:	EQUAL?	HERE,AQUARIUM-AND-KENNEDY \?ELS16
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,AQUARIUM-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	EQUAL?	HERE,AQUARIUM \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \?ELS33
	EQUAL?	HERE,AQUARIUM \?ELS33
	CALL1	V-LOOK
	RSTACK	
?ELS33:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	EQUAL?	HERE,AQUARIUM \FALSE
	CALL2	SCORE,137
	PRINT	AQUARIUM-SMELL
	CRLF	
	RTRUE	


	.FUNCT	AQUARIUM-F,RARG,TIME
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"A ramp winds around a huge central tank, and smaller exhibits fill the outside walls. Exits lead "
	EQUAL?	SYEAR,2071 /?CND8
	PRINTI	"south, "
?CND8:	PRINTI	"west, northwest, and northeast."
	EQUAL?	SYEAR,2071 \FALSE
	PRINTI	" "
	PRINT	AQUARIUM-SMELL
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2041 \?ELS26
	SET	'TIME,1320
	JUMP	?CND24
?ELS26:	EQUAL?	SYEAR,2051 \?ELS28
	SET	'TIME,1200
	JUMP	?CND24
?ELS28:	EQUAL?	SYEAR,2061 \?ELS30
	SET	'TIME,1080
	JUMP	?CND24
?ELS30:	SET	'TIME,1020
?CND24:	CALL	CLOSING-TIME,TIME,STR?118,STR?18,AQUARIUM-AND-KENNEDY
	RSTACK	


	.FUNCT	RAMP-MOVEMENT-F
	PRINTI	"This brings you to a different part of the tank, although the view inside is pretty much the same."
	CRLF	
	RFALSE	


	.FUNCT	TANK-F
	EQUAL?	PRSA,V?LOOK-INSIDE \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"The water is crystal clear, sparkling with "
	GRTR?	LIGHT-LEVEL,2 \?ELS15
	PRINTI	"sun"
	JUMP	?CND13
?ELS15:	PRINTI	"artificial "
?CND13:	PRINTI	"light from the surface of the water several stories above you. As you peer into the tank, a "
	RANDOM	100
	LESS?	25,STACK /?ELS26
	PRINTI	"manta ray"
	JUMP	?CND24
?ELS26:	RANDOM	100
	LESS?	50,STACK /?ELS30
	PRINTI	"sea turtle"
	JUMP	?CND24
?ELS30:	PRINTI	"large, graceful fish"
?CND24:	PRINTR	" swims into view and then vanishes among the rocks and greenery at the bottom of the tank."
?ELS10:	CALL2	SCORE,71
	PRINTR	"The water is murky and the walls of the tank need cleaning. You can only make out vague shapes moving about inside the tank."
?ELS5:	EQUAL?	PRSA,V?WASH \?ELS44
	EQUAL?	SYEAR,2041 /?ELS44
	PRINTR	"You don't have the access or the equipment."
?ELS44:	EQUAL?	PRSA,V?SWIM,V?BOARD,V?THROUGH \FALSE
	PRINTR	"There's no visible entrance to the tank."


	.FUNCT	FISH-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTR	"The fish are large and graceful."
?ELS10:	PRINTR	"Although the central tank is too murky to see into, you can see some fish in the smaller side exhibits. They are small and of average appearance."
?ELS5:	EQUAL?	PRSA,V?TOUCH,V?EAT \FALSE
	PRINTR	"The fish are inside a tank."


	.FUNCT	RAMP-F
	EQUAL?	PRSA,V?CLIMB-DOWN,V?CLIMB-FOO,V?CLIMB-UP \FALSE
	CALL2	DO-WALK,P?UP
	RSTACK	


	.FUNCT	SERVICE-STATION-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,AQUARIUM-AND-PARK \?ELS10
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,SERVICE-STATION-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,SERVICE-STATION \?ELS21
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,SERVICE-STATION \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	PRINTI	"The "
	PRINTD	SERVICE-STATION-OBJECT
	PRINTR	" is unusually large, especially for one so close to the city."


	.FUNCT	BURGER-MEISTER-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,BURGER-MEISTER
	RFALSE	
?ELS5:	RETURN	BURGER-MEISTER


	.FUNCT	BURGER-MEISTER-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2071 \?ELS8
	PUTP	BURGER-MEISTER,P?SDESC,STR?120
	JUMP	?CND6
?ELS8:	EQUAL?	SYEAR,2061 \?ELS10
	PUTP	BURGER-MEISTER,P?SDESC,STR?121
	JUMP	?CND6
?ELS10:	PUTP	BURGER-MEISTER,P?SDESC,STR?122
?CND6:	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?54
	MOVE	BEER,LOCAL-GLOBALS
	MOVE	BAR-STOOL,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS14
	EQUAL?	SYEAR,2071 \?ELS19
	CALL2	SCORE,72
	PRINTI	"You are in a seedy pub, filled with smoke and smelling of urine. A fast-food counter has been converted into the bar"
	PRINT	STOOL-DESC
	PRINTI	"The exit is southwest."
	RTRUE	
?ELS19:	PRINTI	"This is a fast food restaurant serving "
	CALL1	FAST-FOOD-MENU
	PRINTI	". Stools provide ample seating. The only way out is southwest."
	RTRUE	
?ELS14:	EQUAL?	RARG,M-END \FALSE
	CALL2	CURFEW-CLOSE,AQUARIUM-AND-PARK
	RSTACK	


	.FUNCT	BURGER-MEISTER-EXIT-F
	CALL2	HELD?,BEER
	ZERO?	STACK /?ELS5
	PRINT	BARTENDER-YELLS
	CRLF	
	RFALSE	
?ELS5:	RETURN	AQUARIUM-AND-PARK


	.FUNCT	ZOO-ENTRANCE-F,RARG
	EQUAL?	SYEAR,2061 \FALSE
	EQUAL?	RARG,M-END \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	GETP	ZOO-ENTRANCE,P?SCENE
	LESS?	STACK,101 \FALSE
	PUTP	ZOO-ENTRANCE,P?SCENE,101
	CALL2	SCORE,74
	CRLF	
	PRINTR	"Down the block, you can see two youths, wearing Church of God's Word pendants, harassing a middle-aged Hassidic Jew."


	.FUNCT	STADIUM-LOT-A-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	CALL	STADIUM-LOT-DESC,STR?50,STR?49
	RSTACK	


	.FUNCT	STADIUM-LOT-DESC,IN-DIR,OUT-DIR
	PRINTI	"This is a parking lot for Rockvil Municipal Stadium, which can be entered to the "
	PRINT	IN-DIR
	PRINTI	". You can leave the lot to the "
	PRINT	OUT-DIR
	PRINTI	"."
	RTRUE	


	.FUNCT	STADIUM-LOT-B-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	CALL	STADIUM-LOT-DESC,STR?129,STR?130
	RSTACK	


	.FUNCT	WATER-TOWER-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Park Street splits for a block as it climbs Lincoln Hill and passes around a "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"shiny"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2061 \?ELS14
	CALL2	SCORE,130
	PRINTI	"corroding"
	JUMP	?CND8
?ELS14:	EQUAL?	SYEAR,2071 \?CND8
	CALL2	SCORE,131
	PRINTI	"decrepit"
?CND8:	PRINTI	" plastalloy "
	PRINTD	WATER-TOWER-OBJECT
	PRINTI	". The road continues to curve, heading west toward the highway and southeast toward the city. There's a breathtaking view of the reservoir from this hilltop, stretching off to the east. To the southwest you can enter a stadium parking lot. To the north is the "
	PRINTD	ROCKVIL-REFORMATORY
	PRINTI	"."
	RTRUE	


	.FUNCT	WATER-TOWER-OBJECT-F
	EQUAL?	PRSA,V?THROUGH \?ELS5
	PRINTR	"There's no visible entrance to the tower."
?ELS5:	EQUAL?	PRSA,V?CLIMB-UP,V?CLIMB-FOO \FALSE
	PRINTR	"There's no way to scale the tower."


	.FUNCT	ROCKVIL-REFORMATORY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"The Park Street Prison was built during the twentieth century. It was expanded, modernized, and renamed the "
	PRINTD	ROCKVIL-REFORMATORY
	PRINTI	" around "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"ten"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	PRINTI	"twenty"
	JUMP	?CND10
?ELS16:	EQUAL?	SYEAR,2061 \?ELS20
	PRINTI	"thirty"
	JUMP	?CND10
?ELS20:	PRINTI	"forty"
?CND10:	PRINTI	" years ago. "
	CALL	PERFORM,V?EXAMINE,WALLS
	CRLF	
	PRINTI	"From what you've heard, the prison is "
	EQUAL?	SYEAR,2041 \?ELS33
	PRINTI	"overcrowded, because today's stricter law enforcement and mandatory sentencing regulations are putting people into the penal system even faster than the military draft can remove them"
	JUMP	?CND31
?ELS33:	EQUAL?	SYEAR,2051 \?ELS37
	CALL2	SCORE,75
	PRINTI	"unbelievably overcrowded, with brutally unsanitary conditions"
	JUMP	?CND31
?ELS37:	EQUAL?	SYEAR,2061 \?ELS41
	CALL2	SCORE,76
	PRINTI	"much less crowded than it used to be, now that the death penalty has been extended to cover most crimes"
	JUMP	?CND31
?ELS41:	EQUAL?	SYEAR,2071 \?CND31
	CALL2	SCORE,77
	PRINTI	"almost completely unused these days, with most criminals going to the execution matches. The few remaining prisoners are just important Enemies of the Church, former Members who have fallen out of favor with the Leadership"
?CND31:	PRINTI	". Park Street is south of here."
	RTRUE	


	.FUNCT	JAIL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,WATER-TOWER,ROCKVIL-REFORMATORY \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	EQUAL?	HERE,POLICE-STATION \?ELS12
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,WATER-TOWER,POLICE-STATION \?ELS23
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS23:	EQUAL?	HERE,ROCKVIL-REFORMATORY \?ELS27
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS27:	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS18:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?ELS31
	EQUAL?	HERE,POLICE-STATION \?ELS31
	EQUAL?	SYEAR,2061 \?ELS38
	PRINTR	"You can't tell much about the cells from here."
?ELS38:	PRINTI	"From here, the jail cells look pretty "
	EQUAL?	SYEAR,2071 \?ELS47
	PRINTI	"empty"
	JUMP	?CND45
?ELS47:	PRINTI	"crowded"
?CND45:	PRINTR	"."
?ELS31:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,JAIL-CELL,ROCKVIL-REFORMATORY \?ELS62
	CALL1	V-LOOK
	RSTACK	
?ELS62:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	STADIUM-LOT-C-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	CALL	STADIUM-LOT-DESC,STR?133,STR?134
	RSTACK	


	.FUNCT	ROCKVIL-STADIUM-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	FSET	STADIUM-STANDS,FURNITUREBIT
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2061,2071 \?ELS10
	GRTR?	STIME,1200 /?THN13
	LESS?	STIME,480 \?ELS10
?THN13:	PRINTI	"The stadium is dark and deserted"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2071 \?ELS18
	CALL2	SCORE,79
	PRINTI	"The stadium is currently packed by crowds who've come for the weekly Execution Matches. Convicted criminals are matched, or rather mismatched, against laser-armed robotoids and various wild animals. The mobs in the stands roar each time a convict is gored. The field is literally soaked with blood, and there are numerous fistfights throughout the stands"
	JUMP	?CND8
?ELS18:	EQUAL?	SYEAR,2061 \?ELS22
	CALL2	SCORE,78
	PRINTI	"Neither the Bobcats nor the Rockets are playing today; instead, the stadium is being used for the public execution of criminals. Prisoners stand in a dock while the announcer reads their crimes. They are then led into a screened-off area where technicians administer the fatal injection. The stands are sparsely filled"
	JUMP	?CND8
?ELS22:	PRINTI	"Rockvil Municipal Stadium is a multipurpose sporting event facility, home of both baseball's Rockvil Bobcats and soccer's Rockvil Rockets"
?CND8:	PRINTI	". Stadium exits lie to the south, east, and northeast. A "
	EQUAL?	SYEAR,2071 \?CND31
	PRINTI	"closed "
?CND31:	PRINTD	TUBE-STATION
	PRINTI	" lies directly under the stadium."
	RTRUE	


	.FUNCT	STADIUM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,ROCKVIL-STADIUM \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,STADIUM-LOT-A \?ELS14
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS14:	EQUAL?	HERE,STADIUM-LOT-B \?ELS16
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS16:	EQUAL?	HERE,STADIUM-LOT-C \?ELS18
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,STADIUM-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	EQUAL?	HERE,ROCKVIL-STADIUM \?ELS27
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS27:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \?ELS33
	EQUAL?	HERE,ROCKVIL-STADIUM \?ELS38
	CALL1	V-LOOK
	RSTACK	
?ELS38:	EQUAL?	HERE,TUBE-AT-STADIUM \?ELS40
	PRINTR	"You can't see the stadium from down here!"
?ELS40:	PRINTR	"The stadium is a monolithic plasticrete park with tall, narrow, arched entrances."
?ELS33:	EQUAL?	PRSA,V?SIT,V?BOARD \FALSE
	EQUAL?	HERE,ROCKVIL-STADIUM \FALSE
	CALL	PERFORM,V?SIT,STADIUM-STANDS
	RTRUE	


	.FUNCT	ATHLETIC-FIELD-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2061,2071 \?ELS5
	EQUAL?	LIGHT-LEVEL,3 \?ELS5
	CALL	QUEUE,I-ATHLETIC-FIELD,1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is an outdoor athletic field for "
	EQUAL?	SYEAR,2061,2071 \?ELS14
	PRINTI	"the Vincent School"
	JUMP	?CND12
?ELS14:	PRINTI	"Rockvil High School"
?CND12:	PRINTI	", with facilities for baseball and soccer, as well as track and field events. Bleachers line one side of the field, and there are exits in the fence to the northeast and northwest."
	RTRUE	


	.FUNCT	STONES-F
	EQUAL?	PRSA,V?TAKE \FALSE
	MOVE	STONES,PLAYER
	PRINTR	"You pick up a stone."


	.FUNCT	I-ATHLETIC-FIELD
	EQUAL?	HERE,ATHLETIC-FIELD /?ELS5
	SET	'STONING-FLAG,FALSE-VALUE
	RFALSE	
?ELS5:	EQUAL?	SYEAR,2061 \?ELS7
	CALL2	SCORE,80
	CRLF	
	PRINTR	"Some of the schoolchildren notice the stranger who has wandered onto their field, and begin laughing at you, plucking at your ratty clothing."
?ELS7:	EQUAL?	SYEAR,2071 \?ELS11
	ZERO?	STONING-FLAG \?ELS11
	SET	'STONING-FLAG,TRUE-VALUE
	CALL	QUEUE,I-ATHLETIC-FIELD,1
	CRLF	
	PRINTR	"Several of the larger children gather around you menacingly. ""We don't allow animals onto Church land, pops,"" one of them says, poking you sharply in the chest with his fingers. Some of the others begin picking up stones."
?ELS11:	CALL2	SCORE,81
	CALL2	JIGS-UP,STR?137
	RSTACK	


	.FUNCT	RIVER-AND-KENNEDY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"River Street, after paralleling Kennedy Street across the city, curves westward and intersects it here. Kennedy ends at this point, since the reservoir forms the northern border of River Street. "
	EQUAL?	SYEAR,2061,2071 \?ELS10
	PRINTI	"The Vincent"
	JUMP	?CND8
?ELS10:	PRINTI	"Rockvil High"
?CND8:	PRINTI	" School is on the southeast corner, and its athletic field is southwest of here."
	RTRUE	


	.FUNCT	ROCKVIL-HIGH-ENTER-F
	LESS?	STIME,420 /?THN6
	GRTR?	STIME,1020 \?ELS5
?THN6:	CALL2	CLOSED-PRINT,STR?138
	RFALSE	
?ELS5:	RETURN	ROCKVIL-HIGH


	.FUNCT	ROCKVIL-HIGH-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041,2051 \?ELS10
	PUTP	ROCKVIL-HIGH,P?SDESC,STR?139
	RTRUE	
?ELS10:	PUTP	ROCKVIL-HIGH,P?SDESC,STR?140
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS14
	EQUAL?	SYEAR,2041,2051 \?ELS17
	PRINTI	"The oldest secondary school in the city, Rockvil High School moved to its current location and building approximately "
	EQUAL?	SYEAR,2041 \?ELS22
	PRINTI	"thirty"
	JUMP	?CND20
?ELS22:	PRINTI	"forty"
?CND20:	PRINTI	" years ago"
	JUMP	?CND15
?ELS17:	CALL2	SCORE,82
	PRINTI	"The old Rockvil High building was purchased by the Church of God's Word after the public school system shut down in 2058"
?CND15:	PRINTI	". The building has exits at its eastern and northwestern corners."
	RTRUE	
?ELS14:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1020,STR?141,STR?142,RIVER-AND-KENNEDY
	RSTACK	


	.FUNCT	AQUARIUM-AND-KENNEDY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are at a perpendicular intersection formed by the north-south Kennedy Street and the east-west Aquarium Drive. "
	PRINT	CHUN-DESC
	PRINTI	" On the other corners, scanning clockwise, are a dental school, the Aquarium, and a bank."
	RTRUE	


	.FUNCT	CHUN-BUILDING-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	IN?	CHUN-BUILDING,HERE \?ELS5
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINT	CHUN-DESC
	CRLF	
	RTRUE	


	.FUNCT	BANK-ENTER-F
	GRTR?	STIME,480 \?ELS5
	LESS?	STIME,960 \?ELS5
	RETURN	BANK
?ELS5:	CALL2	CLOSED-PRINT,STR?143
	RFALSE	


	.FUNCT	BANK-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?144
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"This is the main office of the First Continent Bank, "
	EQUAL?	SYEAR,2071 \?ELS12
	CALL2	SCORE,83
	PRINTI	"a Church holding and the only"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2061 \?ELS16
	CALL2	SCORE,84
	PRINTI	"the only"
	JUMP	?CND10
?ELS16:	PRINTI	"the largest"
?CND10:	PRINTI	" bank in Rockvil"
	EQUAL?	SYEAR,2061 \?CND25
	PRINTI	", following last year's forced merger"
?CND25:	PRINTI	". The front door is on the southeast wall, opposite the tellers."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,960,STR?145,STR?146,AQUARIUM-AND-KENNEDY
	RSTACK	


	.FUNCT	BANK-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,BANK \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS16
	EQUAL?	HERE,BANK \?ELS21
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,BANK \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	PRINTR	"It's the main branch of the First Continent Bank."


	.FUNCT	DENTAL-SCHOOL-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"The Mortimer "
	PRINTD	DENTAL-SCHOOL
	PRINTI	" is a fairly small"
	EQUAL?	SYEAR,2041 \?CND10
	PRINTI	", fairly new"
?CND10:	PRINTI	" school"
	EQUAL?	SYEAR,2041,2051 \?ELS19
	PRINTI	", but has been gaining an excellent reputation for dental training"
	JUMP	?CND17
?ELS19:	EQUAL?	SYEAR,2071 \?CND17
	PRINTI	" with a fine reputation, and has remained amazingly unchanged by the turmoil of the last few decades"
?CND17:	PRINTI	". The way out is to the northwest."
	RTRUE	


	.FUNCT	PARK-ENTRANCE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2071 \?ELS10
	PUTP	PARK-ENTRANCE,P?SDESC,STR?148
	RTRUE	
?ELS10:	PUTP	PARK-ENTRANCE,P?SDESC,STR?149
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are on Kennedy Street near an entrance to "
	EQUAL?	SYEAR,2071 \?CND17
	CALL2	SCORE,61
	PRINTI	"the estates for the wealthy, built on what was formerly "
?CND17:	PRINTI	"Halley Park, to the west. On the east side of the street is a large"
	EQUAL?	SYEAR,2071 \?CND24
	PRINTI	", abandoned"
?CND24:	PRINTI	" car lot. Kennedy continues to the north and south."
	RTRUE	


	.FUNCT	HALLEY-ESTATES-OBJECT-F
	EQUAL?	SYEAR,2071 /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,HALLEY-ESTATES-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,PARK-ENTRANCE \?ELS14
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS14:	EQUAL?	HERE,HALLEY-AND-PARK \?ELS16
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS16:	EQUAL?	HERE,HALLEY-AND-UNIVERSITY \?ELS18
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,HALLEY-ESTATES-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS22
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"You can't see over the high brick wall that surrounds the estates."


	.FUNCT	SKYCAR-LOT-5-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This parking lot is "
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	"unused, and weeds are beginning to poke through the asphalt. You can reach"
	JUMP	?CND8
?ELS10:	PRINTI	"owned by the First Methodist Church, although it is frequently rented to organizations using nearby Huang Hall. The parking lot has exits to"
?CND8:	PRINTI	" the street to the east and west. "
	EQUAL?	SYEAR,2071 \?ELS23
	PRINTI	"A vacant lot is north of here."
	RTRUE	
?ELS23:	PRINTI	"You can enter the church to the north."
	RTRUE	


	.FUNCT	FIRST-METHODIST-CHURCH-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	CHURCH-OFFICIAL,LOCAL-GLOBALS
	EQUAL?	SYEAR,2071 \?ELS10
	PUTP	FIRST-METHODIST-CHURCH,P?SDESC,STR?89
	RTRUE	
?ELS10:	PUTP	FIRST-METHODIST-CHURCH,P?SDESC,STR?150
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS14
	EQUAL?	SYEAR,2071 \?ELS19
	CALL2	SCORE,85
	PRINTI	"This is a vacant lot where a Protestant church once stood, until it was torched a few years ago by a mob of serfs aroused by a Church revival. You can reach an overgrown car lot to the south, or the street to the northeast."
	RTRUE	
?ELS19:	EQUAL?	SYEAR,2041 \?ELS26
	PRINTI	"This is a new building which"
	JUMP	?CND24
?ELS26:	PRINTI	"This building"
?CND24:	PRINTI	" exhibits both the best and worst features of twenty-first century neoclassical architecture. The congregation must "
	EQUAL?	SYEAR,2061 \?ELS37
	PRINTI	"have once been"
	JUMP	?CND35
?ELS37:	PRINTI	"be"
?CND35:	PRINTI	" very large, judging by the size of the car lot to the south. The main entrance to the church is at the northeast."
	RTRUE	
?ELS14:	EQUAL?	RARG,M-END \FALSE
	CALL1	ELDER-MOVE
	RSTACK	


	.FUNCT	ELDER-MOVE
	EQUAL?	SYEAR,2041,2051 \?ELS5
	GRTR?	STIME,480 \?ELS5
	LESS?	STIME,1200 \?ELS5
	FSET?	CHURCH-OFFICIAL,TOUCHBIT /?ELS5
	IN?	CHURCH-OFFICIAL,HERE /?ELS5
	MOVE	CHURCH-OFFICIAL,HERE
	CRLF	
	PRINTR	"You suddenly notice a church elder, pacing around at the other end of the building."
?ELS5:	IN?	CHURCH-OFFICIAL,HERE \FALSE
	GRTR?	STIME,1200 \FALSE
	MOVE	CHURCH-OFFICIAL,LOCAL-GLOBALS
	CRLF	
	PRINTR	"The church official wanders off."


	.FUNCT	CHURCH-OFFICIAL-F
	EQUAL?	PRSA,V?TELL /?THN6
	EQUAL?	CHURCH-OFFICIAL,WINNER \FALSE
?THN6:	SET	'PRSO,CHURCH-OFFICIAL
	FSET	CHURCH-OFFICIAL,TOUCHBIT
	CALL1	BRIEF-CHAT
	EQUAL?	SYEAR,2041 \?ELS10
	ZERO?	RECORDING /?CND11
	PUT	RECORDING-TABLE,12,1
?CND11:	PRINTI	"smiles and comments on how happy he is about the recent increase in church attendance, which he attributes to an improving national moral climate"
	PRINT	OFFICIAL-LEAVES
	CRLF	
	JUMP	?CND8
?ELS10:	CALL2	SCORE,136
	PRINTI	"looks worried and complains about the growth of the Church of God's Word, and a perceived erosion of religious tolerance. Suddenly he notices the time, mumbles something about a wedding, and rushes off."
	CRLF	
?CND8:	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	BRIEF-CHAT
	SET	'ELAPSED-TIME,8
	SET	'FOLLOW-FLAG,9
	CALL	QUEUE,I-UNFOLLOW,10
	MOVE	PRSO,LOCAL-GLOBALS
	PRINTI	"You have a brief chat with the "
	PRINTD	PRSO
	PRINTI	", who "
	RTRUE	


	.FUNCT	BODANSKI-SQUARE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a large plaza formed by the intersection of Bodanski Boulevard from the east, Centre Street from the southwest, and River Street from the north and south. There is a"
	EQUAL?	SYEAR,2071 \?CND8
	PRINTI	"n abandoned"
?CND8:	PRINTI	" car lot on the western side of the square. On the northeastern corner is a restaurant, and the "
	EQUAL?	SYEAR,2041 \?ELS17
	PRINTI	"old "
	PRINTD	TRAIN-STATION-OBJECT
	JUMP	?CND15
?ELS17:	PRINTI	"Church of God's Word"
?CND15:	PRINTI	" can be entered to the southeast. A "
	EQUAL?	SYEAR,2071 \?ELS30
	PRINTI	"sealed-off stairway indicates a former entrance to the Tubes."
	RTRUE	
?ELS30:	PRINTI	"covered stairway leads down to the Tubes."
	RTRUE	


	.FUNCT	LAMP-POST-F
	EQUAL?	PRSA,V?CLIMB-UP,V?CLIMB-FOO \?ELS5
	PRINTR	"The lamp post is too smooth to climb."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	SYEAR,2041,2051 \FALSE
	PRINTI	"There's a "
	PRINTD	NEWSPAPER-DISPENSER
	PRINTR	" chained to it."


	.FUNCT	NEWSPAPER-DISPENSER-F,RARG
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTI	"The box dispenses copies of The Rockie Times, a regional weekly newspaper"
	EQUAL?	SYEAR,2051 \?CND8
	CALL2	SCORE,86
	PRINTI	", and one of the last remaining newspapers in the country"
?CND8:	PRINTI	". There is a slot on top of the dispenser where you can insert your "
	PRINTD	CREDIT-CARD
	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?OPEN \?ELS18
	PRINTR	"The dispenser is locked. The only way to get a paper out is by putting your card in the slot."
?ELS18:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSO,CREDIT-CARD \FALSE
	CALL	PERFORM,V?PUT,CREDIT-CARD,SLOT
	RTRUE	


	.FUNCT	NEWSPAPER-F
	EQUAL?	PRSA,V?TAKE,V?READ \?ELS5
	FSET?	NEWSPAPER,TRYTAKEBIT \?ELS5
	PRINTR	"It's inside the dispenser!"
?ELS5:	EQUAL?	PRSA,V?READ \?ELS11
	EQUAL?	SYEAR,2041 \?ELS16
	ZERO?	RECORDING /?CND17
	PUT	RECORDING-TABLE,6,1
?CND17:	SET	'ELAPSED-TIME,10
	PRINTR	"The headline story in the news section is about the Index of Leading Economic Indicators, which are up a stunning 9.7% over last month, yet another indication of the economy's robust performance. Related stories discuss the unemployment rate, which is at the lowest level in almost thirty years, and commercial and housing construction, which are at an all-time high.

Another major story covers President Ryder's speech for the Distinguished Lecturer Series of the Border Security Force Academy. In his address, the President called the '40s a ""decade of new hope,"" and attributed much of that new hope to the work of the BSF, sending a signal to the entire world that the USNA ""won't be pushed around by the biggest dictatorship or the smallest band of terrorist murderers.""

On one of the inside pages, an in-depth report on crime reveals that, although the overall crime rate has dropped only 4% over the last decade, public perception is that crime has fallen much further. The report attributes this perception to three points: Violent crime has decreased much faster than other types of crime, and is down by 15% from ten years ago. Crime in the schools, which has always gotten the most publicity, has dropped by 40%. Most importantly, offenders are getting harsher sentences, as opposed to the old days of getting off on technicalities, low bail, and easy parole.

Other stories in the news section deal with the construction of a new InfoTech orbiting factory, deregulation of the medicinal drug industry, the war in Turkey, and plans for a lunar mining operation. An editorial calls for lowering draft board requirements in order to ease prison overcrowding."
?ELS16:	EQUAL?	SYEAR,2051 \?ELS24
	SET	'ELAPSED-TIME,5
	CALL2	SCORE,87
	PRINTR	"The newspaper is extremely thin, and the news section is the thinnest section of all. The lead story deals with the drop in USNA farm output, the first drop in twenty years. A spokesman for the Department of Agriculture attributed the decline to a year of unseasonable cold and low rainfall, and predicted that the coming year would more than make up for it. An alternative viewpoint was expressed by the head of the American Association of Agribusiness, who claimed the drop was caused by overfarming of lands, depletion of aquifers, and an increase in acid rain, and called for a massive government program to save the country's farms.

Other stories cover the Ryder administration's support for a strip-mining bill; the announcement by Huang Laboratories that without subsidized shuttle flights it would be forced to close GEO-7, the last remaining space factory; committee hearings on euthanasia legislation; the decision by a Church of God's Word priest in Arizona to run for a Senate seat; and a poll showing President Ryder enjoying a 71% approval rating."
?ELS24:	PRINTR	"The headline story is about a newly released study which indicates that the average life expectancy for both sexes has now passed one hundred years, and success in the development of regeneratives should send that figure even higher. Despite the dropping mortality rate, global population remains stable at just under two billion, with offworlding now running at a staggering seven million people annually.

To celebrate next month's special twentieth anniversary Disarmament Day, the World Council has passed a bill authorizing fireworks displays in each of the former capital cities of the twenty-two former nuclear powers. The fireworks displays, by Aerialist designer Jean M'gomo, will feature disarmament themes, and will be the largest display of pyrotechnic art in this century.

A story on an inside page catches your eye: ""Perry Simm, Noted Author, To Join Crew of Silver Dove,"" reads the headline. ""Perry Simm, author and poet, recipient of the 2089 Mexicana Prize, has been selected from nearly a thousand applicants to be the resident author aboard the Silver Dove, the space colony that is currently being equipped for mankind's first interstellar journey, a trip expected to last a dozen generations."""
?ELS11:	EQUAL?	PRSA,V?BUY \?ELS32
	EQUAL?	HERE,BODANSKI-SQUARE \?ELS37
	EQUAL?	SYEAR,2041,2051 \?ELS37
	FSET?	NEWSPAPER,TRYTAKEBIT \?ELS44
	CALL	VENDING,NEWSPAPER-DISPENSER,NEWSPAPER,1
	RSTACK	
?ELS44:	PRINTR	"A red empty light flashes for a second."
?ELS37:	EQUAL?	HERE,DRUG-STORE \?ELS50
	PRINTR	"They seem to be sold out."
?ELS50:	CALL2	CANT-BUY,NEWSPAPER
	RSTACK	
?ELS32:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,NEWSPAPER-DISPENSER \FALSE
	PRINTR	"You can't put the paper back into the dispenser!"


	.FUNCT	SIMONS-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,RESTAURANT-OBJECT
	RFALSE	
?ELS5:	RETURN	SIMONS


	.FUNCT	SIMONS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	SET	'MEAL-STATUS,1
	SET	'MAITRE-COUNTER,0
	SET	'WAITER-COUNTER,0
	MOVE	SPEAR-CARRIER,HERE
	CALL2	INT,I-MEAL
	PUT	STACK,0,0
	MOVE	RESTAURANT-TABLE,HERE
	MOVE	CHAIR,HERE
	IN?	CREDIT-CARD,SPEAR-CARRIER \?CND6
	MOVE	CREDIT-CARD,LOCAL-GLOBALS
?CND6:	PUTP	SPEAR-CARRIER,P?SDESC,STR?80
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL2	RESTAURANT-CLOSES,BODANSKI-SQUARE
	ZERO?	STACK \TRUE
	CALL1	PARTY-OF-ONE
	ZERO?	STACK \TRUE
	RFALSE


	.FUNCT	AQUARIUM-AND-RIVER-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Aquarium Drive from the west ends at this ""T"" intersection with River Street. There's a modern theatre building to the northwest, and an older one to the east. On the southwest corner is a"
	EQUAL?	SYEAR,2071 \?ELS12
	PRINTI	"n empty lot."
	RTRUE	
?ELS12:	PRINTI	" church."
	RTRUE	


	.FUNCT	PICKFORD-THEATRE-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,PICKFORD-THEATRE \?ELS10
	PRINT	NO-TICKET
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PICKFORD-THEATRE-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,PICKFORD-THEATRE \?ELS21
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,PICKFORD-THEATRE \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	PRINTR	"The Pickford is a fine, old theatre."


	.FUNCT	PICKFORD-THEATRE-F,RARG
	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2061,2071 \FALSE
	GRTR?	STIME,1160 \FALSE
	LESS?	STIME,1200 \FALSE
	CRLF	
	PRINTI	"Skycar after skycar settles onto the sidewalk outside the theatre, and extravagantly dressed couples walk elegantly into the theatre for the evening's performance"
	EQUAL?	SYEAR,2071 \?CND10
	RANDOM	100
	LESS?	50,STACK /?CND10
	ZERO?	BEGGAR-FLAG \?CND10
	SET	'BEGGAR-FLAG,TRUE-VALUE
	CALL2	SCORE,57
	PRINTI	". A beggar approaches one of the wealthy couples, but before he can even get close to them, some theatre guards grab him, beat him viciously, and hurl him bleeding and dazed into the gutter outside the theatre"
?CND10:	PRINTR	"."


	.FUNCT	AIRPORTWAY-AND-RIVER-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"The road east to the airport begins here. River Street continues north toward the reservoir, curving around to run along its southern shore. A "
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	"Church"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2061 \?ELS14
	PRINTI	"Church of God's Word"
	JUMP	?CND8
?ELS14:	PRINTI	"high"
?CND8:	PRINTI	" school, a theatre, and a hotel can be entered to the west, southwest, and southeast, respectively. To the northeast is the perimeter fence of the Manville Border Security Force Base."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2061 \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	GETP	AIRPORTWAY-AND-RIVER,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	AIRPORTWAY-AND-RIVER,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS31
	PUTP	AIRPORTWAY-AND-RIVER,P?SCENE,101
	CALL2	SCORE,88
	CRLF	
	PRINTR	"A huge private skycar glides to a stop at the curb, nearly crushing an old woman. Several bodyguards leap out, and begin pushing the crowds back. A heavyset woman wearing thick furs steps out of the car, which rises and disappears from view. The woman, surrounded by her contingent of bodyguards, enters the hotel."
?ELS31:	GETP	AIRPORTWAY-AND-RIVER,P?SCENE
	ADD	STACK,33
	PUTP	AIRPORTWAY-AND-RIVER,P?SCENE,STACK
	RFALSE	


	.FUNCT	WELLS-THEATRE-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,AIRPORTWAY-AND-RIVER \?ELS10
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS10:	EQUAL?	HERE,AQUARIUM-AND-RIVER \?ELS12
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,WELLS-THEATRE-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	NO-TICKET
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,WELLS-THEATRE \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,WELLS-THEATRE \?ELS34
	CALL1	V-LOOK
	RSTACK	
?ELS34:	PRINTR	"The Wells is a modern-looking theatre."


	.FUNCT	WELLS-THEATRE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the lobby of a "
	EQUAL?	SYEAR,2041,2051 \?ELS10
	PRINTI	"modern"
	JUMP	?CND8
?ELS10:	PRINTI	"well-maintained"
?CND8:	PRINTI	" theatre, built on the site of the original "
	PRINTD	WELLS-THEATRE
	PRINTI	", which dates to the middle of the last century. According to a showcase, the current season includes productions of "
	EQUAL?	SYEAR,2041 \?ELS23
	PRINTI	"Shakespeare's ""Hamlet,"" Williams' ""A Streetcar Named Desire,"" Furrough's ""Plastic Summer,"" and the classic musical ""Hair."""
	JUMP	?CND21
?ELS23:	EQUAL?	SYEAR,2051 \?ELS27
	PRINTI	"Wilder's ""Our Town,"" Shakespeare's ""A Midsummer Night's Dream,"" Rodgers and Hammerstein's ""Oklahoma"", and Grzenda and Rice's ""Prairie Song."""
	JUMP	?CND21
?ELS27:	EQUAL?	SYEAR,2061 \?ELS31
	PRINTI	"Hilbert's ""Faith of our Fathers,"" Kim's ""Furs, Trees, and Beef,"" and Shaw's ""Man and Superman."""
	JUMP	?CND21
?ELS31:	CALL2	SCORE,89
	PRINTI	"several recent ecumenical plays."
?CND21:	PRINTI	" The theatre has exits to the northeast and southeast."
	RTRUE	


	.FUNCT	MUSEUM-ENTRANCE-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"Standing on the south side of Bodanski Boulevard is the "
	EQUAL?	SYEAR,2061,2071 \?CND8
	CALL2	SCORE,90
	PRINTI	"boarded-up "
?CND8:	PRINTD	RAILROAD-MUSEUM
	PRINTI	". The street runs east toward the park and west toward the square. North of here is a car lot and to the northwest is a huge cinema complex."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2061 \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	GETP	MUSEUM-ENTRANCE,P?SCENE
	EQUAL?	STACK,100 \FALSE
	PUTP	MUSEUM-ENTRANCE,P?SCENE,101
	CALL2	SCORE,91
	CRLF	
	PRINTR	"Two policemen across the street are savagely beating a dark-skinned youth. A hot dog peddler catches their attention, and as they begin buying some food the youth slinks away."


	.FUNCT	SKYCAR-LOT-6-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a large lot "
	EQUAL?	SYEAR,2041,2051 \?ELS12
	PRINTI	"for the cinema to the west, the park to the east, the symphony to the north, and the museum across the street to the south."
	RTRUE	
?ELS12:	EQUAL?	SYEAR,2061 \?ELS16
	PRINTI	"for the park to the east, the symphony to the north, and the cinema to the west."
	RTRUE	
?ELS16:	PRINTI	"for the park to the east and the cinema to the west, although the sort of people who would attend that sort of cinema are hardly the sort of people who could afford to own skycars."
	RTRUE	


	.FUNCT	RAILROAD-MUSEUM-ENTER-F
	EQUAL?	SYEAR,2041,2051 \?ELS5
	GRTR?	STIME,615 \?ELS10
	LESS?	STIME,1185 \?ELS10
	RETURN	RAILROAD-MUSEUM
?ELS10:	CALL2	CLOSED-PRINT,STR?108
	RFALSE	
?ELS5:	CALL2	SCORE,90
	PRINT	BOARDED-OVER
	EQUAL?	SYEAR,2061 \?ELS21
	PRINTI	" A yellowed sign under the boards reads "
	CALL	PERFORM,V?READ,GLOBAL-SIGN
	RFALSE	
?ELS21:	CRLF	
	RFALSE	


	.FUNCT	RAILROAD-MUSEUM-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"This museum is devoted to "
	EQUAL?	SYEAR,2041 \?CND8
	PRINTI	"the old North Central Railroad Station around the corner, and more generally to "
?CND8:	PRINTI	"the entire history of rail travel. Through huge glass windows on the southern wall of the entrance lobby you can see the old "
	PRINTD	RAILROAD-YARD
	PRINTI	"s behind the station. The street is to the north and another exit leads east."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	CLOSING-TIME,1185,STR?109,STR?18,MUSEUM-ENTRANCE
	RSTACK	


	.FUNCT	RAILROAD-YARD-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,MIDLAND-AND-CHURCH \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	


	.FUNCT	RIVERSIDE-PARK-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,92
	PRINTI	"As you enter the park, a guard stops you, staring with barely concealed repugnance. ""Admission to the park is restricted,"" he says, twisting your arm as he pushes you out of the park."
	CRLF	
	RFALSE	
?ELS5:	RETURN	RIVERSIDE-PARK


	.FUNCT	CINEMA-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,MOVIE-THEATRE-OBJECT
	RFALSE	
?ELS5:	RETURN	CINEMA


	.FUNCT	CINEMA-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	FSET?	TICKET,NDESCBIT \?ELS5
	MOVE	TICKET,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS9
	PRINTI	"The Downtown Cinema Quad is a "
	EQUAL?	SYEAR,2041 \?ELS14
	PRINTI	"modern, "
	JUMP	?CND12
?ELS14:	EQUAL?	SYEAR,2061,2071 \?CND12
	PRINTI	"seedy, "
?CND12:	PRINTI	"four-theatre movie complex"
	EQUAL?	SYEAR,2041,2051 \?ELS25
	PRINTI	" with all the latest holographic and personalized stereo technology"
	JUMP	?CND23
?ELS25:	EQUAL?	SYEAR,2071 \?CND23
	CALL2	SCORE,128
	PRINTI	". The carpeting is dirty and torn, and the air is rank with a mixture of putrid odors"
?CND23:	PRINTI	". A marquee above the ticket ""window"" announces the current features. A hallway leads in to the theatres, and there are exits north and east to car lots, and southeast to the street."
	RTRUE	
?ELS9:	EQUAL?	RARG,M-END \FALSE
	CALL2	CURFEW-CLOSE,MUSEUM-ENTRANCE
	RSTACK	


	.FUNCT	THEATRE-ENTER-F
	CALL2	HELD?,TICKET
	ZERO?	STACK /?ELS3
	MOVE	TICKET,CINEMA
	FSET	TICKET,TRYTAKEBIT
	FSET	TICKET,NDESCBIT
	FCLEAR	TICKET,TOUCHBIT
	SET	'ELAPSED-TIME,15
	ZERO?	RECORDING /?CND4
	PUT	RECORDING-TABLE,14,1
?CND4:	PRINTI	"The usher takes your ticket and you step into the darkened theatre and find an empty seat.

Movie Theatre
You begin watching "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"""Upbeat Patrol II,"" which is funny and fast-moving like the prequel, but seems to lack some of the originality and freshness. The soundtrack, locations, and special effects are all top notch. A"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	CALL2	SCORE,93
	PRINTI	"""Manure Marauders,"" but it's so insipid that a"
	JUMP	?CND10
?ELS16:	EQUAL?	SYEAR,2061 \?ELS20
	CALL2	SCORE,94
	PRINTI	"""More of Anything,"" and you quickly find yourself being aroused by the skillfully filmed and edited sex scenes. Then, during a slow moment, you begin to feel ashamed and guilty, and a"
	JUMP	?CND10
?ELS20:	CALL2	SCORE,95
	PRINTI	"an untitled hatefilm, preceded by a five minute Church propaganda short. Most of the audience is much younger; many are still in their teens. When they begin chanting in rhythm with the mobs on the screen, you begin to feel very uncomfortable. A"
?CND10:	PRINTI	"fter about fifteen minutes, you decide you've seen enough, and head out to the lobby."
	CRLF	
	RFALSE	
?ELS3:	PRINT	NO-TICKET
	CRLF	
	RFALSE	


	.FUNCT	MOVIE-THEATRE-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,MUSEUM-ENTRANCE \?ELS10
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS10:	EQUAL?	HERE,CINEMA \?ELS12
	CALL2	DO-WALK,P?IN
	RSTACK	
?ELS12:	EQUAL?	HERE,SKYCAR-LOT-7 \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,CINEMA \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \?ELS29
	EQUAL?	HERE,CINEMA \?ELS34
	CALL1	V-LOOK
	RSTACK	
?ELS34:	PRINTI	"The "
	PRINTD	MOVIE-THEATRE-OBJECT
	PRINTR	" is a large four-plex."
?ELS29:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,CINEMA \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"An unidentifiable, putrid odor hangs in the air."


	.FUNCT	MOVIE-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	CALL	GLOBAL-IN?,MOVIE-THEATRE-OBJECT,HERE
	ZERO?	STACK /?ELS10
	CALL	PERFORM,V?WALK-TO,MOVIE-THEATRE-OBJECT
	RTRUE	
?ELS10:	CALL1	V-WALK-AROUND
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL	GLOBAL-IN?,MOVIE-THEATRE-OBJECT,HERE
	ZERO?	STACK /?ELS19
	CALL	PERFORM,V?WALK-TO,MOVIE-THEATRE-OBJECT
	RTRUE	
?ELS19:	PRINTR	"You can't watch a movie here!"


	.FUNCT	MARQUEE-F
	EQUAL?	PRSA,V?READ \FALSE
	PRINTI	"According to the marquee, the current features of the Cinema are "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTR	"an action-romance entitled ""Let's Get Going,"" a comedy called ""Paulette,"" the sequel to last year's Best Picture, ""Upbeat Patrol II,"" and ""Freefall,"" a Korean film. "
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	CALL2	SCORE,93
	PRINTR	"""Manure Marauders,"" a long-running comedy, a horror-thriller called ""Not Until I Scream,"" and the sixth and seventh films in the popular Foreign Raiders series."
?ELS16:	EQUAL?	SYEAR,2061 \?ELS20
	CALL2	SCORE,94
	PRINTR	"a slasher-comedy named ""Gutsplosion,"" a lustfilm called ""More of Anything,"" ""Gringo Wars,"" a cheap action film, and ""Let's Kill Some Slants,"" a hatefilm being billed as a ""rousing killer comedy frolic."""
?ELS20:	CALL2	SCORE,95
	PRINTR	"two hatefilms, a lustfilm called ""Wild and Woolly,"" and a Church propaganda piece called ""Triumph of Man."""


	.FUNCT	TICKET-SELLER-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The "
	PRINTD	TICKET-SELLER
	PRINTI	" is often called a ticket window, an anachronistic term from the last century when tickets were sold by humans sitting in glass booths. This typical "
	PRINTD	TICKET-SELLER
	PRINTI	" has a slot for your "
	PRINTD	CREDIT-CARD
	PRINTR	"."


	.FUNCT	TICKET-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,CINEMA \?ELS10
	FSET?	TICKET,NDESCBIT \?ELS15
	CALL	VENDING,TICKET-SELLER,TICKET,15
	RSTACK	
?ELS15:	PRINTR	"You already did."
?ELS10:	EQUAL?	HERE,TRAIN-STATION \?ELS21
	EQUAL?	SYEAR,2041 \?ELS21
	PRINTR	"You discover that all the rides are sold out for the rest of the day."
?ELS21:	EQUAL?	HERE,WELLS-THEATRE,PICKFORD-THEATRE \?ELS27
	PRINTR	"You discover that the current season is already sold out."
?ELS27:	EQUAL?	HERE,SKYBUS-TERMINAL,TERMINAL \?ELS31
	PRINTR	"You have no reason to leave the city!"
?ELS31:	CALL2	CANT-BUY,TICKET
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?TAKE \?ELS37
	FSET?	TICKET,TRYTAKEBIT \?ELS37
	CALL	PERFORM,V?BUY,TICKET
	RTRUE	
?ELS37:	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTI	"**Admit One**"
	CALL2	PRINT-SPACES,18
	PRINTI	"No."
	RANDOM	899
	ADD	STACK,100
	PRINTN	STACK
	RANDOM	8999
	ADD	STACK,1000
	PRINTN	STACK
	CRLF	
	CALL2	PRINT-SPACES,10
	PRINTI	"Downtown Cinema Quad"
	CRLF	
	CALL2	PRINT-SPACES,10
	EQUAL?	SYEAR,2041 \?ELS50
	PRINTI	" ""Upbeat Patrol II"""
	JUMP	?CND48
?ELS50:	EQUAL?	SYEAR,2051 \?ELS54
	PRINTI	" ""Manure Marauders"""
	JUMP	?CND48
?ELS54:	EQUAL?	SYEAR,2061 \?ELS58
	PRINTI	" ""More of Anything"""
	JUMP	?CND48
?ELS58:	PRINTI	"hatefilm number 8722"
?CND48:	CRLF	
	PRINTR	"Not refundable or exchangable. Management
reserves the right to refuse admission by
refunding the price of this ticket."


	.FUNCT	ATRIUM-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The atrium is tremendous, rising through the center of the hotel, ending at roof level with a wide skylight."


	.FUNCT	SKYLIGHT-F
	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	ZERO?	LIGHT-LEVEL \?ELS10
	PRINTR	"Because it is dark outside, the lights in the atrium prevent you from seeing through the skylight."
?ELS10:	PRINTR	"You see the sky."


	.FUNCT	SYMPHONY-HALL-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,SYMPHONY-HALL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,SYMPHONY-ENTRANCE \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	EQUAL?	HERE,SKYCAR-LOT-7 \?ELS16
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,SYMPHONY-HALL-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS20
	EQUAL?	HERE,SYMPHONY-HALL \?ELS25
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,SYMPHONY-HALL \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	PRINTD	SYMPHONY-HALL
	PRINTI	" is an ornate building"
	EQUAL?	SYEAR,2071 \?CND41
	PRINTI	", closed for several years"
?CND41:	PRINTR	"."


	.FUNCT	SYMPHONY-HALL-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,96
	EQUAL?	HERE,RIVERSIDE-PARK \?ELS8
	PRINTD	SYMPHONY-HALL
	PRINTI	" has been closed for several years now."
	CRLF	
	RFALSE	
?ELS8:	PRINTI	"A faded sign on the boarded up doors reads "
	PRINT	SYMPHONY-CLOSED
	CRLF	
	RFALSE	
?ELS5:	RETURN	SYMPHONY-HALL


	.FUNCT	BASE-GATE-F,RARG
	EQUAL?	RARG,M-ENTER \FALSE
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?169
	RTRUE	


	.FUNCT	BASE-GATE-ENTER-F
	PRINTI	"The gate is closed. A guard"
	EQUAL?	SYEAR,2041 \?ELS5
	PRINTI	" politely"
	JUMP	?CND3
?ELS5:	EQUAL?	SYEAR,2051 \?ELS9
	PRINTI	" brusquely"
	JUMP	?CND3
?ELS9:	EQUAL?	SYEAR,2061 \?ELS13
	CALL2	SCORE,97
	PRINTI	" threateningly"
	JUMP	?CND3
?ELS13:	CALL2	SCORE,98
	PRINTI	", jabbing you painfully with the point of his weapon,"
?CND3:	PRINTI	" informs you that nonmilitary personnel are not allowed beyond this point."
	CRLF	
	RFALSE	


	.FUNCT	BSF-BASE-F
	EQUAL?	HERE,SKYCAB \?ELS5
	EQUAL?	PRSA,V?EXAMINE \?ELS10
	PRINTR	"The base has been turned into a museum."
?ELS10:	CALL2	MILE-AWAY,BSF-BASE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,BASE-GATE \?ELS21
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS27
	EQUAL?	HERE,BASE-GATE \?ELS32
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS32:	EQUAL?	HERE,SYMPHONY-ENTRANCE \?ELS34
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS34:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS27:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"You can't see much through the perimeter fence."


	.FUNCT	TERMINAL-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"The main terminal building has an exit to Airportway on the south. The "
	PRINTD	AIRPORT-GATE
	PRINTI	"s are east of here, "
	EQUAL?	SYEAR,2041,2051 \?ELS12
	PRINTI	"and the "
	PRINTD	SPACEPORT-GATE
	PRINTI	"s lie to the north"
	JUMP	?CND10
?ELS12:	CALL2	SCORE,99
	PRINTI	"and to the north are the shuttered gates of the once thriving spaceport"
?CND10:	PRINTI	". There is a large red sign over the gates, and "
	EQUAL?	SYEAR,2041 \?ELS25
	PRINTI	"a couple of BSF guards stand beneath it"
	JUMP	?CND23
?ELS25:	PRINTI	"BSF guards are everywhere"
?CND23:	EQUAL?	SYEAR,2071 \?ELS36
	PRINTI	". Plastiboards seal off a stairway leading down."
	RTRUE	
?ELS36:	PRINTI	". Stairs lead down to a "
	PRINTD	TUBE-STATION
	PRINTI	"."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	GETP	TERMINAL,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	TERMINAL,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS53
	PUTP	TERMINAL,P?SCENE,101
	CALL2	SCORE,100
	CRLF	
	PRINTR	"Nearby, a man with an Asian complexion is walking past a pair of BSF guards, and one of their Belt Rad-Detectors clicks. In the wink of an eye, four guns are pointed at the man, who looks terrified and begins to run. As the guns explode, people all around are screaming and throwing themselves on the ground; the Asian's mutilated body lies sprawled in the middle of the terminal. 

A guard cautiously approaches the dead man with a Rad-Detector. He scans the body until he finds the source of the signal. ""Just a nuke-powered wristwatch,"" he laughs, waving the other guards over. ""Can you imagine the gook being dumb enough to wear one of them near a border point?"" They shake their heads in disbelief as they drag the body away."
?ELS53:	GETP	TERMINAL,P?SCENE
	ADD	STACK,33
	PUTP	TERMINAL,P?SCENE,STACK
	RFALSE	


	.FUNCT	SPACEPORT-ENTER-F
	EQUAL?	SYEAR,2041,2051 \?ELS3
	PRINTI	"You can't get into the gate area without a boarding pass."
	CRLF	
	RFALSE	
?ELS3:	PRINTI	"The "
	PRINTD	SPACEPORT-GATE
	PRINTI	"s are closed and boarded over."
	CRLF	
	RFALSE	


	.FUNCT	SPACEPORT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \FALSE
	EQUAL?	HERE,TERMINAL \FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	


	.FUNCT	AIRPORT-GATE-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	PRINTR	"The gates are open!"
?ELS5:	EQUAL?	PRSA,V?CLOSE \?ELS9
	PRINTR	"You can't and wouldn't be allowed to if you could."
?ELS9:	EQUAL?	PRSA,V?THROUGH \?ELS13
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS13:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The gates are patrolled by BSF guards."


	.FUNCT	SPACEPORT-GATE-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	EQUAL?	SYEAR,2041,2051 \?ELS10
	PRINTR	"The gates are open!"
?ELS10:	PRINTR	"You'd need a full-scale construction crew to re-open these gates!"
?ELS5:	EQUAL?	PRSA,V?CLOSE \?ELS18
	EQUAL?	SYEAR,2041,2051 \?ELS23
	CALL	PERFORM,V?CLOSE,AIRPORT-GATE
	RTRUE	
?ELS23:	PRINTR	"The gates are closed!"
?ELS18:	EQUAL?	PRSA,V?THROUGH \?ELS29
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS29:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The "
	PRINTD	SPACEPORT-GATE
	PRINTI	"s are "
	EQUAL?	SYEAR,2041,2051 \?ELS38
	PRINTI	"open"
	JUMP	?CND36
?ELS38:	PRINTI	"sealed up"
?CND36:	PRINTR	"."


	.FUNCT	AIRPORT-TERMINAL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,TERMINAL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,AIRPORT-ENTRANCE \?ELS14
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?UP
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,TERMINAL \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,TERMINAL \?ELS34
	CALL1	V-LOOK
	RSTACK	
?ELS34:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	BSF-GUARDS-F
	EQUAL?	WINNER,BSF-GUARDS,NATIONAL-GUARDSMAN \FALSE
	PRINTI	"The guard ignores you."
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	AIRPORT-SIGN-F
	EQUAL?	PRSA,V?READ \FALSE
	EQUAL?	SYEAR,2041,2051 \?ELS10
	CRLF	
	CALL2	PRINT-SPACES,20
	PRINTI	"Remember! Our security procedures"
	CRLF	
	CALL2	PRINT-SPACES,29
	PRINTI	"exist to protect"
	CRLF	
	CALL2	PRINT-SPACES,20
	CALL2	ITALICIZE,STR?173
	PRINTI	" country and "
	CALL2	ITALICIZE,STR?173
	PRINTR	" way of life"
?ELS10:	CALL2	SCORE,101
	CRLF	
	CALL2	PRINT-SPACES,24
	PRINTI	"All international travellers"
	CRLF	
	CALL2	PRINT-SPACES,23
	PRINTI	"must pass through strip-search"
	CRLF	
	CALL2	PRINT-SPACES,30
	CALL2	ITALICIZE,STR?174
	CRLF	
	RTRUE	


	.FUNCT	NO-ENTRY-TO-HEIMAN-WORLD-F
	PRINTI	"There's no "
	EQUAL?	SYEAR,2041 \?ELS5
	PRINTI	"opening in the perimeter fence there."
	CRLF	
	RFALSE	
?ELS5:	PRINTI	"entry into "
	PRINTD	HEIMAN-WORLD-OBJECT
	PRINTI	" in that direction."
	CRLF	
	RFALSE	


	.FUNCT	BEND-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"River Street curves here, heading downtown to the north and under an old "
	PRINTD	RAILROAD-BRIDGE
	PRINTI	" to the southeast. To the northeast is an "
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	"opening in a tall fence"
	JUMP	?CND10
?ELS12:	PRINTI	"entrance to a massive indoor city"
?CND10:	PRINTI	". A row of stores round the curve on the other side of the street: a laundromat to the west, a pharmacy to the southwest, and a hardware store to the south."
	RTRUE	


	.FUNCT	LAUNDROMAT-OBJECT-F
	EQUAL?	PRSA,V?ON,V?OPEN \?ELS5
	PRINTR	"But you don't have any dirty clothes!"
?ELS5:	EQUAL?	PRSA,V?PUT \?ELS9
	EQUAL?	PRSI,WASHERS,VIBRAMAT \?ELS9
	CALL	PERFORM,V?WASH,PRSO
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,DRYERS \FALSE
	PRINTI	"But"
	CALL	ARTICLE,PRSO,TRUE-VALUE
	PRINTR	" isn't wet!"


	.FUNCT	DRUG-STORE-OBJECT-F
	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS5
	EQUAL?	HERE,DRUG-STORE \?ELS10
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS10:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS16
	EQUAL?	HERE,DRUG-STORE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DRUG-STORE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	DRUG-STORE-ENTER-F
	GRTR?	STIME,480 \?ELS5
	LESS?	STIME,1305 \?ELS5
	RETURN	DRUG-STORE
?ELS5:	CALL2	CLOSED-PRINT,STR?177
	RFALSE	


	.FUNCT	DRUG-STORE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1305,STR?179,STR?180,BEND
	RSTACK	


	.FUNCT	MAGAZINE-F
	EQUAL?	HERE,SKYCAB \?ELS5
	EQUAL?	PRSA,V?EXAMINE,V?READ,V?TAKE \?ELS5
	PRINTR	"Jill is reading it!"
?ELS5:	EQUAL?	PRSA,V?READ,V?TAKE,V?BUY /?THN12
	EQUAL?	PRSA,V?EXAMINE \FALSE
?THN12:	EQUAL?	HERE,DRUG-STORE \?ELS18
	PRINTR	"You peruse the rack, but there's nothing that interests you."
?ELS18:	PRINTR	"There aren't any magazines for sale here!"


	.FUNCT	MILKSHAKE-F
	EQUAL?	PRSA,V?TAKE,V?BUY \?ELS5
	EQUAL?	HERE,DRUG-STORE \?ELS10
	PRINTR	"You approach the ice cream counter, but it's pretty crowded, so you decide against it."
?ELS10:	PRINTR	"You can't get a milkshake here!"
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"It's sold at the ice cream counter."


	.FUNCT	DRUGS-F
	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,DRUG-STORE \?ELS10
	PRINTR	"You decide that it's silly to spend your hard-earned money on medicine when you're feeling perfectly fine."
?ELS10:	PRINTR	"This isn't a drug store!"


	.FUNCT	HARDWARE-STORE-OBJECT-F
	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS5
	EQUAL?	HERE,HARDWARE-STORE \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS16
	EQUAL?	HERE,HARDWARE-STORE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,HARDWARE-STORE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	HARDWARE-STORE-ENTER-F
	GRTR?	STIME,600 \?ELS5
	LESS?	STIME,1080 \?ELS5
	RETURN	HARDWARE-STORE
?ELS5:	CALL2	CLOSED-PRINT,STR?181
	RFALSE	


	.FUNCT	HARDWARE-STORE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"You have entered a large "
	PRINTD	HARDWARE-STORE-OBJECT
	PRINTI	", "
	EQUAL?	SYEAR,2041 \?ELS14
	PRINTI	"well-"
	JUMP	?CND12
?ELS14:	EQUAL?	SYEAR,2071 \?CND12
	PRINTI	"sparsely "
?CND12:	PRINTI	"stocked with various tools and hardware, as well as stuff for home-improvement, home entertainment facilities, skycars, and so forth. The front door is on the north side of the store."
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1080,STR?182,STR?180,BEND
	RSTACK	


	.FUNCT	HARDWARE-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,HARDWARE-STORE \?ELS10
	PRINTR	"You look around the store, but you don't see anything you need for the apartment. At least, nothing that will fit within your budget."
?ELS10:	CALL2	CANT-BUY,HARDWARE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTR	"You'd be arrested for shoplifting!"


	.FUNCT	TOOL-F
	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,HARDWARE-STORE \?ELS10
	PRINTR	"The clerk says, ""All out. Try again in a coupla weeks."""
?ELS10:	CALL2	CANT-BUY,TOOL
	RSTACK	


	.FUNCT	CLOSED-FACTORY-ENTER-F
	EQUAL?	SYEAR,2061,2071 \?ELS5
	CALL2	SCORE,49
	PRINTI	"The "
	PRINTD	SOUP-KITCHEN
	PRINTI	" is closed down."
	CRLF	
	RFALSE	
?ELS5:	RETURN	CLOSED-FACTORY


	.FUNCT	WICKER-AND-RIVER-F,RARG,?TMP1
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"You have crossed the proverbial railroad tracks. "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"The optimism and economic recovery don't seem to have spilled over into this run-down section of Rockvil, near the river"
	JUMP	?CND8
?ELS10:	PRINTI	"This section of town, near the river, is "
	EQUAL?	SYEAR,2071 \?CND17
	PRINTI	"particularly "
?CND17:	PRINTI	"run-down and seedy"
?CND8:	PRINTI	". Wicker Drive, which runs northeast to southwest, cuts perpendicularly across River Street here. To the northwest, River dips under an unused rail bridge. "
	EQUAL?	SYEAR,2041 \?ELS28
	PRINTI	"There are factories on the northern and eastern corners"
	JUMP	?CND26
?ELS28:	PRINTI	"There is a factory on the eastern corner, and on the northern corner a "
	EQUAL?	SYEAR,2051 \?ELS37
	CALL2	SCORE,102
	PRINTI	"line forms along the sidewalk outside a "
	JUMP	?CND35
?ELS37:	CALL2	SCORE,49
	PRINTI	"boarded-up "
?CND35:	PRINTD	SOUP-KITCHEN
?CND26:	PRINTI	". To the west is a "
	EQUAL?	SYEAR,2041,2051 \?ELS48
	PRINTI	"dingy warehouse"
	JUMP	?CND46
?ELS48:	PRINTI	"vacant lot"
?CND46:	PRINTI	", and south of here are some dilapidated apartments. "
	EQUAL?	SYEAR,2071 \?ELS61
	PRINTI	"An entrance to the Tubes is sealed up."
	RTRUE	
?ELS61:	PRINTI	"The smell of stale urine wafts from a stairway leading down to a gloomy "
	PRINTD	TUBE-STATION
	PRINTI	"."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	GETP	WICKER-AND-RIVER,P?SCENE
	LESS?	STACK,101 \FALSE
	GETP	WICKER-AND-RIVER,P?SCENE >?TMP1
	RANDOM	100
	LESS?	?TMP1,STACK /?ELS78
	PUTP	WICKER-AND-RIVER,P?SCENE,101
	CALL2	SCORE,103
	CRLF	
	PRINTR	"A skycopter whizzes overhead, announcing a special series of execution matches this weekend."
?ELS78:	GETP	WICKER-AND-RIVER,P?SCENE
	ADD	STACK,33
	PUTP	WICKER-AND-RIVER,P?SCENE,STACK
	RFALSE	


	.FUNCT	WAREHOUSE-1-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041,2051 \?ELS10
	PUTP	WAREHOUSE-1,P?SDESC,STR?184
	RTRUE	
?ELS10:	PUTP	WAREHOUSE-1,P?SDESC,STR?89
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041,2051 \?ELS19
	PRINTI	"You are standing at the front entrance of an old warehouse whose walls are coated with soot from the nearby factories. The door is locked. The street is east of here."
	RTRUE	
?ELS19:	PRINTI	"This lot is completely empty except for a few concrete footings that must have once formed the foundation for some large building. A rusting, overgrown set of railroad tracks borders the far side of the lot. An intersection of two streets lies to the east."
	RTRUE	


	.FUNCT	WAREHOUSE-1-EXIT-F
	EQUAL?	SYEAR,2041,2051 \?ELS3
	EQUAL?	PRSO,P?WEST \?ELS6
	PRINTI	"The door is locked."
	CRLF	
	RFALSE	
?ELS6:	PRINT	CANT-GO
	CRLF	
	RFALSE	
?ELS3:	EQUAL?	PRSO,P?WEST \?ELS17
	PRINTI	"The tracks are fenced off."
	CRLF	
	RFALSE	
?ELS17:	PRINTI	"There's no exit from the lot in that direction."
	CRLF	
	RFALSE	


	.FUNCT	WAREHOUSE-DOOR-F
	EQUAL?	PRSA,V?EXAMINE,V?OPEN,V?THROUGH \FALSE
	PRINTR	"It's locked."


	.FUNCT	CLOSED-FACTORY-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	SYEAR,2041 \?ELS10
	PUTP	CLOSED-FACTORY,P?SDESC,STR?185
	RTRUE	
?ELS10:	PUTP	CLOSED-FACTORY,P?SDESC,STR?186
	MOVE	CHAIR,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS19
	PRINTI	"You have entered the crumbling buildings of a once-booming chip factory, idle since the invention of the IDF made chips obsolete. The exit leads south."
	RTRUE	
?ELS19:	CALL2	SCORE,102
	PRINTI	"You are in a dirty, crowded "
	PRINTD	SOUP-KITCHEN
	PRINTI	" run by St. Michael's Church. Dozens and dozens of dispirited people are sitting at old wooden tables, eating a thin stew. A door leads south."
	RTRUE	


	.FUNCT	SOUP-KITCHEN-F
	EQUAL?	SYEAR,2041 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,SOUP-KITCHEN
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,WICKER-AND-RIVER \?ELS14
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS14:	CALL	GLOBAL-IN?,SOUP-KITCHEN,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS20
	EQUAL?	HERE,CLOSED-FACTORY \?ELS25
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CLOSED-FACTORY \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	EQUAL?	SYEAR,2051 \?ELS38
	PRINTI	"There's a long line outside the "
	PRINTD	SOUP-KITCHEN
	PRINTR	"."
?ELS38:	CALL2	DO-WALK,P?NORTH
	RSTACK	


	.FUNCT	STEW-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"The soup is thin, without much substance."
?ELS5:	EQUAL?	PRSA,V?EAT,V?TAKE \?ELS9
	PRINTR	"The line of people waiting for soup is too long."
?ELS9:	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,CLOSED-FACTORY \?ELS18
	PRINTR	"The soup is free."
?ELS18:	EQUAL?	HERE,ROYS-PAGODA \?ELS22
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	
?ELS22:	EQUAL?	HERE,SIMONS,THE-COACHMAN,BURGER-MEISTER \?ELS24
	PRINTR	"There's no soup on the menu."
?ELS24:	CALL2	CANT-BUY,STEW
	RSTACK	


	.FUNCT	TENEMENT-1-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are in the lobby of a run-down apartment building. These apartments were probably considered desirable when constructed during the latter part of the last century, but"
	EQUAL?	SYEAR,2041 \?CND8
	PRINTI	" with the encroachment of the factories and utility stations, "
?CND8:	PRINTI	" the building, like the entire area, "
	EQUAL?	SYEAR,2071 \?ELS17
	PRINTI	"has long been"
	JUMP	?CND15
?ELS17:	PRINTI	"has become"
?CND15:	PRINTI	" a slum. The lobby has exits to the north, east, and west."
	RTRUE	


	.FUNCT	WAREHOUSE-OBJECT-F
	EQUAL?	HERE,WAREHOUSE-1,WICKER-AND-RIVER \?ELS5
	EQUAL?	SYEAR,2061,2071 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,WAREHOUSE-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,WICKER-AND-RIVER \?ELS14
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS14:	EQUAL?	HERE,INDUSTRIAL-PARK-ENTRANCE \?ELS16
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS16:	EQUAL?	HERE,INDUSTRIAL-PARK-DRIVE \?ELS18
	CALL	PERFORM,V?THROUGH,FACTORY-OBJECT
	RTRUE	
?ELS18:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS24
	EQUAL?	HERE,WAREHOUSE-1 \?ELS29
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS29:	EQUAL?	HERE,WAREHOUSE-2 \?ELS31
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS31:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS24:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	'HERE,WAREHOUSE-1,WAREHOUSE-2 \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	WAREHOUSE-2-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You have entered a warehouse filled with dusty crates. The exit is to the south. An alarm "
	FSET?	WAREHOUSE-2,ONBIT \?ELS10
	PRINTI	"is ringing"
	JUMP	?CND8
?ELS10:	FSET	WAREHOUSE-2,ONBIT
	PRINTI	"begins to ring"
?CND8:	PRINTI	" loudly."
	RTRUE	


	.FUNCT	ALARM-F
	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"You have little choice -- you can't hear much else."


	.FUNCT	CRATE-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	PRINTR	"You'd need a crowbar to open these crates."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The crates are closed."


	.FUNCT	INDUSTRIAL-PARK-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,INDUSTRIAL-PARK-ENTRANCE \?ELS10
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS10:	EQUAL?	HERE,SKYCAR-LOT-1 \?ELS12
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS18
	EQUAL?	HERE,INDUSTRIAL-PARK-ENTRANCE \?ELS23
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS23:	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,INDUSTRIAL-PARK-DRIVE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CITY-DUMP-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This sprawling site along the river is a multiple unit disposal facility handling all of Rockvil's waste. Garbage "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"is processed and shipped downriver for landfilling. Liquid wastes are dechemified and then"
	JUMP	?CND8
?ELS10:	CALL2	SCORE,104
	PRINTI	"and liquid wastes are"
?CND8:	PRINTI	" dumped into the river. Radioactive wastes are stored for "
	EQUAL?	SYEAR,2061,2071 \?CND19
	PRINTI	"high-security "
?CND19:	PRINTI	"shipment to one of the national storage sites. Energy produced during processing is piped to the "
	PRINTD	POWER-STATION-OBJECT
	PRINTI	" nearby. An opening in the perimeter fence leads northeast to Wicker Drive."
	RTRUE	


	.FUNCT	WASTE-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Like most waste, it's pretty vile."


	.FUNCT	DUMP-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,CITY-DUMP \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,CITY-DUMP \?ELS21
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,CITY-DUMP \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	POWER-STATION-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,POWER-STATION \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,POWER-STATION \?ELS21
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,POWER-STATION \?ELS32
	CALL1	V-LOOK
	RSTACK	
?ELS32:	CALL1	FROM-HERE
	RSTACK	


	.FUNCT	POWER-STATION-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the central "
	PRINTD	POWER-STATION-OBJECT
	PRINTI	" for all of Rockvil. Power is generated here by fusion reactors"
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTI	", and is"
	JUMP	?CND10
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	CALL2	SCORE,105
	PRINTI	" and supplemental coal-burning generators, and is"
	JUMP	?CND10
?ELS16:	EQUAL?	SYEAR,2061 \?ELS20
	CALL2	SCORE,106
	PRINTI	", as well as by more environmentally damaging coal-burning generators. Power is"
	JUMP	?CND10
?ELS20:	CALL2	SCORE,107
	PRINTI	" in addition to the less expensive coal-burners; each coal generator is belching tremendous pillars of black, ashy smoke into the sky. Power is also"
?CND10:	PRINTI	" received here from distant generators via a huge array of microwave receivers. The main entrance is on the north side of the plant."
	RTRUE	


	.FUNCT	RIVER-STREET-BRIDGE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"River Street leaves Rockvil via this bridge, crossing the river into the older and poorer southeastern suburbs."
	CALL2	RIVER-FIRE,STR?50
	RTRUE	


	.FUNCT	RIVER-FIRE,STRING
	EQUAL?	SYEAR,2071 \FALSE
	CALL2	SCORE,108
	PRINTI	" Off to the "
	PRINT	STRING
	PRINTI	", the river is on fire again. Nowadays, "
	PRINTD	FIRECOPTER
	PRINTI	"s usually ignore river fires unless they approach the shoreline."
	RTRUE	


	.FUNCT	SKYCAR-FACTORY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"The Omni-Fabb "
	PRINTD	SKYCAR-FACTORY
	PRINTI	", the last surviving smokestack industry in the area, provides jobs to many residents of the city and the suburbs across the river"
	EQUAL?	SYEAR,2061,2071 \?CND10
	PRINTI	", although not nearly as many as before the suspension of federal regulations limiting robotic job replacement"
?CND10:	EQUAL?	SYEAR,2041 /?ELS17
	LESS?	STIME,480 \?ELS17
	GRTR?	STIME,990 \?ELS17
	CALL2	SCORE,109
	PRINTI	". The parking lot is empty; there must currently be only one shift per day"
	JUMP	?CND15
?ELS17:	PRINTI	". Judging by the number of cars in the workers' lot, and the general level of activity, the plant is running at "
	EQUAL?	SYEAR,2041 \?ELS28
	PRINTI	"nearly full"
	JUMP	?CND26
?ELS28:	EQUAL?	SYEAR,2051 \?ELS32
	CALL2	SCORE,109
	PRINTI	"well above half of"
	JUMP	?CND26
?ELS32:	EQUAL?	SYEAR,2061 \?ELS36
	CALL2	SCORE,110
	PRINTI	"less than half of"
	JUMP	?CND26
?ELS36:	CALL2	SCORE,111
	PRINTI	"a fraction of"
?CND26:	PRINTI	" capacity"
?CND15:	PRINTI	". There are exits from this complex of buildings to the northwest and the southwest."
	RTRUE	


	.FUNCT	GUN-SHOP-ENTER-F
	GRTR?	STIME,630 \?ELS5
	LESS?	STIME,1230 \?ELS5
	RETURN	GUN-SHOP
?ELS5:	CALL2	CLOSED-PRINT,STR?200
	RFALSE	


	.FUNCT	GUN-SHOP-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,FACTORY-ENTRANCE \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	CALL1	MOBY-VERB?
	ZERO?	STACK \FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?ELS16
	EQUAL?	HERE,FACTORY-ENTRANCE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,GUN-SHOP \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	GUN-SHOP-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?202
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1230,STR?203,STR?204,FACTORY-ENTRANCE
	RSTACK	


	.FUNCT	GUN-F
	EQUAL?	HERE,CORE \?ELS5
	IN?	SABOTEURS,HERE /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,GUN
	RSTACK	
?ELS5:	EQUAL?	HERE,CONTROL-CENTER \?ELS9
	ZERO?	SEIGE \?ELS9
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS9
	CALL2	CANT-SEE,GUN
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?BUY \?ELS13
	EQUAL?	HERE,GUN-SHOP \?ELS18
	PRINTI	"The proprietor shows you many different firearms, and you finally settle on a twenty-two caliber pellet gun. However, when you pass your "
	PRINTD	CREDIT-CARD
	PRINTR	" through the grill to the proprietor, he looks disappointed as he announces that you don't have enough in your account for that particular gun. ""In fact,"" he says, ""I doubt there's anything in the shop in your price range. You might try Ribeiro's Secondhand Firearms over in Yankton."""
?ELS18:	CALL2	CANT-BUY,GUN
	RSTACK	
?ELS13:	EQUAL?	HERE,GUN-SHOP \?ELS26
	EQUAL?	PRSA,V?SHOOT,V?TAKE \?ELS26
	PRINTI	"You'll have to buy a gun before you can "
	EQUAL?	PRSA,V?SHOOT \?ELS33
	PRINTI	"shoot"
	JUMP	?CND31
?ELS33:	PRINTI	"take"
?CND31:	PRINTR	" it."
?ELS26:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,GUN-SHOP \FALSE
	PRINTR	"There are a staggering variety of weapons here."


	.FUNCT	BAR-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	LESS?	STIME,1201 \?CND6
	FCLEAR	BAR,ONBIT
?CND6:	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?54
	MOVE	BEER,LOCAL-GLOBALS
	MOVE	BAR-STOOL,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS10
	PRINTI	"This is a tiny, smoke-filled bar, with exits to the west and northeast. Loud, distorted music comes from an old jukebox"
	PRINT	STOOL-DESC
	CALL1	PEOPLE-IN-BAR-DESC
	RSTACK	
?ELS10:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2041 /FALSE
	GRTR?	STIME,1195 \FALSE
	LESS?	STIME,1255 \FALSE
	FSET?	BAR,ONBIT /FALSE
	FSET	BAR,ONBIT
	CRLF	
	PRINTR	"Someone, possibly the owner, shouts above the din, ""It's getting near curfew time; anyone who doesn't wanna stay 'til morning should get a move on it! Of course, we'll be staying open all night, as usual -- you just gotta know the right people!"" He rubs his fingers together, indicating that some official of the Curfew Board is now slightly richer. ""Well, drink up!"""


	.FUNCT	BAR-TO-ALLEY-F
	CALL2	HELD?,BEER
	ZERO?	STACK /?ELS5
	PRINT	BARTENDER-YELLS
	CRLF	
	RFALSE	
?ELS5:	RETURN	ALLEY


	.FUNCT	BAR-TO-PIER-F
	CALL2	HELD?,BEER
	ZERO?	STACK /?ELS5
	PRINT	BARTENDER-YELLS
	CRLF	
	RFALSE	
?ELS5:	RETURN	PIER


	.FUNCT	BAR-OBJECT-F
	EQUAL?	HERE,BURGER-MEISTER,AQUARIUM-AND-PARK \?ELS5
	EQUAL?	SYEAR,2071 /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,BAR-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,BURGER-MEISTER,EZZIS-BAR,BAR \?ELS14
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS14:	EQUAL?	HERE,AQUARIUM-AND-PARK \?ELS18
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS18:	EQUAL?	HERE,ELM-UNDERPASS \?ELS20
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS20:	EQUAL?	HERE,ALLEY \?ELS22
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS22:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS26
	EQUAL?	HERE,BURGER-MEISTER,EZZIS-BAR,BAR \?ELS31
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS31:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS26:	EQUAL?	PRSA,V?EXAMINE \?ELS37
	EQUAL?	HERE,BURGER-MEISTER,EZZIS-BAR,BAR \?ELS37
	CALL1	V-LOOK
	RSTACK	
?ELS37:	EQUAL?	PRSA,V?SMELL \?ELS41
	EQUAL?	HERE,BURGER-MEISTER \?ELS41
	PRINTR	"The air is heavy with the smells of tobacco smoke, urine, and spilled beer."
?ELS41:	EQUAL?	PRSA,V?PUT-ON \FALSE
	EQUAL?	PRSI,BAR-OBJECT \FALSE
	EQUAL?	HERE,BURGER-MEISTER,EZZIS-BAR,BAR \FALSE
	CALL	PERFORM,V?PUT-ON,PRSO,COUNTER
	RTRUE	


	.FUNCT	BAR-STOOL-F
	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,BAR-STOOL \FALSE
	EQUAL?	PRSO,ME \?CND8
	CALL	PERFORM,V?SIT,BAR-STOOL
	RTRUE	
?CND8:	PRINTR	"Stools are for sitting on."


	.FUNCT	JUKEBOX-F
	EQUAL?	PRSA,V?LISTEN \?ELS5
	SET	'ELAPSED-TIME,4
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTR	"The tune is a jazzed-up version of a popular Church march."
?ELS10:	PRINTI	"You listen to the current selection, "
	CALL2	PICK-ONE,JUKEBOXES
	PRINT	STACK
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?PLAY,V?ON \FALSE
	PRINTR	"It's already playing."


	.FUNCT	PIER-OBJECT-F
	EQUAL?	HERE,SKYCAB \?ELS5
	EQUAL?	PRSA,V?EXAMINE /?ELS5
	CALL2	MILE-AWAY,PIER-OBJECT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS9
	EQUAL?	HERE,BAR \?ELS14
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS14:	EQUAL?	HERE,WICKER-AND-PIER \?ELS16
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS16:	EQUAL?	HERE,POOL-HALL \?ELS18
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,PIER,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS9:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS24
	EQUAL?	HERE,PIER \?ELS29
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS29:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS24:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,PIER \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	PIER-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is an aging riverfront pier, "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"extending a short way"
	JUMP	?CND8
?ELS10:	PRINTI	"ending abruptly at the river edge. Jagged, splintered wood at the end of the pier reveals that it once extended further"
?CND8:	PRINTI	" out into the river. To the northwest, the pier intersects with Wicker Drive. A bar opens to the southwest, and a pool hall to the northeast."
	RTRUE	


	.FUNCT	POOL-HALL-ENTER-F
	GRTR?	STIME,1200 /?THN8
	LESS?	STIME,420 \?ELS5
?THN8:	EQUAL?	SYEAR,2041 /?ELS5
	CALL2	OF-COURSE,POOL-HALL-OBJECT
	RFALSE	
?ELS5:	RETURN	POOL-HALL


	.FUNCT	POOL-HALL-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"This is a classless establishment, which has clearly seen its better days. "
	PRINT	TOBACCO-ODOR
	PRINTI	" A door to the pier lies to the southwest. "
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL2	CURFEW-CLOSE,PIER
	RSTACK	


	.FUNCT	POOL-HALL-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,POOL-HALL \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,POOL-HALL \?ELS21
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \?ELS27
	EQUAL?	HERE,POOL-HALL \?ELS27
	CALL1	V-LOOK
	RSTACK	
?ELS27:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,POOL-HALL \FALSE
	PRINT	TOBACCO-ODOR
	CRLF	
	RTRUE	


	.FUNCT	POOL-TABLE-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The "
	PRINTD	POOL-TABLE
	PRINTR	"s are all in poor shape, frayed in many places and scarred by cigarette burns."


	.FUNCT	POOL-F
	EQUAL?	PRSA,V?SHOOT,V?PLAY \FALSE
	EQUAL?	HERE,POOL-HALL \?ELS10
	PRINTR	"You knock a few balls around, but, as usual, you have to admit that you're not very good at cuesmanship."
?ELS10:	PRINTR	"You'd better find a pool hall first."


	.FUNCT	WICKER-AND-PIER-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	EQUAL?	SYEAR,2081 \?ELS10
	CALL2	SCORE,112
	PRINTI	"Rats scamper among the weeds growing through the cracks in the street and among the ruined buildings. A pallor of smoke hangs in the air, and a distant sound like a drumbeat gives this area the feel of a surreal jungle."
	RTRUE	
?ELS10:	PRINTI	"Northeast of here, Wicker curves northwards and passes under an old railroad trestle. An aging, wooden pier leads off to the southeast. On the eastern corner of the street is what appears to be a "
	EQUAL?	SYEAR,2071 \?CND17
	CALL2	SCORE,113
	PRINTI	"closed "
?CND17:	PRINTI	"bookstore. A "
	PRINTD	LIQUOR-STORE-OBJECT
	PRINTI	" occupies the southern corner, and a row of dismal apartment buildings lines the northwestern side of Wicker."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	SYEAR,2081 \FALSE
	CALL2	JIGS-UP,STR?212
	RSTACK	


	.FUNCT	TENEMENT-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"substandard residence unit"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2071 \?ELS14
	PRINTI	"malodorous, disease-ridden, rat-infested slum"
	JUMP	?CND8
?ELS14:	EQUAL?	HERE,TENEMENT-2 \?ELS21
	PRINTI	"filthy"
	JUMP	?CND19
?ELS21:	PRINTI	"dirty"
?CND19:	PRINTI	" tenement"
?CND8:	PRINTI	". The exit is southeast."
	RTRUE	


	.FUNCT	TENEMENT-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,WICKER-AND-RIVER \?ELS10
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS10:	EQUAL?	HERE,POWER-STATION-ENTRANCE \?ELS12
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS12:	EQUAL?	HERE,INDUSTRIAL-PARK-ENTRANCE \?ELS14
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS14:	EQUAL?	HERE,DUMP-ENTRANCE \?ELS16
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS16:	EQUAL?	HERE,FACTORY-ENTRANCE,WICKER-AND-PIER \?ELS18
	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS18:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS24
	EQUAL?	HERE,TENEMENT-2,TENEMENT-3 \?ELS29
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS29:	EQUAL?	HERE,TENEMENT-3 \?ELS31
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS31:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS24:	EQUAL?	PRSA,V?EXAMINE \?ELS37
	EQUAL?	HERE,TENEMENT-1,TENEMENT-2,TENEMENT-3 \?ELS37
	CALL1	V-LOOK
	RSTACK	
?ELS37:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,TENEMENT-2,TENEMENT-3 \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"The building smells foul."


	.FUNCT	BOOKSTORE-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,113
	PRINTI	"The bookstore is locked. Through the grimy window, the bookstore looks empty and barren."
	CRLF	
	RFALSE	
?ELS5:	GRTR?	STIME,1083 /?THN10
	LESS?	STIME,501 \?ELS9
?THN10:	CALL2	CLOSED-PRINT,STR?213
	RFALSE	
?ELS9:	RETURN	BOOKSTORE


	.FUNCT	BOOKSTORE-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,BOOKSTORE \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,BOOKSTORE \?ELS21
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \?ELS27
	EQUAL?	HERE,BOOKSTORE \?ELS27
	CALL1	V-LOOK
	RSTACK	
?ELS27:	EQUAL?	PRSA,V?SEARCH \?ELS31
	EQUAL?	HERE,BOOKSTORE \?ELS31
	FSET?	BOOK,TRYTAKEBIT \?ELS31
	CALL	PERFORM,V?BUY,BOOKS
	RTRUE	
?ELS31:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,BOOKSTORE \FALSE
	PRINTR	"A pleasant, papery odor fills the shop."


	.FUNCT	BOOKSTORE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	MOVE	BOOKS,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?202
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1083,STR?215,STR?204,WICKER-AND-PIER
	RSTACK	


	.FUNCT	BOOK-F
	EQUAL?	PRSA,V?BUY \?ELS5
	FSET?	BOOK,TRYTAKEBIT \?ELS10
	CALL	PERFORM,V?BUY,BOOKS
	RTRUE	
?ELS10:	PRINTR	"You already did."
?ELS5:	EQUAL?	PRSA,V?TAKE \?ELS16
	FSET?	BOOK,TRYTAKEBIT \?ELS16
	CALL	PERFORM,V?TAKE,BOOKS
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?FIND \?ELS20
	EQUAL?	HERE,BOOKSTORE \?ELS20
	FSET?	BOOK,TRYTAKEBIT \?ELS20
	CALL	PERFORM,V?BUY,BOOKS
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?OPEN \?ELS24
	CALL	PERFORM,V?READ,BOOK
	RTRUE	
?ELS24:	EQUAL?	PRSA,V?CLOSE \FALSE
	PRINTR	"It is."


	.FUNCT	BOOKS-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,BOOKSTORE \?ELS10
	ZERO?	BOOK-PURCHASED /?ELS15
	SET	'ELAPSED-TIME,6
	PRINTR	"You browse for a few minutes, but don't find anything of interest."
?ELS15:	FSET?	BOOK,TRYTAKEBIT \?ELS20
	SET	'ELAPSED-TIME,3
	SET	'P-IT-OBJECT,BOOK
	PRINTI	"After browsing for several minutes, something catches your eye: a handsome edition of Baum's ""The Wizard of Oz."" Eagerly, you give your "
	PRINTD	CREDIT-CARD
	PRINTI	" to the proprietor"
	CALL	TOO-POOR,30,BOOK
	ZERO?	STACK \TRUE
	MOVE	BOOK,PLAYER
	FCLEAR	BOOK,TRYTAKEBIT
	FCLEAR	BOOK,NDESCBIT
	SET	'BOOK-PURCHASED,TRUE-VALUE
	CALL2	DEBIT,30
	PRINTR	"."
?ELS20:	PRINTR	"You already bought one book. That's enough extravagance for one day."
?ELS10:	CALL2	CANT-BUY,BOOKS
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?SEARCH \?ELS37
	EQUAL?	HERE,BOOKSTORE \?ELS37
	FSET?	BOOK,TRYTAKEBIT \?ELS37
	CALL	PERFORM,V?BUY,BOOKS
	RTRUE	
?ELS37:	EQUAL?	PRSA,V?EXAMINE \?ELS41
	EQUAL?	HERE,BOOKSTORE,MAIN-LIBRARY \?ELS41
	CALL	PERFORM,V?READ,BOOKS
	RTRUE	
?ELS41:	EQUAL?	PRSA,V?OPEN,V?READ \?ELS45
	EQUAL?	HERE,BOOKSTORE \?ELS50
	PRINTR	"There are thousands of books in the store, of many different sizes and ages. Many are used. You continue to look for one you might be interested in buying."
?ELS50:	EQUAL?	HERE,MAIN-LIBRARY \?ELS54
	PRINTI	"There are many books in the library"
	EQUAL?	SYEAR,2071 \?CND57
	PRINTI	", although some of the shelves are empty and covered with dust"
?CND57:	PRINTR	"."
?ELS54:	CALL	PERFORM,V?TAKE,BOOKS
	RTRUE	
?ELS45:	EQUAL?	PRSA,V?TAKE \?ELS67
	EQUAL?	HERE,MAIN-LIBRARY \?ELS72
	PRINTR	"You don't have a library account."
?ELS72:	PRINTR	"You can't take a book without paying for it."
?ELS67:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,MAIN-LIBRARY \FALSE
	CALL	PERFORM,V?SMELL,MAIN-LIBRARY-OBJECT
	RTRUE	


	.FUNCT	LIQUOR-STORE-OBJECT-F
	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS5
	EQUAL?	HERE,LIQUOR-STORE \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS16
	EQUAL?	HERE,LIQUOR-STORE \?ELS21
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS21:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,LIQUOR-STORE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	LIQUOR-STORE-ENTER-F
	GRTR?	STIME,660 \?ELS5
	LESS?	STIME,1320 \?ELS5
	RETURN	LIQUOR-STORE
?ELS5:	CALL2	CLOSED-PRINT,STR?217
	RFALSE	


	.FUNCT	LIQUOR-STORE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	SPEAR-CARRIER,HERE
	PUTP	SPEAR-CARRIER,P?SDESC,STR?16
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL	SHOP-CLOSES,1320,STR?219,STR?180,WICKER-AND-PIER
	RSTACK	


	.FUNCT	SCOTCH-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,LIQUOR-STORE \?ELS10
	FSET?	SCOTCH,TRYTAKEBIT /?CND11
	PRINTR	"On second thought, you decide you've already wasted enough on liquor."
?CND11:	PRINTI	"You pick out a "
	PRINTD	SCOTCH
	CALL	TOO-POOR,22,SCOTCH
	ZERO?	STACK \TRUE
	MOVE	SCOTCH,PLAYER
	FCLEAR	SCOTCH,TRYTAKEBIT
	FCLEAR	SCOTCH,NDESCBIT
	CALL2	DEBIT,22
	PRINTR	"."
?ELS10:	EQUAL?	HERE,EZZIS-BAR,BAR /?THN25
	EQUAL?	HERE,BURGER-MEISTER \?ELS24
	EQUAL?	SYEAR,2071 \?ELS24
?THN25:	CALL	PERFORM,V?BUY,OTHER-LIQUOR
	RTRUE	
?ELS24:	CALL2	CANT-BUY,SCOTCH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DRINK,V?OPEN,V?TAKE \?ELS32
	FSET?	SCOTCH,TRYTAKEBIT \?ELS32
	CALL	PERFORM,V?TAKE,LIQUOR
	RTRUE	
?ELS32:	EQUAL?	PRSA,V?DRINK,V?OPEN \?ELS36
	CALL1	IN-APARTMENT?
	ZERO?	STACK \?THN42
	ZERO?	MITCHELL-RAID-FLAG /?ELS41
?THN42:	PRINTR	"You open the bottle, take a swig, and close it again."
?ELS41:	PRINTR	"Jill would kill you if you came home drunk."
?ELS36:	EQUAL?	PRSA,V?CLOSE \?ELS51
	PRINTR	"It is."
?ELS51:	EQUAL?	PRSA,V?READ \FALSE
	PRINTR	"""Hampton Scotch, 120 Proof"""


	.FUNCT	BEER-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,EZZIS-BAR,BAR,BURGER-MEISTER \?ELS10
	CALL2	VISIBLE?,BEER
	ZERO?	STACK /?CND11
	PRINTR	"You haven't finished your last one."
?CND11:	PRINTI	"You give your card to the bartender"
	CALL	TOO-POOR,8,BEER
	ZERO?	STACK \TRUE
	MOVE	BEER,HERE
	CALL2	DEBIT,8
	PRINTR	". He gives you a tall, foamy mug of beer."
?ELS10:	EQUAL?	HERE,LIQUOR-STORE \?ELS24
	PRINTR	"The clerk says, ""Sorry, we don't usually got none."""
?ELS24:	EQUAL?	HERE,ROYS-PAGODA \?ELS28
	CALL	PERFORM,V?BUY,LIQUOR
	RTRUE	
?ELS28:	CALL2	CANT-BUY,BEER
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THROW \?ELS32
	PRINTR	"You'd probably get thrown out."
?ELS32:	EQUAL?	PRSA,V?DRINK \FALSE
	MOVE	BEER,LOCAL-GLOBALS
	PRINTR	"You down the brew, and the bartender clears away the empty."


	.FUNCT	LIQUOR-F
	EQUAL?	PRSA,V?BUY \?ELS5
	EQUAL?	HERE,LIQUOR-STORE \?ELS10
	CALL	PERFORM,V?BUY,SCOTCH
	RTRUE	
?ELS10:	EQUAL?	HERE,EZZIS-BAR,BAR /?THN13
	EQUAL?	HERE,BURGER-MEISTER \?ELS12
	EQUAL?	SYEAR,2071 \?ELS12
?THN13:	CALL	PERFORM,V?BUY,BEER
	RTRUE	
?ELS12:	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS18
	PRINTR	"After a quick glance at the drink prices and the prices on the wine list, you decide to abstain."
?ELS18:	EQUAL?	HERE,ROYS-PAGODA \?ELS22
	PRINTR	"Roy's has no liquor license."
?ELS22:	CALL2	CANT-BUY,OTHER-LIQUOR
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTR	"You haven't paid for it!"


	.FUNCT	OTHER-LIQUOR-F
	EQUAL?	PRSA,V?BUY \FALSE
	EQUAL?	HERE,LIQUOR-STORE \?ELS10
	SET	'P-IT-OBJECT,SCOTCH
	PRINTR	"You look for some, but they seem to be all out. The clerk recommends a cheap brand of scotch that's on sale."
?ELS10:	EQUAL?	HERE,EZZIS-BAR,BAR /?THN15
	EQUAL?	HERE,BURGER-MEISTER \?ELS14
	EQUAL?	SYEAR,2071 \?ELS14
?THN15:	PRINTR	"The bartender tells you that they're all out, recommending beer instead."
?ELS14:	EQUAL?	HERE,SIMONS,THE-COACHMAN,ROYS-PAGODA \?ELS22
	CALL	PERFORM,V?BUY,LIQUOR
	RTRUE	
?ELS22:	CALL2	CANT-BUY,OTHER-LIQUOR
	RSTACK	


	.FUNCT	TUBE-STATION-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,RED-TUBECAR,BROWN-TUBECAR \?ELS10
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS10:	FSET?	HERE,TUBEBIT \?ELS12
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS12:	CALL	GLOBAL-IN?,TUBE-STATION,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,RED-TUBECAR,BROWN-TUBECAR \?ELS23
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS23:	FSET?	HERE,TUBEBIT \?ELS25
	CALL2	DO-WALK,P?UP
	RSTACK	
?ELS25:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \?ELS31
	FSET?	HERE,TUBEBIT \?ELS36
	CALL1	V-LOOK
	RSTACK	
?ELS36:	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"Like the entire Tube system, the station is closed down."
?ELS31:	EQUAL?	PRSA,V?SMELL \FALSE
	EQUAL?	HERE,WICKER-AND-RIVER \FALSE
	EQUAL?	SYEAR,2071 /FALSE
	CALL	PERFORM,V?SMELL,STAIRS
	RTRUE	


	.FUNCT	TUBES-ENTER-F
	EQUAL?	SYEAR,2071 \?ELS5
	CALL2	SCORE,32
	PRINTI	"The Tube system closed five years ago!"
	CRLF	
	RFALSE	
?ELS5:	EQUAL?	SYEAR,2051,2061 \?ELS9
	LESS?	STIME,420 /?THN12
	GRTR?	STIME,1250 \?ELS9
?THN12:	PRINTI	"As usual, the Tubes have closed for curfew."
	CRLF	
	RFALSE	
?ELS9:	EQUAL?	HERE,HALLEY-PARK-WEST \?ELS17
	RETURN	TUBE-AT-PARK
?ELS17:	EQUAL?	HERE,ROCKVIL-STADIUM \?ELS19
	RETURN	TUBE-AT-STADIUM
?ELS19:	EQUAL?	HERE,SKYBUS-TERMINAL \?ELS21
	RETURN	TUBE-JUNCTION
?ELS21:	EQUAL?	HERE,ELM-AND-UNIVERSITY \?ELS23
	RETURN	TUBE-AT-UNIVERSITY
?ELS23:	EQUAL?	HERE,ELM-AND-RIVER \?ELS25
	RETURN	TUBE-AT-HEIMAN
?ELS25:	EQUAL?	HERE,BODANSKI-SQUARE \?ELS27
	RETURN	TUBE-AT-BODANSKI
?ELS27:	EQUAL?	HERE,TERMINAL \?ELS29
	RETURN	TUBE-AT-AIRPORT
?ELS29:	EQUAL?	HERE,WICKER-AND-RIVER \?ELS31
	RETURN	TUBE-AT-FACTORY
?ELS31:	PRINTI	"Bug #5X."
	CRLF	
	RFALSE	


	.FUNCT	TUBE-STATION-DESC,BROWN=0
	PRINTI	"You are on a platform between two sets of tracks which lie to the "
	ZERO?	BROWN /?ELS5
	PRINTI	"northwest and southeast"
	JUMP	?CND3
?ELS5:	PRINTI	"northeast and southwest"
?CND3:	PRINTI	". On the wall is a "
	ZERO?	BROWN /?ELS17
	PRINTI	"brown"
	JUMP	?CND15
?ELS17:	PRINTI	"red"
?CND15:	PRINTI	" sign which reads:"
	CRLF	
	CALL	PERFORM,V?READ,TUBE-SIGN
	PRINTI	"A stairway leads up out of the station."
	RTRUE	


	.FUNCT	DEBARK
	PRINTI	"he doors open and "
	LESS?	STIME,360 \?CND3
	PRINTI	"a few "
?CND3:	PRINTR	"people begin boarding and debarking."


	.FUNCT	RED-TUBE-STATION-F,RARG,X=0
	EQUAL?	RARG,M-LOOK \?ELS5
	CALL1	TUBE-STATION-DESC
	RSTACK	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	IN?	RED-TUBECAR-OBJECT,HERE \FALSE
	EQUAL?	PRSA,V?SAVE,V?LOOK \?ELS12
	SET	'X,TRUE-VALUE
	JUMP	?CND10
?ELS12:	EQUAL?	HERE,L-HERE /?CND10
	SET	'X,TRUE-VALUE
?CND10:	ZERO?	X /FALSE
	PRINT	TUBECAR-WAITING
	ZERO?	RED-NORTHBOUND /?ELS25
	PRINTI	"northeast"
	JUMP	?CND23
?ELS25:	PRINTI	"southwest"
?CND23:	PRINTR	"."


	.FUNCT	BROWN-TUBE-STATION-F,RARG,X=0
	EQUAL?	RARG,M-LOOK \?ELS5
	CALL2	TUBE-STATION-DESC,TRUE-VALUE
	RSTACK	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	IN?	BROWN-TUBECAR-OBJECT,HERE \FALSE
	EQUAL?	PRSA,V?SAVE,V?LOOK \?ELS12
	SET	'X,TRUE-VALUE
	JUMP	?CND10
?ELS12:	EQUAL?	HERE,L-HERE /?CND10
	SET	'X,TRUE-VALUE
?CND10:	ZERO?	X /FALSE
	PRINT	TUBECAR-WAITING
	ZERO?	BROWN-NORTHBOUND /?ELS25
	PRINTI	"southeast"
	JUMP	?CND23
?ELS25:	PRINTI	"northwest"
?CND23:	PRINTR	"."


	.FUNCT	TUBECAR-AT-JUNCTION-ENTER-F
	CALL2	VISIBLE?,RED-TUBECAR-OBJECT
	ZERO?	STACK /?ELS5
	CALL2	VISIBLE?,BROWN-TUBECAR-OBJECT
	ZERO?	STACK /?ELS5
	PRINTI	"At the moment, there's more than one tubecar waiting to be boarded."
	CRLF	
	RFALSE	
?ELS5:	CALL2	VISIBLE?,RED-TUBECAR-OBJECT
	ZERO?	STACK /?ELS11
	MOVE	RED-TUBECAR-OBJECT,RED-TUBECAR
	MOVE	RED-TUBECAR-DOOR,RED-TUBECAR
	RETURN	RED-TUBECAR
?ELS11:	CALL2	VISIBLE?,BROWN-TUBECAR-OBJECT
	ZERO?	STACK /?ELS13
	MOVE	BROWN-TUBECAR-OBJECT,BROWN-TUBECAR
	MOVE	BROWN-TUBECAR-DOOR,BROWN-TUBECAR
	RETURN	BROWN-TUBECAR
?ELS13:	PRINTI	"There are no tubecars in the station at the moment."
	CRLF	
	RFALSE	


	.FUNCT	TUBE-JUNCTION-F,RARG,RED=0,BROWN=0,BOTH=0,X=0
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"You are on a central platform between four sets of tracks. On the wall is a sign, in brown and red:"
	CRLF	
	CALL	PERFORM,V?READ,TUBE-SIGN
	PRINTI	"Tracks for the Brownline tubecars lie to the southeast and northwest. Another pair of tracks, for the Redline, lie down some steps to the southwest and northeast. A stairway leads up out of the station."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	PRSA,V?SAVE,V?LOOK \?ELS14
	SET	'X,TRUE-VALUE
	JUMP	?CND12
?ELS14:	EQUAL?	HERE,L-HERE /?CND12
	SET	'X,TRUE-VALUE
?CND12:	ZERO?	X /FALSE
	IN?	RED-TUBECAR-OBJECT,HERE \?CND20
	SET	'RED,TRUE-VALUE
?CND20:	IN?	BROWN-TUBECAR-OBJECT,HERE \?CND23
	SET	'BROWN,TRUE-VALUE
	ZERO?	RED /?CND23
	SET	'BOTH,TRUE-VALUE
?CND23:	ZERO?	RED \?ELS34
	ZERO?	BROWN /FALSE
?ELS34:	ZERO?	BOTH /?ELS41
	PRINTI	"Tubecars are"
	JUMP	?CND39
?ELS41:	PRINTI	"A tubecar is"
?CND39:	PRINTI	" sitting on the tracks to the "
	ZERO?	BROWN /?CND51
	ZERO?	BROWN-NORTHBOUND /?ELS57
	PRINTI	"southeast"
	JUMP	?CND51
?ELS57:	PRINTI	"northwest"
?CND51:	ZERO?	BOTH /?CND65
	PRINTI	" and "
?CND65:	ZERO?	RED /?CND71
	ZERO?	RED-NORTHBOUND /?ELS77
	PRINTI	"northeast"
	JUMP	?CND71
?ELS77:	PRINTI	"southwest"
?CND71:	PRINTR	"."


	.FUNCT	RED-TUBECAR-OBJECT-F
	EQUAL?	PRSA,V?BOARD,V?THROUGH \?ELS5
	EQUAL?	HERE,RED-TUBECAR \?ELS10
	PRINTR	"You've already done that."
?ELS10:	ZERO?	RED-NORTHBOUND /?ELS14
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS14:	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS19
	EQUAL?	HERE,RED-TUBECAR \?ELS24
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS24:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS19:	EQUAL?	PRSA,V?WAIT-FOR \FALSE
	CALL2	V-WAIT,60
	RSTACK	


	.FUNCT	RED-TUBECAR-DOOR-F
	EQUAL?	PRSA,V?THROUGH \?ELS5
	EQUAL?	HERE,RED-TUBECAR \?ELS10
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS10:	CALL	PERFORM,V?BOARD,RED-TUBECAR-OBJECT
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?CLOSE,V?OPEN \FALSE
	PRINTR	"You can't --  the doors open and close automatically."


	.FUNCT	BROWN-TUBECAR-OBJECT-F
	EQUAL?	PRSA,V?BOARD,V?THROUGH \?ELS5
	EQUAL?	HERE,BROWN-TUBECAR \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	ZERO?	BROWN-NORTHBOUND /?ELS14
	CALL2	DO-WALK,P?SE
	RSTACK	
?ELS14:	CALL2	DO-WALK,P?NW
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS19
	EQUAL?	HERE,BROWN-TUBECAR \?ELS24
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS24:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS19:	EQUAL?	PRSA,V?WAIT-FOR \FALSE
	CALL2	V-WAIT,60
	RSTACK	


	.FUNCT	TUBECAR-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is a typical tubecar, "
	EQUAL?	SYEAR,2041 \?ELS10
	PRINTI	"clean and free of graffiti"
	JUMP	?CND8
?ELS10:	EQUAL?	SYEAR,2051 \?ELS14
	CALL2	SCORE,114
	PRINTI	"moderately clean and with a splash of graffiti"
	JUMP	?CND8
?ELS14:	CALL2	SCORE,115
	PRINTI	"grimy and covered with layers of graffiti"
?CND8:	PRINTI	". The doors of the car are "
	EQUAL?	HERE,RED-TUBECAR \?ELS31
	FSET?	RED-TUBECAR-DOOR,OPENBIT /?THN28
?ELS31:	EQUAL?	HERE,BROWN-TUBECAR \?ELS27
	FSET?	BROWN-TUBECAR-DOOR,OPENBIT \?ELS27
?THN28:	PRINTI	"open."
	RTRUE	
?ELS27:	PRINTI	"closed."
	RTRUE	


	.FUNCT	BROWN-TUBECAR-DOOR-F
	EQUAL?	PRSA,V?THROUGH \?ELS5
	EQUAL?	HERE,BROWN-TUBECAR \?ELS10
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS10:	CALL	PERFORM,V?BOARD,BROWN-TUBECAR-OBJECT
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?CLOSE,V?OPEN \FALSE
	CALL	PERFORM,V?OPEN,RED-TUBECAR-DOOR
	RTRUE	


	.FUNCT	TUBE-SIGN-F,CURRENT-STATION
	EQUAL?	HERE,RED-TUBECAR \?ELS3
	GET	RED-TABLE,RED-POINTER >CURRENT-STATION
	JUMP	?CND1
?ELS3:	EQUAL?	HERE,BROWN-TUBECAR \?ELS5
	GET	BROWN-TABLE,BROWN-POINTER >CURRENT-STATION
	JUMP	?CND1
?ELS5:	SET	'CURRENT-STATION,FALSE-VALUE
?CND1:	EQUAL?	PRSA,V?READ \FALSE
	EQUAL?	TUBE-AT-STADIUM,HERE,CURRENT-STATION \?ELS17
	PRINTI	"      "
	PRINTD	ROCKVIL-STADIUM
	CRLF	
	PRINTR	"  (Red Tubeline Terminus)"
?ELS17:	EQUAL?	TUBE-AT-PARK,HERE,CURRENT-STATION \?ELS23
	PRINTR	"  Halley Park
  Rockvil Zoo"
?ELS23:	EQUAL?	TUBE-AT-HEIMAN,HERE,CURRENT-STATION \?ELS27
	PRINTI	"  Elm and River Street
    ("
	PRINTD	HEIMAN-VILLAGE
	PRINTR	")"
?ELS27:	EQUAL?	TUBE-AT-FACTORY,HERE,CURRENT-STATION \?ELS33
	PRINTR	"  Wicker Drive and River Street
     (Red Tubeline Terminus)
        (Omni-Fabb Plant)"
?ELS33:	EQUAL?	TUBE-AT-AIRPORT,HERE,CURRENT-STATION \?ELS37
	PRINTR	"      Airport Terminals
  (Brown Tubeline Terminus)"
?ELS37:	EQUAL?	TUBE-AT-BODANSKI,HERE,CURRENT-STATION \?ELS41
	EQUAL?	SYEAR,2041 /?CND42
	PRINTI	"   "
?CND42:	PRINTI	"  "
	PRINTD	BODANSKI-SQUARE
	CRLF	
	EQUAL?	SYEAR,2041 \?ELS53
	PRINTR	"  (Train Station)"
?ELS53:	PRINTR	"  (Church of God's Word)"
?ELS41:	EQUAL?	TUBE-AT-UNIVERSITY,HERE,CURRENT-STATION \?ELS61
	PRINTI	"  Elm Street and University Avenue"
	CRLF	
	CALL2	PRINT-SPACES,12
	PRINTR	"(Rockvil U)
     (Brown Tubeline Terminus)"
?ELS61:	EQUAL?	TUBE-JUNCTION,HERE,CURRENT-STATION \?ELS67
	CALL2	PRINT-SPACES,10
	PRINTD	SKYBUS-TERMINAL
	CRLF	
	PRINTR	"  (Transfer Between Brown and Red)"
?ELS67:	CALL1	MOBY-VERB?
	ZERO?	STACK \FALSE
	CALL2	CANT-SEE,TUBE-SIGN
	RSTACK	


	.FUNCT	I-RED-TUBE,OLD-WINNER
	ZERO?	RED-TUBECAR-IN-STATION /?ELS5
	SET	'RED-TUBECAR-IN-STATION,FALSE-VALUE
	FCLEAR	RED-TUBECAR-DOOR,OPENBIT
	EQUAL?	SYEAR,2041 \?ELS9
	CALL	QUEUE,I-RED-TUBE,4
	JUMP	?CND7
?ELS9:	EQUAL?	SYEAR,2051 \?ELS11
	CALL	QUEUE,I-RED-TUBE,6
	JUMP	?CND7
?ELS11:	CALL	QUEUE,I-RED-TUBE,8
?CND7:	MOVE	RED-TUBECAR-OBJECT,RED-TUBECAR
	MOVE	RED-TUBECAR-DOOR,RED-TUBECAR
	EQUAL?	HERE,RED-TUBECAR \?CND14
	ZERO?	RECORDING /?CND14
	PUT	RECORDING-TABLE,8,1
?CND14:	GET	RED-TABLE,RED-POINTER
	EQUAL?	HERE,RED-TUBECAR,STACK \FALSE
	CRLF	
	PRINTI	"The "
	PRINTD	RED-TUBECAR-OBJECT
	PRINTI	"'s doors slide shut, and it glides away from the station"
	EQUAL?	RED-POINTER,0,4 \?CND28
	PRINTI	" in the same direction that it came from"
?CND28:	PRINTR	"."
?ELS5:	ZERO?	RED-NORTHBOUND /?ELS41
	DEC	'RED-POINTER
	JUMP	?CND39
?ELS41:	INC	'RED-POINTER
?CND39:	ZERO?	RED-POINTER \?ELS47
	SET	'RED-NORTHBOUND,FALSE-VALUE
	JUMP	?CND45
?ELS47:	EQUAL?	RED-POINTER,4 \?CND45
	SET	'RED-NORTHBOUND,TRUE-VALUE
?CND45:	FSET	RED-TUBECAR-DOOR,OPENBIT
	SET	'RED-TUBECAR-IN-STATION,TRUE-VALUE
	EQUAL?	SYEAR,2041 \?ELS52
	CALL	QUEUE,I-RED-TUBE,2
	JUMP	?CND50
?ELS52:	EQUAL?	SYEAR,2051 \?ELS54
	CALL	QUEUE,I-RED-TUBE,3
	JUMP	?CND50
?ELS54:	CALL	QUEUE,I-RED-TUBE,4
?CND50:	EQUAL?	HERE,RED-TUBECAR \?ELS61
	ZERO?	RECORDING /?CND62
	PUT	RECORDING-TABLE,8,1
?CND62:	CRLF	
	PRINTI	"The tubecar glides into a station, and you can make out a sign reading:"
	CRLF	
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?READ,TUBE-SIGN
	SET	'WINNER,OLD-WINNER
	PRINTR	"The car comes to a stop and the doors slide open."
?ELS61:	GET	RED-TABLE,RED-POINTER
	MOVE	RED-TUBECAR-OBJECT,STACK
	GET	RED-TABLE,RED-POINTER
	MOVE	RED-TUBECAR-DOOR,STACK
	GET	RED-TABLE,RED-POINTER
	EQUAL?	HERE,STACK \FALSE
	SET	'P-IT-OBJECT,RED-TUBECAR-OBJECT
	CRLF	
	PRINTI	"A "
	PRINTD	RED-TUBECAR-OBJECT
	PRINTI	", marked """
	EQUAL?	HERE,TUBE-AT-FACTORY \?ELS83
	PRINTI	"Omni-Fabb Plant"
	JUMP	?CND81
?ELS83:	ZERO?	RED-NORTHBOUND \?THN88
	EQUAL?	HERE,TUBE-AT-STADIUM \?ELS87
?THN88:	PRINTD	ROCKVIL-STADIUM
	JUMP	?CND81
?ELS87:	PRINTI	"Omni-Fabb Plant"
?CND81:	PRINTI	""" whooshes into the station on the "
	ZERO?	RED-NORTHBOUND /?ELS98
	PRINTI	"northeast"
	JUMP	?CND96
?ELS98:	PRINTI	"southwest"
?CND96:	PRINTI	" set of tracks. "
	EQUAL?	HERE,TUBE-AT-STADIUM,TUBE-AT-FACTORY \?ELS110
	PRINTI	"As the sign changes to """
	EQUAL?	HERE,TUBE-AT-STADIUM \?ELS115
	PRINTI	"Omni-Fabb Plant"
	JUMP	?CND113
?ELS115:	PRINTD	ROCKVIL-STADIUM
?CND113:	PRINTI	","" t"
	JUMP	?CND108
?ELS110:	PRINTI	"T"
?CND108:	CALL1	DEBARK
	RSTACK	


	.FUNCT	RED-TUBECAR-ENTER-F
	EQUAL?	PRSO,P?IN \?ELS5
	ZERO?	RED-TUBECAR-IN-STATION /?ELS5
	GET	RED-TABLE,RED-POINTER
	EQUAL?	HERE,STACK \?ELS5
	MOVE	RED-TUBECAR-OBJECT,RED-TUBECAR
	MOVE	RED-TUBECAR-DOOR,RED-TUBECAR
	RETURN	RED-TUBECAR
?ELS5:	EQUAL?	PRSO,P?NE \?ELS9
	ZERO?	RED-NORTHBOUND /?ELS9
	ZERO?	RED-TUBECAR-IN-STATION /?ELS9
	GET	RED-TABLE,RED-POINTER
	EQUAL?	HERE,STACK \?ELS9
	MOVE	RED-TUBECAR-OBJECT,RED-TUBECAR
	MOVE	RED-TUBECAR-DOOR,RED-TUBECAR
	RETURN	RED-TUBECAR
?ELS9:	EQUAL?	PRSO,P?SW \?ELS13
	ZERO?	RED-NORTHBOUND \?ELS13
	ZERO?	RED-TUBECAR-IN-STATION /?ELS13
	GET	RED-TABLE,RED-POINTER
	EQUAL?	HERE,STACK \?ELS13
	MOVE	RED-TUBECAR-OBJECT,RED-TUBECAR
	MOVE	RED-TUBECAR-DOOR,RED-TUBECAR
	RETURN	RED-TUBECAR
?ELS13:	PRINTI	"There's no tubecar there at the moment."
	CRLF	
	RFALSE	


	.FUNCT	RED-TUBECAR-EXIT-F
	FSET?	RED-TUBECAR-DOOR,OPENBIT \?ELS5
	GET	RED-TABLE,RED-POINTER
	MOVE	RED-TUBECAR-OBJECT,STACK
	GET	RED-TABLE,RED-POINTER
	MOVE	RED-TUBECAR-DOOR,STACK
	GET	RED-TABLE,RED-POINTER
	RSTACK	
?ELS5:	PRINTI	"You can't leave the tubecar between stations!"
	CRLF	
	RFALSE	


	.FUNCT	I-BROWN-TUBE,OLD-WINNER
	ZERO?	BROWN-TUBECAR-IN-STATION /?ELS5
	SET	'BROWN-TUBECAR-IN-STATION,FALSE-VALUE
	FCLEAR	BROWN-TUBECAR-DOOR,OPENBIT
	MOVE	BROWN-TUBECAR-OBJECT,BROWN-TUBECAR
	MOVE	BROWN-TUBECAR-DOOR,BROWN-TUBECAR
	EQUAL?	HERE,BROWN-TUBECAR \?CND7
	ZERO?	RECORDING /?CND7
	PUT	RECORDING-TABLE,8,1
?CND7:	EQUAL?	SYEAR,2041 \?ELS14
	CALL	QUEUE,I-BROWN-TUBE,4
	JUMP	?CND12
?ELS14:	EQUAL?	SYEAR,2051 \?ELS16
	CALL	QUEUE,I-BROWN-TUBE,6
	JUMP	?CND12
?ELS16:	CALL	QUEUE,I-BROWN-TUBE,8
?CND12:	GET	BROWN-TABLE,BROWN-POINTER
	EQUAL?	HERE,BROWN-TUBECAR,STACK \FALSE
	CRLF	
	PRINTI	"The doors of the "
	PRINTD	BROWN-TUBECAR-OBJECT
	PRINTI	" slide shut, and it glides out of the station"
	EQUAL?	BROWN-POINTER,0,3 \?CND28
	PRINTI	" in the same direction that it came from"
?CND28:	PRINTR	"."
?ELS5:	ZERO?	BROWN-NORTHBOUND /?ELS41
	DEC	'BROWN-POINTER
	JUMP	?CND39
?ELS41:	INC	'BROWN-POINTER
?CND39:	ZERO?	BROWN-POINTER \?ELS47
	SET	'BROWN-NORTHBOUND,FALSE-VALUE
	JUMP	?CND45
?ELS47:	EQUAL?	BROWN-POINTER,3 \?CND45
	SET	'BROWN-NORTHBOUND,TRUE-VALUE
?CND45:	FSET	BROWN-TUBECAR-DOOR,OPENBIT
	SET	'BROWN-TUBECAR-IN-STATION,TRUE-VALUE
	EQUAL?	SYEAR,2041 \?ELS52
	CALL	QUEUE,I-BROWN-TUBE,2
	JUMP	?CND50
?ELS52:	EQUAL?	SYEAR,2051 \?ELS54
	CALL	QUEUE,I-BROWN-TUBE,3
	JUMP	?CND50
?ELS54:	CALL	QUEUE,I-BROWN-TUBE,4
?CND50:	EQUAL?	HERE,BROWN-TUBECAR \?ELS61
	ZERO?	RECORDING /?CND62
	PUT	RECORDING-TABLE,8,1
?CND62:	CRLF	
	PRINTI	"The tubecar glides into a station, and you can make out a sign reading:"
	CRLF	
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?READ,TUBE-SIGN
	SET	'WINNER,OLD-WINNER
	PRINTR	"The car comes to a stop and the doors slide open."
?ELS61:	GET	BROWN-TABLE,BROWN-POINTER
	MOVE	BROWN-TUBECAR-OBJECT,STACK
	GET	BROWN-TABLE,BROWN-POINTER
	MOVE	BROWN-TUBECAR-DOOR,STACK
	GET	BROWN-TABLE,BROWN-POINTER
	EQUAL?	HERE,STACK \FALSE
	SET	'P-IT-OBJECT,BROWN-TUBECAR-OBJECT
	CRLF	
	PRINTI	"A "
	PRINTD	BROWN-TUBECAR-OBJECT
	PRINTI	", marked """
	EQUAL?	HERE,TUBE-AT-UNIVERSITY \?ELS83
	PRINTI	"University"
	JUMP	?CND81
?ELS83:	ZERO?	BROWN-NORTHBOUND \?THN88
	EQUAL?	HERE,TUBE-AT-AIRPORT \?ELS87
?THN88:	PRINTI	"Airport"
	JUMP	?CND81
?ELS87:	PRINTI	"University"
?CND81:	PRINTI	""" whooshes into the station on the "
	ZERO?	BROWN-NORTHBOUND /?ELS100
	PRINTI	"southeast"
	JUMP	?CND98
?ELS100:	PRINTI	"northwest"
?CND98:	PRINTI	" set of tracks. "
	EQUAL?	HERE,TUBE-AT-AIRPORT,TUBE-AT-UNIVERSITY \?ELS112
	PRINTI	"As the sign changes to """
	EQUAL?	HERE,TUBE-AT-AIRPORT \?ELS117
	PRINTI	"University"
	JUMP	?CND115
?ELS117:	PRINTI	"Airport"
?CND115:	PRINTI	","" t"
	JUMP	?CND110
?ELS112:	PRINTI	"T"
?CND110:	CALL1	DEBARK
	RSTACK	


	.FUNCT	BROWN-TUBECAR-ENTER-F
	EQUAL?	PRSO,P?IN \?ELS5
	GET	BROWN-TABLE,BROWN-POINTER
	EQUAL?	HERE,STACK \?ELS10
	ZERO?	BROWN-TUBECAR-IN-STATION /?ELS10
	MOVE	BROWN-TUBECAR-OBJECT,BROWN-TUBECAR
	MOVE	BROWN-TUBECAR-DOOR,BROWN-TUBECAR
	RETURN	BROWN-TUBECAR
?ELS10:	PRINTI	"There's no train here at the moment."
	CRLF	
	RFALSE	
?ELS5:	EQUAL?	PRSO,P?SE \?ELS18
	ZERO?	BROWN-NORTHBOUND /?ELS18
	ZERO?	BROWN-TUBECAR-IN-STATION /?ELS18
	GET	BROWN-TABLE,BROWN-POINTER
	EQUAL?	HERE,STACK \?ELS18
	MOVE	BROWN-TUBECAR-OBJECT,BROWN-TUBECAR
	MOVE	BROWN-TUBECAR-DOOR,BROWN-TUBECAR
	RETURN	BROWN-TUBECAR
?ELS18:	EQUAL?	PRSO,P?NW \?ELS22
	ZERO?	BROWN-NORTHBOUND \?ELS22
	ZERO?	BROWN-TUBECAR-IN-STATION /?ELS22
	GET	BROWN-TABLE,BROWN-POINTER
	EQUAL?	HERE,STACK \?ELS22
	MOVE	BROWN-TUBECAR-OBJECT,BROWN-TUBECAR
	MOVE	BROWN-TUBECAR-DOOR,BROWN-TUBECAR
	RETURN	BROWN-TUBECAR
?ELS22:	PRINTI	"There's no tubecar there at the moment."
	CRLF	
	RFALSE	


	.FUNCT	BROWN-TUBECAR-EXIT-F
	FSET?	BROWN-TUBECAR-DOOR,OPENBIT \?ELS5
	GET	BROWN-TABLE,BROWN-POINTER
	MOVE	BROWN-TUBECAR-OBJECT,STACK
	GET	BROWN-TABLE,BROWN-POINTER
	MOVE	BROWN-TUBECAR-DOOR,STACK
	GET	BROWN-TABLE,BROWN-POINTER
	RSTACK	
?ELS5:	PRINTI	"You can't leave the tubecar between stations!"
	CRLF	
	RFALSE	


	.FUNCT	I-CITY-NOISES
	RANDOM	7
	ADD	6,STACK
	CALL	QUEUE,I-CITY-NOISES,STACK
	FSET?	HERE,STREETBIT \FALSE
	EQUAL?	LIGHT-LEVEL,3 \FALSE
	FSET?	HERE,BADAREABIT /FALSE
	EQUAL?	HERE,AIRPORT-ENTRANCE,BASE-GATE,INTERCHANGE /FALSE
	EQUAL?	SYEAR,2081 /FALSE
	RANDOM	100
	LESS?	75,STACK \FALSE
	EQUAL?	HERE,ROCKVIL-UNIVERSITY \?ELS9
	EQUAL?	SYEAR,2061,2071 /FALSE
?ELS9:	CRLF	
	SET	'FOLLOW-FLAG,9
	CALL	QUEUE,I-UNFOLLOW,2
	EQUAL?	SYEAR,2041 \?ELS16
	CALL2	PICK-ONE,2041-CITY-NOISES
	PRINT	STACK
	CRLF	
	RFALSE	
?ELS16:	EQUAL?	SYEAR,2051 \?ELS20
	CALL2	PICK-ONE,2051-CITY-NOISES
	PRINT	STACK
	CRLF	
	RFALSE	
?ELS20:	EQUAL?	SYEAR,2061 \?ELS24
	CALL2	PICK-ONE,2061-CITY-NOISES
	PRINT	STACK
	CRLF	
	RFALSE	
?ELS24:	EQUAL?	SYEAR,2071 \FALSE
	CALL2	PICK-ONE,2071-CITY-NOISES
	PRINT	STACK
	CRLF	
	RFALSE	


	.FUNCT	I-MUG,X
	SUB	3,LIGHT-LEVEL
	ADD	STACK,1
	MUL	STACK,10 >X
	FSET?	HERE,OUTSIDEBIT /?ELS3
	SET	'X,0
	JUMP	?CND1
?ELS3:	EQUAL?	HERE,ATHLETIC-FIELD \?ELS5
	SET	'X,0
	JUMP	?CND1
?ELS5:	FSET?	HERE,BADAREABIT /?CND1
	FSET?	HERE,PARKBIT /?CND1
	DIV	X,3 >X
?CND1:	RANDOM	100
	LESS?	X,STACK /?ELS14
	CALL2	SCORE,125
	CALL2	INCREMENT-TIME,14
	SET	'MUGGED,TRUE-VALUE
	CRLF	
	PRINTI	"CRACK! Something hits you from behind. As you crumple to the ground, you catch a glimpse of someone wielding a metal bar. Unknown minutes later, your head clears, and you stagger slowly to your feet"
	FIRST?	PLAYER \?CND17
	PRINTI	". Everything you were carrying is gone"
	CALL	ROB,PLAYER,LOCAL-GLOBALS
?CND17:	PRINTR	"."
?ELS14:	CALL	QUEUE,I-MUG,7
	RFALSE	


	.FUNCT	KEY-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"It's the key to the doors of your apartment"
	EQUAL?	SYEAR,2061,2071 \?CND8
	PRINTI	", "
	EQUAL?	SYEAR,2061 \?ELS15
	PRINTI	"slightly"
	JUMP	?CND13
?ELS15:	PRINTI	"very"
?CND13:	PRINTI	" worn with age"
?CND8:	PRINTR	"."


	.FUNCT	RATION-CARD-F
	EQUAL?	SYEAR,2071 \FALSE
	EQUAL?	PRSA,V?SHOW,V?GIVE \FALSE
	EQUAL?	PRSI,SPEAR-CARRIER \FALSE
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \FALSE
	CALL2	INT,I-FOODVILLE
	PUT	STACK,0,0
	FSET?	SOY-PATTY,TOUCHBIT \?ELS12
	PRINTI	"The clerk looks incensed and sets off a loud buzzer. ""You lousy cheater,"" he screams, ""you've already had your ration for this period!"" Two policemen, wearing patches depicting the familiar black radar symbol of the Church, grab you and drag you off."
	CRLF	
	CRLF	
	RANDOM	10
	ADD	30,STACK
	CALL	QUEUE,I-JAIL,STACK
	CALL2	GOTO,JAIL-CELL
	RSTACK	
?ELS12:	MOD	SDATE,3
	EQUAL?	STACK,2 \?ELS16
	MOVE	SOY-PATTY,PLAYER
	FSET	SOY-PATTY,TOUCHBIT
	MOVE	RATION-CARD,PLAYER
	PRINTR	"The clerk electronically ""punches"" your card, hands it back, then rudely thrusts a smelly package in your face. ""Move along, old man. There's others waitin' ya know."""
?ELS16:	CALL2	SCORE,135
	MOVE	RATION-CARD,PLAYER
	PRINTI	"The clerk tosses your card back at you in disgust. ""It's not your day, you senile idiot."" He motions to a bouncer, who pushes you roughly out the door."
	CRLF	
	CRLF	
	EQUAL?	HERE,FOODVILLE-1 \?ELS27
	CALL2	GOTO,SOUTHWAY-AND-PARK
	RSTACK	
?ELS27:	CALL2	GOTO,MAIN-AND-WICKER
	RSTACK	


	.FUNCT	SLOT-F
	EQUAL?	HERE,BODANSKI-SQUARE \?ELS5
	EQUAL?	SYEAR,2061,2071 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,SLOT
	RSTACK	
?ELS5:	EQUAL?	HERE,JOYBOOTH \?ELS9
	EQUAL?	SYEAR,2071 \?ELS9
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS9
	CALL2	CANT-SEE,SLOT
	RSTACK	
?ELS9:	EQUAL?	PRSA,V?PUT \?ELS13
	EQUAL?	PRSO,CREDIT-CARD \?ELS13
	MOVE	CREDIT-CARD,PLAYER
	EQUAL?	HERE,JOYBOOTH \?ELS20
	FSET?	HEADSET,WORNBIT \?ELS20
	ZERO?	JOYBOOTH-USED /?ELS25
	PRINTR	"You almost succumb and put your card in the slot again, but years of warning messages about joybooth addiction finally prevail and prevent you from going ahead with it."
?ELS25:	LESS?	CREDIT,12 \?CND23
	PRINTR	"A small ""Insufficient Credit"" light flashes incessantly for a moment."
?CND23:	SET	'JOYBOOTH-USED,TRUE-VALUE
	SUB	CREDIT,12 >CREDIT
	SET	'ELAPSED-TIME,30
	PRINTI	"A wave of warm contentment washes over you as the joybooth, and the world, recede. You barely notice as the headset probes the pleasure and imagination centers of your brain, and you feel yourself moving down a tunnel of swirling colors and lights, a warm breeze blowing in your face.

The roller coaster whooshes out of the tunnel, and you scream, not from fear but from the exhilaration of the experience. Rav, scrunched next to you in the seat, laughs and laughs and laughs and Frita laughs and laughs and hands you some cotton candy and suddenly the roller coaster is gone and the park is gone

and you're swimming in a lake of warm clear water. Birds swoop and dive overhead and land on your outstretched arms and sing little songs in your ear and dart away as Father calls from the top of the stairs that dinner's ready and you'd better be on time because it's your favorite cinnamon pie for dessert and if you're not out of the lake in five minutes we'll miss our bus and the vacation's almost over as a cloud passes in front of the sun and a chill passes over you

and you come to realize that you're "
	LOC	PLAYER
	EQUAL?	STACK,SEAT \?ELS37
	PRINTI	"sitting"
	JUMP	?CND35
?ELS37:	PRINTI	"standing"
?CND35:	PRINTR	" in a tiny, dim joybooth, shivering from imagined cold. You feel depressed that the experience has ended; an almost physical longing to return to your fantasy, to the lost innocence of a carefree childhood."
?ELS20:	EQUAL?	HERE,BODANSKI-SQUARE \?ELS47
	CALL	PERFORM,V?BUY,NEWSPAPER
	RTRUE	
?ELS47:	EQUAL?	HERE,CINEMA \?ELS49
	CALL	PERFORM,V?BUY,TICKET
	RTRUE	
?ELS49:	PRINTR	"Nothing happens."
?ELS13:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSO,RATION-CARD,DRIVERS-LICENSE \FALSE
	PRINTR	"Nothing happens."


	.FUNCT	SPEAR-CARRIER-F
	EQUAL?	WINNER,SPEAR-CARRIER \?ELS5
	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS10
	ZERO?	CLERK-WAITING /?ELS10
	CALL1	I-FOODVILLE
	RSTACK	
?ELS10:	EQUAL?	PRSA,V?YES \?ELS14
	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS14
	EQUAL?	MEAL-STATUS,1 \?ELS14
	CALL1	V-YES
	RSTACK	
?ELS14:	EQUAL?	PRSA,V?OPEN \?ELS18
	EQUAL?	PRSO,GATE \?ELS18
	CALL2	DO-WALK,P?NW
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS22
	EQUAL?	PRSO,ME \?ELS22
	EQUAL?	PRSI,MAIN-LIBRARY-OBJECT \?ELS29
	EQUAL?	HERE,MAIN-LIBRARY \?ELS29
	PRINTI	"The "
	CALL2	DPRINT,SPEAR-CARRIER
	PRINTR	" shrugs. ""It's not a bad place to work."""
?ELS29:	PRINTI	"The "
	CALL2	DPRINT,SPEAR-CARRIER
	PRINTI	" gives you an odd look."
	EQUAL?	PRSO,MINDEX \?CND38
	PRINTI	" ""It's an illegal drug."""
?CND38:	CRLF	
	RTRUE	
?ELS22:	EQUAL?	PRSA,V?SHOW \?ELS48
	EQUAL?	PRSO,GUN \?ELS48
	EQUAL?	PRSI,ME /?THN45
?ELS48:	EQUAL?	PRSA,V?SSHOW \?ELS44
	EQUAL?	PRSO,ME \?ELS44
	EQUAL?	PRSI,GUN \?ELS44
?THN45:	SET	'WINNER,PLAYER
	CALL	PERFORM,V?BUY,GUN
	SET	'WINNER,SPEAR-CARRIER
	RTRUE	
?ELS44:	EQUAL?	PRSA,V?SHOW \?ELS56
	EQUAL?	PRSO,BOOKS \?ELS56
	EQUAL?	PRSI,ME /?THN53
?ELS56:	EQUAL?	PRSA,V?SSHOW \?ELS52
	EQUAL?	PRSO,ME \?ELS52
	EQUAL?	PRSI,BOOKS \?ELS52
?THN53:	SET	'WINNER,PLAYER
	CALL	PERFORM,V?BUY,BOOKS
	SET	'WINNER,SPEAR-CARRIER
	RTRUE	
?ELS52:	EQUAL?	PRSA,V?SGIVE \?ELS60
	EQUAL?	PRSO,ME \?ELS60
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?BUY,PRSI
	SET	'WINNER,SPEAR-CARRIER
	RTRUE	
?ELS60:	EQUAL?	HERE,MAIN-LIBRARY \?ELS64
	PRINTI	"""Ssshhh!"" hisses the librarian. ""Be quiet!"""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS64:	SET	'YES-NO-FLAG,12
	CALL	QUEUE,I-YES-NO,2
	PRINTI	"""Can I help you?"""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS72
	EQUAL?	PRSA,V?WAIT-FOR \?ELS72
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	
?ELS72:	EQUAL?	PRSA,V?ASK-FOR \?ELS76
	EQUAL?	PRSI,MENU \?CND77
	SET	'PRSI,MEAL
?CND77:	EQUAL?	HERE,MAIN-LIBRARY \?ELS84
	EQUAL?	PRSI,BOOKS,BOOK \?ELS84
	CALL	PERFORM,V?TAKE,BOOKS
	RTRUE	
?ELS84:	CALL	PERFORM,V?BUY,PRSI
	RTRUE	
?ELS76:	EQUAL?	PRSA,V?GIVE \?ELS90
	EQUAL?	PRSO,CREDIT-CARD \?ELS90
	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS90
	EQUAL?	MEAL-STATUS,4 \?ELS90
	SET	'WAITER-COUNTER,0
	MOVE	CREDIT-CARD,SPEAR-CARRIER
	CALL	QUEUE,I-MEAL,9
	PRINTR	"""Thank you, sir. I'll be back shortly with your meal."""
?ELS90:	EQUAL?	PRSA,V?GIVE \?ELS96
	EQUAL?	PRSO,CREDIT-CARD \?ELS96
	GETP	SPEAR-CARRIER,P?SDESC
	EQUAL?	STACK,STR?144 \?ELS96
	PRINTI	"You wait "
	EQUAL?	SYEAR,2041 \?ELS103
	PRINTI	"a minute"
	JUMP	?CND101
?ELS103:	EQUAL?	SYEAR,2051 \?ELS107
	SET	'ELAPSED-TIME,7
	PRINTI	"several minutes"
	JUMP	?CND101
?ELS107:	SET	'ELAPSED-TIME,22
	PRINTI	"a long time"
?CND101:	PRINTR	" for a teller to become available. You finally reach the teller, and hand her your card, which she runs through a reader. Looking confused, she says ""You only have one account, so there's no transfer to be performed."""
?ELS96:	EQUAL?	PRSA,V?CALL \?ELS117
	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS117
	EQUAL?	MEAL-STATUS,1 \?ELS124
	PRINTR	"He's right here."
?ELS124:	EQUAL?	MEAL-STATUS,2 \?ELS128
	SET	'MEAL-STATUS,1
	RTRUE	
?ELS128:	CALL	PERFORM,V?BUY,MEAL
	RTRUE	
?ELS117:	EQUAL?	PRSA,V?THANK \?ELS132
	EQUAL?	HERE,BOOKSTORE \?ELS132
	FSET?	BOOK,TRYTAKEBIT /?ELS132
	PRINTR	"""No, my pleasure!"" The proprietor smiles kindly at you."
?ELS132:	EQUAL?	PRSA,V?FOLLOW \?ELS138
	EQUAL?	HERE,SIMONS,THE-COACHMAN \?ELS138
	SET	'FOLLOW-FLAG,9
	CALL	QUEUE,I-UNFOLLOW,2
	MOVE	SPEAR-CARRIER,LOCAL-GLOBALS
	CALL1	V-FOLLOW
	MOVE	SPEAR-CARRIER,HERE
	RTRUE	
?ELS138:	EQUAL?	PRSA,V?FOLLOW \FALSE
	EQUAL?	FOLLOW-FLAG,13 \FALSE
	CALL2	DO-WALK,P?SW
	RSTACK	

	.ENDI
