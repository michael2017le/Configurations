
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty (){
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
source ~/.aliases
echo "  ____  _            _      ____       _     _     _ _   "
echo " | __ )| | __ _  ___| | __ |  _ \ __ _| |__ | |__ (_) |_ " 
echo " | |_) | | (_| | (__|   <  |  _ < (_| | |_) | |_) | | |_ "
echo " |____/|_|\__,_|\___|_|\_\ |_| \_\__,_|_.__/|_.__/|_|\__|"
echo "                                                         "

echo "                                                                                "
echo "                    777777                                                      "
echo "                  77IIIII7        77777                                         "
echo "                 77IIII7II      77IIII7                                         "
echo "                777I7III777   77IIIIII7                                         "
echo "                77I777II777  7IIIIIIII7                                         "
echo "                777I77777777IIIIIIIIII7                                         "
echo "                77I77777777IIIIIIIIII7                                          "
echo "                777II777III?IIIIIIIII7                                          "
echo "               7777I77IIIIIII?II?III7                                           "
echo "             77777777IIII?II???IIIII7                                           "
echo "          777777777IIIIIII?II?IIIII7                                            "
echo "        7777I7IIIIIIIIIIIIIIIIIII77                                             "
echo "        77IIIIIIIIIIIIIIIIIIIIII77                                              "
echo "       77IIIIIIIIIIIIIIIIIIIIIII77                                              "
echo "      77IIIIIIIII???I?I?IIIIIIII7777                                            "
echo "      7IIIIIIIII~..~?I???IIIIIIII77777                                          "
echo "    777IIIIIII?+~,,~IIIIIIIIIIIII7777777777777777777777                         "
echo "    77IIIIIIIIII?IIIIIIIIIIIIIIIIII77777777777777777777777                      "
echo "  7777II??IIIIIIIIIIIIIIIIIIIIIIIIII777777777I77IIIIII7777777                   "
echo "  777I????I?IIIIIIIIIIIIIIIIIIIIIIIII77777777777IIIIIIIIII7777                  "
echo "  77II??????I??IIIIIIIIIIIIIIIIIIIIIII777777IIIIIIIIIIIIIIII7777                "
echo "  77I++:??????I?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII7777              "
echo "  77I?=????I?I???IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII777             "
echo "   77IIII??IIII??I?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII777            "
echo "      777IIIIIII??I?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII777           "
echo "      777IIII??????IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77          "
echo "      777IIIIII??IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII777         "
echo "     7777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77        "
echo "     77777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77       "
echo "      7777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII7       "
echo "      77777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77      "
echo "        7777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77     "
echo "         777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII7     "
echo "          7777IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77    "
echo "           777IIIIIIIIIIIIIIIIIIIIIIII?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77    "
echo "            7777IIIIIIIIIIIIIIIIIIIIII?I?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77    "
echo "              777IIIIIIIIIIIII?IIIIIII??IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77   "
echo "                 777IIIIIIIIIII?I??II???IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77   "
echo "                  7777IIIIIIIIII???I????IIIIIIIIIII?IIIIIIIIIIIIIIIIIIIIIII77   "
echo "                    77777IIII??????????II?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII77   "
echo "                       77III????????++???I??III?I?IIIIIIIIIIIIIIIIIIIIIIIIII77  "
echo "                        77III?????????????????III?IIIIIIIIIIIIIIIIIIIIIIIIII77  "
echo "                         77II????++7II????????II??IIIIIIIIIIIIIIIIIIIIIIIIII77  "
export PS1="\[\e[36m\]\u\[\e[m\]:\[\e[35m\]\W\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\]\\$ "
#export PS1="\u:\W"
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PATH="/usr/lib/google-cloud-sdk/bin:$PATH"

export GOOGLE_APPLICATION_CREDENTIALS="/Users/qwerty/Downloads/HackUTD-6884ffc47e8d.json"

export PATH="$PATH:/opt/yarn-1.3.2/bin"
export PATH=/Users/qwerty/Library/Python/3.6/bin/:$PATH
export ANDROID_HOME=/Users/qwerty/Library/Android/sdk/
export JAVA_HOME=/Library/Java/Home
export PATH=$PATH:/Users/qwerty/Library/Android/sdk/emulators
export PATH=$PATH:/Users/qwerty/Library/Android/sdk/tools
export PATH=$PATH:/Users/qwerty/Library/Android/sdk/platform-tools
export PATH=/usr/local/share/python:$PATH
HISTFILESIZE=10000000
export PATH=~/.npm-global/bin:$PATH
export GMAIL_SMTP_USER=sharka99@gmail.com
export GMAIL_SMTP_PASSWORD=5tlR1SKt3Ac9j*Ap

eval $(thefuck --alias)
