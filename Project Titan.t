% Keyu Lin
% Starting Date: May 1st, 2020
% Completion Date: September 2nd, 2020 12:23pm
% Name: Project Titan

% Run window
setscreen ("graphics:1000;600")

% Declare appropriate variables and constants
var x, y, button, buttonmode : int    % mousewhere commands
var switch : array 1 .. 10 of boolean % boolean switches      % 1, 2, 3, 4, 5, 6, 7, 8
var movieset : int := 1  % Which movie set would be displayed
var prevset : int := 0   % Stores the value of the previous set
var currentWinID, MusicMovieID : int
var Movie : string
var mute : boolean := false


% Variables for movies
var moviePosterCoords : array 1 .. 22, 'X' .. 'Y', 1 .. 2 of int

% Variable for the fonts
var PhaseFont : int := Font.New ("Segoe UI Black:26:bold,underline,italic")
var TitleFont : int := Font.New ("Castellar:26:bold,underline,italic")
var BoxTextFont : int := Font.New ("Calibri:22:bold")
var QuickSelectionTitleFont : int := Font.New ("Felix Titling:18:bold,underline,italic")
var QuickSelectionTextFont : int := Font.New ("Cambria:14:bold")
var MovieTitleFont : int := Font.New ("Cambria:26:bold,underline,italic")
var TextFont : int := Font.New ("Calibri:10")
var CaptionFont : int := Font.New ("Calibri:8")


% Constants of the movies
const IronMan := 1
const TheIncredibleHulk := 2
const IronMan2 := 3
const Thor := 4
const CaptainAmerica1 := 5
const Avengers := 6
const IronMan3 := 7
const Thor2 := 8
const CaptainAmerica2 := 9
const GuardiansoftheGalaxy := 10
const Avengers2 := 11
const AntMan := 12
const CaptainAmerica3 := 13
const DoctorStrange := 14
const GuardiansoftheGalaxy2 := 15
const SpiderMan := 16
const Thor3 := 17
const BlackPanther := 18
const Avengers3 := 19
const AntManandtheWasp := 20
const CaptainMarvel := 21
const Avengers4 := 22

% Picture Variables
var TitleBackground : int := Pic.FileNew ("Title Background.jpg")


% Iron Man Pics
var Mark1Pic : int := Pic.FileNew ("Mark 1.jpg")
var ArcReactorPic : int := Pic.FileNew ("Proof Tony Stark has a Heart.jpg")
% The Incredible Hulk Pics
var GammaRadiationPic : int := Pic.FileNew ("Gamma Experiment.jpg")
var BoxerHulkPic : int := Pic.FileNew ("Boxing Hulk.jpg")
% Iron Man 2 Pics
var NewElementPic : int := Pic.FileNew ("New Element.jpg")
var WhiplashFightPic : int := Pic.FileNew ("Whiplash Fight.jpg")
% Thor Pics
var DestroyerPic : int := Pic.FileNew ("Destroyer.jpg")
var ThorvsLokiPic : int := Pic.FileNew ("Thor vs Loki.jpg")
% Captain America Pics
var ErskineTalkPic : int := Pic.FileNew ("Erskine Talk.jpg")
var CapPlaneCrashPic : int := Pic.FileNew ("Cap Plane Crash.jpg")
% Avengers Pics
var AvengersTeamupPic : int := Pic.FileNew ("Avengers Teamup.jpg")
var LokiSmashedPic : int := Pic.FileNew ("Loki Smashed.jpg")
% Iron Man 3 Pic
var TheMechanicPic : int := Pic.FileNew ("The Mechanic.jpg")
var KillianSuitDestructionPic : int := Pic.FileNew ("Killian Suit Destruction.jpg")
% Thor: The Dark World Pics
var JanegetsExposedtoAetherPic : int := Pic.FileNew ("Jane gets Exposed to Aether.jpg")
var ConvergencePic : int := Pic.FileNew ("Convergence.jpg")
% Captain America: The Winter Soldier Pic
var STRIKEElevatorPic : int := Pic.FileNew ("STRIKE Elevator.jpg")
var InsightPic : int := Pic.FileNew ("Insight.jpg")
% Guardians of the Galaxy Vol 1 Pics
var PowerOrbPic : int := Pic.FileNew ("Power Orb.jpg")
var DanceOffPic : int := Pic.FileNew ("Dance Off.jpg")
% Avengers: Age of Ultron Pics
var UltronPic : int := Pic.FileNew ("Ultron.jpg")
var VisionBirthPic : int := Pic.FileNew ("Vision Birth.jpg")
% Ant Man Pics
var AntManShrinksintotheQuantumRealmPic : int := Pic.FileNew ("Ant Man Shrinks into Quantum Realm.jpg")
var FirstAntManShrinkPic : int := Pic.FileNew ("First Ant Man Shrink.jpg")
% Captain America: Civil War Pics
var AirportBattlePic : int := Pic.FileNew ("Airport Battle.jpg")
var CivilFightPic : int := Pic.FileNew ("Civil Fight.jpg")
% Doctor Strange Pics
var MirrorDimensionPic : int := Pic.FileNew ("Mirror Dimension.jpg")
var BargainPic : int := Pic.FileNew ("Bargain.jpg")
% Guardians of the Galaxy Vol 2
var BabyGrootNukePic : int := Pic.FileNew ("Baby Groot Nuke.jpg")
var FatherandSonPic : int := Pic.FileNew ("Father and Son.jpg")
% Spider-Man Pics
var WashingtonMonumentPic : int := Pic.FileNew ("Washington Monument.jpg")
var FerryPic : int := Pic.FileNew ("Ferry.jpg")
% Thor: Ragnarok
var DestroyedMjolnirPic : int := Pic.FileNew ("Mjolnir Destroyed.jpg")
var LightningThorPic : int := Pic.FileNew ("Lightning Thor.jpg")
% Black Panther Pics
var InterrogationPic : int := Pic.FileNew ("Interrogation.jpg")
var VibraniumTrainFightPic : int := Pic.FileNew ("Vibranium Train Fight.jpg")
% Avengers: Infinity War
var MawandObsidianFightPic : int := Pic.FileNew ("Maw and Obsidian Fight.jpg")
var StormbreakerReinforcementPic : int := Pic.FileNew ("Stormbreaker Reinforcement.jpg")
% Ant Man and the Wasp
var BabayagaInterrogationPic : int := Pic.FileNew ("Babayaga Interrogation.jpg")
var QuantumVehiclePic : int := Pic.FileNew ("Quantum Vehicle.jpg")
% Captain Marvel Pics
var CaptainMarvelDestroysRoninFleetPic : int := Pic.FileNew ("Captain Marvel Destroys Ronin Fleet.jpg")
var GooseScratchesFuryPic : int := Pic.FileNew ("Goose Scratches Fury.jpg")
% Avengers: Endgame
var AvengersAssemblePic : int := Pic.FileNew ("Avengers Assemble.jpg")
var IamIronManPic : int := Pic.FileNew ("I am Iron Man.jpg")


% Movie Poster Picture Variables
var IronManPoster : int := Pic.FileNew ("Iron man poster.jpg")
var IncredibleHulkPoster : int := Pic.FileNew ("The Incredible Hulk Poster.jpg")
var IronMan2Poster : int := Pic.FileNew ("Iron man 2 poster.jpg")
var ThorPoster : int := Pic.FileNew ("Thor poster.jpg")
var CaptainAmericaPoster : int := Pic.FileNew ("Captain America The First Avenger Poster.jpg")
var AvengersPoster : int := Pic.FileNew ("The Avengers Poster.jpg")
var IronMan3Poster : int := Pic.FileNew ("Iron Man 3 Poster.jpg")
var Thor2Poster : int := Pic.FileNew ("Thor The Dark World Poster.jpg")
var CaptainAmerica2Poster : int := Pic.FileNew ("Captain America The Winter Soldier Poster.jpg")
var GuardiansoftheGalaxyPoster : int := Pic.FileNew ("Guardians of the Galaxy Vol 1 Poster.jpg")
var Avengers2Poster : int := Pic.FileNew ("Avengers Age of Ultron Poster.jpg")
var AntManPoster : int := Pic.FileNew ("Ant Man Poster.jpg")
var CaptainAmerica3Poster : int := Pic.FileNew ("Captain America Civil War Poster.jpg")
var DoctorStrangePoster : int := Pic.FileNew ("Doctor Strange Poster.jpg")
var GuardiansoftheGalaxy2Poster : int := Pic.FileNew ("Guardians of the Galaxy Vol 2 Poster.jpg")
var SpiderManPoster : int := Pic.FileNew ("Spiderman Homecoming Poster.jpg")
var Thor3Poster : int := Pic.FileNew ("Thor Ragnarok Poster.jpg")
var BlackPantherPoster : int := Pic.FileNew ("Black Panther Poster.jpg")
var Avengers3Poster : int := Pic.FileNew ("Avengers Infinity War Poster.jpg")
var AntMan2Poster : int := Pic.FileNew ("Ant Man and the Wasp Poster.jpg")
var CaptainMarvelPoster : int := Pic.FileNew ("Captain Marvel Poster.jpg")
var Avengers4Poster : int := Pic.FileNew ("Avengers Endgame Poster.jpg")

% Location varibles
var locatorX : array 1 .. 22 of int
var locatorY : array 1 .. 22 of int

% Colour Variables
const White := 0
const Black := 7
const Red := 12
const ConcentratedBlue := 32
const BluePurple := 33
const LightBlue := 53
const AfternoonBlue := 54
const SoftGrey := 56
const BluePurpleTint := 57
const PurpleEveningSun := 58
const EveningDawn := 59
const EarlyDawn := 60
const Dawn := 61
const LateDawn := 62
const LightPink := 63
const FleshlyColour := 64
const LightestBrown := 65
const Tan := 66
const YellowishSkin := 67
const LemonCake := 68
const LightGreenTeaCheeseCake := 69
const GreenTeaCheeseCake := 70
const SummativeYeastColour := 71
const Prism := 72
const BluePrism := 73
const LightBlue2 := 74
const Blue3 := 75
const Blue4 := 76
const Blue5 := 77
const Blue9 := 78
const CloudBlue4 := 103


% Setting values of variables
% Setting the value of the switches
procedure setFalse
    for falsify : 1 .. 10
	switch (falsify) := false
    end for
end setFalse
% Value of movie coordinates
for setValue : 1 .. 22
    locatorX (setValue) := 0
    locatorY (setValue) := 0
    for setValueXY : 'X' .. 'Y'
	for setValue12 : 1 .. 2
	    moviePosterCoords (setValue, setValueXY, setValue12) := 0
	end for
    end for
end for
locatorX (IronMan) := 140
locatorY (IronMan) := 150
locatorX (TheIncredibleHulk) := 390
locatorY (TheIncredibleHulk) := 150
locatorX (IronMan2) := 640
locatorY (IronMan2) := 150

% Mute Button Shennanigans
procedure muteDisplay
    if mute then
	Music.PlayFileStop
	drawfillbox (maxx div 2 - 10, 6, maxx div 2 + 24, 34, CloudBlue4)
	drawfillbox (maxx div 2 - 22, 3, maxx div 2 + 27, 37, Black)         % Outline
	drawfillbox (maxx div 2 - 20, 5, maxx div 2 + 25, 35, CloudBlue4) % Mute button
	drawfillbox (maxx div 2 - 10, 15, maxx div 2 - 7, 25, Black) % Sound symbol
	drawline (maxx div 2 - 7, 25, maxx div 2, 30, Black)
	drawline (maxx div 2 - 7, 15, maxx div 2, 10, Black)
	drawline (maxx div 2, 10, maxx div 2, 30, Black)
	drawfill (maxx div 2 - 2, 20, Black, Black)
	Draw.ThickLine (maxx div 2 + 5, 15, maxx div 2 + 12, 25, 2, Black)
	Draw.ThickLine (maxx div 2 + 5, 25, maxx div 2 + 12, 15, 2, Black)
    else
	drawfillbox (maxx div 2 - 22, 3, maxx div 2 + 27, 37, Black) % Outline
	drawfillbox (maxx div 2 - 20, 5, maxx div 2 + 25, 35, CloudBlue4) % Mute button
	drawfillbox (maxx div 2 - 10, 15, maxx div 2 - 7, 25, Black) % Sound symbol
	drawline (maxx div 2 - 7, 25, maxx div 2, 30, Black)
	drawline (maxx div 2 - 7, 15, maxx div 2, 10, Black)
	drawline (maxx div 2, 10, maxx div 2, 30, Black)
	drawfill (maxx div 2 - 2, 20, Black, Black)
	for soundWaves : 1 .. 3                             % For drawing sound waves of the sound symbol
	    drawarc (maxx div 2, 20, soundWaves * 5, soundWaves * 5, -20 + -10 * soundWaves, 20 + 10 * soundWaves, Black)
	end for
    end if
end muteDisplay

% Procedure for the mute function
procedure Mute
    mute := not mute
end Mute

% Procedure that defines the area of effect for the left right buttons on the movie selection page
procedure ButtonAOE
    if x >= 50 and x <= 100 then
	if x - 50 > abs (300 - y) and button = 1 and not (movieset <= 1) then
	    movieset := movieset - 1
	    switch (1) := true
	end if
    end if
    if x >= maxx - 100 and x <= maxx - 50 then
	if (maxx - 50) - x > abs (300 - y) and button = 1 and not (movieset >= 8) then
	    movieset := movieset + 1
	    switch (1) := true
	end if
    end if
end ButtonAOE

% Special highlight button for closing the movie description buttons
procedure defaultMousewhere
    mousewhere (x, y, button)
    locate (1, 1)
    %    put x : 5, y : 5, button : 5
    if button = 1 then
	buttonwait ("up", x, y, buttonmode, button)
    end if
end defaultMousewhere

procedure Coordinates
    mousewhere (x, y, button)
    locate (1, 1)
    %put x : 5, y : 5, button : 5
    if button = 1 then
	buttonwait ("up", x, y, buttonmode, button)
    end if
    if switch (2) then
	ButtonAOE
    end if
end Coordinates


% Closing the movie plot window
procedure movieWindowClose
    drawfillbox (maxx - 68, maxy - 21, maxx - 15, maxy, black)
    drawfillbox (maxx - 66, maxy - 19, maxx - 17, maxy - 2, white)
    drawline (maxx - 46, maxy - 15, maxx - 36, maxy - 5, black)
    drawline (maxx - 46, maxy - 5, maxx - 36, maxy - 15, black)
    loop
	defaultMousewhere
	if x >= maxx - 66 and x <= maxx - 15 and y >= maxy - 20 and y <= maxy then
	    drawfillbox (maxx - 66, maxy - 19, maxx - 17, maxy - 2, Red)
	    drawline (maxx - 46, maxy - 15, maxx - 36, maxy - 5, black)
	    drawline (maxx - 46, maxy - 5, maxx - 36, maxy - 15, black)
	    loop
		defaultMousewhere
		exit when not (x >= maxx - 66 and x <= maxx - 15 and y >= maxy - 20 and y <= maxy) or button = 1
	    end loop
	    if button = 1 then
		exit
	    end if
	else
	    drawfillbox (maxx - 66, maxy - 19, maxx - 17, maxy - 2, White)
	    drawline (maxx - 46, maxy - 15, maxx - 36, maxy - 5, black)
	    drawline (maxx - 46, maxy - 5, maxx - 36, maxy - 15, black)
	    loop
		defaultMousewhere
		exit when x >= maxx - 66 and x <= maxx - 15 and y >= maxy - 20 and y <= maxy
	    end loop
	end if
    end loop
    Window.Close (currentWinID)
end movieWindowClose

% Linked movie summary
procedure Hyperlink (yDimension : string, var Movie : string)
    var WindowString : string := "position:top;left,graphics:750;" + yDimension
    var WinID : int := Window.Open (WindowString)
    currentWinID := WinID
    case Movie of
	label "Captain America: Civil War" :
	    Font.Draw ("Captain America: Civil War", maxx div 2 - 210, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 1991, the brainwashed super-soldier James \"Bucky\" Barnes is dispatched from a Hydra base in Siberia to intercept", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("an automobile carrying a case of super-soldier serum. In the present day, approximately one year after Ultron's", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("defeat by the Avengers in Sokovia. Steve Rogers, Natasha Romanoff, Sam Wilson, and Wanda Maximoff stop Brock Rumlow", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("from stealing a biological weapon from a lab in Lagos. Rumlow blows himself up, attempting to kill Rogers but", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Maximoff telekinetically contains the explosion and throws it in the air accidently blowing up part of a building", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("and killing several Wakandan humanitarian workers. U.S. Secretary of State Thaddeus Ross informs the Avengers that", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("the United Nations (UN) is preparing to pass the Sokovia Accords, which will establish a UN panel to oversee and", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("control the team. The Avengers are divided: Tony Stark supports oversight because of his role in Ultron's creation", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("and Sokovia's devastation, while Rogers has more faith in his own judgment than that of a government. Meanwhile,", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Helmut Zemo tracks down and kills Barnes' old Hydra handler, stealing a book containing the trigger words that", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("activate Barnes' brainwashing. At a conference in Vienna where the accords are going to be ratified, a bomb is set", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("off killing many people including T'Chaka, king of Wakanda. T'Challa vows to swear revenge and the bomber is", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("seemingly identified as Bucky Barnes whom T'Challa starts to hunt after in his Black Panther suit. Informed by", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Sharon Carter of Barnes' whereabouts and the authorities' intentions to kill him, Rogers and Wilson seek him out", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("to try and bring in Barnes themselves.  Rogers and Wilson track Barnes to Bucharest and attempt to protect him from", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("T'Challa and the authorities but they all get arrested. Impersonating a psychiatrist sent to interview Barnes, Zemo", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("recites the words to make Barnes obey him. He questions Barnes, then sends him on a rampage to cover his own escape.", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Rogers stops Barnes and sneaks him away. When Barnes regains his senses, he explains that Zemo is the real Vienna", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("bomber and wanted the location of the Siberian Hydra base, where other brainwashed \"Winter Soldiers\" are kept in", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("cryogenic stasis. Rogers and Wilson go rogue, not willing to wait till the authorities catch Zemo, recruit Maximoff,", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("Clint Barton, and Scott Lang. With Ross's permission, Stark assembles a team composed of Romanoff, T'Challa, Rhodes,", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("Vision, and Peter Parker to capture the renegades. Stark's team intercepts Rogers' group at Leipzig/Halle Airport,", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("where they fight until Romanoff allows Rogers and Barnes to escape. The rest of Rogers' team is captured and detained", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("at the Raft prison, while Rhodes is partially paralyzed after being inadvertently shot down by Vision, and Romanoff", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("goes into exile. Stark discovers the possibility that Barnes may have been framed when he learns that he investigator", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("is dead. He learns the location of Rogers and Barnes from Wilson by telling him that Barnes was framed and without", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("Ross knowing, flies there in his Iron Man suit. T'Challa is flying right behind him in his stealth jet unbeknownst", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("to Stark. Stark makes a truce with Rogers and Barnes, explore the facility to learn that the super soldiers were", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("all shot dead by Zemo. Zemo then proceeds to show a video of Barnes assassinating Stark's parents in 1991, Stark", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("asks if Rogers knew which he admits to. Stark turns on both Rogers and Barnes that leads into an intense fight", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("with Barnes robotic arm being destroyed and Stark's arc reactor getting damaged by Rogers. He departs with Barnes,", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("leaving his shield behind. Satisfied that he has avenged his family's deaths in Sokovia from the Avengers' actions", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("by successfully fracturing them, Zemo attempts suicide, but he is stopped by T'Challa and taken to the authorities.", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("Rhodes is provided with exoskeletal leg braces that allow him to walk again by Stark while Rogers breaks his", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("teammates out of the Raft.", 10, maxy - 610, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Barnes, granted asylum in Wakanda, chooses to return to cryogenic sleep until a cure for his", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("brainwashing is found.", 10, maxy - 655, TextFont, Black)

	    Font.Draw ("Post Credit Scene: Parker explores the features of the web shooters built for him by Stark.", 10, maxy - 685, TextFont, Black)
	    movieWindowClose
	label "Avengers: Infinity War" :
	    Font.Draw ("Avengers: Infinity War", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Having acquired the Power Stone, one of the six Infinity Stones, from the planet Xandar, Thanos and his lieutenants:", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Ebony Maw, Cull Obsidian, Proxima Midnight, and Corvus Glaive intercept the spaceship carrying the surviving", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("Asguardians from the events of Thor: Ragnarok. Thanos subdues Thor, overpowers Hulk, and Loki has to trade the", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Tesseract for Thor's life and in the process tries to stab Thanos but fails. Loki is killed as a consequence,", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Heimdall uses the power of the Bifröst to send the Hulk to Earth as a warning. Thanos and his subordinates", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("leave Asgaurdian ship deteriorating. Hulk crash-lands at the Sanctum Sanctorum in New York City, reverting back", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("to the form of Bruce Banner. He warns Stephen Strange and Wong about Thanos's plan to kill half of all life in", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("the universe, and they recruit Tony Stark. Maw and Obsidian arrive to retrieve the Time Stone from Strange, drawing", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("the attention of Peter Parker. Maw captures Strange, but fails to take the Time Stone due to an enchantment. Stark", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("and Parker sneak aboard Maw's spaceship, Banner contacts Steve Rogers, and Wong stays behind to guard the Sanctum.", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("In Edinburgh, Midnight and Glaive ambush Wanda Maximoff and Vision in order to retrieve the Mind Stone, which is", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("in Vision's forehead. Rogers, Natasha Romanoff, and Sam Wilson but spare them and retreat, they group up with", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Banner and James Rhodes at the Avengers facility. Vision offers to sacrifice himself by having Maximoff destroy", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("the Mind Stone to keep Thanos from retrieving it, but Maximoff refuses. Rogers suggests they travel to Wakanda,", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("which he believes has the resources to remove the Stone without destroying Vision. The Guardians of the Galaxy", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("respond to a distress call from the Asgardian ship and rescue Thor, who surmises that Thanos is currently going", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("after the Reality Stone, which is in the possession of the Collector on Knowhere. Groot, Rocket and Thor head", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("to Nidavellir to create a weapon that could kill Thanos while Peter Quill, Gamora, Drax, and Mantis head to", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Knowhere to stop Thanos from getting the Reality Stone. Thanos has already obtained the Reality Stone, incapacitate", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("Drax and Mantis, kidnaps Gamora and spares Quill. Gamora reveals that the Soul Stone ito save for Nebula from", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("being tortured is on Vormir.  On Vormir, the Stone's keeper, Red Skull, tells Thanos that he can only acquire it", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("by sacrificing someone he loves. Thanos sacrifices Gamora, earning the Stone. Nebula escapes captivity and asks the", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("remaining Guardians to meet her at Thanos's destroyed homeworld, Titan. Stark and Parker kill Maw by blasting him", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("into open space, freezing him to death.  Landing on Titan, they meet Quill, Drax, and Mantis. Strange uses the", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Time Stone to view millions of possible futures, seeing only one in which Thanos loses. The group forms a plan", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("to subdue Thanos and remove the Infinity Gauntlet, which he uses to house the Stones. Thanos appears and", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("justifies his plans as necessary to ensure the survival of a universe threatened by overpopulation. Nebula", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("arrives soon after, and helps the others subdue Thanos until she deduces that Thanos has killed Gamora. Enraged,", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Quill attacks Thanos, allowing him to break the group's hold and overpower them. Stark is seriously wounded by", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Thanos, but is spared after Strange surrenders the Time Stone to Thanos. At Nidavellir, Thor, Rocket and Groot", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("discover the star forge to be closed and all the dwarves killed except Eitri who has his hands severed. Thanos", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("had come to the forge and forced the Infinity Gauntlet to be made, slaying almost all the dwarves after. Thor", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("withstands the force of a star and with Groot severing his arm to make the handle of the weapon, Stormbreaker", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("was created with power to summon the Bifröst. In Wakanda, Rogers reunites with Bucky Barnes before Thanos's", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("army invades. The Avengers, alongside T'Challa and the Wakandan forces, mount a defense while Shuri works to", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("extract the Mind Stone from Vision. Banner, unable to transform into the Hulk, fights in Stark's Hulkbuster", 10, maxy - 625, TextFont, Black)
	    Font.Draw ("armor. Thor, Rocket, and Groot arrive to reinforce the Avengers; Midnight, Obsidian, and Glaive are killed", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("and their army is routed, but Shuri is unable to complete the extraction of the Mind Stone from Vision. Thanos", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("arrives to retrieve the Mind Stone, but before he can do so Wanda destroys it. Using the Time Stone, Thanos", 10, maxy - 670, TextFont, Black)
	    Font.Draw ("reverses Wanda's actions and rips the repaired Mind Stone from Vision's forehead, killing him. Thor severely", 10, maxy - 685, TextFont, Black)
	    Font.Draw ("wounds Thanos with Stormbreaker, but Thanos activates the completed Gauntlet by snapping his fingers and", 10, maxy - 700, TextFont, Black)
	    Font.Draw ("teleports away. Half of all life across the universe disintegrates, including Barnes, T'Challa, Groot,", 10, maxy - 715, TextFont, Black)
	    Font.Draw ("Maximoff, Wilson, Mantis, Drax, Quill, Strange, and Parker. Thanos is shown sitting on deserted planet", 10, maxy - 730, TextFont, Black)
	    Font.Draw ("watching the sunrise.", 10, maxy - 745, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Fury and Hill are driving in New York when people start dusting away and accidents are", 10, maxy - 775, TextFont, Black)
	    Font.Draw ("occurring everywhere. Fury and Hill are dusted away as well but Fury manages to send an emergency signal", 10, maxy - 790, TextFont, Black)
	    Font.Draw ("to a pager that shows the insignia of Captain Marvel.", 10, maxy - 805, TextFont, Black)
	    movieWindowClose
	label :
    end case
end Hyperlink


% Movie plot window procedure
procedure movieTextWindow (yWindowDimension : string)
    % Creating the button to open the text window
    drawfillbox (278, 58, 362, 82, black)
    drawfillbox (280, 60, 360, 80, 64)
    Font.Draw ("More", 296, 63, QuickSelectionTextFont, black)

    % Creating the button to go back
    drawfillbox (maxx - 54, maxy - 24, maxx, maxy, Black)
    drawfillbox (maxx - 52, maxy - 22, maxx - 2, maxy - 2, LightBlue)
    Font.Draw ("Back", maxx - 48, maxy - 18, QuickSelectionTextFont, Black)

    muteDisplay
    % Coordinates and AOE
    loop
	defaultMousewhere
	if mute and switch (8) then
	    Music.PlayFileStop
	    muteDisplay
	elsif switch (8) then
	    muteDisplay
	    case MusicMovieID of
		label 1 :
		    Music.PlayFileLoop ("Iron Man Soundtrack Main Theme Song.MP3")
		label 2 :
		    Music.PlayFileLoop ("The Incredible Hulk Main Theme.MP3")
		label 3 :
		    Music.PlayFileLoop ("Iron Man 2 Theme.MP3")
		label 4 :
		    Music.PlayFileLoop ("Thor Main Theme.MP3")
		label 5 :
		    Music.PlayFileLoop ("Captain America The First Avenger Theme Trimmed.MP3")
		label 6 :
		    Music.PlayFileLoop ("The-Avengers-Theme-Song.MP3")
		label 7 :
		    Music.PlayFileLoop ("Iron Man 3 Theme.MP3")
		label 8 :
		    Music.PlayFileLoop ("Thor 2 Theme.MP3")
		label 9 :
		    Music.PlayFileLoop ("Captain America The Winter Soldier Theme.MP3")
		label 10 :
		    Music.PlayFileLoop ("Guardians of the Galaxy Theme.MP3")
		label 11 :
		    Music.PlayFileLoop ("Avengers Age of Ultron Theme Trimmed.MP3")
		label 12 :
		    Music.PlayFileLoop ("Ant Man Theme Trimmed.MP3")
		label 13 :
		    Music.PlayFileLoop ("Captain America Civil War - Main Theme.MP3")
		label 14 :
		    Music.PlayFileLoop ("Doctor Strange Main Theme Trimmed.MP3")
		label 15 :
		    Music.PlayFileLoop ("'Guardians of the Galaxy Vol. 2' Main Theme by Tyler Bates.MP3")
		label 16 :
		    Music.PlayFileLoop ("Spider-Man Theme.MP3")
		label 17 :
		    Music.PlayFileLoop ("'Thor Ragnarok' Main Theme by Mark Mothersbaugh.MP3")
		label 18 :
		    Music.PlayFileLoop ("'Black Panther' Main Theme by Ludwig Göransson Trimmed.MP3")
		label 19 :
		    Music.PlayFileLoop ("The-Avengers-Theme-Song.MP3")
		label 20 :
		    Music.PlayFileLoop ("Ant-Man and the Wasp Theme Trimmed.MP3")
		label 21 :
		    Music.PlayFileLoop ("Captain Marvel Soundtrack - Main Theme.MP3")
		label 22 :
		    Music.PlayFileLoop ("'Avengers Endgame' Main Theme by Alan Silvestri.MP3")
	    end case
	end if
	switch (8) := false
	if x >= 278 and x <= 362 and y >= 58 and y <= 82 and button = 1 then
	    switch (3) := true             % 3 is to designate opening the window
	    % Opening the new window
	    var WindowString : string := "position:top;left,graphics:750;" + yWindowDimension
	    var WinID : int := Window.Open (WindowString)
	    currentWinID := WinID
	    exit
	elsif x >= maxx - 54 and x <= maxx and y >= maxy - 24 and y <= maxy and button = 1 then
	    switch (4) := true
	    exit
	elsif switch (7) then
	    if x >= 328 and x <= 449 and y >= 498 and y <= 506 and button = 1 then
		Movie := "Avengers: Infinity War"
		Hyperlink ("820", Movie)
	    elsif x >= 205 and x <= 353 and y >= 392 and y <= 401 and button = 1 then
		Movie := "Captain America: Civil War"
		Hyperlink ("700", Movie)
	    end if
	elsif x >= maxx div 2 - 20 and x <= maxx div 2 + 25 and y >= 5 and y <= 35 and button = 1 then
	    Mute
	    switch (8) := true
	end if
    end loop
end movieTextWindow



% Individual Procedure for every single movie
procedure IronManContents
    MusicMovieID := 1
    cls
    Music.PlayFileLoop ("Iron Man Soundtrack Main Theme Song.MP3")
    Font.Draw ("Iron Man", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Iron Man is the movie that kicked it off, the start of the Marvel Cinematic Universe and the characters within.", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Tony Stark starts off as a genius billionaire, inventor and owner of Stark Industries, a weapons contractor.", 10, maxy - 115, TextFont, Black)
    Font.Draw ("During a weapons demonstration in Afghanistan, Tony Stark is ambushed and kidnapped by the Ten Rings, a terrorist", 10, maxy - 130, TextFont, Black)
    Font.Draw ("organization. Stark gets injured by the blast of one of his own weapons during the ambush and has a wound sprouting", 10, maxy - 145, TextFont, Black)
    Font.Draw ("out of his chest. Yinson, a captured doctor has to install an electromagnet in Stark's chest to keep shrapnel", 10, maxy - 160, TextFont, Black)
    Font.Draw ("from reaching his heart. Yinson and Tony are promised freedom by the leader of Ten Rings, Raza, if they build", 10, maxy - 175, TextFont, Black)
    Font.Draw ("a Jericho Missile for the terrorist group but they know Raza will not keep his promise. Stark and yinsen build", 10, maxy - 190, TextFont, Black)
    Font.Draw ("an arc reactor that powers the electromagnet in Tony's chest and a suit they have been secretly been building.", 10, maxy - 205, TextFont, Black)
    Font.Draw ("However, before they can finish uploading the suit, the terrorist pick up on their plan. Yinson goes out to", 10, maxy - 220, TextFont, Black)
    Font.Draw ("stall time for Tony to get into the suit, and after he does flames everyone using his suit. Yinson is found", 10, maxy - 235, TextFont, Black)
    Font.Draw ("dieing, and with his final words tells Tony Stark \"Don't waste your life\". Tony flies off and his suit crashes", 10, maxy - 250, TextFont, Black)
    Font.Draw ("but then gets found and rescued by his friend, Colonel Rhodes. After returning to America, Stark decides to end", 10, maxy - 265, TextFont, Black)
    Font.Draw ("manufacturing arms. Obadiah Stane, an old partner of Stark Industries and worked with Tony's father Howard Stark", 10, maxy - 280, TextFont, Black)
    Font.Draw ("advises him against this but Stark doesn't listen to him. Tony builds an even more powerful arc reactor and suit", 10, maxy - 295, TextFont, Black)
    Font.Draw ("while his personal assistant, Pepper Potts places the old arc reactor inside a glass box that says \"Proof Tony", 10, maxy - 310, TextFont, Black)
    Font.Draw ("Stark still has a heart\". During a charity event hosted by Stark Industries, reporter Christine Everhart informs", 10, maxy - 325, TextFont, Black)
    Font.Draw ("Stark that his company's weapons were recently delivered to the Ten Rings and are being used to attack Yinsen's", 10, maxy - 340, TextFont, Black)
    Font.Draw ("home village, Gulmira. Stark takes his new suit to kill the terrorists and blow up a tank. While returning home,", 10, maxy - 355, TextFont, Black)
    Font.Draw ("to end the attack. Meanwhile the Ten Rings gather the remains of Stark's original suit, and it is revealed that", 10, maxy - 370, TextFont, Black)
    Font.Draw ("Stane hired the Ten Rings to kidnap and kill Stark. Stark tells Potts to hack into the company database to check", 10, maxy - 385, TextFont, Black)
    Font.Draw ("where the illegal shipments are heading and in the he gets intercepted by two fighter jets. He reveals his secret", 10, maxy - 400, TextFont, Black)
    Font.Draw ("identity to Rhodes over the phone in an attempt process, discovers Stane plot. Stane's scientists cannot duplicate", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Stark's miniaturized arc reactor, so Stane ambushes Stark at his home and takes the one from his chest. Stark", 10, maxy - 430, TextFont, Black)
    Font.Draw ("manages to survive by breaking the glass case around his original reactor and placing it in his chest. Potts and", 10, maxy - 445, TextFont, Black)
    Font.Draw ("several SHIELD(intelligence agency) agents to apprehend Stane but get attacked by Stane in the original Iron Man", 10, maxy - 460, TextFont, Black)
    Font.Draw ("suit. Stark uses his newest suit to confront Stane on top of the Stark Industries building but faces a battery", 10, maxy - 475, TextFont, Black)
    Font.Draw ("problem because of his old arc reactor. He instructs Potts to overload the huge arc reactor that powers the", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Stark Industries building causing Stane to fall due to electrical oversurge and kill him. Tony survives and", 10, maxy - 505, TextFont, Black)

    Pic.Draw (Mark1Pic, 690, 360, picMerge)
    Font.Draw ("This is the Mark 1 Iron Man suit that Tony Stark and Yinsen", 695, 345, CaptionFont, Black)
    Font.Draw ("created, starting a legacy that would save the world one day.", 690, 335, CaptionFont, Black)

    Pic.Draw (ArcReactorPic, 700, 50, picMerge)
    Font.Draw ("The first arc reactor that Tony had, encased in a glass", 700, 35, CaptionFont, Black)
    Font.Draw ("box by Pepper Potts and eventually would save his life", 700, 25, CaptionFont, Black)

    loop
	movieTextWindow ("570")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Iron Man", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Iron Man is the movie that kicked it off, the start of the Marvel Cinematic Universe and the characters within.", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Tony Stark starts off as a genius billionaire, inventor and owner of Stark Industries, a weapons contractor.", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("During a weapons demonstration in Afghanistan, Tony Stark is ambushed and kidnapped by the Ten Rings, a terrorist", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("organization. Stark gets injured by the blast of one of his own weapons during the ambush and has a wound sprouting", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("out of his chest. Yinson, a captured doctor has to install an electromagnet in Stark's chest to keep shrapnel", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("from reaching his heart. Yinson and Tony are promised freedom by the leader of Ten Rings, Raza, if they build", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("a Jericho Missile for the terrorist group but they know Raza will not keep his promise. Stark and yinsen build", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("an arc reactor that powers the electromagnet in Tony's chest and a suit they have been secretly been building.", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("However, before they can finish uploading the suit, the terrorist pick up on their plan. Yinson goes out to", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("stall time for Tony to get into the suit, and after he does flames everyone using his suit. Yinson is found", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("dieing, and with his final words tells Tony Stark \"Don't waste your life\". Tony flies off and his suit crashes", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("but then gets found and rescued by his friend, Colonel Rhodes. After returning to America, Stark decides to end", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("manufacturing arms. Obadiah Stane, an old partner of Stark Industries and worked with Tony's father Howard Stark", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("advises him against this but Stark doesn't listen to him. Tony builds an even more powerful arc reactor and suit", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("while his personal assistant, Pepper Potts places the old arc reactor inside a glass box that says \"Proof Tony", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("Stark still has a heart\". During a charity event hosted by Stark Industries, reporter Christine Everhart informs", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("Stark that his company's weapons were recently delivered to the Ten Rings and are being used to attack Yinsen's", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("home village, Gulmira. Stark takes his new suit to kill the terrorists and blow up a tank. While returning home,", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("to end the attack. Meanwhile the Ten Rings gather the remains of Stark's original suit, and it is revealed that", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("Stane hired the Ten Rings to kidnap and kill Stark. Stark tells Potts to hack into the company database to check", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("where the illegal shipments are heading and in the he gets intercepted by two fighter jets. He reveals his secret", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("identity to Rhodes over the phone in an attempt process, discovers Stane plot. Stane's scientists cannot duplicate", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Stark's miniaturized arc reactor, so Stane ambushes Stark at his home and takes the one from his chest. Stark", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("manages to survive by breaking the glass case around his original reactor and placing it in his chest. Potts and", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("several SHIELD(intelligence agency) agents to apprehend Stane but get attacked by Stane in the original Iron Man", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("suit. Stark uses his newest suit to confront Stane on top of the Stark Industries building but faces a battery", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("problem because of his old arc reactor. He instructs Potts to overload the huge arc reactor that powers the", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Stark Industries building causing Stane to fall due to electrical oversurge and kill him. Tony survives and", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("at the press conference today reveal to the world \"I am Iron Man\" despite what he is told to say. In the post", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("credit scene SHIELD Director Nick Fury shows up at Stark's house to tell him \"He is not the only superhero", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("in the world\" and that he wants to talk about the avengers initiative.", 10, maxy - 550, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end IronManContents


procedure TheIncredibleHulkContents
    MusicMovieID := 2
    cls
    Music.PlayFileLoop ("The Incredible Hulk Main Theme.MP3")
    Font.Draw ("The Incredible Hulk", maxx div 2 - 150, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("The Incredible Hulk is the second movie of the MCU explaining the origins of Bruce Banner, the Hulk. General", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Thadeus Ross consults Dr. Bruce Banner who is dating his daughter Betty Ross about an experiment that is secretly", 10, maxy - 115, TextFont, Black)
    Font.Draw ("an attempted remake of the World War Two super soldier serum but lies, stating it is to make humans immune to", 10, maxy - 130, TextFont, Black)
    Font.Draw ("gamma radiation. The experiment goes wrong, blasting Banner with gamma radiation and causing him to turn into", 10, maxy - 145, TextFont, Black)
    Font.Draw ("a monsterous green being called the Hulk. Banner escapes the facility and in the process killing people, he", 10, maxy - 160, TextFont, Black)
    Font.Draw ("becomes a wanted fugitive Whenever Banner becomes angry or provoked, he transforms into the Hulk and loses", 10, maxy - 175, TextFont, Black)
    Font.Draw ("control of himself. Banner goes on the run from the US military and General Ross who wants to weaponize the Hulk.", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Five years later, Banner is working at a bottling factory in Rocinha, Rio de Janeiro, Brazil, while searching", 10, maxy - 205, TextFont, Black)
    Font.Draw ("for a cure for his condition. He is trying to find a cure for his condition by consulting with someone online", 10, maxy - 220, TextFont, Black)
    Font.Draw ("named Mr.Blue. Banner has been practising Yoga to keep control of himself and not transform into the Hulk.", 10, maxy - 235, TextFont, Black)
    Font.Draw ("While at work, Banner gets a cut on his finger which contaminates a bottle and gives an elder gamma sickness.", 10, maxy - 250, TextFont, Black)
    Font.Draw ("By tracking where the bottle came from, General Ross finds the location of where Banner is and send in a special", 10, maxy - 265, TextFont, Black)
    Font.Draw ("forces team to capture him led by Emil Blonsky. The capture attempt ends in failure when Banner transforms into the", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Hulk. After the defeat, General Ross explain that Banner was injected with a serum that made him strong, Blonsky", 10, maxy - 295, TextFont, Black)
    Font.Draw ("agrees to take a modified smaller dosage of the serum that enhances all his physical abilities but alters his spine", 10, maxy - 310, TextFont, Black)
    Font.Draw ("structure and impairing his judgement. Banner returns to Culver University and reunites with Betty, he is attacked", 10, maxy - 325, TextFont, Black)
    Font.Draw ("again by General Ross forces but transforms into the Hulk again and escapes with Betty. Blonsky attacks the Hulk", 10, maxy - 340, TextFont, Black)
    Font.Draw ("with his depleting mindstate and gets severely injured in the process. Mr. Blue is actually cellular biologist", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Dr. Samuel Sterns develops and antidote that reverses the Hulk transformation and has synthesized Banner blood", 10, maxy - 370, TextFont, Black)
    Font.Draw ("that have been sent from Brazil. Banner wants to destroy the blood supply in order to keep it from getting in", 10, maxy - 385, TextFont, Black)
    Font.Draw ("the hands of the military. Blonsky recovers from being severely injured and wishes to recapture the Hulk and", 10, maxy - 400, TextFont, Black)
    Font.Draw ("succeeds this time. Blonsky stays behind and orders Sterns to inject him with Banner's blood, as he covets", 10, maxy - 415, TextFont, Black)
    Font.Draw ("the Hulk's power. Sterns warns him that injecting him with Banners blood may react with the modified super", 10, maxy - 430, TextFont, Black)
    Font.Draw ("serum and make him an abomination but he doesn't care. The procedure empowers Blonsky to have power beyond the", 10, maxy - 445, TextFont, Black)
    Font.Draw ("Hulk but completely destroys his mind, attacking Sterns. Sterns gets a cut on his forehead and Banners blood", 10, maxy - 460, TextFont, Black)
    Font.Draw ("enters through it causing his head to mutate. Blonsky starts to rampage across Harlem and Banner realizes he", 10, maxy - 475, TextFont, Black)
    Font.Draw ("is the only one who can stop him so he convinces General Ross to let him go. Banner drops out of the helicopter", 10, maxy - 490, TextFont, Black)
    Font.Draw ("and transforms when hitting the ground. In the fight the Hulk uses chains to restrain and strangle the Abomination", 10, maxy - 505, TextFont, Black)

    Pic.Draw (GammaRadiationPic, 690, 370, picMerge)
    Font.Draw ("The gamma radiation experiment that led to the Hulk", 690, 355, CaptionFont, Black)
    Font.Draw ("being created.", 690, 345, CaptionFont, Black)

    Pic.Draw (BoxerHulkPic, 690, 150, picMerge)
    Font.Draw ("The Hulk is battling the Abomination in the streets of", 690, 135, CaptionFont, Black)
    Font.Draw ("Harlem using car parts.", 690, 125, CaptionFont, Black)

    loop
	movieTextWindow ("560")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("The Incredible Hulk", maxx div 2 - 150, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("The Incredible Hulk is the second movie of the MCU explaining the origins of Bruce Banner, the Hulk. General", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Thadeus Ross consults Dr. Bruce Banner who is dating his daughter Betty Ross about an experiment that is secretly", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("an attempted remake of the World War Two super soldier serum but lies, stating it is to make humans immune to", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("gamma radiation. The experiment goes wrong, blasting Banner with gamma radiation and causing him to turn into", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("a monsterous green being called the Hulk. Banner escapes the facility and in the process killing people, he", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("becomes a wanted fugitive Whenever Banner becomes angry or provoked, he transforms into the Hulk and loses", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("control of himself. Banner goes on the run from the US military and General Ross who wants to weaponize the Hulk.", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Five years later, Banner is working at a bottling factory in Rocinha, Rio de Janeiro, Brazil, while searching", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("for a cure for his condition. He is trying to find a cure for his condition by consulting with someone online", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("named Mr.Blue. Banner has been practising Yoga to keep control of himself and not transform into the Hulk.", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("While at work, Banner gets a cut on his finger which contaminates a bottle and gives an elder gamma sickness.", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("By tracking where the bottle came from, General Ross finds the location of where Banner is and send in a special", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("forces team to capture him led by Emil Blonsky. The capture attempt ends in failure when Banner transforms into the", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Hulk. After the defeat, General Ross explain that Banner was injected with a serum that made him strong, Blonsky", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("agrees to take a modified smaller dosage of the serum that enhances all his physical abilities but alters his spine", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("structure and impairing his judgement. Banner returns to Culver University and reunites with Betty, he is attacked", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("again by General Ross forces but transforms into the Hulk again and escapes with Betty. Blonsky attacks the Hulk", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("with his depleting mindstate and gets severely injured in the process. Mr. Blue is actually cellular biologist", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Dr. Samuel Sterns develops and antidote that reverses the Hulk transformation and has synthesized Banner blood", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("that have been sent from Brazil. Banner wants to destroy the blood supply in order to keep it from getting in", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("the hands of the military. Blonsky recovers from being severely injured and wishes to recapture the Hulk and", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("succeeds this time. Blonsky stays behind and orders Sterns to inject him with Banner's blood, as he covets", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("the Hulk's power. Sterns warns him that injecting him with Banners blood may react with the modified super", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("serum and make him an abomination but he doesn't care. The procedure empowers Blonsky to have power beyond the", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Hulk but completely destroys his mind, attacking Sterns. Sterns gets a cut on his forehead and Banners blood", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("enters through it causing his head to mutate. Blonsky starts to rampage across Harlem and Banner realizes he", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("is the only one who can stop him so he convinces General Ross to let him go. Banner drops out of the helicopter", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("and transforms when hitting the ground. In the fight the Hulk uses chains to restrain and strangle the Abomination", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("eventually knocking him out. The Hulk escapes after the fight and months after he is shown trying to control his", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("transformations. In the end credit scene, Tony Stark is shown to meet General Ross in a bar to discuss the", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("\"Avengers Initiative\"", 10, maxy - 550, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end TheIncredibleHulkContents

procedure IronMan2Contents
    MusicMovieID := 3
    cls
    Music.PlayFileLoop ("Iron Man 2 Theme.MP3")
    Font.Draw ("Iron Man 2", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Iron Man 2 starts with the return of Tony Stark with Robert Downey Junior playing the character. News about", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Iron Man's identity has spread all around the world and is being broadcasted to a prison cell in Russia. Ivan Vanko", 10, maxy - 115, TextFont, Black)
    Font.Draw ("whose father, Anton Vanko has just died, starts to build an arc reactor from blueprints he possesses. Six months later", 10, maxy - 130, TextFont, Black)
    Font.Draw ("Stark is shown to be using his Iron Man suit for peaceful purposes and resisting government attempts on seizing his", 10, maxy - 145, TextFont, Black)
    Font.Draw ("suit. He reinstitutes Stark Industries to continue his father, Howard Stark legacy. The arc reactor in Stark's chest", 10, maxy - 160, TextFont, Black)
    Font.Draw ("that has been keeping him alive and powering the Iron Man suit is also slowly poisoning Stark with Palladium and", 10, maxy - 175, TextFont, Black)
    Font.Draw ("an alternative element. Stark does not share this information with anyone else and starts behaving more erratically,", 10, maxy - 190, TextFont, Black)
    Font.Draw ("making Pepper Potts the CEO of Stark Industries and hiring Natalie Rushman as her personal assistant. Stark is", 10, maxy - 205, TextFont, Black)
    Font.Draw ("attacked when he races in the Monaco Historic Grand Prix by Ivan Vanko wielding electrical whips. Stark dons the", 10, maxy - 220, TextFont, Black)
    Font.Draw ("Iron Man suit and defeats Vanko in a fight but Vanko intention was to prove that Iron man is not invincible. Stark's", 10, maxy - 235, TextFont, Black)
    Font.Draw ("rival Justin Hammer, fakes Vanko's death while breaking him out of prison and asks him to build a line of armored", 10, maxy - 250, TextFont, Black)
    Font.Draw ("suits to upstage Stark. During what Stark believes to be his final birthday party, Stark get drunk in the Iron Man", 10, maxy - 265, TextFont, Black)
    Font.Draw ("suit and starts behaving irrationally, his best friend U.S. Air Force Lieutenant Colonel James Rhodes takes Stark's", 10, maxy - 280, TextFont, Black)
    Font.Draw ("prototype armor and takes off with it, confiscating the armor for the Air Force. Nick Fury, director of S.H.I.E.L.D,", 10, maxy - 295, TextFont, Black)
    Font.Draw ("approaches Stark and reveals that the personal assistant that Stark appointed was a SHIELD agent named Natasha", 10, maxy - 310, TextFont, Black)
    Font.Draw ("Romanoff. They explain that Howard Stark was a founding member of SHIELD and that Anton Vanko and Howard Stark", 10, maxy - 325, TextFont, Black)
    Font.Draw ("produced arc-reactor but when Vanko wanted to sell it for profits, Stark had him deported back to Russia which", 10, maxy - 340, TextFont, Black)
    Font.Draw ("resulted in him living the rest of his days in a gulag. Fury leaves some of Howard Stark's possessions to Tony to help", 10, maxy - 355, TextFont, Black)
    Font.Draw ("him cure the Palladium poisoning. Stark rediscovers an element his father had hid in the diorama of the 1974 Stark", 10, maxy - 370, TextFont, Black)
    Font.Draw ("Expo, he synthesizes it to find that it is a suitable replacement to the Palladium in his arc reactor without the", 10, maxy - 385, TextFont, Black)
    Font.Draw ("poison side effects. Stark learns that Vanko is still alive and rushes to the Stark Expo that is currently being held", 10, maxy - 400, TextFont, Black)
    Font.Draw ("to try and warn Rhodes who is in the prototype Iron man suit that has been heavily modified to have an arsenal.", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Along with Rhodes there are Vanko's armored drones at the performance that attack Stark when he arrives. Hammer", 10, maxy - 430, TextFont, Black)
    Font.Draw ("is arrested but Vanko escapes, Rhodes is given back control of his suit by Romanoff and chase after Vanko and Stark.", 10, maxy - 445, TextFont, Black)
    Font.Draw ("Rhodes and Stark defeat Vanko and his drones, Vanko commits suicide by blowing up both himself and all the drones", 10, maxy - 460, TextFont, Black)
    Font.Draw ("in an attempt to kill them but fail.", 10, maxy - 475, TextFont, Black)

    Font.Draw ("Mid Credit Scene: Stark meets with Fury about his recruitment into SHIELD but due to Romanoff report about Stark's", 10, maxy - 505, TextFont, Black)

    Pic.Draw (NewElementPic, 690, 360, picMerge)
    Font.Draw ("Tony Stark rediscovers a new element that could serve as", 690, 345, CaptionFont, Black)
    Font.Draw ("suitable replacement for the Palladium core", 690, 335, CaptionFont, Black)

    Pic.Draw (WhiplashFightPic, 690, 150, picMerge)
    Font.Draw ("Tony Stark and James Rhodes fight Ivan Vanko as he strangles", 690, 135, CaptionFont, Black)
    Font.Draw ("the two with electrical whips", 690, 125, CaptionFont, Black)

    loop
	movieTextWindow ("580")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Iron Man 2", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Iron Man 2 starts with the return of Tony Stark with Robert Downey Junior playing the character. News about", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Iron Man's identity has spread all around the world and is being broadcasted to a prison cell in Russia. Ivan Vanko", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("whose father, Anton Vanko has just died, starts to build an arc reactor from blueprints he possesses. Six months later", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Stark is shown to be using his Iron Man suit for peaceful purposes and resisting government attempts on seizing his", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("suit. He reinstitutes Stark Industries to continue his father, Howard Stark legacy. The arc reactor in Stark's chest", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("that has been keeping him alive and powering the Iron Man suit is also slowly poisoning Stark with Palladium and", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("an alternative element. Stark does not share this information with anyone else and starts behaving more erratically,", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("making Pepper Potts the CEO of Stark Industries and hiring Natalie Rushman as her personal assistant. Stark is", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("attacked when he races in the Monaco Historic Grand Prix by Ivan Vanko wielding electrical whips. Stark dons the", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Iron Man suit and defeats Vanko in a fight but Vanko intention was to prove that Iron man is not invincible. Stark's", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("rival Justin Hammer, fakes Vanko's death while breaking him out of prison and asks him to build a line of armored", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("suits to upstage Stark. During what Stark believes to be his final birthday party, Stark get drunk in the Iron Man", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("suit and starts behaving irrationally, his best friend U.S. Air Force Lieutenant Colonel James Rhodes takes Stark's", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("prototype armor and takes off with it, confiscating the armor for the Air Force. Nick Fury, director of S.H.I.E.L.D,", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("approaches Stark and reveals that the personal assistant that Stark appointed was a SHIELD agent named Natasha", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("Romanoff. They explain that Howard Stark was a founding member of SHIELD and that Anton Vanko and Howard Stark produced", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("arc-reactor but when Vanko wanted to sell it for profits, Stark had him deported back to Russia which resulted in him", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("living the rest of his days in a gulag. Fury leaves some of Howard Stark's possessions to Tony to help him cure the", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Palladium poisoning. Stark rediscovers an element his father had hid in the diorama of the 1974 Stark Expo, he", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("synthesizes it to find that it is a suitable replacement to the Palladium in his arc reactor without the poison", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("side effects. Stark learns that Vanko is still alive and rushes to the Stark Expo that is currently being held", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("to try and warn Rhodes who is in the prototype Iron man suit that has been heavily modified to have an arsenal.", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Along with Rhodes there are Vanko's armored drones at the performance that attack Stark when he arrives. Hammer", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("is arrested but Vanko escapes, Rhodes is given back control of his suit by Romanoff and chase after Vanko and Stark.", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Rhodes and Stark defeat Vanko and his drones, Vanko commits suicide by blowing up both himself and all the drones in", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("an attempt to kill them but fail. ", 10, maxy - 475, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Stark meets with Fury about his recruitment into SHIELD but due to Romanoff report about Stark's", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("egocentric personality, SHIELD only intend to use Stark as a consultant.", 10, maxy - 520, TextFont, Black)

	    Font.Draw ("Post Credit Scene: SHIELD agent Phil Coulsin is shown in desert and phones someone, stating he has found a large", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("hammer in a large crater in New Mexico.", 10, maxy - 565, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end IronMan2Contents


procedure ThorContents
    MusicMovieID := 4
    cls
    Music.PlayFileLoop ("Thor Main Theme.MP3")
    Font.Draw ("Thor", maxx div 2 - 30, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 965 AD, Odin, king of Asgard, wages war against the Frost Giants of Jotunheim and their leader Laufey, to prevent", 10, maxy - 100, TextFont, Black)
    Font.Draw ("them from conquering the nine realms, starting with Earth. The Asgardian warriors defeat the Frost Giants in Tønsberg,", 10, maxy - 115, TextFont, Black)
    Font.Draw ("Norway, and seize the source of their power, the Casket of Ancient Winters. Fast forward to the present, Thor, son", 10, maxy - 130, TextFont, Black)
    Font.Draw ("of Odin, is soon to be ascending the Throne of Asgard but an attack by Frost Giants trying to retrieve the casket.", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Against Odin's order, Thor crosses the Rainbow Bridge to Jotunheim to confront Laufrey with his brother Loki, childhood", 10, maxy - 160, TextFont, Black)
    Font.Draw ("friend Sif and the Warriors Three: Volstagg, Fandral, and Hogun. A battle erupts until Odin arrives to save the", 10, maxy - 175, TextFont, Black)
    Font.Draw ("Asgardians and in the process destroying the fragile truce between the two races. Thor is stripped of his powers", 10, maxy - 190, TextFont, Black)
    Font.Draw ("exiled to earth with his magical hammer Mjölnir, which Odin has cast an enchantment that whoever is worthy can wield", 10, maxy - 205, TextFont, Black)
    Font.Draw ("the hammer. Thor lands in New Mexico, where astrophysicist Dr. Jane Foster, her assistant Darcy Lewis, and mentor", 10, maxy - 220, TextFont, Black)
    Font.Draw ("Dr. Erik Selvig find him. The local populace find Mjölnir which S.H.I.E.L.D. agent Phil Coulson soon commandeers", 10, maxy - 235, TextFont, Black)
    Font.Draw ("before forcibly acquiring Foster's data about the wormhole that delivered Thor to Earth. Thor discovers the location", 10, maxy - 250, TextFont, Black)
    Font.Draw ("of Mjölnir and tries to retrieve it from the crater but fails to do so. Coulson and his agents capture Thor but", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Thor escapes with the help of Dr. Selvig and accepts his exile on Earth, developing a relation with Foster as well.", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Loki discovers that he is a frost giant adopted by Odin and is the biological son of Laufrey and when confronting Odin", 10, maxy - 295, TextFont, Black)
    Font.Draw ("about the matter, Odin falls into Odinsleep to recover his strength. Loki takes the throne in Odin's absence and", 10, maxy - 310, TextFont, Black)
    Font.Draw ("offers Laufrey a chance to kill Odin and retrieve the casket. Sif and the Warriors Three are unhappy with Loki's", 10, maxy - 325, TextFont, Black)
    Font.Draw ("rule and convince Heimdall, gatekeeper of the Bifröstthe means of traveling between worldsto allow them passage", 10, maxy - 340, TextFont, Black)
    Font.Draw ("to Earth. Aware of their plan, Loki sends the Destroyer, a seemingly indestructible automaton, to pursue them and", 10, maxy - 355, TextFont, Black)
    Font.Draw ("kill Thor. The warriors and Sif find Thor but are defeated by the Destroyer. Thor offers to sacrifice himself in", 10, maxy - 370, TextFont, Black)
    Font.Draw ("exchange for his friend's lives and in the process proves himself worthy to wield Mjölnir enabling himself to", 10, maxy - 385, TextFont, Black)
    Font.Draw ("defeat the Destroyer. Thor kisses Foster goodbye and returns to Asgard with the warriors and Sif to confront Loki.", 10, maxy - 400, TextFont, Black)
    Font.Draw ("At Asgard, Loki betrays and kills Laufrey, revealing his true plan to use Laufey's attempt on Odin's life as an", 10, maxy - 415, TextFont, Black)
    Font.Draw ("excuse to destroy Jotunheim with the Bifröst Bridge, thus proving himself worthy to his adoptive father. Thor", 10, maxy - 430, TextFont, Black)
    Font.Draw ("arrives and battles Loki on the Bifrost Bridge to stop Loki and his plan, Thor destroys the Bifrost bridge with", 10, maxy - 445, TextFont, Black)
    Font.Draw ("Mjölnir, rendering Loki's plan impossible but causes both of them to fall into the abyss. Odin awakens and saves", 10, maxy - 460, TextFont, Black)
    Font.Draw ("the brothers from falling but Loki seemingly commits suicide by letting go and falling into the abyss. Thor makes", 10, maxy - 475, TextFont, Black)
    Font.Draw ("amends with Odin, admitting he is not ready to be king; meanwhile, on Earth, Foster and her team search for a way", 10, maxy - 490, TextFont, Black)
    Font.Draw ("to open a portal to Asgard.", 10, maxy - 505, TextFont, Black)

    Pic.Draw (DestroyerPic, 690, 370, picMerge)
    Font.Draw ("Thor offers to sacrifice himself in exchange of the others,", 690, 355, CaptionFont, Black)
    Font.Draw ("in the process of doing so, proves himself to be worthy of", 690, 345, CaptionFont, Black)
    Font.Draw ("wielding Mjolnir", 690, 335, CaptionFont, Black)

    Pic.Draw (ThorvsLokiPic, 690, 140, picMerge)
    Font.Draw ("Loki hangs off the Bifrost bridge after Thor defeats him", 690, 125, CaptionFont, Black)



    loop
	movieTextWindow ("580")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Thor", maxx div 2 - 30, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 965 AD, Odin, king of Asgard, wages war against the Frost Giants of Jotunheim and their leader Laufey, to prevent", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("them from conquering the nine realms, starting with Earth. The Asgardian warriors defeat the Frost Giants in Tønsberg,", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("Norway, and seize the source of their power, the Casket of Ancient Winters. Fast forward to the present, Thor, son", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("of Odin, is soon to be ascending the Throne of Asgard but an attack by Frost Giants trying to retrieve the casket.", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Against Odin's order, Thor crosses the Rainbow Bridge to Jotunheim to confront Laufrey with his brother Loki, childhood", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("friend Sif and the Warriors Three: Volstagg, Fandral, and Hogun. A battle erupts until Odin arrives to save the", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("Asgardians and in the process destroying the fragile truce between the two races. Thor is stripped of his powers", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("exiled to earth with his magical hammer Mjölnir, which Odin has cast an enchantment that whoever is worthy can wield", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("the hammer. Thor lands in New Mexico, where astrophysicist Dr. Jane Foster, her assistant Darcy Lewis, and mentor", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Dr. Erik Selvig finds him. The local populace find Mjölnir which S.H.I.E.L.D. agent Phil Coulson soon commandeers", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("before forcibly acquiring Foster's data about the wormhole that delivered Thor to Earth. Thor discovers the location", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("of Mjölnir and tries to retrieve it from the crater but fails to do so. Coulson and his agents capture Thor but", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Thor escapes with the help of Dr. Selvig and accepts his exile on Earth, developing a relation with Foster as well.", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Loki discovers that he is a frost giant adopted by Odin and is the biological son of Laufrey and when confronting Odin", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("about the matter, Odin falls into Odinsleep to recover his strength. Loki takes the throne in Odin's absence and", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("offers Laufrey a chance to kill Odin and retrieve the casket. Sif and the Warriors Three are unhappy with Loki's", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("rule and convince Heimdall, gatekeeper of the Bifröstthe means of traveling between worldsto allow them passage", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("to Earth. Aware of their plan, Loki sends the Destroyer, a seemingly indestructible automaton, to pursue them and", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("kill Thor. The warriors and Sif find Thor but are defeated by the Destroyer. Thor offers to sacrifice himself in", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("exchange for his friend's lives and in the process proves himself worthy to wield Mjölnir enabling himself to", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("defeat the Destroyer. Thor kisses Foster goodbye and returns to Asgard with the warriors and Sif to confront Loki.", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("At Asgard, Loki betrays and kills Laufrey, revealing his true plan to use Laufey's attempt on Odin's life as an", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("excuse to destroy Jotunheim with the Bifröst Bridge, thus proving himself worthy to his adoptive father. Thor", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("arrives and battles Loki on the Bifrost Bridge to stop Loki and his plan, Thor destroys the Bifrost bridge with", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Mjölnir, rendering Loki's plan impossible but causes both of them to fall into the abyss. Odin awakens and saves", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("the brothers from falling but Loki seemingly commits suicide by letting go and falling into the abyss. Thor makes", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("amends with Odin, admitting he is not ready to be king; meanwhile, on Earth, Foster and her team search for a way", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("to open a portal to Asgard.", 10, maxy - 505, TextFont, Black)

	    Font.Draw ("End Credit Scene: Dr. Selvig meets with Nick Fury in a SHIELD facility where Fury opens a briefcase to reveal a", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("blue cube and asks him to study it, stating it could be to key to unlimited power.  An invisible Loki prompts", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Selvig to agree, and he does.", 10, maxy - 565, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end ThorContents


procedure CaptainAmerica1Contents
    MusicMovieID := 5
    cls
    Music.PlayFileLoop ("Captain America The First Avenger Theme Trimmed.MP3")
    Font.Draw ("Captain America: The First Avenger", maxx div 2 - 270, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Captain America: The First Avenger depicts the origin story behind the very first superhero that the Earth had", 10, maxy - 100, TextFont, Black)
    Font.Draw ("come to know, Captain America. In the modern day, an arctic exploration team discover an old and frozen aircraft.", 10, maxy - 115, TextFont, Black)
    Font.Draw ("One of the exploration members rappel down and find a shield with a star logo on it and radio out to get the colonel.", 10, maxy - 130, TextFont, Black)
    Font.Draw ("March 1942, Nazi officer Johann Schmidt and his men steal a mysterious relic called the Tesseract from the town", 10, maxy - 145, TextFont, Black)
    Font.Draw ("of Tønsberg in German-occupied Norway. The Tesseract is rumored to possess untold powers. In New York City, Steve", 10, maxy - 160, TextFont, Black)
    Font.Draw ("Rogers is watching a World War Two propaganda film when someone in the theatre is being loud, Rogers tell the man", 10, maxy - 175, TextFont, Black)
    Font.Draw ("to be quiet so the man beats up Rogers in an alleyway outside. Rogers tries to use a garbage can lid as a shield", 10, maxy - 190, TextFont, Black)
    Font.Draw ("and says \"I can do this all day\" but proceeds to get beat upon because of his small stature. Rogers best friend", 10, maxy - 205, TextFont, Black)
    Font.Draw ("Sgt. Bucky Barnes spots him in the alleyway and rescues him. While attending an exhibition of future technologies", 10, maxy - 220, TextFont, Black)
    Font.Draw ("with Barnes by Howard Stark, Rogers then tries to enlist for the war but is rejected because of his various health", 10, maxy - 235, TextFont, Black)
    Font.Draw ("problems. Overhearing Rogers' conversation with Barnes about wanting to help in the war, Dr. Abraham Erskine allows", 10, maxy - 250, TextFont, Black)
    Font.Draw ("Rogers to enlist. He is recruited into the Strategic Scientific Reserve as part of a \"super-soldier\" experiment", 10, maxy - 265, TextFont, Black)
    Font.Draw ("under Erskine, Col. Chester Phillips, and British agent Peggy Carter. Phillips is unconvinced by Erskine's claims", 10, maxy - 280, TextFont, Black)
    Font.Draw ("that Rogers is the right person for the procedure but relents after seeing Rogers commit an act of self-sacrificing", 10, maxy - 295, TextFont, Black)
    Font.Draw ("bravery. The night before the treatment, Erskine reveals to Rogers that Schmitt underwent the procedure before it", 10, maxy - 310, TextFont, Black)
    Font.Draw ("was perfected because of his greed for power and suffered permanent side effects. Schmidt and Dr. Arnim Zola harness", 10, maxy - 325, TextFont, Black)
    Font.Draw ("the energies of the Tesseract, intending to use the power to fuel Zola's inventions, mounting an offensive that will", 10, maxy - 340, TextFont, Black)
    Font.Draw ("change the world. Schmidt discovers Erskine's location and dispatches assassin Heinz Kruger to kill him. The super-", 10, maxy - 355, TextFont, Black)
    Font.Draw ("soldier procedure is started, Rogers is blasted with vita-rays and injected with the super-soldier serum. Rogers", 10, maxy - 370, TextFont, Black)
    Font.Draw ("transforms into a taller, stronger and faster person but Erksine gets killed by the undercover Kruger. Rogers pursues", 10, maxy - 385, TextFont, Black)
    Font.Draw ("on foot but Kruger commits suicide by cynanide capsule after he is captured, with his last breath he says \"Hail Hydra!\"", 10, maxy - 400, TextFont, Black)
    Font.Draw ("With Erksine dead and the super soldier serum smashed by Kruger, Rogers is grounded and performs as \"Captain America\"", 10, maxy - 415, TextFont, Black)
    Font.Draw ("for promoting war bonds and studied in an attempt to reverse-engineer the super-soldier serum. Rogers is on tour", 10, maxy - 430, TextFont, Black)
    Font.Draw ("in Italy performing for active servicemen and learns Barnes unit has gone MIA. Against orders, Rogers, Carter and", 10, maxy - 445, TextFont, Black)
    Font.Draw ("Stark who can pilot a plane fly into enemy territory to deliver Rogers in a Hydra base to find Barnes. Rogers frees", 10, maxy - 460, TextFont, Black)
    Font.Draw ("the captured men including Barnes and confronts Schmidt who pulls off his face to reveal it was a mask covering his", 10, maxy - 475, TextFont, Black)
    Font.Draw ("red skull underneath. Rogers recruits Barnes, Dum Dum Dugan, Gabe Jones, Jim Morita, James Montgomery Falsworth,", 10, maxy - 490, TextFont, Black)
    Font.Draw ("and Jacques Dernier to attack other known Hydra bases. Rogers is fitted with an indestructible shield made out of", 10, maxy - 505, TextFont, Black)

    Pic.Draw (ErskineTalkPic, 690, 350, picMerge)
    Font.Draw ("Dr. Erskine talks to Steve Rogers the night before the super", 690, 335, CaptionFont, Black)
    Font.Draw ("soldier procedure and tells Rogers why he was picked", 690, 325, CaptionFont, Black)

    Pic.Draw (CapPlaneCrashPic, 690, 130, picMerge)
    Font.Draw ("Steve Rogers crashes Schmitt's plane into the Arctic to avoid", 690, 115, CaptionFont, Black)
    Font.Draw ("the weapons from being detonated in New York", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("730")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Captain America: The First Avenger", maxx div 2 - 270, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Captain America: The First Avenger depicts the origin story behind the very first superhero that the Earth had", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("come to know, Captain America. In the modern day, an arctic exploration team discover an old and frozen aircraft.", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("One of the exploration members rappel down and find a shield with a star logo on it and radio out to get the colonel.", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("March 1942, Nazi officer Johann Schmidt and his men steal a mysterious relic called the Tesseract from the town", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("of Tønsberg in German-occupied Norway. The Tesseract is rumored to possess untold powers. In New York City, Steve", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("Rogers is watching a World War Two propaganda film when someone in the theatre is being loud, Rogers tell the man", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("to be quiet so the man beats up Rogers in an alleyway outside. Rogers tries to use a garbage can lid as a shield", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("and says \"I can do this all day\" but proceeds to get beat upon because of his small stature. Rogers best friend", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("Sgt. Bucky Barnes spots him in the alleyway and rescues him. While attending an exhibition of future technologies", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("with Barnes by Howard Stark, Rogers then tries to enlist for the war but is rejected because of his various health", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("problems. Overhearing Rogers' conversation with Barnes about wanting to help in the war, Dr. Abraham Erskine allows", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("Rogers to enlist. He is recruited into the Strategic Scientific Reserve as part of a \"super-soldier\" experiment", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("under Erskine, Col. Chester Phillips, and British agent Peggy Carter. Phillips is unconvinced by Erskine's claims", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("that Rogers is the right person for the procedure but relents after seeing Rogers commit an act of self-sacrificing", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("bravery. The night before the treatment, Erskine reveals to Rogers that Schmitt underwent the procedure before it", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("was perfected because of his greed for power and suffered permanent side effects. Schmidt and Dr. Arnim Zola harness", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("the energies of the Tesseract, intending to use the power to fuel Zola's inventions, mounting an offensive that will", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("change the world. Schmidt discovers Erskine's location and dispatches assassin Heinz Kruger to kill him. The super-", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("soldier procedure is started, Rogers is blasted with vita-rays and injected with the super-soldier serum. Rogers", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("transforms into a taller, stronger and faster person but Erksine gets killed by the undercover Kruger. Rogers pursues", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("on foot but Kruger commits suicide by cynanide capsule after he is captured, with his last breath he says \"Hail Hydra!\"", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("With Erksine dead and the super soldier serum smashed by Kruger, Rogers is grounded and performs as \"Captain America\"", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("for promoting war bonds and studied in an attempt to reverse-engineer the super-soldier serum. Rogers is on tour", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("in Italy performing for active servicemen and learns Barnes unit has gone MIA. Against orders, Rogers, Carter and", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Stark who can pilot a plane fly into enemy territory to deliver Rogers in a Hydra base to find Barnes. Rogers frees", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("the captured men including Barnes and confronts Schmidt who pulls off his face to reveal it was a mask covering his", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("red skull underneath. Rogers recruits Barnes, Dum Dum Dugan, Gabe Jones, Jim Morita, James Montgomery Falsworth,", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("and Jacques Dernier to attack other known Hydra bases. Rogers is fitted with an indestructible shield made out of", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Vibranium painted with a star on it. In 1945, the team assaults a train carrying Zola. Rogers and Jones succeed in", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("capturing Zola, but Barnes falls from the train to his apparent death. Rogers attacks the last Hydra stronghold", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("and captures it but Schmidt tries to take off with weapons of mass destruction in an airplane heading for New York.", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Rogers boards Schmidt's plane and the two of them fight but the Tesseract container gets damaged and the Tesseract", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("falls out. Schmidt physically touches the Tesseract which opens a wormhole in space, teleporting him out. The", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("Tesseract burns a hole in the plane and drops into ocean. With no safe location to land, Rogers radios Carter and", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("delivers a farewell message before crashing the plane in the Arctic.", 10, maxy - 610, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Rogers wakes up in a 1940 style hospital to find a nurse waiting there for him but he hears a", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("baseball game in 1941 he attended and deduces there's something wrong. He bursts out of the room to find it is a", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("fake and outside the building is Times Square. Nick Fury shows up to tell Rogers he's been asleep for nearly 70 years.", 10, maxy - 670, TextFont, Black)

	    Font.Draw ("End Credit Scene: Fury approaches Rogers in a boxing room to hand him some files stating that he needs Rogers to", 10, maxy - 700, TextFont, Black)
	    Font.Draw ("save the world.", 10, maxy - 715, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    Music.PlayFileStop
    switch (4) := false
    cls
end CaptainAmerica1Contents


procedure AvengersContents
    MusicMovieID := 6
    cls
    Music.PlayFileLoop ("The-Avengers-Theme-Song.MP3")
    Font.Draw ("The Avengers", maxx div 2 - 100, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("The Asgardian Loki is promised an army by the Other to conquer Earth in exchange for the Tesseract. Back on Earth,", 10, maxy - 100, TextFont, Black)
    Font.Draw ("the Tesseract starts to become unstable and an evacuation is ordered on the SHIELD facility. The Tesseract is being", 10, maxy - 115, TextFont, Black)
    Font.Draw ("studied by physicist Dr. Erik Selvig to discover how to tap in its power source. The Tesseract opens a wormhole", 10, maxy - 130, TextFont, Black)
    Font.Draw ("which Loki steps through and takes the Tesseract, in the process enslaving Selvig and a few other agents, including", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Clint Barton, by taping them in the chest with his scepter. In response of the attack, the Avengers initiative is", 10, maxy - 160, TextFont, Black)
    Font.Draw ("reactivated. SHIELD agent Natasha Romanoff is sent to recruit Dr. Bruce Banner because of his expertise on gamma", 10, maxy - 175, TextFont, Black)
    Font.Draw ("radiation, Agent Coulson is sent to Tony Stark and delivers files regarding Dr. Selvig's research and Fury approaches", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Steve Rogers with an assignment to retrieve the Tesseract. In Stuttgart, Germany, Barton steals iridium needed to", 10, maxy - 205, TextFont, Black)
    Font.Draw ("stabilize the Tesseract's power while Loki causes a distraction. A confrontation between Loki and Rogers, Romanoff", 10, maxy - 220, TextFont, Black)
    Font.Draw ("Stark leads to Loki's surrender and he is captured. While Loki is being escorted to S.H.I.E.L.D., Thor, his adoptive", 10, maxy - 235, TextFont, Black)
    Font.Draw ("brother, arrives and frees him, hoping to convince him to abandon his plan and return to Asgard. After a confrontation", 10, maxy - 250, TextFont, Black)
    Font.Draw ("with Stark and Rogers, Thor agrees to take Loki to S.H.I.E.L.D.'s flying aircraft carrier, the Helicarrier. Upon arrival,", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Loki is imprisoned while Banner and Stark attempt to locate the Tesseract. The Avengers become divided, both over how", 10, maxy - 280, TextFont, Black)
    Font.Draw ("to approach Loki and the revelation that S.H.I.E.L.D. plans to harness the Tesseracts energy to make weapons to combat", 10, maxy - 295, TextFont, Black)
    Font.Draw ("hostile extraterrestrials. Meanwhile, Barton and other agents possessed by Loki shut down of the Helicarrier engines", 10, maxy - 310, TextFont, Black)
    Font.Draw ("causing Banner to transform into the Hulk. Thor goes to fight the Hulk, Natasha finds Barton and knocks him unconscious", 10, maxy - 325, TextFont, Black)
    Font.Draw ("while Rogers and Stark fix the engine. Thor gets tricked into Loki's cage and is ejected below, Coulson gets killed", 10, maxy - 340, TextFont, Black)
    Font.Draw ("by Loki and Hulk falls to the ground after leaping onto a fighter jet. Fury uses Coulson's death to serve as a", 10, maxy - 355, TextFont, Black)
    Font.Draw ("motivator and get the team working together, Rogers and Stark predict that Loki is going to be at Stark Towers in New", 10, maxy - 370, TextFont, Black)
    Font.Draw ("York. Loki and Selvig use the Tesseract, a device Sevig created and the sustainable energy source from Stark Towers", 10, maxy - 385, TextFont, Black)
    Font.Draw ("to open a wormhole in the sky, allowing a large Chitari army to fly through. Rogers, Stark, Romanoff, Barton, and", 10, maxy - 400, TextFont, Black)
    Font.Draw ("Thor rally in defense of New York City, Banner shows up in a motorcycle he borrowed. Banner willingly transforms into", 10, maxy - 415, TextFont, Black)
    Font.Draw ("the Hulk and the Avengers fight against the Chitauri army while civilians are evacuated. Hulk beats Loki into submission,", 10, maxy - 430, TextFont, Black)
    Font.Draw ("Romanoff makes it to the wormhole generator where Dr. Selvig who is now free from Loki's control, reveals that the Loki's", 10, maxy - 445, TextFont, Black)
    Font.Draw ("scepter can shut down the generator. Meanwhile, Fury's superiors from the World Security Council attempt to end the", 10, maxy - 460, TextFont, Black)
    Font.Draw ("invasion by launching a nuclear missile at Midtown Manhattan. The two airplanes take off from the SHIELD Helicarrier", 10, maxy - 475, TextFont, Black)
    Font.Draw ("but Fury managed to destroy one of them, Stark intercepts the other Nuke and guides it into the wormhole detonating", 10, maxy - 490, TextFont, Black)
    Font.Draw ("it at the Chitauri mothership disabling all the Chitari. Romanoff disrupts the generator closing the portal just as", 10, maxy - 505, TextFont, Black)

    Pic.Draw (AvengersTeamupPic, 690, 350, picMerge)
    Font.Draw ("The Avengers are assembled in New York to battle against", 690, 335, CaptionFont, Black)
    Font.Draw ("the Chitauri invasion", 690, 325, CaptionFont, Black)

    Pic.Draw (LokiSmashedPic, 690, 130, picMerge)
    Font.Draw ("Loki gets smashed by the Hulk", 690, 115, CaptionFont, Black)

    loop
	movieTextWindow ("620")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("The Avengers", maxx div 2 - 100, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("The Asgardian Loki is promised an army by the Other to conquer Earth in exchange for the Tesseract. Back on Earth,", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("the Tesseract starts to become unstable and an evacuation is ordered on the SHIELD facility. The Tesseract is being", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("studied by physicist Dr. Erik Selvig to discover how to tap in its power source. The Tesseract opens a wormhole", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("which Loki steps through and takes the Tesseract, in the process enslaving Selvig and a few other agents, including", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Clint Barton, by taping them in the chest with his scepter. In response of the attack, the Avengers initiative is", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("reactivated. SHIELD agent Natasha Romanoff is sent to recruit Dr. Bruce Banner because of his expertise on gamma", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("radiation, Agent Coulson is sent to Tony Stark and delivers files regarding Dr. Selvig's research and Fury approaches", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Steve Rogers with an assignment to retrieve the Tesseract. In Stuttgart, Germany, Barton steals iridium needed to", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("stabilize the Tesseract's power while Loki causes a distraction. A confrontation between Loki and Rogers, Romanoff", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Stark leads to Loki's surrender and he is captured. While Loki is being escorted to S.H.I.E.L.D., Thor, his adoptive", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("brother, arrives and frees him, hoping to convince him to abandon his plan and return to Asgard. After a confrontation", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("with Stark and Rogers, Thor agrees to take Loki to S.H.I.E.L.D.'s flying aircraft carrier, the Helicarrier. Upon arrival,", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Loki is imprisoned while Banner and Stark attempt to locate the Tesseract. The Avengers become divided, both over how", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("to approach Loki and the revelation that S.H.I.E.L.D. plans to harness the Tesseracts energy to make weapons to combat", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("hostile extraterrestrials. Meanwhile, Barton and other agents possessed by Loki shut down of the Helicarrier engines", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("causing Banner to transform into the Hulk. Thor goes to fight the Hulk, Natasha finds Barton and knocks him unconscious", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("while Rogers and Stark fix the engine. Thor gets tricked into Loki's cage and is ejected below, Coulson gets killed", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("by Loki and Hulk falls to the ground after leaping onto a fighter jet. Fury uses Coulson's death to serve as a", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("motivator and get the team working together, Rogers and Stark predict that Loki is going to be at Stark Towers in New", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("York. Loki and Selvig use the Tesseract, a device Sevig created and the sustainable energy source from Stark Towers", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("to open a wormhole in the sky, allowing a large Chitari army to fly through. Rogers, Stark, Romanoff, Barton, and", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("Thor rally in defense of New York City, Banner shows up in a motorcycle he borrowed. Banner willingly transforms into", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("the Hulk and the Avengers fight against the Chitauri army while civilians are evacuated. Hulk beats Loki into submission,", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("Romanoff makes it to the wormhole generator where Dr. Selvig who is now free from Loki's control, reveals that the Loki's", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("scepter can shut down the generator. Meanwhile, Fury's superiors from the World Security Council attempt to end the", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("invasion by launching a nuclear missile at Midtown Manhattan. The two airplanes take off from the SHIELD Helicarrier", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("but Fury managed to destroy one of them, Stark intercepts the other Nuke and guides it into the wormhole detonating", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("it at the Chitauri mothership disabling all the Chitari. Romanoff disrupts the generator closing the portal just as", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Stark drops through the closing wormhole with no power in his suit. The Hulk saves Stark from the fall and roars to", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("awaken him. Stark requests that the Avengers should try shawarma at a nearby place, Thor returns Loki and the Tesseract", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("to Asgard, and while Fury expresses confidence that the Avengers will return if and when they are needed.", 10, maxy - 550, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: The Other confers with his master about the failed attack on Earth.", 10, maxy - 580, TextFont, Black)

	    Font.Draw ("End Credit Scene: The Avengers are shown quietly eating in a desolated shawarma place.", 10, maxy - 610, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    Music.PlayFileStop
    switch (4) := false
    cls
end AvengersContents


procedure IronMan3Contents
    MusicMovieID := 7
    cls
    Music.PlayFileLoop ("Iron Man 3 Theme.MP3")
    Font.Draw ("Iron Man 3", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In the New Year Party of 1999, Stark meets scientist Maya Hansen, the inventor of an experimental regenerative", 10, maxy - 100, TextFont, Black)
    Font.Draw ("treatment named Extremis that allows recovery from crippling injuries. Disabled scientist Aldrich Killian offers", 10, maxy - 115, TextFont, Black)
    Font.Draw ("them a place in his company Advanced Idea Mechanics, but Stark rejects him. In December 2012, seven months after", 10, maxy - 130, TextFont, Black)
    Font.Draw ("the Battle of New York, Tony Stark is suffering from Post-Traumatic Stress Disorder and having frequent anxiety", 10, maxy - 145, TextFont, Black)
    Font.Draw ("attacks due to the experiences from the battle. A string of bombings claimed by a terrorist known as the Mandarin", 10, maxy - 160, TextFont, Black)
    Font.Draw ("has left intelligence agencies bewildered by a lack of forensic evidence. Stark's security chief Happy Hogan is", 10, maxy - 175, TextFont, Black)
    Font.Draw ("badly injured in one such attack, prompting Stark to boldly issue a televised threat to the Mandarin, revealing", 10, maxy - 190, TextFont, Black)
    Font.Draw ("his home address in the process. The Mandarin sends gunship helicopters to destroy Stark's home. Hansen, who came", 10, maxy - 205, TextFont, Black)
    Font.Draw ("to warn Stark, survives the attack with Potts. Stark escapes in an experimental new Iron Man suit, which his", 10, maxy - 220, TextFont, Black)
    Font.Draw ("artificial intelligence J.A.R.V.I.S. pilots to rural Tennessee, following a flight plan from Stark's investigation", 10, maxy - 235, TextFont, Black)
    Font.Draw ("into the Mandarin. Stark's new armor is not fully functional, and lacks sufficient power to return to California,", 10, maxy - 250, TextFont, Black)
    Font.Draw ("leaving the world to believe him dead. Stark meets 10 year old Harley and investigates the site of one of the", 10, maxy - 265, TextFont, Black)
    Font.Draw ("bombings. Stark discovers that the bombings are soldiers subjected to Extremis and their body couldn't handle the ", 10, maxy - 280, TextFont, Black)
    Font.Draw ("treatment leading them to explode. Stark witnesses Extremis first hand when Mandarin agents Brandt and Savin attack", 10, maxy - 295, TextFont, Black)
    Font.Draw ("him: Stark kills Brandt, and incapacitates Savin. Meanwhile, Killian resurfaces and kidnaps Potts and Hansen. James", 10, maxy - 310, TextFont, Black)
    Font.Draw ("Rhodes, War Machine is lured into a trap by the Extremis group to steal the Iron Man armor. With Harley's help, Stark", 10, maxy - 325, TextFont, Black)
    Font.Draw ("traces the Mandarin to Miami and infiltrates his headquarters using improvised weapons. Inside he discovers the", 10, maxy - 340, TextFont, Black)
    Font.Draw ("Mandarin is actually an English actor named Trevor Slattery, who is oblivious to the actions carried out in his image.", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Killian is revealed to be the real Mandarin behind all the plots, after capturing Stark, Killian reveals that he has", 10, maxy - 370, TextFont, Black)
    Font.Draw ("subjected Potts to Extremis in the hope that Stark will help fix Extremis's flaws while trying to save her. Killian fatally", 10, maxy - 385, TextFont, Black)
    Font.Draw ("shoots Hansen when she tries to stop him. Stark escapes and reunites with Rhodes, discovering that Killian intends", 10, maxy - 400, TextFont, Black)
    Font.Draw ("to attack President Ellis aboard Air Force One, using the Iron Patriot armor, controlled by Savin. Savin is neutralized", 10, maxy - 415, TextFont, Black)
    Font.Draw ("and some of the passengers are rescued but the president is still captured and air force one is destroyed. Killian", 10, maxy - 430, TextFont, Black)
    Font.Draw ("intends to kill the president on live TV, the vice-president will become Killian's puppet in exchange for Extremis", 10, maxy - 445, TextFont, Black)
    Font.Draw ("to cure his young daughter's disability. Rhodes goes off to save the president while Stark goes off to save Potts,", 10, maxy - 460, TextFont, Black)
    Font.Draw ("the \"Iron Legion\", the remainder of Starks suits are summoned to help in the battle. The president is secured and", 10, maxy - 475, TextFont, Black)
    Font.Draw ("Potts is revealed to be alive but the rig collapses making Potts fall to her apparent death. Stark traps Killian in ", 10, maxy - 490, TextFont, Black)
    Font.Draw ("one of the Iron Man suits that is commanded to self-destruct but still fails to kill Killian but Potts reveals to", 10, maxy - 505, TextFont, Black)

    Pic.Draw (TheMechanicPic, 690, 330, picMerge)
    Font.Draw ("Dr. Erskine talks to Steve Rogers the night before the super", 690, 315, CaptionFont, Black)
    Font.Draw ("soldier procedure and tells Rogers why he was picked", 690, 305, CaptionFont, Black)

    Pic.Draw (KillianSuitDestructionPic, 690, 110, picMerge)
    Font.Draw ("Steve Rogers crashes Schmitt's plane into the Arctic to avoid", 690, 95, CaptionFont, Black)
    Font.Draw ("the weapons from being detonated in New York", 690, 85, CaptionFont, Black)

    loop
	movieTextWindow ("610")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Iron Man 3", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In the New Year Party of 1999, Stark meets scientist Maya Hansen, the inventor of an experimental regenerative", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("treatment named Extremis that allows recovery from crippling injuries. Disabled scientist Aldrich Killian offers", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("them a place in his company Advanced Idea Mechanics, but Stark rejects him. In December 2012, seven months after", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("the Battle of New York, Tony Stark is suffering from Post-Traumatic Stress Disorder and having frequent anxiety", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("attacks due to the experiences from the battle. A string of bombings claimed by a terrorist known as the Mandarin", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("has left intelligence agencies bewildered by a lack of forensic evidence. Stark's security chief Happy Hogan is", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("badly injured in one such attack, prompting Stark to boldly issue a televised threat to the Mandarin, revealing", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("his home address in the process. The Mandarin sends gunship helicopters to destroy Stark's home. Hansen, who came", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("to warn Stark, survives the attack with Potts. Stark escapes in an experimental new Iron Man suit, which his", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("artificial intelligence J.A.R.V.I.S. pilots to rural Tennessee, following a flight plan from Stark's investigation", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("into the Mandarin. Stark's new armor is not fully functional, and lacks sufficient power to return to California,", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("leaving the world to believe him dead. Stark meets 10 year old Harley and investigates the site of one of the", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("bombings. Stark discovers that the bombings are soldiers subjected to Extremis and their body couldn't handle the ", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("treatment leading them to explode. Stark witnesses Extremis first hand when Mandarin agents Brandt and Savin attack", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("him: Stark kills Brandt, and incapacitates Savin. Meanwhile, Killian resurfaces and kidnaps Potts and Hansen. James", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("Rhodes, War Machine is lured into a trap by the Extremis group to steal the Iron Man armor. With Harley's help, Stark", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("traces the Mandarin to Miami and infiltrates his headquarters using improvised weapons. Inside he discovers the", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Mandarin is actually an English actor named Trevor Slattery, who is oblivious to the actions carried out in his image.", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Killian is revealed to be the real Mandarin behind all the plots, after capturing Stark, Killian reveals that he has", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("subjected Potts to Extremis in the hope that Stark will help fix Extremis's flaws while trying to save her. Killian fatally", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("shoots Hansen when she tries to stop him. Stark escapes and reunites with Rhodes, discovering that Killian intends", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("to attack President Ellis aboard Air Force One, using the Iron Patriot armor, controlled by Savin. Savin is neutralized", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("and some of the passengers are rescued but the president is still captured and air force one is destroyed. Killian", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("intends to kill the president on live TV, the vice-president will become Killian's puppet in exchange for Extremis", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("to cure his young daughter's disability. Rhodes goes off to save the president while Stark goes off to save Potts,", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("the \"Iron Legion\", the remainder of Starks suits are summoned to help in the battle. The president is secured and", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("Potts is revealed to be alive but the rig collapses making Potts fall to her apparent death. Stark traps Killian in ", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("one of the Iron Man suits that is commanded to self-destruct but still fails to kill Killian but Potts reveals to", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("still be alive and with her Extremis powers, kills Killian. Stark orders J.A.R.V.I.S. to remotely destroy each Iron", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Man suit as a sign of his devotion to Potts, while the Vice President and Slattery are arrested. Potts Extremis is", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("removed, Stark wants to live a normal live and has the shrapnel removed from his heart as well as throwing his", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("arc reactor into the ocean. Harley is gifted with a load of new upgrades and inventions as a present from \"The Mechanic\"", 10, maxy - 565, TextFont, Black)

	    Font.Draw ("End Credit Scene: Banner is shown to be dozing off to Stark recounting his life story.", 10, maxy - 595, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end IronMan3Contents


procedure Thor2Contents
    MusicMovieID := 8
    cls
    Music.PlayFileLoop ("Thor 2 Theme.MP3")
    Font.Draw ("Thor: The Dark World", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Eons ago, Bor, father of Odin, clashes with the Dark Elf Malekith, who seeks to unleash a weapon known as the", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Aether on the nine realms. After conquering Malekith's forces, including enhanced warriors called the Kursed,", 10, maxy - 115, TextFont, Black)
    Font.Draw ("on their home world of Svartalfheim, Bor safeguards the Aether within a stone column. Unknown to Bor, Malekith", 10, maxy - 130, TextFont, Black)
    Font.Draw ("as well as his lieutenant Algrim and a handful of Dark Elves escape into suspended animation. In the present day,", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Loki is imprisoned for his war crimes on Earth, Thor is fighting marauders in Vanaheim, home of their comrade", 10, maxy - 160, TextFont, Black)
    Font.Draw ("Hogun; it is the final battle in a war to pacify the Nine Realms following the reconstruction of the Bifröst.", 10, maxy - 175, TextFont, Black)
    Font.Draw ("The Asguardians learn that the Convergence is soon to happen, portals are appearing because of the nine realms", 10, maxy - 190, TextFont, Black)
    Font.Draw ("coming in alignment. In London, astrophysicist Dr. Jane Foster and her intern Darcy Lewis travel to an abandoned", 10, maxy - 205, TextFont, Black)
    Font.Draw ("factory where such portals have appeared, Foster is separated and transported into another realm where she is", 10, maxy - 220, TextFont, Black)
    Font.Draw ("infected with the Aether. Heimdall, guardian of the Bifröst alerts Thor that Foster has disappeared from Heimdall's", 10, maxy - 235, TextFont, Black)
    Font.Draw ("near all-seeing vision. Thor travels to Earth to find Foster, when Thor finds Foster, she inadvertently releases ", 10, maxy - 250, TextFont, Black)
    Font.Draw ("an unearthly force, and Thor returns with her to Asgard. Odin, recognizing the Aether, warns that the Aether will", 10, maxy - 265, TextFont, Black)
    Font.Draw ("not only kill Foster but that its return heralds a catastrophic prophecy. Malekith, awakened by the Aether's release,", 10, maxy - 280, TextFont, Black)
    Font.Draw ("turns Algrim into a Kursed and attacks Asgard. During the battle, Malekith and Algrim search for Foster, sensing", 10, maxy - 295, TextFont, Black)
    Font.Draw ("that she contains the Aether. Thor's mother Frigga is killed protecting Foster, and Malekith and Algrim are forced", 10, maxy - 310, TextFont, Black)
    Font.Draw ("to flee. Thor reluctantly enlists the help of Loki who knows of a secret portal to Svartalfheim, plan to use Foster", 10, maxy - 325, TextFont, Black)
    Font.Draw ("as a bait to draw Malekith out and destroy him. Odin warns them not to leave Asgard but with Volstagg and Sif stalling", 10, maxy - 340, TextFont, Black)
    Font.Draw ("Asgardian soldiers and Fandral assisting their escape, Thor, Loki, and Foster head to Svartalfheim. Malekith is tricked", 10, maxy - 355, TextFont, Black)
    Font.Draw ("to draw the Aether out of Foster but Thor fails to destroy the substance. Malekith merges with the Aether and leaves", 10, maxy - 370, TextFont, Black)
    Font.Draw ("in his ship as Loki is fatally wounded while killing Algrim. Thor, cradling Loki in his arms, promises to tell their", 10, maxy - 385, TextFont, Black)
    Font.Draw ("father of his sacrifice. Foster and Thor arrive back on Earth through a nearby portal in a cave, reunite in London", 10, maxy - 400, TextFont, Black)
    Font.Draw ("with Lewis and Foster's mentor Dr. Erik Selvig. They learn that Malekith plans to restore the Dark Elves to dominance", 10, maxy - 415, TextFont, Black)
    Font.Draw ("by unleashing the Aether at the center of the Convergence in Greenwich. Thor battles Malekith through various portals", 10, maxy - 430, TextFont, Black)
    Font.Draw ("and across multiple worlds until one portal separates them, leaving Malekith unopposed on Earth. Thor returns in time", 10, maxy - 445, TextFont, Black)
    Font.Draw ("to help his mortal comrades use their scientific equipment to transport Malekith to Svartalfheim, where he is crushed", 10, maxy - 460, TextFont, Black)
    Font.Draw ("by his own damaged ship. Thor returns to Asgard, declines Odin's offer to become King of Asgard and tells Odin of", 10, maxy - 475, TextFont, Black)
    Font.Draw ("Loki's sacrifice. As Thor leaves, Odin transforms revealing it to be Loki impersonating him.", 10, maxy - 490, TextFont, Black)

    Pic.Draw (JanegetsExposedtoAetherPic, 690, 350, picMerge)
    Font.Draw ("Jane gets transported to another place through a portal and", 690, 335, CaptionFont, Black)
    Font.Draw ("gets infected with the Aether", 690, 325, CaptionFont, Black)

    Pic.Draw (ConvergencePic, 690, 130, picMerge)
    Font.Draw ("The nine realms are aligning together, something that", 690, 115, CaptionFont, Black)
    Font.Draw ("happens rarely throughout the ages", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("600")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Thor: The Dark World", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Eons ago, Bor, father of Odin, clashes with the Dark Elf Malekith, who seeks to unleash a weapon known as the", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Aether on the nine realms. After conquering Malekith's forces, including enhanced warriors called the Kursed,", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("on their home world of Svartalfheim, Bor safeguards the Aether within a stone column. Unknown to Bor, Malekith", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("as well as his lieutenant Algrim and a handful of Dark Elves escape into suspended animation. In the present day,", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Loki is imprisoned for his war crimes on Earth, Thor is fighting marauders in Vanaheim, home of their comrade", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("Hogun; it is the final battle in a war to pacify the Nine Realms following the reconstruction of the Bifröst.", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("The Asguardians learn that the Convergence is soon to happen, portals are appearing because of the nine realms", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("coming in alignment. In London, astrophysicist Dr. Jane Foster and her intern Darcy Lewis travel to an abandoned", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("factory where such portals have appeared, Foster is separated and transported into another realm where she is", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("infected with the Aether. Heimdall, guardian of the Bifröst alerts Thor that Foster has disappeared from Heimdall's", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("near all-seeing vision. Thor travels to Earth to find Foster, when Thor finds Foster, she inadvertently releases ", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("an unearthly force, and Thor returns with her to Asgard. Odin, recognizing the Aether, warns that the Aether will", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("not only kill Foster but that its return heralds a catastrophic prophecy. Malekith, awakened by the Aether's release,", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("turns Algrim into a Kursed and attacks Asgard. During the battle, Malekith and Algrim search for Foster, sensing", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("that she contains the Aether. Thor's mother Frigga is killed protecting Foster, and Malekith and Algrim are forced", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("to flee. Thor reluctantly enlists the help of Loki who knows of a secret portal to Svartalfheim, plan to use Foster", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("as a bait to draw Malekith out and destroy him. Odin warns them not to leave Asgard but with Volstagg and Sif stalling", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Asgardian soldiers and Fandral assisting their escape, Thor, Loki, and Foster head to Svartalfheim. Malekith is tricked", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("to draw the Aether out of Foster but Thor fails to destroy the substance. Malekith merges with the Aether and leaves", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("in his ship as Loki is fatally wounded while killing Algrim. Thor, cradling Loki in his arms, promises to tell their", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("father of his sacrifice. Foster and Thor arrive back on Earth through a nearby portal in a cave, reunite in London", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("with Lewis and Foster's mentor Dr. Erik Selvig. They learn that Malekith plans to restore the Dark Elves to dominance", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("by unleashing the Aether at the center of the Convergence in Greenwich. Thor battles Malekith through various portals", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("and across multiple worlds until one portal separates them, leaving Malekith unopposed on Earth. Thor returns in time", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("to help his mortal comrades use their scientific equipment to transport Malekith to Svartalfheim, where he is crushed", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("by his own damaged ship. Thor returns to Asgard, declines Odin's offer to become King of Asgard and tells Odin of", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("Loki's sacrifice. As Thor leaves, Odin transforms revealing it to be Loki impersonating him.", 10, maxy - 490, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: The Aether is given to the Collector by Sif and Volstagg, telling the Collector that they already", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("have the Tesseract and having two infinity stones in one place is not wise. ", 10, maxy - 535, TextFont, Black)

	    Font.Draw ("End Credit Scene: Foster and Thor reunite on Earth, while somewhere in London, a frost monster from Jotunheim, accidentally", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("transported to Earth during the final battle continues to run amok.", 10, maxy - 580, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end Thor2Contents


procedure CaptainAmerica2Contents
    MusicMovieID := 9
    cls
    Music.PlayFileLoop ("Captain America The Winter Soldier Theme.MP3")
    Font.Draw ("Captain America: The Winter Soldier", maxx div 2 - 280, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Two years after the Battle of New York, Steve Rogers is working at espionage agency SHIELD while still adjusting", 10, maxy - 100, TextFont, Black)
    Font.Draw ("to the world. Rogers and Agent Natasha Romanoff are sent with S.H.I.E.L.D.'s counter-terrorism S.T.R.I.K.E. team,", 10, maxy - 115, TextFont, Black)
    Font.Draw ("led by Agent Rumlow, to free hostages aboard a S.H.I.E.L.D. vessel from Georges Batroc and his mercenaries.", 10, maxy - 130, TextFont, Black)
    Font.Draw ("Mid-mission, Rogers discovers Romanoff has another agenda: to extract data from the ship's computers for Fury.", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Rogers confronts Fury about the hidden mission and is briefed about Project Insight: three Helicarriers linked", 10, maxy - 160, TextFont, Black)
    Font.Draw ("to spy satellites, designed to preemptively eliminate threats. Unable to decrypt the data recovered by Romanoff,", 10, maxy - 175, TextFont, Black)
    Font.Draw ("Fury becomes suspicious about Insight and asks senior S.H.I.E.L.D. official and Secretary of Internal Security", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Alexander Pierce to delay the project. Fury is on his way to rendezvous with agent and friend Maria Hill when", 10, maxy - 205, TextFont, Black)
    Font.Draw ("he is ambushed by the assassin by the name of the Winter Soldier. Fury escapes to Rogers apartment to warns him", 10, maxy - 220, TextFont, Black)
    Font.Draw ("SHIELD is compromised and is about to hand him a hard drive before he is seemingly fatally shot through the window", 10, maxy - 235, TextFont, Black)
    Font.Draw ("by the Winter Soldier. Maria Hill recovers Fury's body, Rogers is summoned by Pierce to disclose information", 10, maxy - 250, TextFont, Black)
    Font.Draw ("given to him by Fury. When he withholds the information, Rogers is branded as a fugitive and hunted down by STRIKE.", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Roger meets with Romanoff where they decrypt the information on the flash drive, which leads them to a secret", 10, maxy - 280, TextFont, Black)
    Font.Draw ("SHIELD bunker in New Jersey. There, they activate a super computer containing the consciousness of Arnim Zola,", 10, maxy - 295, TextFont, Black)
    Font.Draw ("who was taken into SHIELD for work. Zola reveals that every since SHIELD was founded HYDRA has been operated", 10, maxy - 310, TextFont, Black)
    Font.Draw ("within its ranks, sowing global chaos with the objective of making humanity surrender its freedom in exchange", 10, maxy - 325, TextFont, Black)
    Font.Draw ("for security. Zola finishes by revealing he is stalling time for a missile heading for the bunker but Rogers and", 10, maxy - 340, TextFont, Black)
    Font.Draw ("Romanoff barely escapes. The two of them realise that Alexander Pierce is HYDRA's leader within SHIELD and enlist", 10, maxy - 355, TextFont, Black)
    Font.Draw ("the help of former USAF pararescueman Sam Wilson, whom Rogers befriended, and acquire his powered \"Falcon\" wingpack.", 10, maxy - 370, TextFont, Black)
    Font.Draw ("Deducing that S.H.I.E.L.D. agent Jasper Sitwell is a Hydra mole, they force him to divulge that Zola developed a data-", 10, maxy - 385, TextFont, Black)
    Font.Draw ("mining algorithm that can identify individuals becoming threats to Hydra. The Insight Carriers will eliminate anyone", 10, maxy - 400, TextFont, Black)
    Font.Draw ("that is a threat by using satellite guided guns. Rogers, Romanoff and Wilson are ambushed by the Winter Soldier who", 10, maxy - 415, TextFont, Black)
    Font.Draw ("kills Sitwell, during the fight the Winter Soldier's mask falls off revealing his identity to be Bucky Barnes, Rogers", 10, maxy - 430, TextFont, Black)
    Font.Draw ("childhood friend. Barnes supposedly fell to his death on a mission, but was actually captured and experimented upon", 10, maxy - 445, TextFont, Black)
    Font.Draw ("after WWII. Hill manages to rescue the trio and deliver them to a warehouse where Fury is residing and reveals that", 10, maxy - 460, TextFont, Black)
    Font.Draw ("he faked his death. Fury has plans to sabotage the helicarriers by replacing controller chips. After the World", 10, maxy - 475, TextFont, Black)
    Font.Draw ("Security Council members arrive for the Helicarriers' launch, Rogers broadcasts Hydra's plot to everyone at the", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Triskelion. Romanoff, disguised as one of the Council members, disarms Pierce. Fury arrives and forces Pierce to", 10, maxy - 505, TextFont, Black)

    Pic.Draw (STRIKEElevatorPic, 690, 350, picMerge)
    Font.Draw ("STRIKE team enter the elevator with Steve Rogers, planning to", 690, 335, CaptionFont, Black)
    Font.Draw ("take him down", 690, 325, CaptionFont, Black)

    Pic.Draw (InsightPic, 690, 130, picMerge)
    Font.Draw ("The helicarriers from Project Insight are launched to survey", 690, 115, CaptionFont, Black)
    Font.Draw ("and kill threats around the world", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("730")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Captain America: The Winter Soldier", maxx div 2 - 280, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Two years after the Battle of New York, Steve Rogers is working at espionage agency SHIELD while still adjusting", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("to the world. Rogers and Agent Natasha Romanoff are sent with S.H.I.E.L.D.'s counter-terrorism S.T.R.I.K.E. team,", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("led by Agent Rumlow, to free hostages aboard a S.H.I.E.L.D. vessel from Georges Batroc and his mercenaries.", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Mid-mission, Rogers discovers Romanoff has another agenda: to extract data from the ship's computers for Fury.", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Rogers confronts Fury about the hidden mission and is briefed about Project Insight: three Helicarriers linked", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("to spy satellites, designed to preemptively eliminate threats. Unable to decrypt the data recovered by Romanoff,", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("Fury becomes suspicious about Insight and asks senior S.H.I.E.L.D. official and Secretary of Internal Security", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Alexander Pierce to delay the project. Fury is on his way to rendezvous with agent and friend Maria Hill when", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("he is ambushed by the assassin by the name of the Winter Soldier. Fury escapes to Rogers apartment to warns him", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("SHIELD is compromised and is about to hand him a hard drive before he is seemingly fatally shot through the window", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("by the Winter Soldier. Maria Hill recovers Fury's body, Rogers is summoned by Pierce to disclose information", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("given to him by Fury. When he withholds the information, Rogers is branded as a fugitive and hunted down by STRIKE.", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Roger meets with Romanoff where they decrypt the information on the flash drive, which leads them to a secret", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("SHIELD bunker in New Jersey. There, they activate a super computer containing the consciousness of Arnim Zola,", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("who was taken into SHIELD for work. Zola reveals that every since SHIELD was founded HYDRA has been operated", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("within its ranks, sowing global chaos with the objective of making humanity surrender its freedom in exchange", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("for security. Zola finishes by revealing he is stalling time for a missile heading for the bunker but Rogers and", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Romanoff barely escapes. The two of them realise that Alexander Pierce is HYDRA's leader within SHIELD and enlist", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("the help of former USAF pararescueman Sam Wilson, whom Rogers befriended, and acquire his powered \"Falcon\" wingpack.", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("Deducing that S.H.I.E.L.D. agent Jasper Sitwell is a Hydra mole, they force him to divulge that Zola developed a data-", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("mining algorithm that can identify individuals becoming threats to Hydra. The Insight Carriers will eliminate anyone", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("that is a threat by using satellite guided guns. Rogers, Romanoff and Wilson are ambushed by the Winter Soldier who", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("kills Sitwell, during the fight the Winter Soldier's mask falls off revealing his identity to be Bucky Barnes, Rogers", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("childhood friend. Barnes supposedly fell to his death on a mission, but was actually captured and experimented upon", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("after WWII. Hill manages to rescue the trio and deliver them to a warehouse where Fury is residing and reveals that", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("he faked his death. Fury has plans to sabotage the helicarriers by replacing controller chips. After the World", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("Security Council members arrive for the Helicarriers' launch, Rogers broadcasts Hydra's plot to everyone at the", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Triskelion. Romanoff, disguised as one of the Council members, disarms Pierce. Fury arrives and forces Pierce to", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("unlock S.H.I.E.L.D.'s database so that Romanoff can leak classified information, exposing Hydra to the public.", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Fury kills Pierce in a struggle while Rogers and Wilson replace the controller chips for two of the helicarriers.", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("Wilson's suit is disabled by the Winter Soldier and Rogers fights the Winter Soldier on the third helicarrier.", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Rogers manages to replace the chip while fighting Barnes, then refusing the fight Barnes anymore stating he is his", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("friend. Rogers is thrown into the Potomac River and then rescued by Barnes by dragging him to shore then disappearing.", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("Romanoff appears before a Senate subcommittee and Fury, under the cover of his apparent death, heads to Eastern Europe", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("in pursuit of Hydra's remaining cells. Rogers and Wilson decide to find the Winter Soldier, while Rumlow, who was a", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("double agent for Hydra, is hospitalized following the Triskelion's destruction.", 10, maxy - 625, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: In a mid-credits scene, Baron Wolfgang von Strucker, at a Hydra lab, proclaims that the \"age of miracles\"", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("has begun as scientists examine an energy-filled scepter[N 2] and two test subjects: one with superhuman speed, the other with", 10, maxy - 670, TextFont, Black)
	    Font.Draw ("telekinetic powers.", 10, maxy - 685, TextFont, Black)

	    Font.Draw ("End Credit Scene: Bucky Barnes is shown to be at Smithsonian Institution reading his own biography.", 10, maxy - 715, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end CaptainAmerica2Contents


procedure GuardiansoftheGalaxyContents
    MusicMovieID := 10
    cls
    Music.PlayFileLoop ("Guardians of the Galaxy Theme.MP3")
    Font.Draw ("Guardians of the Galaxy Vol. 1", maxx div 2 - 220, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 1988, following his mother's death, a young Peter Quill is abducted from Earth by the Ravagers, a group of", 10, maxy - 100, TextFont, Black)
    Font.Draw ("alien thieves and smugglers led by Yondu Udonta. Twenty-six years later on the planet Morag, Quill steals a.", 10, maxy - 115, TextFont, Black)
    Font.Draw ("mysterious orb but is attacked by Korath, a subordinate to the fanatical Kree militant, Ronan. Although Quill", 10, maxy - 130, TextFont, Black)
    Font.Draw ("escapes with the orb, Yondu discovers his theft and issues a bounty for his capture, while Ronan sends the", 10, maxy - 145, TextFont, Black)
    Font.Draw ("assassin Gamora after the orb. When Quill attempts to sell the orb on Xandar, capital of the Nova Empire,", 10, maxy - 160, TextFont, Black)
    Font.Draw ("Gamora ambushes him and steals it. A fight ensues, drawing in a pair of bounty hunters: the genetically and", 10, maxy - 175, TextFont, Black)
    Font.Draw ("cybernetically modified raccoon Rocket, and the tree-like humanoid Groot. Nova Corps officers capture the", 10, maxy - 190, TextFont, Black)
    Font.Draw ("four, detaining them in the Kyln prison. Drax the Destroyer, a powerful inmate attempts to kill Gamora because", 10, maxy - 205, TextFont, Black)
    Font.Draw ("of her connection to Ronan and Thanos who killed his family. Quill establishes a truce by stating that Gamora", 10, maxy - 220, TextFont, Black)
    Font.Draw ("could be used to lure out Ronan. Gamora reveals that she betrayed Ronan so that the orb wouldn't land in his", 10, maxy - 235, TextFont, Black)
    Font.Draw ("hands and intends to sell it to the Collector Taneleer Tivan, Quill, Rocket, Groot, and Drax work with her to", 10, maxy - 250, TextFont, Black)
    Font.Draw ("escape the Kyln in Quill's ship, the Milano. Ronan meets with Gamora's adoptive father, Thanos, to discuss her", 10, maxy - 265, TextFont, Black)
    Font.Draw ("betrayal. Quill's group flee to Knowhere, a remote lawless outpost in space built in the giant severed head of", 10, maxy - 280, TextFont, Black)
    Font.Draw ("a Celestial. A drunken Drax summons Ronan while the rest of the group meet Tivan. Tivan reveals that the orb is", 10, maxy - 295, TextFont, Black)
    Font.Draw ("an infinity stone, one of the objects since the beginning of time that grants immeasurable power but destroys ", 10, maxy - 310, TextFont, Black)
    Font.Draw ("most wielders. Tivan's slave Carina grabs the Stone, destroying the majority of the place but everyone survives.", 10, maxy - 325, TextFont, Black)
    Font.Draw ("Ronan easily defeats Drax, making the others flee by ship but Gamora's ship is destroyed which leads Quill to", 10, maxy - 340, TextFont, Black)
    Font.Draw ("send a transmission to Yondu revealing his location and transferring his face mask to Gamora. Yondu and the", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Ravagers retrieve the duo and imprison the two of them. Rocket, Drax, and Groot threaten to attack Yondu's ship", 10, maxy - 370, TextFont, Black)
    Font.Draw ("to rescue them, but Quill negotiates a truce, promising the orb to Yondu. Quill's group agrees that facing Ronan", 10, maxy - 385, TextFont, Black)
    Font.Draw ("means certain death, but that they cannot let him use the Infinity Stone to destroy the galaxy. On Ronan's", 10, maxy - 400, TextFont, Black)
    Font.Draw ("flagship, the Dark Aster, Ronan embeds the Stone in his warhammer allowing him to wield the power. Ronan", 10, maxy - 415, TextFont, Black)
    Font.Draw ("contacts Thanos, threatening to kill him after destroying Xandar, Nebula allies with Xandar because of shared", 10, maxy - 430, TextFont, Black)
    Font.Draw ("hatred of her adoptive father. The Ravagers and Quill's group join with the Nova Corps to confront the Dark Aster", 10, maxy - 445, TextFont, Black)
    Font.Draw ("at Xandar, with Quill's group breaching the Dark Aster with the Milano. Ronan uses his empowered warhammer to", 10, maxy - 460, TextFont, Black)
    Font.Draw ("destroy the Nova Corps fleet. Drax kills Korath and Gamora defeats Nebula, who escapes, but the group find ", 10, maxy - 475, TextFont, Black)
    Font.Draw ("themselves outmatched by Ronan's power until Rocket crashes a Ravager ship through the Dark Aster. The damaged", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Dark Aster crash-lands on Xandar, with Groot sacrificing himself to shield the group. Ronan emerges from the wreck", 10, maxy - 505, TextFont, Black)

    Pic.Draw (PowerOrbPic, 690, 350, picMerge)
    Font.Draw ("This the power orb that contains the power stone, an object of", 690, 335, CaptionFont, Black)
    Font.Draw ("immense power.", 690, 325, CaptionFont, Black)

    Pic.Draw (DanceOffPic, 740, 110, picMerge)
    Font.Draw ("Peter Quill is having a dance off to distract Ronan and stall", 690, 95, CaptionFont, Black)
    Font.Draw ("time to blast the power stone out of the warhammer", 690, 85, CaptionFont, Black)

    loop
	movieTextWindow ("690")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Guardians of the Galaxy Vol 1", maxx div 2 - 220, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 1988, following his mother's death, a young Peter Quill is abducted from Earth by the Ravagers, a group of", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("alien thieves and smugglers led by Yondu Udonta. Twenty-six years later on the planet Morag, Quill steals a.", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("mysterious orb but is attacked by Korath, a subordinate to the fanatical Kree militant, Ronan. Although Quill", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("escapes with the orb, Yondu discovers his theft and issues a bounty for his capture, while Ronan sends the", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("assassin Gamora after the orb. When Quill attempts to sell the orb on Xandar, capital of the Nova Empire,", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("Gamora ambushes him and steals it. A fight ensues, drawing in a pair of bounty hunters: the genetically and", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("cybernetically modified raccoon Rocket, and the tree-like humanoid Groot. Nova Corps officers capture the", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("four, detaining them in the Kyln prison. Drax the Destroyer, a powerful inmate attempts to kill Gamora because", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("of her connection to Ronan and Thanos who killed his family. Quill establishes a truce by stating that Gamora", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("could be used to lure out Ronan. Gamora reveals that she betrayed Ronan so that the orb wouldn't land in his", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("hands and intends to sell it to the Collector Taneleer Tivan, Quill, Rocket, Groot, and Drax work with her to", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("escape the Kyln in Quill's ship, the Milano. Ronan meets with Gamora's adoptive father, Thanos, to discuss her", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("betrayal. Quill's group flee to Knowhere, a remote lawless outpost in space built in the giant severed head of", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("a Celestial. A drunken Drax summons Ronan while the rest of the group meet Tivan. Tivan reveals that the orb is", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("an infinity stone, one of the objects since the beginning of time that grants immeasurable power but destroys ", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("most wielders. Tivan's slave Carina grabs the Stone, destroying the majority of the place but everyone survives.", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("Ronan easily defeats Drax, making the others flee by ship but Gamora's ship is destroyed which leads Quill to", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("send a transmission to Yondu revealing his location and transferring his face mask to Gamora. Yondu and the", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Ravagers retrieve the duo and imprison the two of them. Rocket, Drax, and Groot threaten to attack Yondu's ship", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("to rescue them, but Quill negotiates a truce, promising the orb to Yondu. Quill's group agrees that facing Ronan", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("means certain death, but that they cannot let him use the Infinity Stone to destroy the galaxy. On Ronan's", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("flagship, the Dark Aster, Ronan embeds the Stone in his warhammer allowing him to wield the power. Ronan", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("contacts Thanos, threatening to kill him after destroying Xandar, Nebula allies with Xandar because of shared", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("hatred of her adoptive father. The Ravagers and Quill's group join with the Nova Corps to confront the Dark Aster", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("at Xandar, with Quill's group breaching the Dark Aster with the Milano. Ronan uses his empowered warhammer to", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("destroy the Nova Corps fleet. Drax kills Korath and Gamora defeats Nebula, who escapes, but the group find ", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("themselves outmatched by Ronan's power until Rocket crashes a Ravager ship through the Dark Aster. The damaged", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Dark Aster crash-lands on Xandar, with Groot sacrificing himself to shield the group. Ronan emerges from the wreck", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("and prepares to destroy Xandar, but Quill distracts him, allowing Drax and Rocket to destroy Ronan's warhammer.", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Quill grabs the freed Stone, and with Gamora, Drax, and Rocket sharing its burden, uses it to vaporize Ronan.", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("After the battle, Quill hands Yondu a fake orb while delivering the real one to the Nova corps. As the Ravagers", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("leave Xandar, Yondu remarks that it turned out well that they did not deliver Quill to his father per their", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("contract. The crew is now called the Guardians of the Galaxy and have all their criminal records erased. Quill", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("learns that he is only half-human, his father being part of an ancient, unknown species. Quill finally opens", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("the last present he received from his mother: a cassette tape filled with her favorite songs. The Guardians", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("leave in the rebuilt Milano along with a sapling cut from Groot, which grows into a baby version of him.", 10, maxy - 625, TextFont, Black)

	    Font.Draw ("In a post-credits scene, Tivan sits in his destroyed archive with two of his living exhibits: a canine cosmonaut", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("and an anthropomorphic duck.", 10, maxy - 670, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end GuardiansoftheGalaxyContents


procedure Avengers2Contents
    MusicMovieID := 11
    cls
    Music.PlayFileLoop ("Avengers Age of Ultron Theme Trimmed.MP3")
    Font.Draw ("Avengers: Age of Ultron", maxx div 2 - 180, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In the Eastern European country of Sokovia, the AvengersTony Stark, Steve Rogers, Thor, Bruce Banner, Natasha", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Romanoff, and Clint Bartonraid a Hydra facility commanded by Baron Wolfgang von Strucker, who has been", 10, maxy - 115, TextFont, Black)
    Font.Draw ("experimenting on humans using the scepter previously wielded by Loki. They encounter two of Strucker's test subjects", 10, maxy - 130, TextFont, Black)
    Font.Draw ("twins Pietro, who has superhuman speed, and Wanda Maximoff, who has telepathic and telekinetic abilities and", 10, maxy - 145, TextFont, Black)
    Font.Draw ("apprehend Strucker, while Stark retrieves Loki's scepter. Banner and Stark discover that there is an artificial intelligence", 10, maxy - 160, TextFont, Black)
    Font.Draw ("within the scepter gem and use it for global defense program. The artificial intelligence Ultron decides to rid of", 10, maxy - 175, TextFont, Black)
    Font.Draw ("humanity to save Earth, destroys JARVIS and attacks the Avengers before escaping through the net. Ultron uses the", 10, maxy - 190, TextFont, Black)
    Font.Draw ("resources in Strucker's Sokovia base to upgrade his rudimentary body and build an army of robot drones. Ultrin kills,", 10, maxy - 205, TextFont, Black)
    Font.Draw ("Strucker recruits the Maximoff twins whom bear a grudge against Stark for the death of their parents by Stark's weapons.", 10, maxy - 220, TextFont, Black)
    Font.Draw ("Ultron seeks out arms dealer Ulysses Klaue in Johannesburg to obtain Wakandan vibranium. Avengers attack Ultron", 10, maxy - 235, TextFont, Black)
    Font.Draw ("and the Maximoffs, but Wanda subdues them with haunting visions, causing Banner to turn into the Hulk and rampage", 10, maxy - 250, TextFont, Black)
    Font.Draw ("until Stark stops him with his Hulkbuster armor. A worldwide backlash over the resulting destruction, and the fears", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Wanda's hallucinations incited, send the team into hiding at a safe house. Thor departs to consult with Dr. Erik", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Selvig on the apocalyptic future he saw in his hallucination, while Nick Fury arrives and encourages the team to", 10, maxy - 295, TextFont, Black)
    Font.Draw ("form a plan to stop Ultron. In Seoul, Ultron uses Loki's scepter to enslave the team's friend Dr. Helen Cho. Through", 10, maxy - 310, TextFont, Black)
    Font.Draw ("her synthetic tissue technology, Ultron creates a body made out of Vibranium with the gem from Loki's scepter embedded", 10, maxy - 325, TextFont, Black)
    Font.Draw ("in his forehead. When uploading his consciousness, Wanda Maximoff sees his plan for global extinction and the twins", 10, maxy - 340, TextFont, Black)
    Font.Draw ("turn against him. The Avengers steal the synthetic body but Romanoff is captured by Ultron in the process. Banner", 10, maxy - 355, TextFont, Black)
    Font.Draw ("and Stark secretly reupload JARVIS into the body but the Avengers have different opinions on this. Thor comes back", 10, maxy - 370, TextFont, Black)
    Font.Draw ("explaining that the gem is the Mind Stone, one of the six Infinity Stones, the most powerful objects in existence", 10, maxy - 385, TextFont, Black)
    Font.Draw ("and finishes integrating the body with a hammer strike.  This \"Vision\" and the Maximoffs accompany the Avengers", 10, maxy - 400, TextFont, Black)
    Font.Draw ("to Sokovia, where Ultron has used the remaining vibranium to build a machine to lift a large part of the capital", 10, maxy - 415, TextFont, Black)
    Font.Draw ("city skyward, intending to crash it into the ground to cause global extinction. Banner rescues Romanoff, who", 10, maxy - 430, TextFont, Black)
    Font.Draw ("awakens the Hulk for the battle. Fury arrives in a helicarrier with  Maria Hill, James Rhodes and S.H.I.E.L.D. agents", 10, maxy - 445, TextFont, Black)
    Font.Draw ("to evacuate civilians. Pietro Maximoff dies when he shields Hawkeye from bullets, this causes Wanda to become", 10, maxy - 460, TextFont, Black)
    Font.Draw ("enraged and destroy Ultron's prime body but leaving her post unguarded allowing one of the drones to activate", 10, maxy - 475, TextFont, Black)
    Font.Draw ("the switch to drop Sokovia. Stark and Thor work together to overload the machine and in the process shatter the land", 10, maxy - 490, TextFont, Black)
    Font.Draw ("avoiding the crisis. In the aftermath, the Hulk, unwilling to endanger Romanoff by being with her, departs in a Quinjet,", 10, maxy - 505, TextFont, Black)

    Pic.Draw (UltronPic, 690, 330, picMerge)
    Font.Draw ("Ultron has just destroyed JARVIS and is meeting the Avengers", 690, 315, CaptionFont, Black)
    Font.Draw ("for the first time", 690, 305, CaptionFont, Black)

    Pic.Draw (VisionBirthPic, 690, 110, picMerge)
    Font.Draw ("Vision is born from a body of Vibranium, Thor's energy", 690, 95, CaptionFont, Black)
    Font.Draw ("strike, Mind Stone, Banner and Starks's programming", 690, 85, CaptionFont, Black)

    loop
	movieTextWindow ("620")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Avengers: Age of Ultron", maxx div 2 - 180, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In the Eastern European country of Sokovia, the Avengers: Tony Stark, Steve Rogers, Thor, Bruce Banner, Natasha", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Romanoff, and Clint Bartonraid a Hydra facility commanded by Baron Wolfgang von Strucker, who has been experimenting", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("on humans using the scepter previously wielded by Loki. They encounter two of Strucker's test subjectstwins Pietro,", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("who has superhuman speed, and Wanda Maximoff, who has telepathic and telekinetic abilitiesand apprehend Strucker,", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("while Stark retrieves Loki's scepter. Banner and Stark discover that there is an artificial intelligence within", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("the scepter gem and use it for global defense program. The artificial intelligence Ultron decides to rid of humanity", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("to save Earth, destroys JARVIS and attacks the Avengers before escaping through the net. Ultron uses the resources", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("in Strucker's Sokovia base to upgrade his rudimentary body and build an army of robot drones. Ultrin kills Strucker,", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("recruits the Maximoff twins whom bear a grudge against Stark for the death of their parents by Stark's weapons.", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Ultron seeks out arms dealer Ulysses Klaue in Johannesburg to obtain Wakandan vibranium. Avengers attack Ultron", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("and the Maximoffs, but Wanda subdues them with haunting visions, causing Banner to turn into the Hulk and rampage", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("until Stark stops him with his Hulkbuster armor. A worldwide backlash over the resulting destruction, and the fears", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Wanda's hallucinations incited, send the team into hiding at a safe house. Thor departs to consult with Dr. Erik", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Selvig on the apocalyptic future he saw in his hallucination, while Nick Fury arrives and encourages the team to", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("form a plan to stop Ultron. In Seoul, Ultron uses Loki's scepter to enslave the team's friend Dr. Helen Cho. Through", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("her synthetic tissue technology, Ultron creates a body made out of Vibranium with the gem from Loki's scepter embedded", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("in his forehead. When uploading his consciousness, Wanda Maximoff sees his plan for global extinction and the twins", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("turn against him. The Avengers steal the synthetic body but Romanoff is captured by Ultron in the process. Banner", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("and Stark secretly reupload JARVIS into the body but the Avengers have different opinions on this. Thor comes back", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("explaining that the gem is the Mind Stone, one of the six Infinity Stones, the most powerful objects in existence", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("and finishes integrating the body with a hammer strike.  This \"Vision\" and the Maximoffs accompany the Avengers", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("to Sokovia, where Ultron has used the remaining vibranium to build a machine to lift a large part of the capital", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("city skyward, intending to crash it into the ground to cause global extinction. Banner rescues Romanoff, who", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("awakens the Hulk for the battle. Fury arrives in a helicarrier with  Maria Hill, James Rhodes and S.H.I.E.L.D. agents", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("to evacuate civilians. Pietro Maximoff dies when he shields Hawkeye from bullets, this causes Wanda to become", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("enraged and destroy Ultron's prime body but leaving her post unguarded allowing one of the drones to activate", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("the switch to drop Sokovia. Stark and Thor work together to overload the machine and in the process shatter the land", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("avoiding the crisis. In the aftermath, the Hulk, unwilling to endanger Romanoff by being with her, departs in a Quinjet,", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("while Vision confronts and seemingly destroys Ultron's last remaining body. ater, with the Avengers having established", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("a new base run by Fury, Hill, Cho, and Selvig, Thor returns to Asgard to learn more about the forces he suspects have", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("manipulated recent events. As Stark leaves and Barton retires, Rogers and Romanoff prepare to train new Avengers:", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Rhodes, Vision, Sam Wilson, and Wanda.", 10, maxy - 565, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Thanos is disappointed by the success of his pawns so he puts on a gauntlet and decides to get", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("the Infinity Stones himself.", 10, maxy - 610, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end Avengers2Contents


procedure AntManContents
    MusicMovieID := 12
    cls
    Music.PlayFileLoop ("Ant Man Theme Trimmed.MP3")

    Font.Draw ("Ant Man", maxx div 2 - 60, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 1989, scientist Hank Pym resigns from S.H.I.E.L.D. after discovering their attempt to replicate his Ant-Man", 10, maxy - 100, TextFont, Black)
    Font.Draw ("shrinking technology. Believing the technology would be dangerous if replicated, Pym vows to hide it for as long", 10, maxy - 115, TextFont, Black)
    Font.Draw ("as he lives. n the present day, Pym's estranged daughter, Hope van Dyne, and former protégé, Darren Cross,", 10, maxy - 130, TextFont, Black)
    Font.Draw ("have forced him out of his company, Pym Technologies. Cross is close to perfecting a shrinking suit of his own,", 10, maxy - 145, TextFont, Black)
    Font.Draw ("the Yellowjacket, which horrifies Pym. Scott Lang, a thief is just getting released from prison after serving his", 10, maxy - 160, TextFont, Black)
    Font.Draw ("sentence.  Lang visits his daughter Cassie unannounced and is rebuked by his former wife Maggie and her police-", 10, maxy - 175, TextFont, Black)
    Font.Draw ("detective fiancé, Paxton, for not providing child support. Unable to hold down a job because of his criminal record,", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Lang agrees to join Luis' crew and commit a burglary. He only finds what he thinks is an old motorcycle outfit", 10, maxy - 205, TextFont, Black)
    Font.Draw ("and takes it home. After trying on the suit, Lang accidentally shrinks down in the bathtub. Lang tries to return", 10, maxy - 220, TextFont, Black)
    Font.Draw ("the suit after being traumatized but is caught and arrested on his way out. Pym, the homeowner, visits Lang in", 10, maxy - 235, TextFont, Black)
    Font.Draw ("jail and smuggles the suit into his cell to help him break out. Pym guided an unknowing Luis into getting Lang to", 10, maxy - 250, TextFont, Black)
    Font.Draw ("help him break into his house as a test. Lang had unknowingly passes and Pym is entrusted Lang to steal to the", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Yellowjacket suit from Cross. Lang gets training from both Van Dyne and Lang, to work with ants and fight. Van", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Dyne who harbours a grudge to her father because of her mother's disappearance but Pym reveals that Janet went", 10, maxy - 295, TextFont, Black)
    Font.Draw ("subatomic and never came back. Pym is warned that he could suffer the same fate if he overrides his regulator.", 10, maxy - 310, TextFont, Black)
    Font.Draw ("Lang is sent to the Avengers headquarters thought to be an unguarded warehouse and briefly fights Sam Wilson to", 10, maxy - 325, TextFont, Black)
    Font.Draw ("steal a piece of equipment from the headquarter. Cross perfects the Yellowjacket and hosts an unveiling ceremony", 10, maxy - 340, TextFont, Black)
    Font.Draw ("at Pym Technologies' headquarters. Lang, along with his crew and a swarm of flying ants, infiltrates the building", 10, maxy - 355, TextFont, Black)
    Font.Draw ("during the event, sabotages the company's servers, and plants explosives. When he attempts to steal the Yellowjacket,", 10, maxy - 370, TextFont, Black)
    Font.Draw ("he, along with Pym and Van Dyne, are captured by Cross, who intends to sell both the Yellowjacket and Ant-Man suits", 10, maxy - 385, TextFont, Black)
    Font.Draw ("to Hydra. Lang breaks free and he and Van Dyne dispatch most of the Hydra agents, though one flees with a vial of", 10, maxy - 400, TextFont, Black)
    Font.Draw ("Cross' particles and Pym is shot. Lang pursues Cross, while the explosives detonate, imploding the building as Pym", 10, maxy - 415, TextFont, Black)
    Font.Draw ("and Van Dyne escape. Cross uses the Yellowjacket suit and battles Lang, Paxton shows up to arrest Lang but Cassie", 10, maxy - 430, TextFont, Black)
    Font.Draw ("is kidnapped by Cross. Lang goes subatomic and into the quantum realm, sabotaging Cross's suit and making it", 10, maxy - 445, TextFont, Black)
    Font.Draw ("malfunction, killing him. Scott manages to return from the quantum realm and in exchange of Lang's heroic actions", 10, maxy - 460, TextFont, Black)
    Font.Draw ("Payton lets him go. Seeing that Lang survived and returned from the quantum realm, Pym wonders if his wife is", 10, maxy - 475, TextFont, Black)
    Font.Draw ("alive as well. Later, Lang meets up with Luis, who tells him that Wilson is looking for him.", 10, maxy - 490, TextFont, Black)

    Pic.Draw (AntManShrinksintotheQuantumRealmPic, 690, 350, picMerge)
    Font.Draw ("Ant Man shrinks into the quantum realm when trying to", 690, 335, CaptionFont, Black)
    Font.Draw ("overload Cross's suit", 690, 325, CaptionFont, Black)

    Pic.Draw (FirstAntManShrinkPic, 690, 130, picMerge)
    Font.Draw ("Scott Lang accidentally shrinks down with the Ant Man", 690, 115, CaptionFont, Black)
    Font.Draw ("suit in his bathtub.", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("600")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Ant Man", maxx div 2 - 60, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 1989, scientist Hank Pym resigns from S.H.I.E.L.D. after discovering their attempt to replicate his Ant-Man", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("shrinking technology. Believing the technology would be dangerous if replicated, Pym vows to hide it for as long", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("as he lives. n the present day, Pym's estranged daughter, Hope van Dyne, and former protégé, Darren Cross,", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("have forced him out of his company, Pym Technologies. Cross is close to perfecting a shrinking suit of his own,", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("the Yellowjacket, which horrifies Pym. Scott Lang, a thief is just getting released from prison after serving his", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("sentence.  Lang visits his daughter Cassie unannounced and is rebuked by his former wife Maggie and her police-", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("detective fiancé, Paxton, for not providing child support. Unable to hold down a job because of his criminal record,", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Lang agrees to join Luis' crew and commit a burglary. He only finds what he thinks is an old motorcycle outfit", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("and takes it home. After trying on the suit, Lang accidentally shrinks down in the bathtub. Lang tries to return", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("the suit after being traumatized but is caught and arrested on his way out. Pym, the homeowner, visits Lang in", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("jail and smuggles the suit into his cell to help him break out. Pym guided an unknowing Luis into getting Lang to", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("help him break into his house as a test. Lang had unknowingly passes and Pym is entrusted Lang to steal to the", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Yellowjacket suit from Cross. Lang gets training from both Van Dyne and Lang, to work with ants and fight. Van", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Dyne who harbours a grudge to her father because of her mother's disappearance but Pym reveals that Janet went", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("subatomic and never came back. Pym is warned that he could suffer the same fate if he overrides his regulator.", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("Lang is sent to the Avengers headquarters thought to be an unguarded warehouse and briefly fights Sam Wilson to", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("steal a piece of equipment from the headquarter. Cross perfects the Yellowjacket and hosts an unveiling ceremony", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("at Pym Technologies' headquarters. Lang, along with his crew and a swarm of flying ants, infiltrates the building", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("during the event, sabotages the company's servers, and plants explosives. When he attempts to steal the Yellowjacket,", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("he, along with Pym and Van Dyne, are captured by Cross, who intends to sell both the Yellowjacket and Ant-Man suits", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("to Hydra. Lang breaks free and he and Van Dyne dispatch most of the Hydra agents, though one flees with a vial of", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("Cross' particles and Pym is shot. Lang pursues Cross, while the explosives detonate, imploding the building as Pym", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("and Van Dyne escape. Cross uses the Yellowjacket suit and battles Lang, Paxton shows up to arrest Lang but Cassie", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("is kidnapped by Cross. Lang goes subatomic and into the quantum realm, sabotaging Cross's suit and making it", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("malfunction, killing him. Scott manages to return from the quantum realm and in exchange of Lang's heroic actions", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("Payton lets him go. Seeing that Lang survived and returned from the quantum realm, Pym wonders if his wife is", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("alive as well. Later, Lang meets up with Luis, who tells him that Wilson is looking for him.", 10, maxy - 490, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Pym shows Van Dyne a new Wasp prototype suit and offers it to her, Van Dyne smirks and says", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("\"It's about damn time\"", 10, maxy - 535, TextFont, Black)

	    Font.Draw ("End Credit Scene: Wilson and Steve Rogers have Bucky Barnes in their custody. Unable to contact Tony Stark", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("because of \"the accords\", Wilson mentions that he knows someone who can help.", 10, maxy - 580, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    cls
end AntManContents


procedure CaptainAmerica3Contents
    MusicMovieID := 13
    cls
    Music.PlayFileLoop ("Captain America Civil War - Main Theme.MP3")
    Font.Draw ("Captain America: Civil War", maxx div 2 - 210, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 1991, the brainwashed super-soldier James \"Bucky\" Barnes is dispatched from a Hydra base in Siberia to intercept", 10, maxy - 100, TextFont, Black)
    Font.Draw ("an automobile carrying a case of super-soldier serum. In the present day, approximately one year after Ultron's", 10, maxy - 115, TextFont, Black)
    Font.Draw ("defeat by the Avengers in Sokovia. Steve Rogers, Natasha Romanoff, Sam Wilson, and Wanda Maximoff stop Brock Rumlow", 10, maxy - 130, TextFont, Black)
    Font.Draw ("from stealing a biological weapon from a lab in Lagos. Rumlow blows himself up, attempting to kill Rogers but", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Maximoff telekinetically contains the explosion and throws it in the air accidently blowing up part of a building", 10, maxy - 160, TextFont, Black)
    Font.Draw ("and killing several Wakandan humanitarian workers. U.S. Secretary of State Thaddeus Ross informs the Avengers that", 10, maxy - 175, TextFont, Black)
    Font.Draw ("the United Nations (UN) is preparing to pass the Sokovia Accords, which will establish a UN panel to oversee and", 10, maxy - 190, TextFont, Black)
    Font.Draw ("control the team. The Avengers are divided: Tony Stark supports oversight because of his role in Ultron's creation", 10, maxy - 205, TextFont, Black)
    Font.Draw ("and Sokovia's devastation, while Rogers has more faith in his own judgment than that of a government. Meanwhile,", 10, maxy - 220, TextFont, Black)
    Font.Draw ("Helmut Zemo tracks down and kills Barnes' old Hydra handler, stealing a book containing the trigger words that", 10, maxy - 235, TextFont, Black)
    Font.Draw ("activate Barnes' brainwashing. At a conference in Vienna where the accords are going to be ratified, a bomb is set", 10, maxy - 250, TextFont, Black)
    Font.Draw ("off killing many people including T'Chaka, king of Wakanda. T'Challa vows to swear revenge and the bomber is", 10, maxy - 265, TextFont, Black)
    Font.Draw ("seemingly identified as Bucky Barnes whom T'Challa starts to hunt after in his Black Panther suit. Informed by", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Sharon Carter of Barnes' whereabouts and the authorities' intentions to kill him, Rogers and Wilson seek him out", 10, maxy - 295, TextFont, Black)
    Font.Draw ("to try and bring in Barnes themselves.  Rogers and Wilson track Barnes to Bucharest and attempt to protect him from", 10, maxy - 310, TextFont, Black)
    Font.Draw ("T'Challa and the authorities but they all get arrested. Impersonating a psychiatrist sent to interview Barnes, Zemo", 10, maxy - 325, TextFont, Black)
    Font.Draw ("recites the words to make Barnes obey him. He questions Barnes, then sends him on a rampage to cover his own escape.", 10, maxy - 340, TextFont, Black)
    Font.Draw ("Rogers stops Barnes and sneaks him away. When Barnes regains his senses, he explains that Zemo is the real Vienna", 10, maxy - 355, TextFont, Black)
    Font.Draw ("bomber and wanted the location of the Siberian Hydra base, where other brainwashed \"Winter Soldiers\" are kept in", 10, maxy - 370, TextFont, Black)
    Font.Draw ("cryogenic stasis. Rogers and Wilson go rogue, not willing to wait till the authorities catch Zemo, recruit Maximoff,", 10, maxy - 385, TextFont, Black)
    Font.Draw ("Clint Barton, and Scott Lang. With Ross's permission, Stark assembles a team composed of Romanoff, T'Challa, Rhodes,", 10, maxy - 400, TextFont, Black)
    Font.Draw ("Vision, and Peter Parker to capture the renegades. Stark's team intercepts Rogers' group at Leipzig/Halle Airport,", 10, maxy - 415, TextFont, Black)
    Font.Draw ("where they fight until Romanoff allows Rogers and Barnes to escape. The rest of Rogers' team is captured and detained", 10, maxy - 430, TextFont, Black)
    Font.Draw ("at the Raft prison, while Rhodes is partially paralyzed after being inadvertently shot down by Vision, and Romanoff", 10, maxy - 445, TextFont, Black)
    Font.Draw ("goes into exile. Stark discovers the possibility that Barnes may have been framed when he learns that he investigator", 10, maxy - 460, TextFont, Black)
    Font.Draw ("is dead. He learns the location of Rogers and Barnes from Wilson by telling him that Barnes was framed and without", 10, maxy - 475, TextFont, Black)
    Font.Draw ("Ross knowing, flies there in his Iron Man suit. T'Challa is flying right behind him in his stealth jet unbeknownst", 10, maxy - 490, TextFont, Black)
    Font.Draw ("to Stark. Stark makes a truce with Rogers and Barnes, explore the facility to learn that the super soldiers were", 10, maxy - 505, TextFont, Black)

    Pic.Draw (AirportBattlePic, 690, 350, picMerge)
    Font.Draw ("The Avengers face off in Halle Airport in Berlin to stop them from", 690, 335, CaptionFont, Black)
    Font.Draw ("going any further", 690, 325, CaptionFont, Black)

    Pic.Draw (CivilFightPic, 690, 130, picMerge)
    Font.Draw ("Rogers and Barnes battle Stark to survive while Stark wants", 690, 115, CaptionFont, Black)
    Font.Draw ("revenge for his parents that were killed by Barnes", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("700")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Captain America: Civil War", maxx div 2 - 210, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 1991, the brainwashed super-soldier James \"Bucky\" Barnes is dispatched from a Hydra base in Siberia to intercept", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("an automobile carrying a case of super-soldier serum. In the present day, approximately one year after Ultron's", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("defeat by the Avengers in Sokovia. Steve Rogers, Natasha Romanoff, Sam Wilson, and Wanda Maximoff stop Brock Rumlow", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("from stealing a biological weapon from a lab in Lagos. Rumlow blows himself up, attempting to kill Rogers but", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Maximoff telekinetically contains the explosion and throws it in the air accidently blowing up part of a building", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("and killing several Wakandan humanitarian workers. U.S. Secretary of State Thaddeus Ross informs the Avengers that", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("the United Nations (UN) is preparing to pass the Sokovia Accords, which will establish a UN panel to oversee and", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("control the team. The Avengers are divided: Tony Stark supports oversight because of his role in Ultron's creation", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("and Sokovia's devastation, while Rogers has more faith in his own judgment than that of a government. Meanwhile,", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("Helmut Zemo tracks down and kills Barnes' old Hydra handler, stealing a book containing the trigger words that", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("activate Barnes' brainwashing. At a conference in Vienna where the accords are going to be ratified, a bomb is set", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("off killing many people including T'Chaka, king of Wakanda. T'Challa vows to swear revenge and the bomber is", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("seemingly identified as Bucky Barnes whom T'Challa starts to hunt after in his Black Panther suit. Informed by", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Sharon Carter of Barnes' whereabouts and the authorities' intentions to kill him, Rogers and Wilson seek him out", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("to try and bring in Barnes themselves.  Rogers and Wilson track Barnes to Bucharest and attempt to protect him from", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("T'Challa and the authorities but they all get arrested. Impersonating a psychiatrist sent to interview Barnes, Zemo", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("recites the words to make Barnes obey him. He questions Barnes, then sends him on a rampage to cover his own escape.", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Rogers stops Barnes and sneaks him away. When Barnes regains his senses, he explains that Zemo is the real Vienna", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("bomber and wanted the location of the Siberian Hydra base, where other brainwashed \"Winter Soldiers\" are kept in", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("cryogenic stasis. Rogers and Wilson go rogue, not willing to wait till the authorities catch Zemo, recruit Maximoff,", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("Clint Barton, and Scott Lang. With Ross's permission, Stark assembles a team composed of Romanoff, T'Challa, Rhodes,", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("Vision, and Peter Parker to capture the renegades. Stark's team intercepts Rogers' group at Leipzig/Halle Airport,", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("where they fight until Romanoff allows Rogers and Barnes to escape. The rest of Rogers' team is captured and detained", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("at the Raft prison, while Rhodes is partially paralyzed after being inadvertently shot down by Vision, and Romanoff", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("goes into exile. Stark discovers the possibility that Barnes may have been framed when he learns that he investigator", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("is dead. He learns the location of Rogers and Barnes from Wilson by telling him that Barnes was framed and without", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("Ross knowing, flies there in his Iron Man suit. T'Challa is flying right behind him in his stealth jet unbeknownst", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("to Stark. Stark makes a truce with Rogers and Barnes, explore the facility to learn that the super soldiers were", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("all shot dead by Zemo. Zemo then proceeds to show a video of Barnes assassinating Stark's parents in 1991, Stark", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("asks if Rogers knew which he admits to. Stark turns on both Rogers and Barnes that leads into an intense fight", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("with Barnes robotic arm being destroyed and Stark's arc reactor getting damaged by Rogers. He departs with Barnes,", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("leaving his shield behind. Satisfied that he has avenged his family's deaths in Sokovia from the Avengers' actions", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("by successfully fracturing them, Zemo attempts suicide, but he is stopped by T'Challa and taken to the authorities.", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("Rhodes is provided with exoskeletal leg braces that allow him to walk again by Stark while Rogers breaks his", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("teammates out of the Raft.", 10, maxy - 610, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Barnes, granted asylum in Wakanda, chooses to return to cryogenic sleep until a cure for his", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("brainwashing is found.", 10, maxy - 655, TextFont, Black)

	    Font.Draw ("Post Credit Scene: Parker explores the features of the web shooters built for him by Stark.", 10, maxy - 685, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end CaptainAmerica3Contents


procedure DoctorStrangeContents
    MusicMovieID := 14
    cls
    Music.PlayFileLoop ("Doctor Strange Main Theme Trimmed.MP3")
    Font.Draw ("Doctor Strange", maxx div 2 - 110, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In Kathmandu, the sorcerer Kaecilius and his zealots enter the secret compound Kamar-Taj and behead its librarian.", 10, maxy - 100, TextFont, Black)
    Font.Draw ("They steal a few pages from an ancient, mystical text belonging to the Ancient One, a long-lived sorcerer who has", 10, maxy - 115, TextFont, Black)
    Font.Draw ("taught every student at Kamar-Taj, including Kaecilius, in the mystic arts. The Ancient One pursues the traitors,", 10, maxy - 130, TextFont, Black)
    Font.Draw ("but Kaecilius and his followers escape. In New York City, Stephen Strange, a wealthy, acclaimed, and arrogant", 10, maxy - 145, TextFont, Black)
    Font.Draw ("neurosurgeon, severely injures his hands in a car crash, leaving him unable to operate. Fellow surgeon Christine", 10, maxy - 160, TextFont, Black)
    Font.Draw ("Palmer tries to help him move on, but Strange vainly pursues experimental surgeries to heal his hands, nearly", 10, maxy - 175, TextFont, Black)
    Font.Draw ("bankrupting himself. Strange learns about Jonathan Pangborn, a paraplegic who mysteriously regained use of his legs.", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Pangborn directs Strange to Kamar-Taj, where he is taken in by Mordo, a sorcerer under the Ancient One. The Ancient", 10, maxy - 205, TextFont, Black)
    Font.Draw ("One demonstrates her power to Strange, revealing the astral plane and other dimensions such as the Mirror Dimension.", 10, maxy - 220, TextFont, Black)
    Font.Draw ("She reluctantly agrees to train Strange, whose arrogance and ambition remind her of Kaecilius. Strange studies under", 10, maxy - 235, TextFont, Black)
    Font.Draw ("Ancient One and Mordo, and learns from the ancient books in the library that Earth is guarded from extradimensional ", 10, maxy - 250, TextFont, Black)
    Font.Draw ("threats by a shield generated by the three sanctums on Earth: New York City, London, and Hong Kong. They are all", 10, maxy - 265, TextFont, Black)
    Font.Draw ("connected and accessible from Kamar-Taj and the sorcerer's job is to protect the sanctums. Strange progresses quickly,", 10, maxy - 280, TextFont, Black)
    Font.Draw ("and secretly reads the text from which Kaecilius stole pages, learning to bend time with the mystical Eye of Agamotto.", 10, maxy - 295, TextFont, Black)
    Font.Draw ("Mordo and Wong warn Strange against breaking the laws of nature, drawing a comparison to Kaecilius' desire for eternal", 10, maxy - 310, TextFont, Black)
    Font.Draw ("life. Kaecilius uses the stolen pages to contact Dormammu of the Dark Dimension, where time is non-existent. Kaecilius", 10, maxy - 325, TextFont, Black)
    Font.Draw ("destroys the London Sanctum to weaken Earth's protection. The zealots then attack the New York Sanctum, killing its", 10, maxy - 340, TextFont, Black)
    Font.Draw ("guardian, but Strange holds them off with the help of the Cloak of Levitation until Mordo and the Ancient One arrive.", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Mordo becomes disillusioned with the Ancient One after Strange reveals that the Ancient One has been drawing power", 10, maxy - 370, TextFont, Black)
    Font.Draw ("from the Dark Dimension to sustain her long life. The Ancient One fights Kaecilius in the mirror dimension but", 10, maxy - 385, TextFont, Black)
    Font.Draw ("is fatally stabbed through one of Kaecilius' own subordinates. Before dying, the Ancient one appears in her astral", 10, maxy - 400, TextFont, Black)
    Font.Draw ("form to tell Strange that he too will have to bend the rules to complement Mordo's steadfast nature in order to.", 10, maxy - 415, TextFont, Black)
    Font.Draw ("defeat Kaecilius. Strange and Mordo arrive in Hong Kong to find Wong dead, the Sanctum destroyed, and the Dark", 10, maxy - 430, TextFont, Black)
    Font.Draw ("Dimension engulfing Earth. Strange uses the Eye of Agamotto to reverse the damage done, restoring the sanctum and", 10, maxy - 445, TextFont, Black)
    Font.Draw ("reviving Wong. Strange enters the Dark Dimension and sets a time loop, trying to bargain with Dormammu. Dormammu", 10, maxy - 460, TextFont, Black)
    Font.Draw ("gives in after killing Strange so many times to no avail, Dormammu halts his assault on Earth and take Kaecilius", 10, maxy - 475, TextFont, Black)
    Font.Draw ("and his zealots with him. Disillusioned by Strange and the Ancient One defying nature's laws, Mordo departs.", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Strange returns the Eye to Kamar-Taj and takes up residence in the New York Sanctum to continue his studies.", 10, maxy - 505, TextFont, Black)

    Pic.Draw (MirrorDimensionPic, 690, 350, picMerge)
    Font.Draw ("Dr. Strange, Mordo and the Ancient One face Kaecilius in the mirror", 690, 335, CaptionFont, Black)
    Font.Draw ("dimension where reality is whatever you want it to be", 690, 325, CaptionFont, Black)

    Pic.Draw (BargainPic, 690, 130, picMerge)
    Font.Draw ("Dr. Strange bargains with Dormammu to stop the assault on Earth,", 690, 115, CaptionFont, Black)
    Font.Draw ("withdraw his men and never come back", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("600")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Doctor Strange", maxx div 2 - 110, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In Kathmandu, the sorcerer Kaecilius and his zealots enter the secret compound Kamar-Taj and behead its librarian.", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("They steal a few pages from an ancient, mystical text belonging to the Ancient One, a long-lived sorcerer who has", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("taught every student at Kamar-Taj, including Kaecilius, in the mystic arts. The Ancient One pursues the traitors,", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("but Kaecilius and his followers escape. In New York City, Stephen Strange, a wealthy, acclaimed, and arrogant", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("neurosurgeon, severely injures his hands in a car crash, leaving him unable to operate. Fellow surgeon Christine", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("Palmer tries to help him move on, but Strange vainly pursues experimental surgeries to heal his hands, nearly", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("bankrupting himself. Strange learns about Jonathan Pangborn, a paraplegic who mysteriously regained use of his legs.", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Pangborn directs Strange to Kamar-Taj, where he is taken in by Mordo, a sorcerer under the Ancient One. The Ancient", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("One demonstrates her power to Strange, revealing the astral plane and other dimensions such as the Mirror Dimension.", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("She reluctantly agrees to train Strange, whose arrogance and ambition remind her of Kaecilius. Strange studies under", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("Ancient One and Mordo, and learns from the ancient books in the library that Earth is guarded from extradimensional ", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("threats by a shield generated by the three sanctums on Earth: New York City, London, and Hong Kong. They are all", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("connected and accessible from Kamar-Taj and the sorcerer's job is to protect the sanctums. Strange progresses quickly,", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("and secretly reads the text from which Kaecilius stole pages, learning to bend time with the mystical Eye of Agamotto.", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("Mordo and Wong warn Strange against breaking the laws of nature, drawing a comparison to Kaecilius' desire for eternal", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("life. Kaecilius uses the stolen pages to contact Dormammu of the Dark Dimension, where time is non-existent. Kaecilius", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("destroys the London Sanctum to weaken Earth's protection. The zealots then attack the New York Sanctum, killing its", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("guardian, but Strange holds them off with the help of the Cloak of Levitation until Mordo and the Ancient One arrive.", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Mordo becomes disillusioned with the Ancient One after Strange reveals that the Ancient One has been drawing power", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("from the Dark Dimension to sustain her long life. The Ancient One fights Kaecilius in the mirror dimension but", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("is fatally stabbed through one of Kaecilius' own subordinates. Before dying, the Ancient one appears in her astral", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("form to tell Strange that he too will have to bend the rules to complement Mordo's steadfast nature in order to.", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("defeat Kaecilius. Strange and Mordo arrive in Hong Kong to find Wong dead, the Sanctum destroyed, and the Dark", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("Dimension engulfing Earth. Strange uses the Eye of Agamotto to reverse the damage done, restoring the sanctum and", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("reviving Wong. Strange enters the Dark Dimension and sets a time loop, trying to bargain with Dormammu. Dormammu", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("gives in after killing Strange so many times to no avail, Dormammu halts his assault on Earth and take Kaecilius", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("and his zealots with him. Disillusioned by Strange and the Ancient One defying nature's laws, Mordo departs.", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Strange returns the Eye to Kamar-Taj and takes up residence in the New York Sanctum to continue his studies.", 10, maxy - 505, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Strange is shown sitting in the New York Sanctum with Thor who seeks help to find his father, Odin.", 10, maxy - 535, TextFont, Black)

	    Font.Draw ("End Credit Scene: Mordo confronts Pangborn and steals the mystical energy he uses to walk, telling him that Earth", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("has \"too many sorcerers\".", 10, maxy - 580, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end DoctorStrangeContents


procedure GuardiansoftheGalaxy2Contents
    MusicMovieID := 15
    cls
    Music.PlayFileLoop ("'Guardians of the Galaxy Vol. 2' Main Theme by Tyler Bates.MP3")
    Font.Draw ("Guardians of the Galaxy Vol. 2", maxx div 2 - 230, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 2014, Peter Quill, Gamora, Drax, Rocket, and Baby Groot are renowned as the Guardians of the Galaxy. Ayesha,", 10, maxy - 100, TextFont, Black)
    Font.Draw ("leader of the Sovereign race, has the Guardians protect valuable batteries from an interdimensional monster in", 10, maxy - 115, TextFont, Black)
    Font.Draw ("exchange for Gamora's estranged sister Nebula, who was caught attempting to steal the batteries. After Rocket", 10, maxy - 130, TextFont, Black)
    Font.Draw ("steals the batteries for himself, the Sovereign attacks the Guardians' ship with a fleet of drones. The drones", 10, maxy - 145, TextFont, Black)
    Font.Draw ("are destroyed by a mysterious figure, and the Guardians crash-land on a nearby planet. There, this figure reveals", 10, maxy - 160, TextFont, Black)
    Font.Draw ("himself as Quill's father, Ego, and invites Quill, Gamora, and Drax to his home planet. Rocket and Groot remain", 10, maxy - 175, TextFont, Black)
    Font.Draw ("behind to repair the ship and guard Nebula. Ayesha hires Yondu and his crew, whom have been disgraced for child", 10, maxy - 190, TextFont, Black)
    Font.Draw ("trafficking to capture the Guardians of the Galaxy. They find the ship along with Rocket and Baby Groot whom they", 10, maxy - 205, TextFont, Black)
    Font.Draw ("capture. but when Yondu hesitates to turn over Quill, whom he raised, his assistant Kraglin questions his", 10, maxy - 220, TextFont, Black)
    Font.Draw ("objectivity, and his lieutenant Taserface leads a mutiny with help from Nebula. Rocket and Yondu are imprisoned", 10, maxy - 235, TextFont, Black)
    Font.Draw ("on Yondu's ship and all of Yondu's loyalists are executed by being thrown into space. Nebula leaves to find and", 10, maxy - 250, TextFont, Black)
    Font.Draw ("kill Gamora, whom she blames for the torture inflicted on her by their father, Thanos. While imprisoned, Rocket", 10, maxy - 265, TextFont, Black)
    Font.Draw ("and Yondu bond. Groot and Kraglin, the latter having never intended to start the mutiny, free Rocket and Yondu,", 10, maxy - 280, TextFont, Black)
    Font.Draw ("and they destroy the ship and its crew as they escape, but Taserface tells the Sovereign of their whereabouts", 10, maxy - 295, TextFont, Black)
    Font.Draw ("before dying. Ego, a god-like Celestial that manipulated the matter around its consciousness to form this \"home\"", 10, maxy - 310, TextFont, Black)
    Font.Draw ("planet, explains that he projected a humanoid guise to travel the universe and discover a purpose, eventually falling", 10, maxy - 325, TextFont, Black)
    Font.Draw ("in love with Quill's mother Meredith. Ego hired Yondu to collect the young Quill after Meredith's death, but the boy", 10, maxy - 340, TextFont, Black)
    Font.Draw ("was never delivered, and Ego has been searching for him ever since. He teaches Quill to manipulate the Celestial power.", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Nebula arrives at Ego's planet and tries to kill Gamora, but the pair reach an uneasy alliance when they discover a", 10, maxy - 370, TextFont, Black)
    Font.Draw ("cavern filled with skeletal remains. Ego reveals to Quill that he has seeds of himself planted in planets he has", 10, maxy - 385, TextFont, Black)
    Font.Draw ("visited and can be activated through the power of two Celestials. The planets would become extensions of himself,", 10, maxy - 400, TextFont, Black)
    Font.Draw ("granting him control and giant power. Ego tried to conceive many children, have Yondu bring them to him hoping one", 10, maxy - 415, TextFont, Black)
    Font.Draw ("of them would have celestial power but killed them all when they didn't. Under Ego's influence, Quill helps him", 10, maxy - 430, TextFont, Black)
    Font.Draw ("activate the seedlings, which begin to consume every world, but Quill snaps when Ego reveals that he planted the", 10, maxy - 445, TextFont, Black)
    Font.Draw ("tumor that killed Quill's mother. Mantis, Ego's naïve empath servant, grows close to Drax and warns him of Ego's", 10, maxy - 460, TextFont, Black)
    Font.Draw ("plan. Gamora and Nebula also learn of the plan as Rocket, Yondu, Groot, and Kraglin arrive. The reunited Guardians", 10, maxy - 475, TextFont, Black)
    Font.Draw ("find Ego's brain at the planet's core, as they come under attack from the Sovereign's drones. Rocket makes a bomb", 10, maxy - 490, TextFont, Black)
    Font.Draw ("using the stolen batteries, which Groot plants on the brain. Quill fights Ego with his newfound Celestial powers", 10, maxy - 505, TextFont, Black)

    Pic.Draw (BabyGrootNukePic, 690, 350, picMerge)
    Font.Draw ("Baby Groot is being explained which buttons to press in order", 690, 335, CaptionFont, Black)
    Font.Draw ("to set a timer on the bomb", 690, 325, CaptionFont, Black)

    Pic.Draw (FatherandSonPic, 690, 130, picMerge)
    Font.Draw ("A funeral is held for Yondu by the Ravager crews that recognize", 690, 115, CaptionFont, Black)
    Font.Draw ("Yondu as one of their own", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("690")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Guardians of the Galaxy Vol. 2", maxx div 2 - 230, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 2014, Peter Quill, Gamora, Drax, Rocket, and Baby Groot are renowned as the Guardians of the Galaxy. Ayesha,", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("leader of the Sovereign race, has the Guardians protect valuable batteries from an interdimensional monster in", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("exchange for Gamora's estranged sister Nebula, who was caught attempting to steal the batteries. After Rocket", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("steals the batteries for himself, the Sovereign attacks the Guardians' ship with a fleet of drones. The drones", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("are destroyed by a mysterious figure, and the Guardians crash-land on a nearby planet. There, this figure reveals", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("himself as Quill's father, Ego, and invites Quill, Gamora, and Drax to his home planet. Rocket and Groot remain", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("behind to repair the ship and guard Nebula. Ayesha hires Yondu and his crew, whom have been disgraced for child", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("trafficking to capture the Guardians of the Galaxy. They find the ship along with Rocket and Baby Groot whom they", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("capture. but when Yondu hesitates to turn over Quill, whom he raised, his assistant Kraglin questions his", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("objectivity, and his lieutenant Taserface leads a mutiny with help from Nebula. Rocket and Yondu are imprisoned", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("on Yondu's ship and all of Yondu's loyalists are executed by being thrown into space. Nebula leaves to find and", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("kill Gamora, whom she blames for the torture inflicted on her by their father, Thanos. While imprisoned, Rocket", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("and Yondu bond. Groot and Kraglin, the latter having never intended to start the mutiny, free Rocket and Yondu,", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("and they destroy the ship and its crew as they escape, but Taserface tells the Sovereign of their whereabouts", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("before dying. Ego, a god-like Celestial that manipulated the matter around its consciousness to form this \"home\"", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("planet, explains that he projected a humanoid guise to travel the universe and discover a purpose, eventually falling", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("in love with Quill's mother Meredith. Ego hired Yondu to collect the young Quill after Meredith's death, but the boy", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("was never delivered, and Ego has been searching for him ever since. He teaches Quill to manipulate the Celestial power.", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Nebula arrives at Ego's planet and tries to kill Gamora, but the pair reach an uneasy alliance when they discover a", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("cavern filled with skeletal remains. Ego reveals to Quill that he has seeds of himself planted in planets he has", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("visited and can be activated through the power of two Celestials. The planets would become extensions of himself,", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("granting him control and giant power. Ego tried to conceive many children, have Yondu bring them to him hoping one", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("of them would have celestial power but killed them all when they didn't. Under Ego's influence, Quill helps him", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("activate the seedlings, which begin to consume every world, but Quill snaps when Ego reveals that he planted the", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("tumor that killed Quill's mother. Mantis, Ego's naïve empath servant, grows close to Drax and warns him of Ego's", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("plan. Gamora and Nebula also learn of the plan as Rocket, Yondu, Groot, and Kraglin arrive. The reunited Guardians", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("find Ego's brain at the planet's core, as they come under attack from the Sovereign's drones. Rocket makes a bomb", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("using the stolen batteries, which Groot plants on the brain. Quill fights Ego with his newfound Celestial powers", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("to distract him long enough for the other Guardians and Mantis to escape. The bomb explodes, killing Ego and", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("disintegrating the planet. Quill loses his celestial powers because Ego is dead, Yondu sacrifices himself by", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("transferring the face mask to Quill in space. uill realizes that the reason Yondu kept him was to spare him", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("from the fate of Ego's other progeny. Having reconciled with Gamora, Nebula still chooses to leave and resume", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("her quest to kill Thanos by herself. The Guardians hold a funeral for Yondu, which is attended by Kraglin and", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("dozens of Ravager ships, acknowledging Yondu's sacrifice and accepting him as a Ravager again.", 10, maxy - 595, TextFont, Black)

	    Font.Draw ("Many Credit Scenes: Kraglin starts to learn how to wield Yondu's Yakka Arrow but has very little success with it,", 10, maxy - 625, TextFont, Black)
	    Font.Draw ("Ravager leader Stakar Ogord reunites with his ex-teammates, Groot grows into a teenager, Ayesha creates a new", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("artificial being with whom she plans to destroy the Guardians, naming him Adam, and a group of uninterested", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("Watchers abandon their informant(Stan Lee), who is discussing his experiences on Earth.", 10, maxy - 670, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end GuardiansoftheGalaxy2Contents


procedure SpiderManContents
    MusicMovieID := 16
    cls
    Music.PlayFileLoop ("Spider-Man Theme.MP3")
    Font.Draw ("Spider-Man: Homecoming", maxx div 2 - 180, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Following the Battle of New York, the city is left in ruins causing salvage companies such as Adrian Toomes and", 10, maxy - 100, TextFont, Black)
    Font.Draw ("his salvage company to clean up the aftermath. However, the Department of Damage Control, a partnership by Tony", 10, maxy - 115, TextFont, Black)
    Font.Draw ("Stark and the US government takes over the wreckage sites for cleanup, driving the salvage company out of business.", 10, maxy - 130, TextFont, Black)
    Font.Draw ("Enraged, Tombes convinces his employees to keep the technology and make weapons to sell. Eight years later, Peter", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Parker is enlisted to help in the Avengers fight at Berlin but resumes his studies at the Midtown School of Science", 10, maxy - 160, TextFont, Black)
    Font.Draw ("and Technology when Stark tells him he is not yet ready to become a full Avenger. Parker quits his school's academic", 10, maxy - 175, TextFont, Black)
    Font.Draw ("decathlon team to spend more time on crime fighting. One night, Parker discovers ATM's being robbed in a bank wit", 10, maxy - 190, TextFont, Black)
    Font.Draw ("advanced weapons from Toombes which ends in a nearby convenience store being blown up and the robbers caught.", 10, maxy - 205, TextFont, Black)
    Font.Draw ("Parker returns back to his Queen's apartment when Ned discovers him climbing on the wall and his secret identity.", 10, maxy - 220, TextFont, Black)
    Font.Draw ("During another night, Parker finds Toomes' associates Jackson Brice and Herman Schultz selling weapons to local", 10, maxy - 235, TextFont, Black)
    Font.Draw ("criminal Aaron Davis. Parker saves Davis before being caught by Toomes and dropped in a lake, nearly drowning after", 10, maxy - 250, TextFont, Black)
    Font.Draw ("becoming tangled in a parachute built into his suit. He is rescued by Stark, who is monitoring the Spider-Man suit", 10, maxy - 265, TextFont, Black)
    Font.Draw ("he gave Parker and warns him against further involvement with the criminals. Toomes accidentally kills Brice with", 10, maxy - 280, TextFont, Black)
    Font.Draw ("one of their weapons, and Schultz becomes the new Shocker. Parker and Ned remove the purple gem core powering the", 10, maxy - 295, TextFont, Black)
    Font.Draw ("one of the weapons left behind by Brice. A tracking device stuck on Schultz travels to Maryland so Parker rejoins", 10, maxy - 310, TextFont, Black)
    Font.Draw ("the decathlon team because of the decathlon event being located in Maryland. Ned and Parker disable the tracker", 10, maxy - 325, TextFont, Black)
    Font.Draw ("Stark implanted in the Spider-Man suit, and unlock its advanced features. Parker tries to stop Toomes from stealing", 10, maxy - 340, TextFont, Black)
    Font.Draw ("weapons from a D.O.D.C. truck, but is trapped inside the truck, causing him to miss the decathlon tournament. Parker", 10, maxy - 355, TextFont, Black)
    Font.Draw ("discovers that the purple core gems are unstable and can explode when exposed to radiation. Peter escapes the D.O.D.C.", 10, maxy - 370, TextFont, Black)
    Font.Draw ("storage place and races to the Washington Monument where the core explodes and traps Ned and their friends in the", 10, maxy - 385, TextFont, Black)
    Font.Draw ("elevator. Evading local authorities, Parker saves his friends, including his classmate and crush Liz. Returning to", 10, maxy - 400, TextFont, Black)
    Font.Draw ("New York City, Parker persuades Davis to reveal Toomes' whereabouts. Aboard the Staten Island Ferry, Parker captures", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Toomes' new buyer Mac Gargan, but Toomes escapes and a malfunctioning weapon tears the ferry in half. Stark helps", 10, maxy - 430, TextFont, Black)
    Font.Draw ("Parker saves the passengers and takes away the suit as a result of his recklessness. Parker returns to a normal", 10, maxy - 445, TextFont, Black)
    Font.Draw ("life, asking out his crush Liz to the homecoming dance. When he arrives at Liz's house, he learns that Liz's father", 10, maxy - 460, TextFont, Black)
    Font.Draw ("is the Toombes and Toombes deduces that Parker is Spider-Man through Liz's stories about Parker. When in the car", 10, maxy - 475, TextFont, Black)
    Font.Draw ("alone with Parker, Toombes threatens to kill Parker if he interferes with his plans again. During the dance, Parker", 10, maxy - 490, TextFont, Black)
    Font.Draw ("realizes Toomes is planning to hijack a D.O.D.C. plane transporting weapons from Avengers Tower to the team's new", 10, maxy - 505, TextFont, Black)

    Pic.Draw (WashingtonMonumentPic, 690, 320, picMerge)
    Font.Draw ("Peter Parker is at the top of the Washington Monument, trying", 690, 305, CaptionFont, Black)
    Font.Draw ("to save his friends in the elevator inside", 690, 295, CaptionFont, Black)

    Pic.Draw (FerryPic, 690, 100, picMerge)
    Font.Draw ("Parker is trying to keep the ferry together after it was split", 690, 85, CaptionFont, Black)
    Font.Draw ("in half by the Chitauri weapon", 690, 75, CaptionFont, Black)

    loop
	movieTextWindow ("700")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Spider-Man: Homecoming", maxx div 2 - 180, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Following the Battle of New York, the city is left in ruins causing salvage companies such as Adrian Toomes and", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("his salvage company to clean up the aftermath. However, the Department of Damage Control, a partnership by Tony", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("Stark and the US government takes over the wreckage sites for cleanup, driving the salvage company out of business.", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Enraged, Tombes convinces his employees to keep the technology and make weapons to sell. Eight years later, Peter", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Parker is enlisted to help in the Avengers fight at Berlin but resumes his studies at the Midtown School of Science", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("and Technology when Stark tells him he is not yet ready to become a full Avenger. Parker quits his school's academic", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("decathlon team to spend more time on crime fighting. One night, Parker discovers ATM's being robbed in a bank wit", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("advanced weapons from Toombes which ends in a nearby convenience store being blown up and the robbers caught.", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("Parker returns back to his Queen's apartment when Ned discovers him climbing on the wall and his secret identity.", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("During another night, Parker finds Toomes' associates Jackson Brice and Herman Schultz selling weapons to local", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("criminal Aaron Davis. Parker saves Davis before being caught by Toomes and dropped in a lake, nearly drowning after", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("becoming tangled in a parachute built into his suit. He is rescued by Stark, who is monitoring the Spider-Man suit", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("he gave Parker and warns him against further involvement with the criminals. Toomes accidentally kills Brice with", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("one of their weapons, and Schultz becomes the new Shocker. Parker and Ned remove the purple gem core powering the", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("one of the weapons left behind by Brice. A tracking device stuck on Schultz travels to Maryland so Parker rejoins", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("the decathlon team because of the decathlon event being located in Maryland. Ned and Parker disable the tracker", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("Stark implanted in the Spider-Man suit, and unlock its advanced features. Parker tries to stop Toomes from stealing", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("weapons from a D.O.D.C. truck, but is trapped inside the truck, causing him to miss the decathlon tournament. Parker", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("discovers that the purple core gems are unstable and can explode when exposed to radiation. Peter escapes the D.O.D.C.", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("storage place and races to the Washington Monument where the core explodes and traps Ned and their friends in the", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("elevator. Evading local authorities, Parker saves his friends, including his classmate and crush Liz. Returning to", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("New York City, Parker persuades Davis to reveal Toomes' whereabouts. Aboard the Staten Island Ferry, Parker captures", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Toomes' new buyer Mac Gargan, but Toomes escapes and a malfunctioning weapon tears the ferry in half. Stark helps", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("Parker saves the passengers and takes away the suit as a result of his recklessness. Parker returns to a normal", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("life, asking out his crush Liz to the homecoming dance. When he arrives at Liz's house, he learns that Liz's father", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("is the Toombes and Toombes deduces that Parker is Spider-Man through Liz's stories about Parker. When in the car", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("alone with Parker, Toombes threatens to kill Parker if he interferes with his plans again. During the dance, Parker", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("realizes Toomes is planning to hijack a D.O.D.C. plane transporting weapons from Avengers Tower to the team's new", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("headquarters, dons his old homemade Spider-Man suit, and races to Toomes' lair. He is first ambushed by Schultz,", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("but defeats him with the help of Ned. At the lair, Toomes destroys the building's support beams and leaves Parker", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("to die. Parker escapes the rubble through sheer willpower and intercepts the plane, steering it to crash on the", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("beach near Coney Island. Parker and Toombes keep fighting but after Toombes knocks down Parker and goes after the", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("weapons, Parker notices that Toombes suit is going to explode and saves his life. After her father's arrest, Liz", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("moves away, Parker declines an invitation from Stark to join the Avengers full-time, and Stark proposes to Pepper", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("Potts. He also returns Parker's suit, which he puts on in his bedroom just as his Aunt May walks in. ", 10, maxy - 610, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: An incarcerated Gargan approaches Toomes in prison. Gargan has heard that Toomes knows Spider-Man's", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("real identity, which Toomes denies.", 10, maxy - 655, TextFont, Black)

	    Font.Draw ("Post Credit Scene: After a long wait of scrolling credits, Steve Rogers shows up in his Avenger costume and talks", 10, maxy - 670, TextFont, Black)
	    Font.Draw ("about the value of patience. There is no significance of this scene and it is a complete troll.", 10, maxy - 685, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end SpiderManContents


procedure Thor3Contents
    MusicMovieID := 17
    cls
    Music.PlayFileLoop ("'Thor Ragnarok' Main Theme by Mark Mothersbaugh.MP3")
    Font.Draw ("Thor: Ragnarok", maxx div 2 - 100, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Two years after the battle of Sokovia,[N 1] Thor is imprisoned by the fire demon Surtur, who reveals that Thor's", 10, maxy - 100, TextFont, Black)
    Font.Draw ("father Odin is no longer on Asgard. He explains that the realm will soon be destroyed during the prophesied", 10, maxy - 115, TextFont, Black)
    Font.Draw ("Ragnarök, once Surtur unites his crown with the Eternal Flame that burns in Odin's vault. Thor frees himself,", 10, maxy - 130, TextFont, Black)
    Font.Draw ("defeats Surtur and takes his crown, believing he has prevented Ragnarök. Thor returns to Asgard to find Heimdall", 10, maxy - 145, TextFont, Black)
    Font.Draw ("gone and Loki impersonating Odin. Thor forces Loki to look for Odin which leads them to Earth and obtain the", 10, maxy - 160, TextFont, Black)
    Font.Draw ("help of Dr. Steven Strange who takes them to Norway where Odin reveals that he is dying and Ragnarök is imminent.", 10, maxy - 175, TextFont, Black)
    Font.Draw ("He also reveals that Hela, Odin's firstborn will be freed upon his death and that she was imprisoned and erased", 10, maxy - 190, TextFont, Black)
    Font.Draw ("from the history of Asgard because of her ambition. Odin passes away and Hela emerges out of a formed portal,", 10, maxy - 205, TextFont, Black)
    Font.Draw ("easily destroys Mjolnir which forces Loki and Thor to flee through the Bifröst Bridge. Loki and Thor get separated", 10, maxy - 220, TextFont, Black)
    Font.Draw ("when they exit the Bifrost abruptly due to Hela's chase. Arriving in Asgard, she defeats its army and kills the", 10, maxy - 235, TextFont, Black)
    Font.Draw ("Warriors Three. She then resurrects the ancient dead who once fought with her, including her giant wolf Fenris,", 10, maxy - 250, TextFont, Black)
    Font.Draw ("and appoints the Asgardian Skurge as her executioner. Hela plans to use the Bifröst to expand Asgard's empire,", 10, maxy - 265, TextFont, Black)
    Font.Draw ("but Heimdall sneaks in, takes the sword that controls the Bridge and begins hiding other Asgardians. Thor crash-", 10, maxy - 280, TextFont, Black)
    Font.Draw ("lands on Sakaar, a garbage planet surrounded by wormholes. A slave trader designated Scrapper 142 subdues him ", 10, maxy - 295, TextFont, Black)
    Font.Draw ("with an obedience disk and sells him as a gladiator to Sakaar's ruler, the Grandmaster. Loki has already gotten", 10, maxy - 310, TextFont, Black)
    Font.Draw ("familiar with the Grandmaster and denies any relation to Thor. Thor recognizes 142 as one of the Valkyrior, a", 10, maxy - 325, TextFont, Black)
    Font.Draw ("legendary force of female warriors who were killed fighting Hela eons ago. Thor is forced to compete in the", 10, maxy - 340, TextFont, Black)
    Font.Draw ("Grandmaster's Contest of Champions, facing the Hulk who crashed landed on Sakaar after the events of Avengers:", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Age of Ultron. Thor summons lightning after being pummeled, allowing him to gain the upper hand but the Grandmaster", 10, maxy - 370, TextFont, Black)
    Font.Draw ("sabotages the fight to ensure Hulk's victory. Thor attempts to convince Hulk and Valkyrie to retake Asgard but", 10, maxy - 385, TextFont, Black)
    Font.Draw ("both refuse, Thor eventually escapes and finds the Quinjet that the Hulk came from. Hulk follows Thor to the", 10, maxy - 400, TextFont, Black)
    Font.Draw ("Quinjet, where a recording of Natasha Romanoff causes him to transform back into Bruce Banner for the first", 10, maxy - 415, TextFont, Black)
    Font.Draw ("time since Sokovia. The Grandmaster orders Valkyrie and Loki to find Thor and Hulk, but the pair come to blows and", 10, maxy - 430, TextFont, Black)
    Font.Draw ("Loki forces her to relive the deaths of her fellow Valkyrior at the hands of Hela. Deciding to help Thor, she", 10, maxy - 445, TextFont, Black)
    Font.Draw ("takes Loki captive, Loki, not wanting to be left behind provides a method to steal of the Grandmasters ships to ", 10, maxy - 460, TextFont, Black)
    Font.Draw ("escape and liberate all the gladiators in the process, starting a rebellion. Loki tries to betray his brother", 10, maxy - 475, TextFont, Black)
    Font.Draw ("again when they are just about the board the ship but Thor pulls reverse UNO and Loki gets left behind instead.", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Two alien gladiators named Korg and Meek as well as the other gladiators soon find Loki and offer him help. Thor,", 10, maxy - 505, TextFont, Black)

    Pic.Draw (DestroyedMjolnirPic, 690, 350, picMerge)
    Font.Draw ("Mjolnir is destroyed by Hela after she is freed", 690, 335, CaptionFont, Black)

    Pic.Draw (LightningThorPic, 690, 130, picMerge)
    Font.Draw ("Thor willingly channels his powers and becomes an embodiment", 690, 115, CaptionFont, Black)
    Font.Draw ("of lightning easily fighting Hela's army of dead", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("720")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Thor: Ragnarok", maxx div 2 - 100, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Two years after the battle of Sokovia,[N 1] Thor is imprisoned by the fire demon Surtur, who reveals that Thor's", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("father Odin is no longer on Asgard. He explains that the realm will soon be destroyed during the prophesied", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("Ragnarök, once Surtur unites his crown with the Eternal Flame that burns in Odin's vault. Thor frees himself,", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("defeats Surtur and takes his crown, believing he has prevented Ragnarök. Thor returns to Asgard to find Heimdall", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("gone and Loki impersonating Odin. Thor forces Loki to look for Odin which leads them to Earth and obtain the", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("help of Dr. Steven Strange who takes them to Norway where Odin reveals that he is dying and Ragnarök is imminent.", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("He also reveals that Hela, Odin's firstborn will be freed upon his death and that she was imprisoned and erased", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("from the history of Asgard because of her ambition. Odin passes away and Hela emerges out of a formed portal,", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("easily destroys Mjolnir which forces Loki and Thor to flee through the Bifröst Bridge. Loki and Thor get separated", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("when they exit the Bifrost abruptly due to Hela's chase. Arriving in Asgard, she defeats its army and kills the", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("Warriors Three. She then resurrects the ancient dead who once fought with her, including her giant wolf Fenris,", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("and appoints the Asgardian Skurge as her executioner. Hela plans to use the Bifröst to expand Asgard's empire,", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("but Heimdall sneaks in, takes the sword that controls the Bridge and begins hiding other Asgardians. Thor crash-", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("lands on Sakaar, a garbage planet surrounded by wormholes. A slave trader designated Scrapper 142 subdues him ", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("with an obedience disk and sells him as a gladiator to Sakaar's ruler, the Grandmaster. Loki has already gotten", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("familiar with the Grandmaster and denies any relation to Thor. Thor recognizes 142 as one of the Valkyrior, a", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("legendary force of female warriors who were killed fighting Hela eons ago. Thor is forced to compete in the", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("Grandmaster's Contest of Champions, facing the Hulk who crashed landed on Sakaar after the events of Avengers:", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Age of Ultron. Thor summons lightning after being pummeled, allowing him to gain the upper hand but the Grandmaster", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("sabotages the fight to ensure Hulk's victory. Thor attempts to convince Hulk and Valkyrie to retake Asgard but", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("both refuse, Thor eventually escapes and finds the Quinjet that the Hulk came from. Hulk follows Thor to the", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("Quinjet, where a recording of Natasha Romanoff causes him to transform back into Bruce Banner for the first", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("time since Sokovia. The Grandmaster orders Valkyrie and Loki to find Thor and Hulk, but the pair come to blows and", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("Loki forces her to relive the deaths of her fellow Valkyrior at the hands of Hela. Deciding to help Thor, she", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("takes Loki captive, Loki, not wanting to be left behind provides a method to steal of the Grandmasters ships to ", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("escape and liberate all the gladiators in the process, starting a rebellion. Loki tries to betray his brother", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("again when they are just about the board the ship but Thor pulls reverse UNO and Loki gets left behind instead.", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Two alien gladiators named Korg and Meek as well as the other gladiators soon find Loki and offer him help. Thor,", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Banner, and Valkyrie head through the wormhole known as \"The Devil's Anus\" to Asgard where Hela is attacking", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Heimdall and the remaining Asguardians to gain control of the sword that controls the Bifröst. Banner drops onto", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("the ground which causes him to transform into the Hulk to combat Fernis and defeat him while Thor confronts Hela.", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Loki and the gladiators arrive to rescue the citizens, and a repentant Skurge sacrifices himself to enable their", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("escape. Thor, facing Hela, loses his right eye and then has a vision of Odin that helps him realize only Ragnarök", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("can stop her. He sends Loki to retrieve Surtur's crown and place it in the Eternal Flame. Surtur is reborn and", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("destroys Asgard, killing Hela. Aboard the Grandmaster's ship, Thor addresses the Asguardians as their new king and", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("heads for Earth to settle at their new home.", 10, maxy - 625, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: The Grandmaster's ship is intercepted by a large spacecraft.", 10, maxy - 655, TextFont, Black)

	    Font.Draw ("Post Credit Scene: The overthrown Grandmaster is thrown out of the main gladiator building to face a mob of his", 10, maxy - 685, TextFont, Black)
	    Font.Draw ("former subjects. He declares to the masses that the rebellion has ended \"in a tie\"", 10, maxy - 700, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end Thor3Contents


procedure BlackPantherContents
    MusicMovieID := 18
    cls
    Music.PlayFileLoop ("'Black Panther' Main Theme by Ludwig Göransson Trimmed.MP3")
    Font.Draw ("Black Panther", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Thousands of years ago, a meteor made out of Vibranium crashes on the continent of Africa causing five African", 10, maxy - 100, TextFont, Black)
    Font.Draw ("tribes to war over the resource. One warrior ingests a \"heart-shaped herb\" affected by the metal and gains superhuman", 10, maxy - 115, TextFont, Black)
    Font.Draw ("abilities, becoming the first \"Black Panther\". He unites all but the Jabari Tribe to form the nation of Wakanda.", 10, maxy - 130, TextFont, Black)
    Font.Draw ("Over centuries, the Vibranium is used by Wakandans to make advanced technology and hide the nation and their", 10, maxy - 145, TextFont, Black)
    Font.Draw ("technology while posing to the world as a Third World country. In 1992, Wakanda's King T'Chaka visits his brother", 10, maxy - 160, TextFont, Black)
    Font.Draw ("N'Jobu, who is working undercover in Oakland, California. T'Chaka accuses N'Jobu of assisting black-market arms", 10, maxy - 175, TextFont, Black)
    Font.Draw ("dealer Ulysses Klaue with stealing vibranium from Wakanda. N'Jobu partner reveals he is Zuri, another undercover", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Wakandan, and confirms T'Chaka's suspicions. In the present day, T'Challa returns to Wakanda to assume the throne", 10, maxy - 205, TextFont, Black)
    Font.Draw ("after the previous king and T'Challa's father T'Chaka died in a UN bombing. T'Challa's younger sister Shuri and", 10, maxy - 220, TextFont, Black)
    Font.Draw ("is mother Ramonda attend the ceremony to oversee it. At the coronation ceremony, Tribe's leader M'Baku challenges", 10, maxy - 235, TextFont, Black)
    Font.Draw ("T'Challa for the crown in ritual combat. T'Challa defeats M'Baku and persuades him to yield rather than die. When", 10, maxy - 250, TextFont, Black)
    Font.Draw ("Klaue and his accomplice Erik Stevens steal a Wakandan artifact from a London museum, T'Challa's friend and", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Okoye's lover W'Kabi urges him to bring Klaue back alive. T'Challa, Okoye, and Nakia travel to Busan, South Korea,", 10, maxy - 280, TextFont, Black)
    Font.Draw ("where Klaue plans to sell the artifact to CIA agent Everett K. Ross. A firefight erupts and Klaue attempts to flee but", 10, maxy - 295, TextFont, Black)
    Font.Draw ("is caught by T'Challa, who reluctantly releases him to Ross' custody. Klaue tells Ross about the secret of Wakanda", 10, maxy - 310, TextFont, Black)
    Font.Draw ("and that it is not a Third World country but a technologically advanced nation. Erik attacks the compound and", 10, maxy - 325, TextFont, Black)
    Font.Draw ("extracts Klaue while Ross is seriously injured protecting Nakia. Instead of pursuing Klaue, T'Challa brings Ross", 10, maxy - 340, TextFont, Black)
    Font.Draw ("to Wakanda, where their technology can save him. While Shuri heals Ross, T'Challa confronts Zuri about N'Jobu. Zuri", 10, maxy - 355, TextFont, Black)
    Font.Draw ("explains that N'Jobu planned to share Wakanda's technology with people of African descent around the world to help", 10, maxy - 370, TextFont, Black)
    Font.Draw ("them conquer their oppressors. As T'Chaka arrested N'Jobu, the latter attacked Zuri and forced T'Chaka to kill him.", 10, maxy - 385, TextFont, Black)
    Font.Draw ("T'Chaka ordered Zuri to lie that N'Jobu had disappeared and left behind N'Jobu American son in order to maintain", 10, maxy - 400, TextFont, Black)
    Font.Draw ("the lie. This boy grew up to be Stevens, a U.S. black ops soldier who adopted the name \"Killmonger\". Meanwhile,", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Killmonger kills Klaue and takes his body to Wakanda. He is brought before the tribal elders, revealing his identity", 10, maxy - 430, TextFont, Black)
    Font.Draw ("to be N'Jadaka and claim to the throne. Killmonger challenges T'Challa to ritual combat, where he kills Zuri, defeats", 10, maxy - 445, TextFont, Black)
    Font.Draw ("T'Challa, and hurls him over a waterfall to his presumed death. Killmonger ingests the heart-shaped herb and orders", 10, maxy - 460, TextFont, Black)
    Font.Draw ("the rest incinerated, but Nakia extracts one first. Killmonger, supported by W'Kabi and his army, prepares to", 10, maxy - 475, TextFont, Black)
    Font.Draw ("distribute shipments of Wakandan weapons to operatives around the world. Nakia, Shuri, Ramonda, and Ross flee to", 10, maxy - 490, TextFont, Black)
    Font.Draw ("the Jabari Tribe for aid. They find a comatose T'Challa, rescued by the Jabari in repayment for sparing M'Baku", 10, maxy - 505, TextFont, Black)

    Pic.Draw (InterrogationPic, 690, 350, picMerge)
    Font.Draw ("Agent Ross interrogates Klaue who reveals the facade that", 690, 335, CaptionFont, Black)
    Font.Draw ("Wakanda has put on for the world", 690, 325, CaptionFont, Black)

    Pic.Draw (VibraniumTrainFightPic, 690, 130, picMerge)
    Font.Draw ("T'Challa and Killmonger fight in their own Black Panther suits", 690, 115, CaptionFont, Black)
    Font.Draw ("in the Vibranium train tunnel where their suit's powers are", 690, 105, CaptionFont, Black)
    Font.Draw ("ineffective.", 690, 95, CaptionFont, Black)

    loop
	movieTextWindow ("690")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Black Panther", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Thousands of years ago, a meteor made out of Vibranium crashes on the continent of Africa causing five African", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("tribes to war over the resource. One warrior ingests a \"heart-shaped herb\" affected by the metal and gains superhuman", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("abilities, becoming the first \"Black Panther\". He unites all but the Jabari Tribe to form the nation of Wakanda.", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Over centuries, the Vibranium is used by Wakandans to make advanced technology and hide the nation and their", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("technology while posing to the world as a Third World country. In 1992, Wakanda's King T'Chaka visits his brother", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("N'Jobu, who is working undercover in Oakland, California. T'Chaka accuses N'Jobu of assisting black-market arms", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("dealer Ulysses Klaue with stealing vibranium from Wakanda. N'Jobu partner reveals he is Zuri, another undercover", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Wakandan, and confirms T'Chaka's suspicions. In the present day, T'Challa returns to Wakanda to assume the throne", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("after the previous king and T'Challa's father T'Chaka died in a UN bombing. T'Challa's younger sister Shuri and", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("is mother Ramonda attend the ceremony to oversee it. At the coronation ceremony, Tribe's leader M'Baku challenges", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("T'Challa for the crown in ritual combat. T'Challa defeats M'Baku and persuades him to yield rather than die. When", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("Klaue and his accomplice Erik Stevens steal a Wakandan artifact from a London museum, T'Challa's friend and", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Okoye's lover W'Kabi urges him to bring Klaue back alive. T'Challa, Okoye, and Nakia travel to Busan, South Korea,", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("where Klaue plans to sell the artifact to CIA agent Everett K. Ross. A firefight erupts and Klaue attempts to flee but", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("is caught by T'Challa, who reluctantly releases him to Ross' custody. Klaue tells Ross about the secret of Wakanda", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("and that it is not a Third World country but a technologically advanced nation. Erik attacks the compound and", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("extracts Klaue while Ross is seriously injured protecting Nakia. Instead of pursuing Klaue, T'Challa brings Ross", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("to Wakanda, where their technology can save him. While Shuri heals Ross, T'Challa confronts Zuri about N'Jobu. Zuri", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("explains that N'Jobu planned to share Wakanda's technology with people of African descent around the world to help", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("them conquer their oppressors. As T'Chaka arrested N'Jobu, the latter attacked Zuri and forced T'Chaka to kill him.", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("T'Chaka ordered Zuri to lie that N'Jobu had disappeared and left behind N'Jobu American son in order to maintain", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("the lie. This boy grew up to be Stevens, a U.S. black ops soldier who adopted the name \"Killmonger\". Meanwhile,", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Killmonger kills Klaue and takes his body to Wakanda. He is brought before the tribal elders, revealing his identity", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("to be N'Jadaka and claim to the throne. Killmonger challenges T'Challa to ritual combat, where he kills Zuri, defeats", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("T'Challa, and hurls him over a waterfall to his presumed death. Killmonger ingests the heart-shaped herb and orders", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("the rest incinerated, but Nakia extracts one first. Killmonger, supported by W'Kabi and his army, prepares to", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("distribute shipments of Wakandan weapons to operatives around the world. Nakia, Shuri, Ramonda, and Ross flee to", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("the Jabari Tribe for aid. They find a comatose T'Challa, rescued by the Jabari in repayment for sparing M'Baku", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("life. Healed by Nakia's herb, T'Challa returns to fight Killmonger, who dons his own Black Panther suit. W'Kabi", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("and his army fight Shuri, Nakia, and the Dora Milaje, while Ross remotely pilots a jet and shoots down planes", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("carrying the vibranium weapons. M'Baku and the Jabari arrive to reinforce T'Challa. Confronted by Okoye, W'Kabi", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("and his army stand down. T'Challa leads Killmonger to the Vibranium mine where the Black Panther suits are disabled", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("allowing T'Challa to stab Killmonger. Killmonger refuses to be healed, choosing to die a free man rather than be", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("incarcerated. T'Challa establishes an outreach center at the building where N'Jobu died, to be run by Nakia and Shuri.", 10, maxy - 595, TextFont, Black)

	    Font.Draw ("Mid Credit Scene:  In a mid-credits scene, T'Challa appears before the United Nations to reveal Wakanda's true nature", 10, maxy - 625, TextFont, Black)
	    Font.Draw ("to the world.", 10, maxy - 640, TextFont, Black)

	    Font.Draw ("Post Credit Scene: Shuri helps Bucky Barnes with his recuperation.", 10, maxy - 670, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end BlackPantherContents


procedure Avengers3Contents
    MusicMovieID := 19
    cls
    Music.PlayFileLoop ("The-Avengers-Theme-Song.MP3")
    Font.Draw ("Avengers: Infinity War", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Having acquired the Power Stone, one of the six Infinity Stones, from the planet Xandar, Thanos and his lieutenants:", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Ebony Maw, Cull Obsidian, Proxima Midnight, and Corvus Glaive intercept the spaceship carrying the surviving", 10, maxy - 115, TextFont, Black)
    Font.Draw ("Asguardians from the events of Thor: Ragnarok. Thanos subdues Thor, overpowers Hulk, and Loki has to trade the", 10, maxy - 130, TextFont, Black)
    Font.Draw ("Tesseract for Thor's life and in the process tries to stab Thanos but fails. Loki is killed as a consequence,", 10, maxy - 145, TextFont, Black)
    Font.Draw ("Heimdall uses the power of the Bifröst to send the Hulk to Earth as a warning. Thanos and his subordinates", 10, maxy - 160, TextFont, Black)
    Font.Draw ("leave Asgaurdian ship deteriorating. Hulk crash-lands at the Sanctum Sanctorum in New York City, reverting back", 10, maxy - 175, TextFont, Black)
    Font.Draw ("to the form of Bruce Banner. He warns Stephen Strange and Wong about Thanos's plan to kill half of all life in", 10, maxy - 190, TextFont, Black)
    Font.Draw ("the universe, and they recruit Tony Stark. Maw and Obsidian arrive to retrieve the Time Stone from Strange, drawing", 10, maxy - 205, TextFont, Black)
    Font.Draw ("the attention of Peter Parker. Maw captures Strange, but fails to take the Time Stone due to an enchantment. Stark", 10, maxy - 220, TextFont, Black)
    Font.Draw ("and Parker sneak aboard Maw's spaceship, Banner contacts Steve Rogers, and Wong stays behind to guard the Sanctum.", 10, maxy - 235, TextFont, Black)
    Font.Draw ("In Edinburgh, Midnight and Glaive ambush Wanda Maximoff and Vision in order to retrieve the Mind Stone, which is", 10, maxy - 250, TextFont, Black)
    Font.Draw ("in Vision's forehead. Rogers, Natasha Romanoff, and Sam Wilson but spare them and retreat, they group up with", 10, maxy - 265, TextFont, Black)
    Font.Draw ("Banner and James Rhodes at the Avengers facility. Vision offers to sacrifice himself by having Maximoff destroy", 10, maxy - 280, TextFont, Black)
    Font.Draw ("the Mind Stone to keep Thanos from retrieving it, but Maximoff refuses. Rogers suggests they travel to Wakanda,", 10, maxy - 295, TextFont, Black)
    Font.Draw ("which he believes has the resources to remove the Stone without destroying Vision. The Guardians of the Galaxy", 10, maxy - 310, TextFont, Black)
    Font.Draw ("respond to a distress call from the Asgardian ship and rescue Thor, who surmises that Thanos is currently going", 10, maxy - 325, TextFont, Black)
    Font.Draw ("after the Reality Stone, which is in the possession of the Collector on Knowhere. Groot, Rocket and Thor head", 10, maxy - 340, TextFont, Black)
    Font.Draw ("to Nidavellir to create a weapon that could kill Thanos while Peter Quill, Gamora, Drax, and Mantis head to", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Knowhere to stop Thanos from getting the Reality Stone. Thanos has already obtained the Reality Stone, incapacitate", 10, maxy - 370, TextFont, Black)
    Font.Draw ("Drax and Mantis, kidnaps Gamora and spares Quill. Gamora reveals that the Soul Stone ito save for Nebula from", 10, maxy - 385, TextFont, Black)
    Font.Draw ("being tortured is on Vormir.  On Vormir, the Stone's keeper, Red Skull, tells Thanos that he can only acquire it", 10, maxy - 400, TextFont, Black)
    Font.Draw ("by sacrificing someone he loves. Thanos sacrifices Gamora, earning the Stone. Nebula escapes captivity and asks the", 10, maxy - 415, TextFont, Black)
    Font.Draw ("remaining Guardians to meet her at Thanos's destroyed homeworld, Titan. Stark and Parker kill Maw by blasting him", 10, maxy - 430, TextFont, Black)
    Font.Draw ("into open space, freezing him to death.  Landing on Titan, they meet Quill, Drax, and Mantis. Strange uses the", 10, maxy - 445, TextFont, Black)
    Font.Draw ("Time Stone to view millions of possible futures, seeing only one in which Thanos loses. The group forms a plan", 10, maxy - 460, TextFont, Black)
    Font.Draw ("to subdue Thanos and remove the Infinity Gauntlet, which he uses to house the Stones. Thanos appears and", 10, maxy - 475, TextFont, Black)
    Font.Draw ("justifies his plans as necessary to ensure the survival of a universe threatened by overpopulation. Nebula", 10, maxy - 490, TextFont, Black)
    Font.Draw ("arrives soon after, and helps the others subdue Thanos until she deduces that Thanos has killed Gamora. Enraged,", 10, maxy - 505, TextFont, Black)

    Pic.Draw (MawandObsidianFightPic, 690, 350, picMerge)
    Font.Draw ("Ebony Maw and Cull Obsidian arrive on Earth to obtain the time", 690, 335, CaptionFont, Black)
    Font.Draw ("stone from Doctor Strange but end up fight Stark, Strange, Wong", 690, 325, CaptionFont, Black)
    Font.Draw ("and Parker", 690, 315, CaptionFont, Black)

    Pic.Draw (StormbreakerReinforcementPic, 690, 130, picMerge)
    Font.Draw ("Thor arrives with Rocket and Groot by the power of the Bifrost", 690, 115, CaptionFont, Black)
    Font.Draw ("to reinforce at the Battle of Wakanda", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("820")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Avengers: Infinity War", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Having acquired the Power Stone, one of the six Infinity Stones, from the planet Xandar, Thanos and his lieutenants:", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Ebony Maw, Cull Obsidian, Proxima Midnight, and Corvus Glaive intercept the spaceship carrying the surviving", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("Asguardians from the events of Thor: Ragnarok. Thanos subdues Thor, overpowers Hulk, and Loki has to trade the", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("Tesseract for Thor's life and in the process tries to stab Thanos but fails. Loki is killed as a consequence,", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("Heimdall uses the power of the Bifröst to send the Hulk to Earth as a warning. Thanos and his subordinates", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("leave Asgaurdian ship deteriorating. Hulk crash-lands at the Sanctum Sanctorum in New York City, reverting back", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("to the form of Bruce Banner. He warns Stephen Strange and Wong about Thanos's plan to kill half of all life in", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("the universe, and they recruit Tony Stark. Maw and Obsidian arrive to retrieve the Time Stone from Strange, drawing", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("the attention of Peter Parker. Maw captures Strange, but fails to take the Time Stone due to an enchantment. Stark", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("and Parker sneak aboard Maw's spaceship, Banner contacts Steve Rogers, and Wong stays behind to guard the Sanctum.", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("In Edinburgh, Midnight and Glaive ambush Wanda Maximoff and Vision in order to retrieve the Mind Stone, which is", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("in Vision's forehead. Rogers, Natasha Romanoff, and Sam Wilson but spare them and retreat, they group up with", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("Banner and James Rhodes at the Avengers facility. Vision offers to sacrifice himself by having Maximoff destroy", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("the Mind Stone to keep Thanos from retrieving it, but Maximoff refuses. Rogers suggests they travel to Wakanda,", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("which he believes has the resources to remove the Stone without destroying Vision. The Guardians of the Galaxy", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("respond to a distress call from the Asgardian ship and rescue Thor, who surmises that Thanos is currently going", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("after the Reality Stone, which is in the possession of the Collector on Knowhere. Groot, Rocket and Thor head", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("to Nidavellir to create a weapon that could kill Thanos while Peter Quill, Gamora, Drax, and Mantis head to", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Knowhere to stop Thanos from getting the Reality Stone. Thanos has already obtained the Reality Stone, incapacitate", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("Drax and Mantis, kidnaps Gamora and spares Quill. Gamora reveals that the Soul Stone ito save for Nebula from", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("being tortured is on Vormir.  On Vormir, the Stone's keeper, Red Skull, tells Thanos that he can only acquire it", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("by sacrificing someone he loves. Thanos sacrifices Gamora, earning the Stone. Nebula escapes captivity and asks the", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("remaining Guardians to meet her at Thanos's destroyed homeworld, Titan. Stark and Parker kill Maw by blasting him", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("into open space, freezing him to death.  Landing on Titan, they meet Quill, Drax, and Mantis. Strange uses the", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("Time Stone to view millions of possible futures, seeing only one in which Thanos loses. The group forms a plan", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("to subdue Thanos and remove the Infinity Gauntlet, which he uses to house the Stones. Thanos appears and", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("justifies his plans as necessary to ensure the survival of a universe threatened by overpopulation. Nebula", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("arrives soon after, and helps the others subdue Thanos until she deduces that Thanos has killed Gamora. Enraged,", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Quill attacks Thanos, allowing him to break the group's hold and overpower them. Stark is seriously wounded by", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("Thanos, but is spared after Strange surrenders the Time Stone to Thanos. At Nidavellir, Thor, Rocket and Groot", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("discover the star forge to be closed and all the dwarves killed except Eitri who has his hands severed. Thanos", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("had come to the forge and forced the Infinity Gauntlet to be made, slaying almost all the dwarves after. Thor", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("withstands the force of a star and with Groot severing his arm to make the handle of the weapon, Stormbreaker", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("was created with power to summon the Bifröst. In Wakanda, Rogers reunites with Bucky Barnes before Thanos's", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("army invades. The Avengers, alongside T'Challa and the Wakandan forces, mount a defense while Shuri works to", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("extract the Mind Stone from Vision. Banner, unable to transform into the Hulk, fights in Stark's Hulkbuster", 10, maxy - 625, TextFont, Black)
	    Font.Draw ("armor. Thor, Rocket, and Groot arrive to reinforce the Avengers; Midnight, Obsidian, and Glaive are killed", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("and their army is routed, but Shuri is unable to complete the extraction of the Mind Stone from Vision. Thanos", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("arrives to retrieve the Mind Stone, but before he can do so Wanda destroys it. Using the Time Stone, Thanos", 10, maxy - 670, TextFont, Black)
	    Font.Draw ("reverses Wanda's actions and rips the repaired Mind Stone from Vision's forehead, killing him. Thor severely", 10, maxy - 685, TextFont, Black)
	    Font.Draw ("wounds Thanos with Stormbreaker, but Thanos activates the completed Gauntlet by snapping his fingers and", 10, maxy - 700, TextFont, Black)
	    Font.Draw ("teleports away. Half of all life across the universe disintegrates, including Barnes, T'Challa, Groot,", 10, maxy - 715, TextFont, Black)
	    Font.Draw ("Maximoff, Wilson, Mantis, Drax, Quill, Strange, and Parker. Thanos is shown sitting on deserted planet", 10, maxy - 730, TextFont, Black)
	    Font.Draw ("watching the sunrise.", 10, maxy - 745, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Fury and Hill are driving in New York when people start dusting away and accidents are", 10, maxy - 775, TextFont, Black)
	    Font.Draw ("occurring everywhere. Fury and Hill are dusted away as well but Fury manages to send an emergency signal", 10, maxy - 790, TextFont, Black)
	    Font.Draw ("to a pager that shows the insignia of Captain Marvel.", 10, maxy - 805, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end Avengers3Contents


procedure AntManandtheWaspContents
    MusicMovieID := 20
    cls
    Music.PlayFileLoop ("Ant-Man and the Wasp Theme Trimmed.MP3")
    switch (7) := true
    Font.Draw ("Ant-Man and the Wasp", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Ant-Man and the Wasp is a movie set before the events of                                           and shows the perspective of Ant", 10, maxy - 100, TextFont, Black)
    Font.Draw ("Avengers: Infinity War", 328, maxy - 100, TextFont, ConcentratedBlue)
    Font.Draw ("Man during his missing presence in Avengers: Infinity War. Two years after Scott Lang was placed under house", 10, maxy - 115, TextFont, Black)
    Font.Draw ("arrest due to his involvement with the Avengers, in violation of the Sokovia Accords, Hank Pym and Hope van Dyne", 10, maxy - 130, TextFont, Black)
    Font.Draw ("briefly open a tunnel into the quantum realm where they believe Pym's wife and Hope's mother, Janet van Dyne is", 10, maxy - 145, TextFont, Black)
    Font.Draw ("to be after shrinking to sub-atomic levels in 1987. When he had previously visited the quantum realm, Lang had", 10, maxy - 160, TextFont, Black)
    Font.Draw ("unknowingly become quantumly entangled with Janet, and now he receives an apparent message from her. With only", 10, maxy - 175, TextFont, Black)
    Font.Draw ("days left of house arrest, Lang contacts Pym about Janet despite the strained relationship they have due to", 10, maxy - 190, TextFont, Black)
    Font.Draw ("Lang's actions with the Avengers in                                                  . Hope and Pym kidnap Lang, leaving a decoy so", 10, maxy - 205, TextFont, Black)
    Font.Draw ("Captain America: Civil War", 205, maxy - 205, TextFont, ConcentratedBlue)
    Font.Draw ("as not to arouse suspicion from FBI agent Jimmy Woo. Believing the message from Janet to be confirmation that", 10, maxy - 220, TextFont, Black)
    Font.Draw ("she is alive, the trio work to build a stable quantum tunnel so they can take a vehicle to the quantum realm has", 10, maxy - 235, TextFont, Black)
    Font.Draw ("and retrieve her. They arrange to buy a part needed for the tunnel from black market dealer Sonny Burch, who", 10, maxy - 250, TextFont, Black)
    Font.Draw ("realized the potential profit that can be earned from Pym's research and double-crosses them. Donning the Wasp", 10, maxy - 265, TextFont, Black)
    Font.Draw ("outfit, Hope fights off Burch and his men until she is attacked by a quantumly unstable masked woman. Lang tries", 10, maxy - 280, TextFont, Black)
    Font.Draw ("to help fight off this \"ghost\", but the woman escapes with Pym's lab, which has been shrunk down to the size of a", 10, maxy - 295, TextFont, Black)
    Font.Draw ("suitcase. Pym reluctantly visits his estranged former partner Bill Foster with Hope and Lang. Foster helps them locate", 10, maxy - 310, TextFont, Black)
    Font.Draw ("the lab, where the ghost captures the trio and reveals herself to be Ava Starr. Her father Elihas, another of Pym's", 10, maxy - 325, TextFont, Black)
    Font.Draw ("former partners, died along with his wife during a quantum experiment causings Ava's unstable quantum state. Foster", 10, maxy - 340, TextFont, Black)
    Font.Draw ("reveals that Ava is dying and in constant pain as a result of her condition, and they plan to cure her using Janet's", 10, maxy - 355, TextFont, Black)
    Font.Draw ("quantum energy. Believing that this will kill Janet, Pym refuses to help them and escapes with Hope, Lang, and the", 10, maxy - 370, TextFont, Black)
    Font.Draw ("lab. Opening a stable version of the tunnel, Pym, Hope, and Lang are able to contact Janet, who gives them a precise", 10, maxy - 385, TextFont, Black)
    Font.Draw ("location to find her but warns that they only have two hours before the unstable nature of the realm separates them", 10, maxy - 400, TextFont, Black)
    Font.Draw ("for a century. Using a truth serum, Burch learns the trio's location from Lang's business partners Luis, Dave, and", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Kurt, and informs a contact at the FBI. Luis warns Lang, who rushes home before Woo can see him violating his house", 10, maxy - 430, TextFont, Black)
    Font.Draw ("arrest. Pym and Hope are arrested by the FBI, allowing Ava to take the lab. Lang helps Pym and Hope escape, Hope", 10, maxy - 445, TextFont, Black)
    Font.Draw ("and Lang distract Ava while Pym pilots a vehicle into the quantum realm to find Janet but Burch attacks with his", 10, maxy - 460, TextFont, Black)
    Font.Draw ("men allowing Ava to start forcibly take Janet's energy. Luis, Dave, and Kurt help incapacitate Burch and his men", 10, maxy - 475, TextFont, Black)
    Font.Draw ("so that Lang and Hope can stop Ava. Pym and Janet return safely from the quantum realm, and Janet voluntarily gifts", 10, maxy - 490, TextFont, Black)
    Font.Draw ("some of her energy to Ava to temporarily stabilize her. Lang returns home once again, in time for a now suspicious", 10, maxy - 505, TextFont, Black)

    Pic.Draw (BabayagaInterrogationPic, 690, 350, picMerge)
    Font.Draw ("Luis, Dave, and Kurt are interrogated under a truth serum by", 690, 335, CaptionFont, Black)
    Font.Draw ("Burch who makes them reveal Lang's location", 690, 325, CaptionFont, Black)

    Pic.Draw (QuantumVehiclePic, 690, 130, picMerge)
    Font.Draw ("The quantum vehicle is ready to travel into the quantum", 690, 115, CaptionFont, Black)
    Font.Draw ("realm, piloted by Hank Pym to find Janet van Dyne", 690, 105, CaptionFont, Black)

    loop
	movieTextWindow ("580")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Ant-Man and the Wasp", maxx div 2 - 160, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Ant-Man and the Wasp is a movie set before the events of Avengers: Infinity War and shows the perspective of Ant", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("Man during his missing presence in Avengers: Infinity War. Two years after Scott Lang was placed under house", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("arrest due to his involvement with the Avengers, in violation of the Sokovia Accords, Hank Pym and Hope van Dyne", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("briefly open a tunnel into the quantum realm where they believe Pym's wife and Hope's mother, Janet van Dyne is", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("to be after shrinking to sub-atomic levels in 1987. When he had previously visited the quantum realm, Lang had", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("unknowingly become quantumly entangled with Janet, and now he receives an apparent message from her. With only", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("days left of house arrest, Lang contacts Pym about Janet despite the strained relationship they have due to", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("Lang's actions with the Avengers in Captain America: Civil War. Hope and Pym kidnap Lang, leaving a decoy so", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("as not to arouse suspicion from FBI agent Jimmy Woo. Believing the message from Janet to be confirmation that", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("she is alive, the trio work to build a stable quantum tunnel so they can take a vehicle to the quantum realm has", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("and retrieve her. They arrange to buy a part needed for the tunnel from black market dealer Sonny Burch, who", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("realized the potential profit that can be earned from Pym's research and double-crosses them. Donning the Wasp", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("outfit, Hope fights off Burch and his men until she is attacked by a quantumly unstable masked woman. Lang tries", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("to help fight off this \"ghost\", but the woman escapes with Pym's lab, which has been shrunk down to the size of a", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("suitcase. Pym reluctantly visits his estranged former partner Bill Foster with Hope and Lang. Foster helps them locate", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("the lab, where the ghost captures the trio and reveals herself to be Ava Starr. Her father Elihas, another of Pym's", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("former partners, died along with his wife during a quantum experiment causings Ava's unstable quantum state. Foster", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("reveals that Ava is dying and in constant pain as a result of her condition, and they plan to cure her using Janet's", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("quantum energy. Believing that this will kill Janet, Pym refuses to help them and escapes with Hope, Lang, and the", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("lab. Opening a stable version of the tunnel, Pym, Hope, and Lang are able to contact Janet, who gives them a precise", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("location to find her but warns that they only have two hours before the unstable nature of the realm separates them", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("for a century. Using a truth serum, Burch learns the trio's location from Lang's business partners Luis, Dave, and", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Kurt, and informs a contact at the FBI. Luis warns Lang, who rushes home before Woo can see him violating his house", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("arrest. Pym and Hope are arrested by the FBI, allowing Ava to take the lab. Lang helps Pym and Hope escape, Hope", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("and Lang distract Ava while Pym pilots a vehicle into the quantum realm to find Janet but Burch attacks with his", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("men allowing Ava to start forcibly take Janet's energy. Luis, Dave, and Kurt help incapacitate Burch and his men", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("so that Lang and Hope can stop Ava. Pym and Janet return safely from the quantum realm, and Janet voluntarily gifts", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("some of her energy to Ava to temporarily stabilize her. Lang returns home once again, in time for a now suspicious", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("Woo to release him at the end of his house arrest. Ava and Foster go into hiding.", 10, maxy - 520, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: Janet, Hope and Pym send Lang into the quantum realm after Janet warns Lang about time vortexes.", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("As Lang is about to exit the quantum realm, Hope, Janet and Pym disintegrate due to the Thanos snap. ", 10, maxy - 565, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    switch (7) := false
    Music.PlayFileStop
    cls
end AntManandtheWaspContents


procedure CaptainMarvelContents
    MusicMovieID := 21
    cls
    Music.PlayFileLoop ("Captain Marvel Soundtrack - Main Theme.MP3")
    Font.Draw ("Captain Marvel", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("In 1995, on the Kree Empire's capital planet of Hala, Starforce member Vers suffers from amnesia and recurring", 10, maxy - 100, TextFont, Black)
    Font.Draw ("nightmares involving an older woman. Yon-Rogg, her mentor and commander, trains her to control her abilities", 10, maxy - 115, TextFont, Black)
    Font.Draw ("while the Supreme Intelligence, the artificial intelligence that rules the Kree, urges her to keep her emotions", 10, maxy - 130, TextFont, Black)
    Font.Draw ("in check. During a mission to rescue an undercover operative infiltrating a group of Skrulls, alien shapeshifters", 10, maxy - 145, TextFont, Black)
    Font.Draw ("with whom the Kree are at war, Vers is captured by Skrull commander Talos. A probe of Vers's memories leads them", 10, maxy - 160, TextFont, Black)
    Font.Draw ("to Earth. Vers escapes and crash-lands in Los Angeles. Her presence attracts S.H.I.E.L.D. agents Nick Fury and", 10, maxy - 175, TextFont, Black)
    Font.Draw ("Phil Coulson, whose investigation is interrupted by a Skrull attack. In the ensuing chase, Vers recovers a crystal", 10, maxy - 190, TextFont, Black)
    Font.Draw ("containing her extracted memories while Fury kills a Skrull impersonating Coulson. Talos, disguised as Fury's boss", 10, maxy - 205, TextFont, Black)
    Font.Draw ("Keller, orders Fury to work with Vers and keep tabs on her. Learning through extracted memories, Fury and Vers", 10, maxy - 220, TextFont, Black)
    Font.Draw ("go to the U.S. Air Force base where project Pegasus tok place. They discover Vers was a pilot presumed to have", 10, maxy - 235, TextFont, Black)
    Font.Draw ("died in 1989 while testing an experimental light-speed engine designed by Dr. Wendy Lawson, whom Vers recognizes", 10, maxy - 250, TextFont, Black)
    Font.Draw ("as the woman from her nightmares. Fury informs SHIELD of their whereabouts through a pager, a team led by Talos", 10, maxy - 265, TextFont, Black)
    Font.Draw ("disguised as Keller arrives. Fury discovers that Keller is a fake and helps Vers escape in a cargo jet with Lawson's", 10, maxy - 280, TextFont, Black)
    Font.Draw ("stowaway cat Goose. They fly to Louisiana to meet former pilot Maria Rambeau, the last person to see Vers and Lawson", 10, maxy - 295, TextFont, Black)
    Font.Draw ("alive. Rambeau and her daughter Monica reveal that Vers is Carol Danvers, who was once like family to them. Talos,", 10, maxy - 310, TextFont, Black)
    Font.Draw ("arriving unarmed, explains that the Skrulls are refugees searching for a new home and that Lawson was Mar-Vell, a", 10, maxy - 325, TextFont, Black)
    Font.Draw ("renegade Kree scientist helping them. Talos plays a recovered recording from Lawson's jet, prompting Danvers to", 10, maxy - 340, TextFont, Black)
    Font.Draw ("remember the crash: Lawson was killed by Yon-Rogg to prevent her from destroying the engine before the Kree could", 10, maxy - 355, TextFont, Black)
    Font.Draw ("recover it. Danvers destroys the engine herself, which results in an energy explosion that is absorbed by Danvers", 10, maxy - 370, TextFont, Black)
    Font.Draw ("granting her powers but losing her memories. Danvers, Talos, Fury, and Rambeau locate Lawson's cloaked laboratory", 10, maxy - 385, TextFont, Black)
    Font.Draw ("through vector coordinates given, revealed Lawson's cloaked laboratory to be orbiting Earth and hiding the Skrulls,", 10, maxy - 400, TextFont, Black)
    Font.Draw ("and the Tesseract which powers Lawson's engine. There, Danvers is captured by Starforce and interfaces with the", 10, maxy - 415, TextFont, Black)
    Font.Draw ("Supreme Intelligence. During their conversation, Danvers removes the Kree implant that was suppressing her powers,", 10, maxy - 430, TextFont, Black)
    Font.Draw ("allowing her to reach her full potential. In the subsequent battle, Fury retrieves Goose, who is revealed to be an", 10, maxy - 445, TextFont, Black)
    Font.Draw ("alien Flerken. Goose swallows the Tesseract and scratches Fury, blinding his left eye. Danvers easily destroys a Kree,", 10, maxy - 460, TextFont, Black)
    Font.Draw ("bomber forcing Kree officer Ronan the Accuser and his squadron to retreat, before overpowering Yon-Rogg on Earth and", 10, maxy - 475, TextFont, Black)
    Font.Draw ("sending him back to Hala with a warning to the Supreme Intelligence. Danvers leaves Earth to help the Skrulls find", 10, maxy - 490, TextFont, Black)
    Font.Draw ("a new home and leaves Fury a modified pager to contact her in case of an emergency. Fury drafts an initiative to", 10, maxy - 505, TextFont, Black)

    Pic.Draw (CaptainMarvelDestroysRoninFleetPic, 690, 350, picMerge)
    Font.Draw ("Captain Marvel destroys Ronin's fleet of destroyers to prevent", 690, 335, CaptionFont, Black)
    Font.Draw ("him from destroying Earth", 690, 325, CaptionFont, Black)

    Pic.Draw (GooseScratchesFuryPic, 690, 130, picMerge)
    Font.Draw ("Goose scratches Fury's left eye, severely wounding it", 690, 115, CaptionFont, Black)

    loop
	movieTextWindow ("610")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Captain Marvel", maxx div 2 - 80, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("In 1995, on the Kree Empire's capital planet of Hala, Starforce member Vers suffers from amnesia and recurring", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("nightmares involving an older woman. Yon-Rogg, her mentor and commander, trains her to control her abilities", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("while the Supreme Intelligence, the artificial intelligence that rules the Kree, urges her to keep her emotions", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("in check. During a mission to rescue an undercover operative infiltrating a group of Skrulls, alien shapeshifters", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("with whom the Kree are at war, Vers is captured by Skrull commander Talos. A probe of Vers's memories leads them", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("to Earth. Vers escapes and crash-lands in Los Angeles. Her presence attracts S.H.I.E.L.D. agents Nick Fury and", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("Phil Coulson, whose investigation is interrupted by a Skrull attack. In the ensuing chase, Vers recovers a crystal", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("containing her extracted memories while Fury kills a Skrull impersonating Coulson. Talos, disguised as Fury's boss", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("Keller, orders Fury to work with Vers and keep tabs on her. Learning through extracted memories, Fury and Vers", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("go to the U.S. Air Force base where project Pegasus tok place. They discover Vers was a pilot presumed to have", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("died in 1989 while testing an experimental light-speed engine designed by Dr. Wendy Lawson, whom Vers recognizes", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("as the woman from her nightmares. Fury informs SHIELD of their whereabouts through a pager, a team led by Talos", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("disguised as Keller arrives. Fury discovers that Keller is a fake and helps Vers escape in a cargo jet with Lawson's", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("stowaway cat Goose. They fly to Louisiana to meet former pilot Maria Rambeau, the last person to see Vers and Lawson", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("alive. Rambeau and her daughter Monica reveal that Vers is Carol Danvers, who was once like family to them. Talos,", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("arriving unarmed, explains that the Skrulls are refugees searching for a new home and that Lawson was Mar-Vell, a", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("renegade Kree scientist helping them. Talos plays a recovered recording from Lawson's jet, prompting Danvers to", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("remember the crash: Lawson was killed by Yon-Rogg to prevent her from destroying the engine before the Kree could", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("recover it. Danvers destroys the engine herself, which results in an energy explosion that is absorbed by Danvers", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("granting her powers but losing her memories. Danvers, Talos, Fury, and Rambeau locate Lawson's cloaked laboratory", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("through vector coordinates given, revealed Lawson's cloaked laboratory to be orbiting Earth and hiding the Skrulls,", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("and the Tesseract which powers Lawson's engine. There, Danvers is captured by Starforce and interfaces with the", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("Supreme Intelligence. During their conversation, Danvers removes the Kree implant that was suppressing her powers,", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("allowing her to reach her full potential. In the subsequent battle, Fury retrieves Goose, who is revealed to be an", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("alien Flerken. Goose swallows the Tesseract and scratches Fury, blinding his left eye. Danvers easily destroys a Kree,", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("bomber forcing Kree officer Ronan the Accuser and his squadron to retreat, before overpowering Yon-Rogg on Earth and", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("sending him back to Hala with a warning to the Supreme Intelligence. Danvers leaves Earth to help the Skrulls find", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("a new home and leaves Fury a modified pager to contact her in case of an emergency. Fury drafts an initiative to", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("locate heroes like Danvers, naming it after her Air Force call sign, \"Avenger\".", 10, maxy - 520, TextFont, Black)

	    Font.Draw ("Mid Credit Scene: The remaining avengers monitor the pager that Fury sent a signal on, the signal disappears and", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("Danvers appears in her suit.", 10, maxy - 565, TextFont, Black)

	    Font.Draw ("Post Credit Scene: Goose climbs onto Fury's desk and regurgitates the Tesseract.", 10, maxy - 595, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end CaptainMarvelContents


procedure Avengers4Contents
    MusicMovieID := 22
    cls
    Music.PlayFileLoop ("'Avengers Endgame' Main Theme by Alan Silvestri.MP3")
    Font.Draw ("Avengers: Endgame", maxx div 2 - 150, maxy - 45, MovieTitleFont, Black)

    Font.Draw ("Avengers: Endgame is the culmination of the Marvel Cinematic Universe and the end of the Infinity Saga. It signifies", 10, maxy - 100, TextFont, Black)
    Font.Draw ("the end of the first era of the MCU and wraps up many of the MCU character journeys. Twenty-three days after Thanos", 10, maxy - 115, TextFont, Black)
    Font.Draw ("used the Infinity Gauntlet to disintegrate half of all life in the universe, Tony Stark and Nebula are stranded in", 10, maxy - 130, TextFont, Black)
    Font.Draw ("space aboard the Milano with no food, water and air supply running out. Captain Marvel appears and takes the ship", 10, maxy - 145, TextFont, Black)
    Font.Draw ("back to Earth, where they reunite with the remaining Avengers: Bruce Banner, Steve Rogers, Thor, Natasha Romanoff,", 10, maxy - 160, TextFont, Black)
    Font.Draw ("James Rhodes, and Rocket. Tony berates with Steve on the reason the Avengers lost was because Rogers had split them", 10, maxy - 175, TextFont, Black)
    Font.Draw ("up. Rocket locates a shockwave with the same energy signature as Thanos's snap, locating the planet that Thanos", 10, maxy - 190, TextFont, Black)
    Font.Draw ("retired too. Rocket, Rogers, Rhodes, Romanoff, Thor, Danvers head to located planet and discover that Thanos used", 10, maxy - 205, TextFont, Black)
    Font.Draw ("the Stones to destroy the Stones. Thor, enraged beheads Thanos. Five years later, a rat runs across the quantum", 10, maxy - 220, TextFont, Black)
    Font.Draw ("realm truck and releases Scott Lang from the quantum realm. He reunites with Cassie and discovers that the world", 10, maxy - 235, TextFont, Black)
    Font.Draw ("has progressed five years as well as half the population disappeared. Lang arrives at the Avengers compound with", 10, maxy - 250, TextFont, Black)
    Font.Draw ("Romanoff and Rogers present and tells them that he only spent five hours in the quantum realm in comparison to the", 10, maxy - 265, TextFont, Black)
    Font.Draw ("five years that passed in the outside world. Theorizing the quantum realm could allow time travel, the three ask", 10, maxy - 280, TextFont, Black)
    Font.Draw ("Stark to help them retrieve the Stones from the past to reverse Thanos' actions in the present. Stark refuses,", 10, maxy - 295, TextFont, Black)
    Font.Draw ("thinking of his wife, Pepper Potts, and daughter, Morgan, but relents after looking at a picture of himself and", 10, maxy - 310, TextFont, Black)
    Font.Draw ("the late Peter Parker. Stark and Banner, who has since merged his intelligence with the Hulk's strength, build a", 10, maxy - 325, TextFont, Black)
    Font.Draw ("time machine. Lang uses the time machine but instead of traveling through time, time travels through Lang. Stark", 10, maxy - 340, TextFont, Black)
    Font.Draw ("arrived with a wristband machine that allows time travel and the Avengers search for the rest of the superheroes.", 10, maxy - 355, TextFont, Black)
    Font.Draw ("Banner and Rocket visit the Asgardian refugees' new home in Norway, New Asgard to recruit Thor, now overweight", 10, maxy - 370, TextFont, Black)
    Font.Draw ("and drinking heavily, despondent over his failure to stop Thanos. In Tokyo, Romanoff recruits Clint Barton, now a", 10, maxy - 385, TextFont, Black)
    Font.Draw ("vigilante following the disintegration of his family.  Banner notes changing the past does not affect their present;", 10, maxy - 400, TextFont, Black)
    Font.Draw ("any changes instead create branched alternate realities. Banner, Lang, Rogers, and Stark travel to New York City", 10, maxy - 415, TextFont, Black)
    Font.Draw ("in 2012. Banner visits the Sanctum Sanctorum and convinces the Ancient One to give him the Time Stone. Rogers", 10, maxy - 430, TextFont, Black)
    Font.Draw ("convinces STRIKE team that he is HYDRA and takes the scepter. Stark and Lang fail to obtain the Tesseract when", 10, maxy - 445, TextFont, Black)
    Font.Draw ("the Hulk knocks the Tesseract into the hands of 2012 Loki who escapes with it. Rogers meets 2012 Rogers that thinks", 10, maxy - 460, TextFont, Black)
    Font.Draw ("that the present Rogers is Loki. The 2012 Rogers is defeated but the Tesseract is gone. Rogers and Stark travel to", 10, maxy - 475, TextFont, Black)
    Font.Draw ("S.H.I.E.L.D. headquarters in 1970, where Stark obtains an earlier version of the Space Stone and encounters his father,", 10, maxy - 490, TextFont, Black)
    Font.Draw ("Howard, while Rogers steals Pym Particles from Hank Pym to return to the present. Meanwhile, Rocket and Thor travel", 10, maxy - 505, TextFont, Black)

    Pic.Draw (AvengersAssemblePic, 690, 350, picMerge)
    Font.Draw ("The heroes and armies from all over the universe assemble", 690, 335, CaptionFont, Black)
    Font.Draw ("to Captain America to fight against Thanos and his forces", 690, 325, CaptionFont, Black)

    Pic.Draw (IamIronManPic, 690, 130, picMerge)
    Font.Draw ("Iron Man secretly transfers the Infinity Stones to his hand,", 690, 115, CaptionFont, Black)
    Font.Draw ("snapping and vanishing Thanos and his army at the cost", 690, 105, CaptionFont, Black)
    Font.Draw ("of his life", 690, 95, CaptionFont, Black)

    loop
	movieTextWindow ("970")
	if switch (3) then             % If the text window is opened then switch 2 would be true
	    switch (3) := false
	    Font.Draw ("Avengers: Endgame", maxx div 2 - 150, maxy - 45, MovieTitleFont, Black)

	    Font.Draw ("Avengers: Endgame is the culmination of the Marvel Cinematic Universe and the end of the Infinity Saga. It signifies", 10, maxy - 100, TextFont, Black)
	    Font.Draw ("the end of the first era of the MCU and wraps up many of the MCU character journeys. Twenty-three days after Thanos", 10, maxy - 115, TextFont, Black)
	    Font.Draw ("used the Infinity Gauntlet to disintegrate half of all life in the universe, Tony Stark and Nebula are stranded in", 10, maxy - 130, TextFont, Black)
	    Font.Draw ("space aboard the Milano with no food, water and air supply running out. Captain Marvel appears and takes the ship", 10, maxy - 145, TextFont, Black)
	    Font.Draw ("back to Earth, where they reunite with the remaining Avengers: Bruce Banner, Steve Rogers, Thor, Natasha Romanoff,", 10, maxy - 160, TextFont, Black)
	    Font.Draw ("James Rhodes, and Rocket. Tony berates with Steve on the reason the Avengers lost was because Rogers had split them", 10, maxy - 175, TextFont, Black)
	    Font.Draw ("up. Rocket locates a shockwave with the same energy signature as Thanos's snap, locating the planet that Thanos", 10, maxy - 190, TextFont, Black)
	    Font.Draw ("retired too. Rocket, Rogers, Rhodes, Romanoff, Thor, Danvers head to located planet and discover that Thanos used", 10, maxy - 205, TextFont, Black)
	    Font.Draw ("the Stones to destroy the Stones. Thor, enraged beheads Thanos. Five years later, a rat runs across the quantum", 10, maxy - 220, TextFont, Black)
	    Font.Draw ("realm truck and releases Scott Lang from the quantum realm. He reunites with Cassie and discovers that the world", 10, maxy - 235, TextFont, Black)
	    Font.Draw ("has progressed five years as well as half the population disappeared. Lang arrives at the Avengers compound with", 10, maxy - 250, TextFont, Black)
	    Font.Draw ("Romanoff and Rogers present and tells them that he only spent five hours in the quantum realm in comparison to the", 10, maxy - 265, TextFont, Black)
	    Font.Draw ("five years that passed in the outside world. Theorizing the quantum realm could allow time travel, the three ask", 10, maxy - 280, TextFont, Black)
	    Font.Draw ("Stark to help them retrieve the Stones from the past to reverse Thanos' actions in the present. Stark refuses,", 10, maxy - 295, TextFont, Black)
	    Font.Draw ("thinking of his wife, Pepper Potts, and daughter, Morgan, but relents after looking at a picture of himself and", 10, maxy - 310, TextFont, Black)
	    Font.Draw ("the late Peter Parker. Stark and Banner, who has since merged his intelligence with the Hulk's strength, build a", 10, maxy - 325, TextFont, Black)
	    Font.Draw ("time machine. Lang uses the time machine but instead of traveling through time, time travels through Lang. Stark", 10, maxy - 340, TextFont, Black)
	    Font.Draw ("arrived with a wristband machine that allows time travel and the Avengers search for the rest of the superheroes.", 10, maxy - 355, TextFont, Black)
	    Font.Draw ("Banner and Rocket visit the Asgardian refugees' new home in Norway, New Asgard to recruit Thor, now overweight", 10, maxy - 370, TextFont, Black)
	    Font.Draw ("and drinking heavily, despondent over his failure to stop Thanos. In Tokyo, Romanoff recruits Clint Barton, now a", 10, maxy - 385, TextFont, Black)
	    Font.Draw ("vigilante following the disintegration of his family.  Banner notes changing the past does not affect their present;", 10, maxy - 400, TextFont, Black)
	    Font.Draw ("any changes instead create branched alternate realities. Banner, Lang, Rogers, and Stark travel to New York City", 10, maxy - 415, TextFont, Black)
	    Font.Draw ("in 2012. Banner visits the Sanctum Sanctorum and convinces the Ancient One to give him the Time Stone. Rogers", 10, maxy - 430, TextFont, Black)
	    Font.Draw ("convinces STRIKE team that he is HYDRA and takes the scepter. Stark and Lang fail to obtain the Tesseract when", 10, maxy - 445, TextFont, Black)
	    Font.Draw ("the Hulk knocks the Tesseract into the hands of 2012 Loki who escapes with it. Rogers meets 2012 Rogers that thinks", 10, maxy - 460, TextFont, Black)
	    Font.Draw ("that the present Rogers is Loki. The 2012 Rogers is defeated but the Tesseract is gone. Rogers and Stark travel to", 10, maxy - 475, TextFont, Black)
	    Font.Draw ("S.H.I.E.L.D. headquarters in 1970, where Stark obtains an earlier version of the Space Stone and encounters his father,", 10, maxy - 490, TextFont, Black)
	    Font.Draw ("Howard, while Rogers steals Pym Particles from Hank Pym to return to the present. Meanwhile, Rocket and Thor travel", 10, maxy - 505, TextFont, Black)
	    Font.Draw ("to Asgard in 2013, extracting the Reality Stone from Jane Foster. Thor's mother, Frigga realises that Thor is from", 10, maxy - 520, TextFont, Black)
	    Font.Draw ("the future, gone through harsh times so she gives him a prep talk. They return back to the present with the Reality", 10, maxy - 535, TextFont, Black)
	    Font.Draw ("Stone but not before Thor summons Mjolnir to bring into the present with him. Nebula and Rhodes travel to Morag in", 10, maxy - 550, TextFont, Black)
	    Font.Draw ("2014 and steal the Power Stone before Peter Quill can.[N 5] Rhodes returns to the present with the Power Stone, but", 10, maxy - 565, TextFont, Black)
	    Font.Draw ("Nebula becomes incapacitated when her cybernetic implants link with those of her past self. Through this connection,", 10, maxy - 580, TextFont, Black)
	    Font.Draw ("2014 Thanos learns of his future success and the Avengers' attempts to undo it. He captures Nebula and sends 2014", 10, maxy - 595, TextFont, Black)
	    Font.Draw ("Nebula to the present in the former's place. Barton and Romanoff travel to Vormir in 2014, where the Soul Stone's", 10, maxy - 610, TextFont, Black)
	    Font.Draw ("keeper, the Red Skull, reveals it can only be acquired by sacrificing someone they love. Romanoff sacrifices herself,", 10, maxy - 625, TextFont, Black)
	    Font.Draw ("allowing Barton to obtain the Soul Stone. Reuniting in the present, the Avengers grief after Romanoff's death, and", 10, maxy - 640, TextFont, Black)
	    Font.Draw ("the Stones are placed into a nanotech Stark created gauntlet. Banner, reasons that he is the most immune to gamma", 10, maxy - 655, TextFont, Black)
	    Font.Draw ("radiation does the snap to reverse the effects of five years ago but in the process, burns his arm.  Meanwhile, 2014", 10, maxy - 670, TextFont, Black)
	    Font.Draw ("Nebula uses the time machine to transport 2014 Thanos and his warship to the present, where he attacks the Avengers'", 10, maxy - 685, TextFont, Black)
	    Font.Draw ("compound, planning to destroy and rebuild the universe with the Stones. Nebula convinces 2014 Gamora to betray Thanos,", 10, maxy - 700, TextFont, Black)
	    Font.Draw ("but fails to convince 2014 Nebula and is forced to kill her. Stark, Thor and Rogers are outmatched by Thannos even", 10, maxy - 715, TextFont, Black)
	    Font.Draw ("after Rogers wields Mjolnir. Thanos promises to destroy Earth because of the trouble the Avengers caused him, but", 10, maxy - 730, TextFont, Black)
	    Font.Draw ("as all seems lost, Steven Strange appears with reinforcements from everywhere in the galaxy appearing through portals", 10, maxy - 745, TextFont, Black)
	    Font.Draw ("created by the sorcerers including the rest of the Guardians of the Galaxy, the Wakandan army, Asgardian Army,", 10, maxy - 760, TextFont, Black)
	    Font.Draw ("Ravagers and many more. Wanda Maximoff is enraged after being resurrected because Thanos took everything from her,", 10, maxy - 775, TextFont, Black)
	    Font.Draw ("Maximoff defeats Thanos in a solo battle and Thanos orders the ships to rain down, disrupting the fight. Danvers", 10, maxy - 790, TextFont, Black)
	    Font.Draw ("arrives through the atmosphere and destroys the ships but destroys the quantum realm truck leaving the gauntlet", 10, maxy - 805, TextFont, Black)
	    Font.Draw ("and stones stranded in the present and overpowers everyone. Stark tries to pull off a last desperate fight but", 10, maxy - 820, TextFont, Black)
	    Font.Draw ("is easily repelled. Thanos tries to snap the gauntlet again declaring \"I am inevitable\" but nothing happens.", 10, maxy - 835, TextFont, Black)
	    Font.Draw ("Stark reveals to have transferred the stones through his nanotechnology and has all the stones on his hand, he", 10, maxy - 850, TextFont, Black)
	    Font.Draw ("snaps, declaring \"I am Iron Man\" recalling to the moment when he revealed his identity to the world. The snap", 10, maxy - 865, TextFont, Black)
	    Font.Draw ("disintegrates all of Thanos's forces along with Thanos ending the battle. Stark is mortally wounded as the price", 10, maxy - 880, TextFont, Black)
	    Font.Draw ("to pay for using the Infinity Stones. A funeral is held for Stark with a prerecorded message of Stark's last words", 10, maxy - 895, TextFont, Black)
	    Font.Draw ("in case of an untimely death. Following Stark's funeral, Thor appoints Valkyrie as the new ruler of New Asgard and", 10, maxy - 910, TextFont, Black)
	    Font.Draw ("joins the Guardians of the Galaxy. Rogers returns the Infinity Stones and Mjolnir to their original timelines and", 10, maxy - 925, TextFont, Black)
	    Font.Draw ("remains in the past to live with Peggy Carter. In the present, an elderly Rogers passes his shield and mantle on to", 10, maxy - 940, TextFont, Black)
	    Font.Draw ("Sam Wilson.", 10, maxy - 955, TextFont, Black)
	    movieWindowClose
	end if
	exit when switch (4)
    end loop
    switch (4) := false
    Music.PlayFileStop
    cls
end Avengers4Contents


% Back button to the main menu
procedure backToMainMenuButton
    drawfillbox (maxx - 194, maxy - 25, maxx, maxy, Black)
    drawfillbox (maxx - 192, maxy - 23, maxx - 2, maxy - 2, CloudBlue4)
    Font.Draw ("Return to Main Menu", maxx - 188, maxy - 20, QuickSelectionTextFont, Black)
end backToMainMenuButton


% Procedure for quick selection without all the shifting
procedure StartingScreen
    Pic.Draw (TitleBackground, 1, 1, picCopy)
    Font.Draw ("Marvel Cinematic Universe: Infinity Saga", 20, maxy - 150, TitleFont, White)
    drawfillbox (198, maxy div 2 - 52, 502, maxy div 2 + 102, Black)             % Border of the first button
    drawfillbox (200, maxy div 2 - 50, 500, maxy div 2 + 100, 12)             % First button (movie selection)
    Font.Draw ("Movie", 312, maxy div 2 + 40, BoxTextFont, Black)
    Font.Draw ("Selection", 295, maxy div 2, BoxTextFont, Black)
    drawfillbox (548, maxy div 2 - 52, 852, maxy div 2 + 102, Black)             % Border of second button
    drawfillbox (550, maxy div 2 - 50, 850, maxy div 2 + 100, 55)             % Second button (quick movie selection)
    Font.Draw ("Quick", 662, maxy div 2 + 40, BoxTextFont, Black)
    Font.Draw ("Selection", 645, maxy div 2, BoxTextFont, Black)
end StartingScreen


% Procedure to do the aoe effect of clicking on movies
% Try to integrate if button is up playing background animation like netflix
% If button is down redirect into the procedure of the movie clicked, those procedures are above
procedure MovieDetector
    if x >= 140 and x <= 360 and y >= 150 and y <= 476 and button = 1 then
	case movieset of
	    label 1 :
		IronManContents
		switch (6) := true
	    label 2 :
		ThorContents
		switch (6) := true
	    label 3 :
		IronMan3Contents
		switch (6) := true
	    label 4 :
		GuardiansoftheGalaxyContents
		switch (6) := true
	    label 5 :
		CaptainAmerica3Contents
		switch (6) := true
	    label 6 :
		SpiderManContents
		switch (6) := true
	    label 7 :
		Avengers3Contents
		switch (6) := true
	    label 8 :
		Avengers4Contents
		switch (6) := true
	end case
    end if
    if x >= 390 and x <= 610 and y >= 150 and y <= 476 and button = 1 then
	case movieset of
	    label 1 :
		TheIncredibleHulkContents
		switch (6) := true
	    label 3 :
		Thor2Contents
		switch (6) := true
	    label 4 :
		Avengers2Contents
		switch (6) := true
	    label 5 :
		DoctorStrangeContents
		switch (6) := true
	    label 6 :
		Thor3Contents
		switch (6) := true
	    label 7 :
		AntManandtheWaspContents
		switch (6) := true
	    label :
	end case
    end if
    if x >= 390 and x <= 610 and y >= 150 and y <= 483 and movieset = 2 and button = 1 then
	CaptainAmerica1Contents
	switch (6) := true
    end if
    if x >= 640 and x <= 860 and y >= 150 and y <= 476 and button = 1 then
	case movieset of
	    label 1 :
		IronMan2Contents
		switch (6) := true
	    label 2 :
		AvengersContents
		switch (6) := true
	    label 3 :
		CaptainAmerica2Contents
		switch (6) := true
	    label 4 :
		AntManContents
		switch (6) := true
	    label 5 :
		GuardiansoftheGalaxy2Contents
		switch (6) := true
	    label 6 :
		BlackPantherContents
		switch (6) := true
	    label 7 :
		CaptainMarvelContents
		switch (6) := true
	end case
    end if
end MovieDetector


% Graphical user interface

% Movie Selection
procedure arrows
    % Left side movie selection arrow
    drawline (100, maxy div 2 + 50, 100, maxy div 2 - 50, Black)
    drawline (50, maxy div 2, 100, maxy div 2 + 50, Black)
    drawline (50, maxy div 2, 100, maxy div 2 - 50, Black)
    drawfill (75, maxy div 2, Black, Black)
    % Right side movie selection arrow
    drawline (maxx - 100, maxy div 2 + 50, maxx - 100, maxy div 2 - 50, Black)
    drawline (maxx - 50, maxy div 2, maxx - 100, maxy div 2 + 50, Black)
    drawline (maxx - 50, maxy div 2, maxx - 100, maxy div 2 - 50, Black)
    drawfill (maxx - 75, maxy div 2, Black, Black)
end arrows


% Displaying the mcu movie posters
procedure MovieSelection
    switch (2) := true             % Activates the AOE effect for the arrows
    cls
    backToMainMenuButton
    loop
	arrows
	if switch (6) then
	    backToMainMenuButton
	    switch (6) := false
	end if
	Coordinates
	if switch (1) then
	    drawfillbox (5, 15, 200, 100, white)
	    if 1 <= prevset and prevset <= 7 then
		drawfillbox (moviePosterCoords (prevset * 3 - 2, 'X', 1), moviePosterCoords (prevset * 3 - 2, 'Y', 1), moviePosterCoords (prevset * 3 - 2, 'X', 2),
		    moviePosterCoords (prevset
		    * 3 - 2,
		    'Y', 2), white)
		drawfillbox (moviePosterCoords (prevset * 3 - 1, 'X', 1), moviePosterCoords (prevset * 3 - 1, 'Y', 1), moviePosterCoords (prevset * 3 - 1, 'X', 2),
		    moviePosterCoords (prevset
		    * 3 - 1,
		    'Y', 2), white)
		drawfillbox (moviePosterCoords (prevset * 3, 'X', 1), moviePosterCoords (prevset * 3, 'Y', 1), moviePosterCoords (prevset * 3, 'X', 2), moviePosterCoords (prevset * 3, 'Y',
		    2), white)
		switch (1) := false
	    else
		drawfillbox (moviePosterCoords (prevset * 3 - 2, 'X', 1), moviePosterCoords (prevset * 3 - 2, 'Y', 1), moviePosterCoords (prevset * 3 - 2, 'X', 2),
		    moviePosterCoords (prevset
		    * 3 - 2,
		    'Y', 2), white)
		switch (1) := false
	    end if
	end if
	case movieset of
	    label 1 :
		Pic.Draw (IronManPoster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (IncredibleHulkPoster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (IronMan2Poster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (1, 'X', 1) := 140
		moviePosterCoords (1, 'Y', 1) := 150
		moviePosterCoords (1, 'X', 2) := 360
		moviePosterCoords (1, 'Y', 2) := 476
		moviePosterCoords (2, 'X', 1) := 390
		moviePosterCoords (2, 'Y', 1) := 150
		moviePosterCoords (2, 'X', 2) := 610
		moviePosterCoords (2, 'Y', 2) := 476
		moviePosterCoords (3, 'X', 1) := 640
		moviePosterCoords (3, 'Y', 1) := 150
		moviePosterCoords (3, 'X', 2) := 860
		moviePosterCoords (3, 'Y', 2) := 476
		prevset := 1
		Font.Draw ("Phase 1", 10, 20, PhaseFont, black)
	    label 2 :
		Pic.Draw (ThorPoster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (CaptainAmericaPoster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (AvengersPoster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (4, 'X', 1) := 140
		moviePosterCoords (4, 'Y', 1) := 150
		moviePosterCoords (4, 'X', 2) := 360
		moviePosterCoords (4, 'Y', 2) := 476
		moviePosterCoords (5, 'X', 1) := 390
		moviePosterCoords (5, 'Y', 1) := 150
		moviePosterCoords (5, 'X', 2) := 610
		moviePosterCoords (5, 'Y', 2) := 493
		moviePosterCoords (6, 'X', 1) := 640
		moviePosterCoords (6, 'Y', 1) := 150
		moviePosterCoords (6, 'X', 2) := 860
		moviePosterCoords (6, 'Y', 2) := 476
		prevset := 2
		Font.Draw ("Phase 1", 10, 20, PhaseFont, black)
	    label 3 :
		Pic.Draw (IronMan3Poster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (Thor2Poster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (CaptainAmerica2Poster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (7, 'X', 1) := 140
		moviePosterCoords (7, 'Y', 1) := 150
		moviePosterCoords (7, 'X', 2) := 360
		moviePosterCoords (7, 'Y', 2) := 476
		moviePosterCoords (8, 'X', 1) := 390
		moviePosterCoords (8, 'Y', 1) := 150
		moviePosterCoords (8, 'X', 2) := 610
		moviePosterCoords (8, 'Y', 2) := 476
		moviePosterCoords (9, 'X', 1) := 640
		moviePosterCoords (9, 'Y', 1) := 150
		moviePosterCoords (9, 'X', 2) := 860
		moviePosterCoords (9, 'Y', 2) := 476
		prevset := 3
		Font.Draw ("Phase 2", 10, 20, PhaseFont, black)
	    label 4 :
		Pic.Draw (GuardiansoftheGalaxyPoster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (Avengers2Poster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (AntManPoster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (10, 'X', 1) := 140
		moviePosterCoords (10, 'Y', 1) := 150
		moviePosterCoords (10, 'X', 2) := 360
		moviePosterCoords (10, 'Y', 2) := 476
		moviePosterCoords (11, 'X', 1) := 390
		moviePosterCoords (11, 'Y', 1) := 150
		moviePosterCoords (11, 'X', 2) := 610
		moviePosterCoords (11, 'Y', 2) := 476
		moviePosterCoords (12, 'X', 1) := 640
		moviePosterCoords (12, 'Y', 1) := 150
		moviePosterCoords (12, 'X', 2) := 860
		moviePosterCoords (12, 'Y', 2) := 476
		prevset := 4
		Font.Draw ("Phase 2", 10, 20, PhaseFont, black)
	    label 5 :
		Pic.Draw (CaptainAmerica3Poster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (DoctorStrangePoster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (GuardiansoftheGalaxy2Poster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (13, 'X', 1) := 140
		moviePosterCoords (13, 'Y', 1) := 150
		moviePosterCoords (13, 'X', 2) := 360
		moviePosterCoords (13, 'Y', 2) := 476
		moviePosterCoords (14, 'X', 1) := 390
		moviePosterCoords (14, 'Y', 1) := 150
		moviePosterCoords (14, 'X', 2) := 610
		moviePosterCoords (14, 'Y', 2) := 476
		moviePosterCoords (15, 'X', 1) := 640
		moviePosterCoords (15, 'Y', 1) := 150
		moviePosterCoords (15, 'X', 2) := 860
		moviePosterCoords (15, 'Y', 2) := 476
		prevset := 5
		Font.Draw ("Phase 3", 10, 20, PhaseFont, black)
	    label 6 :
		Pic.Draw (SpiderManPoster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (Thor3Poster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (BlackPantherPoster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (16, 'X', 1) := 140
		moviePosterCoords (16, 'Y', 1) := 150
		moviePosterCoords (16, 'X', 2) := 360
		moviePosterCoords (16, 'Y', 2) := 476
		moviePosterCoords (17, 'X', 1) := 390
		moviePosterCoords (17, 'Y', 1) := 150
		moviePosterCoords (17, 'X', 2) := 610
		moviePosterCoords (17, 'Y', 2) := 476
		moviePosterCoords (18, 'X', 1) := 640
		moviePosterCoords (18, 'Y', 1) := 150
		moviePosterCoords (18, 'X', 2) := 860
		moviePosterCoords (18, 'Y', 2) := 476
		prevset := 6
		Font.Draw ("Phase 3", 10, 20, PhaseFont, black)
	    label 7 :
		Pic.Draw (Avengers3Poster, locatorX (IronMan), locatorY (IronMan), picMerge)
		Pic.Draw (AntMan2Poster, locatorX (TheIncredibleHulk), locatorY (TheIncredibleHulk), picMerge)
		Pic.Draw (CaptainMarvelPoster, locatorX (IronMan2), locatorY (IronMan2), picMerge)
		moviePosterCoords (19, 'X', 1) := 140
		moviePosterCoords (19, 'Y', 1) := 150
		moviePosterCoords (19, 'X', 2) := 360
		moviePosterCoords (19, 'Y', 2) := 476
		moviePosterCoords (20, 'X', 1) := 390
		moviePosterCoords (20, 'Y', 1) := 150
		moviePosterCoords (20, 'X', 2) := 610
		moviePosterCoords (20, 'Y', 2) := 476
		moviePosterCoords (21, 'X', 1) := 640
		moviePosterCoords (21, 'Y', 1) := 150
		moviePosterCoords (21, 'X', 2) := 860
		moviePosterCoords (21, 'Y', 2) := 476
		prevset := 7
		Font.Draw ("Phase 3", 10, 20, PhaseFont, black)
	    label 8 :
		Pic.Draw (Avengers4Poster, locatorX (IronMan), locatorY (IronMan), picMerge)
		moviePosterCoords (22, 'X', 1) := 140
		moviePosterCoords (22, 'Y', 1) := 390
		moviePosterCoords (22, 'X', 2) := 360
		moviePosterCoords (22, 'Y', 2) := 476
		prevset := 8
		Font.Draw ("Phase 3", 10, 20, PhaseFont, black)
	end case
	exit when x >= maxx - 194 and x <= maxx and y >= maxy - 23 and y <= maxy and button = 1
	MovieDetector
    end loop
end MovieSelection


% AOE button effect on the quick selection menu
procedure QuickSelectionAOE
    loop
	defaultMousewhere
	if x >= maxx - 194 and x <= maxx and y >= maxy - 23 and y <= maxy and button = 1 then
	    switch (2) := true
	    exit
	elsif switch (5) then
	    exit
	end if
	if x >= 125 and x <= 455 and button = 1 then
	    if y >= maxy - 80 and y <= maxy - 50 then
		IronManContents
		switch (5) := true
	    elsif y >= maxy - 130 and y <= maxy - 100 then
		TheIncredibleHulkContents
		switch (5) := true
	    elsif y >= maxy - 180 and y <= maxy - 150 then
		IronMan2Contents
		switch (5) := true
	    elsif y >= maxy - 230 and y <= maxy - 200 then
		ThorContents
		switch (5) := true
	    elsif y >= maxy - 280 and y <= maxy - 250 then
		CaptainAmerica1Contents
		switch (5) := true
	    elsif y >= maxy - 330 and y <= maxy - 300 then
		AvengersContents
		switch (5) := true
	    elsif y >= maxy - 380 and y <= maxy - 350 then
		IronMan3Contents
		switch (5) := true
	    elsif y >= maxy - 430 and y <= maxy - 400 then
		Thor2Contents
		switch (5) := true
	    elsif y >= maxy - 480 and y <= maxy - 450 then
		CaptainAmerica2Contents
		switch (5) := true
	    elsif y >= maxy - 530 and y <= maxy - 500 then
		GuardiansoftheGalaxyContents
		switch (5) := true
	    elsif y >= maxy - 580 and y <= maxy - 550 then
		Avengers2Contents
		switch (5) := true
	    end if
	elsif x >= 550 and x <= 878 and button = 1 then
	    if y >= maxy - 80 and y <= maxy - 50 then
		AntManContents
		switch (5) := true
	    elsif y >= maxy - 130 and y <= maxy - 100 then
		CaptainAmerica3Contents
		switch (5) := true
	    elsif y >= maxy - 180 and y <= maxy - 150 then
		DoctorStrangeContents
		switch (5) := true
	    elsif y >= maxy - 230 and y <= maxy - 200 then
		GuardiansoftheGalaxy2Contents
		switch (5) := true
	    elsif y >= maxy - 280 and y <= maxy - 250 then
		SpiderManContents
		switch (5) := true
	    elsif y >= maxy - 330 and y <= maxy - 300 then
		Thor3Contents
		switch (5) := true
	    elsif y >= maxy - 380 and y <= maxy - 350 then
		BlackPantherContents
		switch (5) := true
	    elsif y >= maxy - 430 and y <= maxy - 400 then
		Avengers3Contents
		switch (5) := true
	    elsif y >= maxy - 480 and y <= maxy - 450 then
		AntManandtheWaspContents
		switch (5) := true
	    elsif y >= maxy - 530 and y <= maxy - 500 then
		CaptainMarvelContents
		switch (5) := true
	    elsif y >= maxy - 580 and y <= maxy - 550 then
		Avengers4Contents
		switch (5) := true
	    end if
	end if
    end loop
    switch (5) := false
end QuickSelectionAOE


% Quick Selection GUI
procedure QuickSelection
    cls
    loop
	Font.Draw ("Movie Quick Selection", maxx div 2 - 170, maxy - 30, QuickSelectionTitleFont, Black)
	for deduction : 1 .. 11
	    drawfillbox (125, maxy - 30 - deduction * 50, 455, maxy - deduction * 50, black)
	    drawfillbox (127, maxy - 28 - deduction * 50, 453, maxy - deduction * 50 - 2, 55 + deduction)
	    drawfillbox (550, maxy - 30 - deduction * 50, 878, maxy - deduction * 50, black)
	    drawfillbox (552, maxy - 28 - deduction * 50, 876, maxy - deduction * 50 - 2, 66 + deduction)
	end for
	backToMainMenuButton
	Font.Draw ("Iron Man", 135, maxy - 73, QuickSelectionTextFont, Black)
	Font.Draw ("The Incredible Hulk", 135, maxy - 123, QuickSelectionTextFont, Black)
	Font.Draw ("Iron Man 2", 135, maxy - 173, QuickSelectionTextFont, Black)
	Font.Draw ("Thor", 135, maxy - 223, QuickSelectionTextFont, Black)
	Font.Draw ("Captain America: The First Avenger", 135, maxy - 273, QuickSelectionTextFont, Black)
	Font.Draw ("The Avengers", 135, maxy - 323, QuickSelectionTextFont, Black)
	Font.Draw ("Iron Man 3", 135, maxy - 373, QuickSelectionTextFont, Black)
	Font.Draw ("Thor: The Dark World", 135, maxy - 423, QuickSelectionTextFont, Black)
	Font.Draw ("Captain America: The Winter Soldier", 135, maxy - 473, QuickSelectionTextFont, Black)
	Font.Draw ("Guardians of the Galaxy Vol 1", 135, maxy - 523, QuickSelectionTextFont, Black)
	Font.Draw ("Avengers: Age of Ultron", 135, maxy - 573, QuickSelectionTextFont, Black)

	Font.Draw ("Ant Man", 560, maxy - 73, QuickSelectionTextFont, Black)
	Font.Draw ("Captain America: Civil War", 560, maxy - 123, QuickSelectionTextFont, Black)
	Font.Draw ("Doctor Strange", 560, maxy - 173, QuickSelectionTextFont, Black)
	Font.Draw ("Guardians of the Galaxy Vol 2", 560, maxy - 223, QuickSelectionTextFont, Black)
	Font.Draw ("Spiderman: Homecoming", 560, maxy - 273, QuickSelectionTextFont, Black)
	Font.Draw ("Thor: Ragnarok", 560, maxy - 323, QuickSelectionTextFont, Black)
	Font.Draw ("Black Panther", 560, maxy - 373, QuickSelectionTextFont, Black)
	Font.Draw ("Avengers: Infinity War", 560, maxy - 423, QuickSelectionTextFont, Black)
	Font.Draw ("Ant Man and the Wasp", 560, maxy - 473, QuickSelectionTextFont, Black)
	Font.Draw ("Captain Marvel", 560, maxy - 523, QuickSelectionTextFont, Black)
	Font.Draw ("Avengers: Endgame", 560, maxy - 573, QuickSelectionTextFont, Black)
	QuickSelectionAOE
	exit when switch (2)
    end loop
end QuickSelection


% The AOE effect for the title screen into the movie selection or quick selection
procedure titleCoordinates
    loop
	StartingScreen
	loop
	    defaultMousewhere
	    exit when (x >= 198 and x <= 502 and y >= maxy div 2 - 52 and y <= maxy div 2 + 102 and button = 1) or (x >= 548 and x <= 852 and y >= maxy div 2 - 52 and y <= maxy div 2 +
		102 and
		button
		= 1)
	end loop
	if x >= 198 and x <= 502 and y >= maxy div 2 - 52 and y <= maxy div 2 + 102 and button = 1 then
	    MovieSelection
	    movieset := 1
	elsif x >= 548 and x <= 852 and y >= maxy div 2 - 52 and y <= maxy div 2 + 102 and button = 1 then
	    QuickSelection
	    switch (2) := false
	end if
    end loop
end titleCoordinates


% Main Program
setFalse
titleCoordinates

