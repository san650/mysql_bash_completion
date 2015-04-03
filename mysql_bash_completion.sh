_mysql()
{
    local prefix=${COMP_WORDS[COMP_CWORD]}
    local words=$(mysql -uroot test -e 'show databases' | sed -n '2,$ p' | xargs)

    COMPREPLY=( $(compgen -W "$words" -- $prefix) )
}

complete -F _mysql mysql
