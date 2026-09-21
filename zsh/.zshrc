export DATASTORE_USE_PROJECT_ID_AS_APP_ID=true
export DATASTORE_DATASET=adc-individual-evaluation
export DATASTORE_PROJECT_ID=adc-individual-evaluation
export DATASTORE_EMULATOR_HOST=127.0.0.1:8081
export DATASTORE_EMULATOR_HOST_PATH=127.0.0.1:8081/datastore
export DATASTORE_HOST=http://127.0.0.1:8081

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/myco/Desktop/ADC/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/myco/Desktop/ADC/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/myco/Desktop/ADC/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/myco/Desktop/ADC/google-cloud-sdk/completion.zsh.inc'; fi

# Ocaml
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/myco/.opam/opam-init/init.zsh' ]] || source '/Users/myco/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
#
# Latex
export PATH="/Library/TeX/texbin:$PATH"

# Java
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/25.0.2/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Visuals
neofetch
eval "$(starship init zsh)"

# Rugby
eval "$(rbenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# # Mail templates
# Copies frequently used email templates to the macOS clipboard.
# Templates are stored separately in ~/Templates/Mail so they can
# be edited without modifying the dotfiles repository.
mailprof() {
    pbcopy < ~/Templates/Mail/professor_pt.txt
}

mailprofen() {
    pbcopy < ~/Templates/Mail/professor_en.txt
}

mailproffromal() {
    pbcopy < ~/Templates/Mail/professor_formal_pt.txt
}

mailproffromalen() {
    pbcopy < ~/Templates/Mail/professor_formal_en.txt
}

# Azure CLI completion
#
# Homebrew installs Azure CLI's Bash completion script in its
# bash_completion.d directory. Since this shell uses Zsh, initialize
# Bash completion compatibility before sourcing the Azure CLI completion.
#
# Required for `az <TAB>` command completion in Zsh.
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
