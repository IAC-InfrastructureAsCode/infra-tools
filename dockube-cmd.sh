#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  OPTION COMMAND - DOCKUBE BUILDER
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  Repository : https://github.com/dockube/dockube
#  License    : Apache v2
# -----------------------------------------------------------------------------

case $1 in

    build)
        echo "### Build All Container ###"
        ./dockube-build.sh
        ;;

    compose-build)
        echo "### Spesific Build Container ###"
        docker-compose build $@
        ;;

    compose-up)
        echo "### Container Up ###"
        docker-compose up -d
        ;;

    compose-stop)
        echo "### Stop All Container ###"
        docker-compose stop -t 5
        ;;

    compose-down)
        echo "### Remove All Container ###"
        docker-compose down -t 5
        ;;

esac