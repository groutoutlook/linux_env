# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# "robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

 # Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#as-an-oh-my-zsh-custom-plugin
# git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
plugins=(
zsh-vi-mode
aliases 
fzf 
)
 # Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# My Display export.
export DISPLAY=:0
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls='clear'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#FZF config
export FZF_BASE="/data/data/com.termux/files/usr/bin/fzf";
DISABLE_FZF_AUTO_COMPLETION="false";
DISABLE_FZF_KEY_BINDINGS="false";
export FZF_DEFAULT_COMMAND='fd';

# INFO: PATH export.
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
PATH="$PATH:$HOME/.config/emacs/bin"

cd-(){
  for i in {1..$1}
  do
    cd -
  done
}
cd..(){
  for i in {1..$1}
  do
    ..
  done
}
alias :Q=":q"
alias qqq=":q"
:q(){
 exit
}

alias :A=":a"
alias :az=":a zsh"
:a(){
local linux_env_dir="$HOME/linux_env"
if [ $# -lt 1 ]; then
  reloadProfile
elif [ $1 = "zsh" ]; then 
  echo "linux_env_dir"
  git -C $linux_env_dir pull -f 
  reloadProfile
fi
}
alias :v="nvimhere"
alias :V="nvimhere"
alias :vl="nvimhere last"
alias :vs="nvimhere ls"
nvimhere(){
  if [ $# -lt 1 ]; then
    nvim .
  elif [ $1 = "last" ]; then
    nvim -c "lua require('resession').load 'Last Session'"
  elif [ $1 = "ls" ]; then
    nvim -c "lua require('resession').load()"
  fi
}
#reload Profile
alias repro="reloadProfile"
reloadProfile(){

  local nvim_dir="$HOME/.config/nvim"
  cp ~/linux_env/.zshrc ~/.zshrc && source ~/.zshrc && echo "success reloadProfile."
  cp ~/dotfiles/.gitconfig ~ && echo ".gitconfig reload"
  echo nvim_dir
  git -C $nvim_dir pull 
}

alias obs="os:"
alias o="os:"
os:(){
  local query="" 
	for arg in "$@"
	do
		query="${query}${arg}%20"
	done
 xdg-open "obsidian://omnisearch?query=${query}"
}
osj(){
  xdg-open "obsidian://omnisearch?Journal"
}
alias gg="gos"
gos(){
	origin_query="https://www.google.com/search?q="
	query=$origin_query
	for arg in "$@"
	do
		query=$query+$arg
	done
	xdg-open $query #need w3m.
}
nvimconf(){
  nvim /data/data/com.termux/files/home/.config/nvim/
}

cst(){
  if [ $1 -ne 0 ];
  then
  xdg-open https://codestats.net/users/groutlloyd
  
  else
  curl https://codestats.net/api/users/groutlloyd
  fi
}
alias j="jnl"
alias J="jnl"
export andstorage="/storage/emulated/0"
export jrnlpath="${andstorage}/Note/MainJournal.md"
export defaultVault="${andstorage}/Note"

jnl(){
typeset -A jrnlTable
jrnlTable=(
  [1688]="${defaultVault}/1_Markdown/note_Items/1688Journal.md"
  [taobao]="${defaultVault}/1_Markdown/note_Items/TaobaoJournal.md"
  [asset]="${defaultVault}/1_Markdown/note_Items/AssetJournal.md"
  [place]="${defaultVault}/1_Markdown/note_Knowledge/note_Places/PlacesJournal.md"
  [work]="${defaultVault}/1_Markdown/note_Business/WorkJournal.md"
  [lang]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/LangJournal.md"
  [prog]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/ProgrammingJournal.md"
  [comp]="${defaultVault}/1_Markdown/note_Embedded/ComponentJournal.md"
  [kicad]="${defaultVault}/1_Markdown/note_Embedded/note_EDA/EDAJournal.md"
  [eda]="${defaultVault}/1_Markdown/note_Embedded/note_EDA/EDAJournal.md"
  [hw]="${defaultVault}/1_Markdown/note_Embedded/HardwareJournal.md"
  [hard]="${defaultVault}/1_Markdown/note_Embedded/HardwareJournal.md"
  [sw]="${defaultVault}/1_Markdown/note_software/0_LongJournal/SoftwareJournal.md"
  [soft]="${defaultVault}/1_Markdown/note_software/SoftwareJournal.md"
  [acro]="${defaultVault}/1_Markdown/note_Knowledge/AcronymJournal.md"
  [vocab]="${defaultVault}/1_Markdown/note_Knowledge/VocabJournal.md"
  [flow]="${defaultVault}/1_Markdown/note_Business/WorkflowJournal.md"
  [wf]="${defaultVault}/1_Markdown/note_Business/WorkflowJournal.md"
  [workflow]="${defaultVault}/1_Markdown/note_Business/WorkflowJournal.md"
  [phr]="${defaultVault}/1_Markdown/note_Knowledge/PhraseJournal.md"
  [phrase]="${defaultVault}/1_Markdown/note_Knowledge/PhraseJournal.md"
  [ev]="${defaultVault}/1_Markdown/note_Knowledge/EventJournal.md"
  [event]="${defaultVault}/1_Markdown/note_Knowledge/EventJournal.md"
  [math]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/STEMJournal.md"
  [physic]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/STEMJournal.md"
  [stem]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/STEMJournal.md"
  [til]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/OtherKnowledgeJournal.md"
  [other]="${defaultVault}/1_Markdown/note_algo_lang/0_LongJournal/OtherKnowledgeJournal.md"
  [acc]="${defaultVault}/1_Markdown/note_software/0_LongJournal/AccountJournal.md"
)
  local final_string=""
  local time_date=$(date "+%F %r")
  local jrnl_path=$jrnlpath
  jrnl_path=$jrnlTable[$1]
  if [[ -z jrnl_path  ]]; then
    jrnl_path=$jrnlpath
  else
    jrnl_path=$jrnlTable[$1]
  fi
  last=${@[-1]}
  if [ $# -gt 2 ]; then 
    for arg in "${@:2}"
	  do
		    final_string="${final_string}${arg} "
	  done
    echo "\n[${time_date}] ${final_string}\n" >> $jrnl_path
  else
    # echo "this opens nvim"
    echo "\n[${time_date}] " >> $jrnl_path
    nvim $jrnl_path -c $ -c "startinsert!" # -c "call feedkeys(zz)" 
  fi 

}
 typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias cat="bat"
alias cd="z"
export EDITOR=nvim

eval "$(zoxide init zsh)"
