#! /bin/sh
# Simple script that gathers new mail from locl directories.
# This works perfectly if you pull down emails from imap accounts.

personal=$(du -a $HOME/.local/share/mail/personal/INBOX/new/* 2>/dev/null | wc -l)
andshape=$(du -a $HOME/.local/share/mail/andshape/INBOX/new/* 2>/dev/null | wc -l)

echo -n "$((andshape+personal))"
