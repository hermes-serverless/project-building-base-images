display_usage() { 
  echo -e "\nUsage: ./testBuild LANGUAGE FN_PATH\n" 
} 

if [  $# -le 0 ] 
then 
  display_usage
  exit 1
fi 

set -euo pipefail

FN_BUILDER_DOCKERFILE=$( cat "$( pwd )/$1.Dockerfile" )
echo "$FN_BUILDER_DOCKERFILE"
echo "======== BUILDING FUNCTION ========"
echo "$FN_BUILDER_DOCKERFILE" | \
  docker build  -t tiagonapoli/test-build \
                -f - \
                $2
echo ""
echo ""
