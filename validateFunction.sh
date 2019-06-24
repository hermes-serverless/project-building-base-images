end_with_error() { 
  echo ""
  echo -e "\e[1m==================== ENDED WITH ERROR ====================\e[0m"
  echo ""
} 

echo -e "\e[1m==================== RUNNING VALIDATION SCRIPT ====================\e[0m"
echo ""


if [ ! $# -eq 0 ]; then
  FN_PATH="$1"
else
  FN_PATH="/function/"
fi

HERMES_CONFIG_PATH="$FN_PATH/hermes.config.json"
if [ -f "$HERMES_CONFIG_PATH" ]; then
  echo -e "\e[1m-> OK\e[0m: hermes.config.json exists"
else
  echo -e "-> \e[1m-> ERROR\e[0m: No hermes.config.json on function root dir "
  end_with_error
  exit 1
fi


{
  HANDLER=$( cat $HERMES_CONFIG_PATH | python -c "import json,sys;obj=json.load(sys.stdin);print obj['handler'];")
} || { 
  echo -e "\e[1m-> ERROR\e[0m: No handler key on hermes.config.json "
  end_with_error
  exit 1
}

HANDLER_PATH="$FN_PATH/$HANDLER"
if [ -f "$HANDLER_PATH" ]; then
  echo -e "\e[1m-> OK\e[0m: handler $HANDLER exists"
else
  echo -e "\e[1m-> ERROR\e[0m: The handler is not valid. The file $HANDLER doesn't exist after make"
  end_with_error
  exit 1
fi
echo ""

echo -e "\e[1m==================== ENDED VALIDATION SCRIPT ====================\e[0m"
echo ""

exit 0

