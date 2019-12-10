#! /bin/sh
# Simple script that gathers new mail from locl directories.
# This works perfectly if you pull down emails from imap accounts.
#du -a .local/share/mail/personal/INBOX/new/* 2>/dev/null | wc -l
personal=$(du -a $HOME/.local/share/mail/personal/INBOX/new/* 2>/dev/null | wc -l | xargs)
andshape=$(du -a $HOME/.local/share/mail/andshape/INBOX/new/* 2>/dev/null | wc -l | xargs)

echo "$((andshape+personal))"
