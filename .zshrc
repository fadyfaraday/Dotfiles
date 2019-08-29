# Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist
setopt +o nomatch

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share historyetween different instances
setopt correct_all # autocorrect commands
setopt interactive_comments # allow comments in interactive shells
# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion


# Plugins
source ~/.zplugin/bin/zplugin.zsh

zplugin load zsh-users/zsh-syntax-highlighting
zplugin load romkatv/powerlevel10k
zplugin load zsh-users/zsh-history-substring-search
zplugin load zsh-users/zsh-autosuggestions
zplugin load MichaelAquilina/zsh-auto-notify
zplugin load 'https://github.com/MichaelAquilina/zsh-you-should-use'
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zplugin snippet OMZ::plugins/extract/extract.plugin.zsh
zplugin snippet OMZ::plugins/copyfile/copyfile.plugin.zsh	
zplugin snippet OMZ::plugins/copydir/copydir.plugin.zsh	
zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh	
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh	
zplugin load zdharma/history-search-multi-word

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

export EDITOR='vim'
export VISUAL='vim'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#Custom cd when you cd into dir it will ls as well.
chpwd() ls
# Alias
  alias history='fc -il 1' # for HIST_STAMPS in oh-my-zsh
  alias gdw="git diff --color-words"
  alias rg='rg -S'
  alias l="exa -lha"
  alias lt="exa -lhT"
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'

