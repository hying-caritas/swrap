
INIT_FILE="$SESSION_DIR/emacs_init.el"
DESKTOP_INIT_FILE="$SESSION_DIR/emacs_desktop_init.el"
cat <<EOF > $DESKTOP_INIT_FILE
(desktop-save-mode 1)
(setq desktop-base-file-name ".swrap.emacs.desktop")
(setq desktop-base-lock-name ".swrap.emacs.desktop.lock")
(setq desktop-path '("$SESSION_DIR"))
(setq desktop-dirname "$SESSION_DIR")
(desktop-read)
EOF

if [ -f "$INIT_FILE" ]; then
    PARAMS="-l $INIT_FILE"
fi

exec emacs --no-desktop $PARAMS -l $DESKTOP_INIT_FILE "$@"
