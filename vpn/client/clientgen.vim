command! -nargs=1 Cc %s/XXX/<args>/|w! <args>.ovpn|%s/^remote 192\.168\.0\.2/;\0/|w! <args>-external.ovpn|undo
command! -nargs=1 Ccs %s/XXX/<args>/|w! <args>.ovpn|undo