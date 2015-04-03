_mysql()
{
    local prefix=${COMP_WORDS[COMP_CWORD]}
    local options=''

    # Get dash options
    options=$(mysql --help | sed -n -e '/^[ ][ ]*-[^-]/ { s/,.*$//; p; }' | xargs)

    # Get double dash options
    options="$options $(mysql --help | sed -n 's/^[ ]*//; /^-/ {; s/^-[a-zA-Z#?],*[ ]*//; s/[ ].*$//; s/=.*$/=/; y/()./   /; s/\[//; p; }' | sort | uniq | sed -n '2,$ p')"

    # Get database names
    options="$options $(mysql -uroot test -e 'show databases' | sed -n '2,$ p' | xargs)"

    COMPREPLY=( $(compgen -W "$options" -- $prefix) )
}

complete -F _mysql mysql
