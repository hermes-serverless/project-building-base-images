HERMES_CONFIG_PATH="/function/hermes.config.json"

if [ -f "$HERMES_CONFIG_PATH" ]; then
  echo "OK: hermes.config.json exists"
else
  echo "ERROR: No hermes.config.json on function root dir"
  exit 1
fi

{
  HANDLER=$( cat $HERMES_CONFIG_PATH | python -c "import json,sys;obj=json.load(sys.stdin);print obj['handler'];")
} || { 
  echo "ERROR: No handler key on hermes.config.json"
  exit 1
}

if [ -f "$HANDLER" ]; then
  echo "OK: hermes.config.json exists"
else
  echo "ERROR: No hermes.config.json on function root dir"
  exit 1
fi

exit 0