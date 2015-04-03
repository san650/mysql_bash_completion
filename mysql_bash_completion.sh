_mysql()
{
    local prefix=${COMP_WORDS[COMP_CWORD]}
    local options=''

    if [ "$prefix" == "-" ]
    then
      options=$(mysql --help | sed -n -e '/^[ ][ ]*-[^-]/ { s/,.*$//; p; }' | xargs)
    else
      options=$(mysql -uroot test -e 'show databases' | sed -n '2,$ p' | xargs)
    fi

    COMPREPLY=( $(compgen -W "$options" -- $prefix) )
}

complete -F _mysql mysql
