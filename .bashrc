stty discard undef
if [ -n "$RANGER_LEVEL"  ]; then
    bind '"\C-o":"exit\015"'
    export EDITOR=nvim
fi
