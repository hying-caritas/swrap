
INIT_FILE="$SESSION_DIR/emacs_init.el"
DESKTOP_INIT_FILE="$SESSION_DIR/emacs_desktop_init.el"
cat <<EOF > $DESKTOP_INIT_FILE
(desktop-save-mode 1)
(setq desktop-path '("$SESSION_DIR"))
(setq desktop-dirname "$SESSION_DIR")
(desktop-read)
EOF

if [ -f "$INIT_FILE" ]; then
    PARAMS="-l $INIT_FILE"
fi

exec emacs $PARAMS -l $DESKTOP_INIT_FILE "$@"
