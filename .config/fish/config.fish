set -l os (uname)


### PATH/EXPORT ###
# Clear Path too avoid fish slowing down
set -e fish_user_paths

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if test "$os" = Darwin
    # do things for macOS
    set -U fish_user_paths /Users/martin/.local/bin /Users/martin/.local.bin /Applications /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/libpq/bin /Users/martin/go/bin /Users/martin/.omnisharp/bin /Users/martin/.cargo/bin
else if test "$os" = Linux
    # do things for Linux
    set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $fish_user_paths
else
    # do things for other operating systems
end
### PATH END ###

### SET OPTIONS ###

# Supresses fish's intro message
set fish_greeting

#Set term color
set TERM xterm-256color

#Set default Editor
set EDITOR lvim

# Set manpager
set -x MANPAGER "lvim -c 'set ft=man'"
### SET OPTIONS END



### SET KEYBIND MODE ###
function fish_user_key_bindings
    #fish_default_key_bindings
    fish_vi_key_bindings
end
### SET KEYBIND MODE END ###

### ALIAS

# App shortcuts
alias vim='lvim'
if test "$os" = Darwin
    # do things for macOS
    alias hvim="hx"
else if test "$os" = Linux
    # do things for Linux
    alias hvim="helix"
else
    # do things for other operating systems
    alias hvim="helix"
end

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

## Software update
if test "$os" = Darwin
    # do things for macOS
    alias os-refresh-update="brew update && brew upgrade"   # Update brew pkg db and update packages
    alias os-update="brew upgrade"                          # Update brew pkg db and update packages
    alias os-remove="brew remove"                           # Update brew pkg db and update packages
    alias os-install="brew install"
    alias os-search="brew search"
else if test "$os" = Linux
    # do things for Linux
    alias os-update-std='sudo pacman -Syu'                  # update only standard pkgs
    alias os-refresh-update='sudo pacman -Syyu'             # Refresh pkglist & update standard pkgs
    alias os-update-aur='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
    alias os-update='paru -Syu --noconfirm'                 # update standard pkgs and AUR pkgs (paru)
    alias os-unlock='sudo rm /var/lib/pacman/db.lck'        # remove pacman lock
    alias os-cleanup='sudo pacman -Rns (pacman -Qtdq)'      # remove orphaned packages
    alias os-install="paru -S"
    alias os-search="paru -Ss"
    alias os-remove="paru -Rs"                              # Update brew pkg db and update packages
else
    # do things for other operating systems
end
# Arch
# Mac
## Software update end

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Tmux
alias start-work="tmux new-session -s work"
alias work="tmux"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias zz='zellij'
alias zwork='zellij --session work'
alias zhome='zellij --session personal'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# Cloudflared open tunnels
alias mctunnel="cloudflared access tcp --hostname minecraft.clenchedgaming.com --url localhost:25565"
alias pgtunnel="cloudflared access tcp --hostname databases.clenchedgaming.com/pgs --url localhost:5434"

#fastfetch
