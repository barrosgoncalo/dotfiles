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
