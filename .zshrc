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
ZSH_THEME="robbyrussell"
# "powerlevel10k/powerlevel10k"

setopt nobanghist
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
setopt NO_HIST_VERIFY
 # Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#as-an-oh-my-zsh-custom-plugin
# git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
plugins=(
# zsh-vi-mode
sudo
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
local dotfiles_dir="$HOME/dotfiles"
local linux_env_dir="$HOME/linux_env"
if [ $# -lt 1 ]; then
  reloadProfile
elif [ $1 = "zsh" ]; then 
  echo "linux_env_dir"
  git -C $dotfiles_dir pull -f
  git -C $linux_env_dir pull -f 
  reloadProfile
fi
}

alias :v="nvimhere"
alias :V="nvimhere"
alias :vl="nvimhere last"
alias :vs="nvimhere ls"
alias :Vl="nvimhere last"
alias :Vs="nvimhere ls"
nvimhere(){
  if [ $# -lt 1 ]; then
    nvim .
  elif [ $1 = "last" ]; then
    nvim -c "lua require('resession').load 'Last Session'"
  elif [ $1 = "ls" ]; then
    nvim -c "lua require('resession').load()"
  else
    nvim $@
  fi
}

alias :e="espanso"
alias :E="espanso"

# reload Profile
alias repro="reloadProfile"
reloadProfile(){
  local nvim_dir="$HOME/.config/nvim"
  local zshfile="$HOME/.zshrc"
if [[ -e $zshfile ]]; then
  echo "Symlink-ed"
else
	ln -s $HOME/linux_env/.zshrc $HOME/.zshrc -f
	echo "Link .zshrc"
fi
source $HOME/.zshrc
if [[ -e "$HOME/.gitconfig" ]]; then
  echo ".gitconfig linked."
else
  ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig -f
  echo "Link .gitconfig"
fi
  # echo nvim_dir
  git -C $nvim_dir pull 
}

alias obs="os:"
alias o="os:"
alias :o="os:"
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
# export CFLAGS="-Wno-incompatible-function-pointer-types"
alias g="DuckDuckGo"
DuckDuckGo(){
	origin_query="https://www.duckduckgo.com/?q="
	query=$origin_query
	for arg in "$@"
	do
		query=$query+$arg
	done
	xdg-open $query #need w3m.
}


search-command-line() {
  # If line is empty, get the last run command from history
  [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

  # Save beginning space
  local WHITESPACE=""
  if [[ ${LBUFFER:0:1} = " " ]]; then
    WHITESPACE=" "
    LBUFFER="${LBUFFER:1}"
  fi

  LBUFFER="g ${WHITESPACE}${LBUFFER}"
  zle && zle redisplay 
  zle .accept-line
}


zle -N search-command-line

# Defined shortcut keys: `^s`
bindkey -M emacs '^s' search-command-line



cst(){
  if [ $1 -ne 0 ];
  then
  xdg-open https://codestats.net/users/groutlloyd
  
  else
  curl https://codestats.net/api/users/groutlloyd
  fi
}
alias j="jrnl"
alias J="jrnl"
export andstorage="/storage/emulated/0"
export jrnlpath="${andstorage}/Note/MainJournal.md"
export defaultVault="${andstorage}/Note"


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
alias ls="eza"
alias lsd="eza"
export EDITOR=nvim

alias js="just"
# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
