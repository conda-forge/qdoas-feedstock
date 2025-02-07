if [%PKG_NAME%] == [doas_cl] (
  cmake --install . --component doas_cl --config Release
  if errorlevel 1 exit 1
)

if [%PKG_NAME%] == [qdoas] (
  cmake --install . --component gui-tools --config Release
  if errorlevel 1 exit 1
)
