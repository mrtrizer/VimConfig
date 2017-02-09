# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mrtrizer/Temp/fzf/bin* ]]; then
  export PATH="$PATH:/home/mrtrizer/Temp/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mrtrizer/Temp/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mrtrizer/Temp/fzf/shell/key-bindings.bash"

