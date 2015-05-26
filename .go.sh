reloadbash()
{
    cd ~
    . .bashrc
}
 
function get_hash
{
    echo $1 | sum -s | awk '{ print $1 }'
}
 
function init_go_element
{
    i=`get_hash $1`
    ELEMS[$i]=$2
    KEYS[$i]=$1
}
 
go()
{
	init_go_element 'all' 'cd /c/dev/cm/all'
	init_go_element 'cmall' 'cd /d/dev/cm/all'
	init_go_element 'git' 'cd /c/dev/git'
	init_go_element 'cm' 'cd /c/dev/cm'
	init_go_element 'kanso' 'cd /c/dev/cm/kanso/kanso'
	init_go_element 'k3d' 'cd /c/dev/cm/kanso/kanso-3d'
	init_go_element 'zebra' 'cd /c/dev/cm/zebra/zebra'
	init_go_element 'drive' 'cd /c/dev/cm/drive/drive'
	init_go_element 'banana' 'cd /c/dev/cm/banana/banana'
	init_go_element 'archive' 'cd /c/dev/cm/archive/archive.web'
	init_go_element 'b' '"C:\Program Files (x86)\GitExtensions\GitExtensions.exe" browse &'
 
 
    i=`get_hash $1`
    CMD=${ELEMS[$i]}
 
    if [ ! -z "$CMD" ]
    then
        eval "$CMD"
        return
    fi
 
    #print help
    echo ${KEYS[@]} | sed -e 's/ /    /g'
}

