echo "==================== RUNNING VALIDATION SCRIPT ===================="
echo ""


if [ ! $# -eq 0 ]; then
  FN_PATH="$1"
else
  FN_PATH="/function/"
fi

HERMES_CONFIG_PATH="$FN_PATH/hermes.config.json"
if [ -f "$HERMES_CONFIG_PATH" ]; then
  echo "-> OK: hermes.config.json exists"
else
  echo "-> ERROR: No hermes.config.json on function root dir "
  exit 1
fi


{
  HANDLER=$( cat $HERMES_CONFIG_PATH | python -c "import json,sys;obj=json.load(sys.stdin);print obj['handler'];")
} || { 
  echo "-> ERROR: No handler key on hermes.config.json "
  exit 1
}

HANDLER_PATH="$FN_PATH/$HANDLER"
if [ -f "$HANDLER_PATH" ]; then
  echo "-> OK: handler $HANDLER exists"
else
  echo "-> ERROR: The handler is not valid. The file $HANDLER doesn't exist after make"
  exit 1
fi

exit 0