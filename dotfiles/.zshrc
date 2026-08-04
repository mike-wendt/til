# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load homebrew (covers both Apple Silicon /opt/homebrew and Intel /usr/local)
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Note: theme is loaded via brew at the bottom of this file, not ZSH_THEME
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Full list: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(git terraform)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
alias stree='open -a /Applications/Sourcetree.app/ .'
alias zcode='open -a /Applications/Zed.app/ .'
alias tfir='terraform init -reconfigure'
alias tfdr='terraform-docs markdown . > README.md'
alias tfck='tffr && tfv && pcra'
alias tfpp='tfck && tfp'
alias pcin='pre-commit install'
alias pcau='pre-commit autoupdate'
alias pcra='pre-commit run --all-files'
alias actt='act --container-architecture linux/amd64'
alias gcml='gcm && gfa && ggl'
alias gcdl='gco dev && gfa && ggl'
# NOTE: This alias assumes a Git remote named "mike". Change "mike" to your remote (e.g., "origin") if different.
alias gpsupm='git push --set-upstream mike $(git_current_branch)'
alias colimavm='colima start --arch x86_64 --vm-type vz --cpu 6 --memory 12 --disk 128'
alias awssl="aws sso login --profile=$AWS_PROFILE"

# Per-directory shell history: switches to a project-specific history file when
# entering a git repo, and restores the global history when leaving.
autoload -Uz add-zsh-hook

function _per_dir_history() {
  if [[ -d "${OLDPWD}/.git" && ! -d "${PWD}/.git" ]]; then
    fc -P
    return
  fi
  if [[ -d "${PWD}/.git" ]]; then
    local hist_dir="${HOME}/.zsh_project_histories"
    mkdir -p "${hist_dir}"
    local hash=$(echo "${PWD}" | shasum -a 256 | cut -c1-12)
    fc -p "${hist_dir}/${hash}"
  fi
}

add-zsh-hook chpwd _per_dir_history
# Run on shell start (Zed opens terminals directly in the project dir, so chpwd never fires)
_per_dir_history

# Theme and syntax highlighting — installed via: brew install powerlevel10k zsh-syntax-highlighting
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable bash-style completion (needed for tools like terraform)
autoload -U +X bashcompinit && bashcompinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
