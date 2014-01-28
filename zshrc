# Fichier $HOME/.zshrc (un des fichiers d'init du Z-shell(/bin/zsh)).
#  d.zshrc: version par defaut
# 12/12/2005 - W 

# decommenter la ou les ligne(s) suivante(s) pour deboguer:
# echo "Debut d'execution du fichier .zshrc"
# setopt verbose xtrace ; 

umask 077	# definition du masque pour les droits d'acces de nouveaux fichiers

# Mise en place de quelques variables du zsh (et variables d'environnement).
	HISTSIZE=1000	# nbre de commandes pour l'historique
	SAVEHIST=1000	
	HISTFILE=~/.history			# chem du fich d'histo

	PS1="%B%n@%m (%h)%#%b "		# prompts
	RPS1="%B%~ [%*]%b"	
	cdpath=($HOME /usr/local /usr )		# liste de chemins pour
										# ... la commande cd
#	export CXXFLAGS='-W -Wall -Werror -O2' # options de compile pour make si abscence de Makefile 
	export LANG='fr_FR.UTF-8'			# charset par defaut sur la session zsh (a valider)
	
	
	unsetopt ignoreeof			# EOF (^D) autoris'e

export EDITOR="/usr/bin/vim"
	
# configuration permettant d'inserer maven dans le PATH
export M2_HOME="/tools/maven"
# configuration permettant le fonctionnement de gradle, variable utilisee dans le PATH
export GRADLE_HOME="/tools/gradle"
export IDEA_HOME="/tools/idea"
export SOAPUI_HOME="/tools/soapui"
export NETBEANS_HOME="/tools/netbeans"
export PATH="$PATH:$M2_HOME/bin:/tools/android-sdk/tools:/tools/android-sdk/platform-tools:$GRADLE_HOME/bin:$IDEA_HOME/bin:$SOAPUI_HOME/bin:$NETBEANS_HOME/bin"

	if [ -z $cfe ]
	then 	export PATH="$PATH:/usr/local/bin:./"
			export cfe='oui'
	fi


	# Quelques alias:  
	alias	ao='a.out'
	alias	delete='/script/poubelle.sh'
	alias	h='history -d'
	alias	jb='jobs'
	alias	jbl='jobs -l'
	alias	ls='/bin/ls '  #-CF --color=auto'		# list 
	alias	ll='/bin/ls -lF --color=auto'		# list (long)
	alias   l='/bin/ls -al '  #'--color=auto'		# list (long & caché)
	function llr()
	  {/bin/ls -lFaR --color=always $*|pg -R;}	# list (long & recursif)
	function lfr()
	  {/bin/ls -lFaR --full-time --color=always $*|pg -R;}	# list (long,full & recursif)

	alias	lpr='/usr/bin/lpr -p'	# impression
	alias	lp2='/usr/bin/a2ps'	# impression 2 pages sur une
	alias	lpp='/usr/bin/a2ps -1rl120' #impression paysage 120 car
	function mlp() {man $* |/usr/bin/a2ps;} # impression du manuel
	alias	m="$PAGER"
	alias	pg='/usr/bin/less -c'
	alias   rm='/bin/rm -i'
	alias	psu='ps -u $LOGNAME'
	alias	psuf='ps -f -u $LOGNAME'
	alias   sshi='ssh lmarchau@ssh.insia.org'
				#   Pour l'imprimante
	alias	qu='lpq'	# examine la queue (file d'attente)				
	alias	st='/usr/bin/lpstat -o'  # examine etat des imprimantes
	alias	stp='/usr/bin/lpstat -p' # quelles imprimantes ?
	alias	ca='lprm'	# annule impression
	
		# cherche localisation d'une commande
	function wh() {	which $* ; 
			echo ------------------------------- ;
			whereis $*;
			echo ------------------------------- ;
			whence $*;
		      }
	alias	whi='which'
	alias	whe='whereis'
	alias   whn='whence'
	alias	loc="locate"
	alias 	xv='xv -vsp -vsm -dir ~/images'
	if [[ -r ~/.aliaszsh ]] ; then
		source ~/.aliaszsh
	fi

source ~/.zprofile

