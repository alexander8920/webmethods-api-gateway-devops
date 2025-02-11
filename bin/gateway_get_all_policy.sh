#!/bin/bash
##############################################################################
##
## This script can be used for developers import and export APIs(projects) 
## as a flat file representation of the VCS.
## Parameters: 
## import(or)export           To import or export from the flat file.
## api_name	                  The API project to import.
## apigateway_url		      APIGateway url to import or export from.Default is http://localhost:5555.
## apigateway_es_port		  API Gateway Elastic search port.Default is 9240
## username                   The APIGateway username.Default is Administrator.
## password				      The APIGateway password.Default is password.
## 
##############################################################################
. ./common.lib
CURR_DIR="$PWD"
url=http://localhost:5555
username=Administrator
password=manage
api=
#Usage of this script
usage(){
echo "Usage: $0a rgs"
echo "args:"
echo "--apigateway_url      APIGateway url to import or export from.Default is http://localhost:5555"
echo "--username            The APIGateway username.Default is Administrator."
echo "--password            The APIGateway password.Default is password."
exit
}

#Parseinputarguments
parseArgs(){
  while test $# -ge 1; do
    arg=$1
    shift
    case $arg in
      --apigateway_url)
        url=${1}
        shift
      ;;
      --username)
        username=${1}
        shift
      ;;      
      --password)
        password=${1}
        shift
	  ;;
	  *)
        echo "Unknown: $@"
        usage
		exit
      ;;
    esac
  done
}

main(){
  #Parseinputarguments
  parseArgs "$@"
  get_all_policy $url $username $password
}
#Call the main function with all arguments passed in...
main "$@"
