
export HISTFILE=$SESSION_DIR/.bash_history
RC_FILE="$SESSION_DIR/.bashrc"
if [ -f "$RC_FILE" ]; then
    PARAMS="--rcfile $RC_FILE"
fi

exec bash $PARAMS "$@"
