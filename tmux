chtitle()
{
	echo -ne "\033]0;""$1""\007"
}

tmux_find_session()
{
	local name=$1
	tmux list-session | grep -q "^$name:"
}

CONFIG_FILE="$SESSION_DIR/tmux.conf"

SESSION_NAME="$(basename $SESSION_DIR)"

chtitle "tmux: $SESSION_NAME,$USER@$(hostname)"

if tmux_find_session $SESSION_NAME; then
	exec tmux attach -t $SESSION_NAME
else
	exec tmux new -s $SESSION_NAME \; source "$CONFIG_FILE"
fi
