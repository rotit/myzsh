
#########################################zsh
plugins=(
  git
  z
  zsh-history-substring-search

  zsh-syntax-highlighting
  #zsh-autosuggestions
  #incr
)

#autojump
#[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u

#autosuggestions
#[[ -s ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#########################################end



#########################################start
function fa()
{
	cnt=$1
	dir=$2
    local cmd
   other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name  '*.h' \) -print0 | xargs -0 grep --color -n  -C0 -i "$cnt" $3 

}

function ra()
{
    local cmd
	dir=$1
	echo "==============> FIND [a] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name  '*.h' \)  >> files
}

function sc()
{
	cnt=$1
	dir=$2
    local cmd
    	other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' \) -print0 | xargs -0 egrep -i --color -n  -C0 $3 "$cnt"  
}

function fcc()
{
	cnt=$1
	dir=$2
    local cmd
    	other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.cpp' -o -name '*.c' \) -print0 | xargs -0 egrep -i --color -n  -C0 $3 "$cnt"  
}

function cf()
{
	local cmd
	echo "==============> FIND"
	#cat files |grep "$2" | xargs grep "$1" --color -i -n -C0 "$3"
	cat files | xargs grep "$1" --color -i -n -C0 "$2"
}

function fz()
{
	cnt=$1
	opt=$2
	dir=$3
    local cmd
    	other=$4
	echo "==============> FIND [$cnt] in dir: [$dir] <================="
	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*'$opt'' \) -print0 | xargs -0 egrep --color -n  -C0 "$cnt" $4 
}

function fb()
{
	cnt=$1
	dir=$2
    local cmd
    	other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.bb*' \) -print0 | xargs -0 egrep --color -n  -C0 "$cnt" $3 
}


function ff()
{
	cnt=$1
	dir=$2
    local cmd
    	other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*' \) -print0 | xargs -0 egrep --color -n  -C0 "$cnt" $3 
}

function ft()
{
	cnt=$1
	dir=$2
    local cmd
    	other=$3
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.txt' \) -print0 | xargs -0 egrep --color -n  -C0 "$cnt" $3 
}

function fh()
{
	cnt=$1
	dir=$2
	
    local cmd
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.h' \) -print0 | xargs -0 grep --color -i -n -C0  "$cnt" $3
}

function fe()
{
	cnt=$1
	dir=$2
	
    local cmd
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*' \) -print0 | xargs -0 grep --color -n -C0  "$cnt" $3
}

function fs()
{
	cnt=$1
	dir=$2
	
    local cmd
	echo "==============> FIND [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o -type f \( -name '*.dts' -o -name '*.dtsi' \) -print0 | xargs -0 grep -i --color -n -C0 "$cnt" $3
}

function fj()
{
	cnt=$1
	dir=$2

	echo "======== FIND [$cnt] in dir: [$dir] ================="
    find $dir -name .repo -prune -o -name .git -prune -o  -type f -name "*\.java" -print0 | xargs -0 grep --color -n "$cnt"
}

function fm()
{
	cnt=$1
	dir=$2
	other=$3
	echo "===============> find [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o  -type f \( -name "*\.mk" -o -name "[Mm]akefile" -o -name "*config" -o -name "Kconfig.*"  -o -name "*mk" -o -name "*rc" -o -name "*mak*" -o -name "*conf" -o -name "*cmake" -o -name "*in" \)  -print0 | xargs -0 grep --color -n "$cnt" $3
}

function fk()
{
	cnt=$1
	dir=$2
	other=$3
	echo "===============> find [$cnt] in dir: [$dir] <================="

	find $dir -name .repo -prune -o -name .git -prune -o  -type f \( -name "*[Kk]config*" \)  -print0 | xargs -0 grep --color -n "$cnt" $3
}


function resgrep()
{
    for dir in `find . -name .repo -prune -o -name .git -prune -o -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 grep --color -n "$@"; done;
}


function f()
{
	echo "===============> find [$1] in dir: [$2] <================="
	find "$2" -name "$1";
}

function fd()
{
	echo "===============> find [$1] in dir: [$2] <================="
	find $2 -name $1 -type d
}

#########################################end

##########################################
function py()
{
	sed  -ne '1p' $1 | sed  -e 's/.*:= \(.*\)/\1/g' | cut -d ' ' -f 3- | sed -ne 's/ *\(.*\)/\1/gp' |awk '{ for(i=1;i<=NF;i++) { if($(i+1)~"^-") ORS="\n";else ORS=" "; print $i }} END {print "\n"}'  |sed '/--sysroot/,+7d' | sed "s/.*/\'&\',/g"

}
##########################################


##########################################
export PATH=$PATH:~/gongju/clang_llvm-8.0.0/bin/
##########################################

#########################################git
git config --global alias.st status
git config --global alias.l "log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)' --abbrev-commit"
#########################################end

#########################################others
[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker
#########################################end


