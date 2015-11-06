chtitle()
{
	echo -ne "\033]0;""$1""\007"
}

CONFIG_FILE="$SESSION_DIR/tmux.conf"

SESSION_NAME="$(basename $SESSION_DIR)"

chtitle "tmux: $SESSION_NAME,$USER@$(hostname)"

exec tmux new -A -s $SESSION_NAME \; source "$CONFIG_FILE"
