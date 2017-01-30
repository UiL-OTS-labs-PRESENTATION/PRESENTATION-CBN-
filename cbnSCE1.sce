# This file is made/ adapted by Esther Meeuwissen. For questions esther.meeuwissen@fcdonders.ru.nl
# may2012 This file is adapted by Marijn Struiksma. For questions m.struiksma@uu.nl

pcl_file = "cbnPCL1.pcl"; 					# pcl file name geven
scenario = "cbnSCE1.sce"; 						# for log-file
default_font_size = 35;                      # size of the letters
#default_font_size = 45;                      # size of the letters
default_background_color = 0, 0, 0;    		# use black
default_text_color = 150, 150, 150;          # use light grey as default
#screen_height = 768;                        # display settings
#screen_width = 1024;                        # display settings
#screen_bit_depth = 8;  							# display settings
pulse_width = 100;									# determines the length of time that the codes remain on the port
write_codes = true; 								# presentation will write user defined codes to the output port when an event occurs
active_buttons = 1;									# 1 button active
button_codes = 253;						
response_port_output = true; 					# no output at response events (in the pcl file teporarily restored, to avoid unwanted responses)
response_matching=simple_matching;
 
begin;													# start scenario

picture {} default; 									# default picture of emtpy screen

picture {text { caption = " "; } text1;	   # picture with text as in 'text1'
         x = 0; y = 0;} pict1;
picture {text { caption = "  ";}; 			   # picture with blank screen
			x = 0; y = 0;} pict2;
			
picture {text { caption = "*";};					# picture with fixation cross
			x = 0; y = 0;} fix1;		

nothing { default_code = "space"; } stim; 	# empty stimulus
		
######################################### default-trial

trial {   												# trial define
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# define 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} event; 										# het stimulus event heet event
} trial1;  		

trial {   												# trial define
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# define 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} eventcode; 										# het stimulus event heet event
} trial2;  

####################################### start-screen that precedes the practice-session
trial {													# trial define
	trial_type = specific_response;
	terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Dit experiment bestaat uit 2 taken
die elkaar afwisselen. 
In totaal zijn er 18 blokjes van elke taak met
na elk blokje een korte pauze.
Tussendoor zit er 2 keer een langere pauze.

Druk nu met je wijsvinger op de blauwe knop
om door te gaan met de instructie.";											# met de text 'oefensessie'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} start1; 												# deze trial heet oefen
 	

trial {													# trial define
	trial_type = specific_response;
	terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "In het volgende scherm komt jouw naam te staan.
Als dit NIET jouw naam is, waarschuw dan de proefleider.
Als dit wel jouw naam is, druk dan op de blauwe knop om verder te gaan.

Druk nu op de blauwe knop om jouw naam te zien.";											# met de text 'oefensessie'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} ask_name; 												# deze trial heet oefen

trial {													# trial define
	trial_type = specific_response;
	terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "naam";}name; 																# met de text 'naam'
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} check_name; 												# deze trial heet oefen


trial {													# trial define
	trial_type = specific_response;
	terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "In taak 1 zijn er 3 mannen van wie je uitspraken te lezen zal krijgen, 
zij heten Bram, Daan en Paul. 
Lees hun uitspraken aandachtig.
De uitspraken gaan over jou of over een andere vrouw. 
Die andere vrouw is net als jij een studente in Utrecht
en proefpersoon in dit experiment.

Na elke uitspraak volgt een fixatiekruisje: *
Als je dit ziet kun je evt. even knipperen.

Druk op de blauwe knop om verder te gaan."; 											# met de text 'oefensessie'
		font_size = 35;};
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen; 												# deze trial heet oefen

trial {													# trial define
	trial_type = specific_response;
	terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Je mag nu eerst een paar keer oefenen. 
In de oefensessie gaan de uitspraken over Sanne.

N.B. Sommige uitspraken zijn beledigend, 
als je het erg onprettig vindt om deze beledigingen te lezen, 
dan kun je altijd besluiten om te stoppen.

Start de oefensessie door op de 
blauwe knop te drukken. Succes!"; 											# met de text 'oefensessie'
		font_size = 35;};
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "start_oefen1";										# in het middel van het scherm															
	response_active = true;  						# responsen komen door
} oefen1; 												# deze trial heet oefen

trial {													# trial define
	trial_duration=forever;	
	trial_type = specific_response;				# eerste response eindigt de trial				
	terminator_button=1;
	picture { 											# object is een picture
		text { caption = "Einde van de oefensessie van taak 1.

Dit is een korte uitleg voor de 2e taak.
Je krijgt steeds korte piepjes te horen. 
Jouw taak is om telkens als je een hoge piep hoort
op de blauwe knop te drukken. 
Doe dit zo snel en zo goed mogelijk.

Nu volgt een korte oefensessie voor taak 2.
Start de oefening door met je wijsvinger 
op de blauwe knop te drukken. Succes!"; 	# met de text 'einde van de oefensessie'
		font_size = 35;};
		x = 0; y = 0;};
	code = "start_oefen2";										# in het middel van het scherm															
	response_active = true; 					   # responsen mogen nu doorkomen
} oefenodd1;											# deze trial heel eindeoefen

trial {													# trial define
	trial_duration=forever;	
	trial_type = specific_response;				# eerste response eindigt de trial				
	terminator_button=1;
	picture { 											# object is een picture
		text { caption = "Einde van de oefensessie.

De proefleider komt zo even binnen.
Als je nog vragen hebt, dan kun je die nu
aan de proefleider stellen.

Start het experiment door op de 
blauwe knop te drukken.
Succes!"; 	# met de text 'einde van de oefensessie'
		font_size = 35;};
		x = 0; y = 0;};
	code = "start_experiment";										# in het middel van het scherm															
	response_active = true; 					   # responsen mogen nu doorkomen
} eindeoefen;											# deze trial heel eindeoefen

############################## oddball-fixatie


trial {													# trial define
	picture { 
	background_color = 50,50,255;
	bitmap { filename = "soundicon_small.jpg"; } oddicon; #with an icon of a speaker
		x = 0; y = 0;};
	code = "oddfix";
	port_code = 211;
	response_active = true;  							# in het midden van het scherm
} oddfix;  													# de trial heet fix

############################## fixatie
 trial {													# trial define
	trial_duration = 1000; 							# trial duur 1000 ms
	picture { text { caption = "*";}; 			# met de text '*'
		x = 0; y = 0;};
	code = "fix";
response_active = true;  							# in het midden van het scherm
} fix;  													# de trial heet fix

################################# end-screen
trial {													# trial define
	trial_duration = 5000;                 # trial duur oneindig  
	picture { text { caption = "Einde van de taak";}; # picture met de text 'einde van het experiment'
		x = 0; y = 0;};								# in het midden van het scherm															# de correcte response is button 1
} einde;  												# de trial heet einde

################################# blank-screen
trial {													# trial define
		trial_duration = 1000; 						# trial duur 1000 ms
		picture { 										# het object is een picture
		text { caption = " ";}; 					# met een blanco scherm
		x = 0; y = 0;};
response_active = false;    						# in het midden van het scherm
} blank;  												# de trial heet blank


################################# blank-kort-screen
trial {													# trial define
		trial_duration = 350; 						# trial duur 350 ms
		picture { 										# het object is een picture
		text { caption = " ";}; 					# met een blanco scherm
		x = 0; y = 0;};
response_active = true;    						# in het midden van het scherm
} blankkort;  		

#####################################  hoofdtaak
trial {													# trial define
	trial_type = specific_response;
   terminator_button=1;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Nu komt taak 1:

Lees de woorden aandachtig.

Druk op de blauwe knop
als je klaar bent om te beginnen.";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "schelden";
	response_active = true;  						# responsen komen door
} scheldbegin;

#####################################  beep-sound
wavefile { filename = "beep.wav"; } beepwav; # filenaam van de wavfile geven en deze wavfile beepwav noemen								
wavefile { filename = "2000hz.wav"; } beepH; # filenaam van de wavfile geven en deze wavfile beepwav noemen								
wavefile { filename = "2000hz.wav"; } beepL; # filenaam van de wavfile geven en deze wavfile beepwav noemen								

trial {													# trial define
   sound { wavefile beepwav; } sound1;			# geluid van wavfile beepwav is sound1
	code = "beep";
} beep; 													# de trial heet beep

trial {											# 
	trial_type = fixed;
	trial_duration = 450;
   sound { wavefile beepL; };
   time = 0;
	code = "beepLow";
	response_active=true;
}beeplow; 

trial {											# 
	trial_type = fixed;
	trial_duration = 450;
   sound { wavefile beepH; };
   time = 0;
	code = "beepHigh";
	target_button = 1;
	response_active=true;
}beephigh; 

################# beep en fix samen

trial {											# 
	trial_type = first_response;
	trial_duration = 1000;
   picture fix1;
   time = 0;
   sound { wavefile beepwav; };
   time = 0;
	code = "fixbeep";
}fixbeep; 

########################################
#################################### pauzes
trial {													# trial define
	trial_duration=4000;
	trial_type=fixed;
	picture { 											# het object is een picture
		text { caption = "Pauze";
		font_color = 255,90,255;}; 								# met de text 'druk op de knop om verder te gaan'
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "pauze";
	response_active = true;  						# responsen komen door
} breaks; 

trial {													# trial define
	trial_duration=20000;
	trial_type=fixed;
	picture { 											# het object is een picture
		text { caption = "Dit is een langere pauze.";
		font_color = 245,170,245;}; 								# met de text 'druk op de knop om verder te gaan'
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "pauzelang1";
	response_active = true;  						# responsen komen door
} breakslong1; 


trial {													# trial define
	trial_type = specific_response;
   terminator_button=1;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Ga nu weer klaar zitten voor het volgende deel.

Druk op de blauwe knop als je klaar bent
om verder te gaan.";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "endpauselang";
	response_active = true;  						# responsen komen door
} endpauselong; 

trial {													# trial define
	trial_type = specific_response;
   terminator_button=1;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Druk op de blauwe knop
als je klaar bent om verder te gaan.";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "endpause";
	response_active = true;  						# responsen komen door
} endpause; 

########################################
#################################### oddball

trial {													# trial define
	trial_type = specific_response;
   terminator_button=1;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Nu komt taak 2:

Luister naar de tonen. 
Zodra je de hoge toon hoort druk je op de blauwe knop.

Druk op de blauwe knop
als je klaar bent om te beginnen.";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "oddball";
	response_active = true;  						# responsen komen door
} oddbegin;

trial {													# trial define
	nothing {};    # Always use this code for out1...
	code = "oddbegin";
} oddstart;

trial {													# trial define
	nothing {};    # Always use this code for out1...
	code = "oddend";
} oddend;



########################################
#################################### aankondiging sprekers

trial{
	trial_duration=1000;
	trial_type=fixed;
	picture {text { caption = "Als eerste is Peter aan het woord...";
			font_size = 50;
			font_color = 255,255,0;};
			x = 0; y = 0;} paul1e;	
	code = "peterstart";
	port_code = 211;
	response_active=false;
} eerstename;


array {
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {
		text { caption = "Nu is Peter aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} paul;	
	code = "peter1";
	port_code = 211;
	response_active=false;
} name1;
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {
		text { caption = "Nu is Bert aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} bram;		
	code = "bert1";
	port_code = 212;
	response_active=false;
} name2;
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {
		text { caption = "Nu is David aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} daan;		
	code = "david1";
	port_code = 213;
	response_active=false;
} name3;
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {text { caption = "Nu is David aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} daanS;	
	code = "david3";
	port_code = 233;
	response_active=false;
} name4;
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {text { caption = "Nu is Bert aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} bramS;		
	code = "bert3";
	port_code = 232;
	response_active=false;
} name5;
trial{
	trial_duration=2000;
	trial_type=fixed;
	picture {text { caption = "Nu is Peter aan het woord...";
		font_size = 50;
		font_color = 255,255,0;};
		x = 0; y = 0;} paulS;		
	code = "peter3";
	port_code = 231;
	response_active=false;
} name6;
}names;

