##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  ui_print "+----------------------------+"
  ui_print "|                            |"
  ui_print "|   TH VoLTE/VoWiFi Enabler  |"
  ui_print "|    (AIS / DTAC / TRUE-H)   |"
  ui_print "|            for             |"
  ui_print "|    Pixel 3/3a/4 series     |"
  ui_print "|                            |"
  ui_print "|       v1.00-20200303       |"
  ui_print "|         by thongtech       |"
  ui_print "|     based on nooriro's     |"
  ui_print "|                            |"
  ui_print "+----------------------------+"
}

# Some modification of grep_prop() in util_functions.sh
# https://github.com/topjohnwu/Magisk/blob/v20.1/scripts/util_functions.sh#L46

my_grep_prop() {
  local REGEX="s/^$1=//p"
  shift
  local FILES=$@
  [ -z "$FILES" ] && FILES='/system/build.prop /vendor/build.prop /product/build.prop'
  sed -n "$REGEX" $FILES 2>/dev/null | head -n 1
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  
  # Get device information
  local MANUFACTURER="$(my_grep_prop 'ro\.product\.manufacturer')"
  local        MODEL="$(my_grep_prop 'ro\.product\.model'       )"
  local       DEVICE="$(my_grep_prop 'ro\.product\.device'      )"
  [ -z "$MANUFACTURER" ] && MANUFACTURER="$(my_grep_prop 'ro\.product\.vendor\.manufacturer')"
  [ -z "$MODEL"        ] &&        MODEL="$(my_grep_prop 'ro\.product\.vendor\.model'       )"
  [ -z "$DEVICE"       ] &&       DEVICE="$(my_grep_prop 'ro\.product\.vendor\.device'      )"
  
  # Set $MBNTYPE
  local MBNTYPE
  if [ "$DEVICE" = "flame" ] || [ "$DEVICE" = "coral" ];  then
    MBNTYPE="coral"
  elif [ "$DEVICE" = "blueline" ] || [ "$DEVICE" = "crosshatch" ];  then
    MBNTYPE="crosshatch"
  elif [ "$DEVICE" = "sargo" ] || [ "$DEVICE" = "bonito" ]; then
    MBNTYPE="bonito"
  fi
  
  # Set path variables by $MBNTYPE
  local MBNDIR        # absolute path to 'mbn base directory'
  local LISTFILE      # relative path to 'mbn list file' from $MBNDIR
  local MBN_FILES     # relative paths to 'mbn files' from $MBNDIR
  # if [ "$MBNTYPE" = "crosshatch" ]; then
    MBNDIR="/vendor/rfs/msm/mpss/readonly/vendor/mbn"
    LISTFILE="mcfg_sw/mbn_sw.txt"
    MBN_FILES="
      mcfg_sw/generic/SEA/AIS/Commercial/Thailand/mcfg_sw.mbn
      mcfg_sw/generic/SEA/DTAC/Commercial/VoLTE/mcfg_sw.mbn
      mcfg_sw/generic/SEA/Truemove/Commercial/VoLTE/mcfg_sw.mbn
    "
  # fi
  
  # Check device eligibility for installation
  ui_print "- Device: ${DEVICE} (${MANUFACTURER} ${MODEL})"
  if [ -n "$MBNTYPE" ]; then
    ui_print "- Eligible device for installation"
  else
    abort "! This module is only for Pixel 3 and later"
  fi
  
  ui_print "- Installing Thai carrier configs"
  # ui_print "- Extracting mcfg_sw.mbn files"
  unzip -o "$ZIPFILE" "mbn/${MBNTYPE}/*" -d "$MODPATH" >&2
  mkdir -p "${MODPATH}/system${MBNDIR}"
  mv "${MODPATH}/mbn/${MBNTYPE}/"* "${MODPATH}/system${MBNDIR}/"
  rm -rf "${MODPATH}/mbn"
  
  # ui_print "- Getting current mbn_sw.txt from /vendor"
  local MODPATH_LIST="${MODPATH}/system${MBNDIR}/${LISTFILE}"
  cp "${MBNDIR}/${LISTFILE}" "$MODPATH_LIST"
  
  # ui_print "- Adding mcfg_sw.mbn paths to mbn_sw.txt"
  # Add each path to mcfg_sw.mbn at the end of mbn_sw.txt
  #           ONLY IF the path is NOT EXIST in mbn_sw.txt
  echo "" >> "$MODPATH_LIST"
  local MBNFILE
  for MBNFILE in $MBN_FILES; do
    grep -qF "$MBNFILE" "$MODPATH_LIST" || echo "$MBNFILE" >> "$MODPATH_LIST"
  done
  
  # ui_print "- Removing /data/vendor/modem_fdr/fdr_check"
  rm /data/vendor/modem_fdr/fdr_check

  ui_print ""
  ui_print "After reboot, finds the options in Settings -> Network & Internet -> Mobile Network"
  ui_print "** Make sure VoLTE & VoWiFi services are activated by your carrier!"
  ui_print ""
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  
  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
  
  # directory :   0   2000  0755   u:object_r:vendor_file:s0
  # file      :   0   0     0644   u:object_r:vendor_file:s0
  
  # set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
  set_perm_recursive "$MODPATH" 0 2000 0755 0644 u:object_r:vendor_file:s0
  
  # set_perm <target> <owner> <group> <permission> [context]
  local FILE
  find $MODPATH -type f -o -type l 2>/dev/null | while read FILE; do
    set_perm  "$FILE"  0  0  0644  u:object_r:vendor_file:s0
  done
}

# You can add more functions to assist your custom script code
