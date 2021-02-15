#
# Create a custom command with a target of the firmware output to
# merge the firmware binary and the bootloader binary.
# :param TARGET_BIN: The target binary to trigger the custom command on.
# :type TARGET_BIN: string
# :param BIN_NAME: The binary name to merge with the bootloader
# :type BIN_NAME: string
# :param MAC_ADDRESS: The mac address to be set for the bootloader
# :type MAC_ADDRESS: String formatted as 'xx:xx:xx:xx:xx:xx'
# :param IP_ADDRESS: The ip address to set for the bootloader
# :type IP_ADDRESS: String formatted as 'xxx.xxx.xxx.xxx'
#
function(stm32_bootloader_merge_binary TARGET_BIN BIN_NAME OUTPUT_NAME MAC_ADDRESS IP_ADDRESS)
  add_custom_command(
    TARGET ${TARGET_BIN}
    POST_BUILD
    COMMAND
      ${CATKIN_ENV} rosrun boxer_firmware merge_binaries -D ${CATKIN_DEVEL_PREFIX}/${CATKIN_PACKAGE_SHARE_DESTINATION}
      -p ${PROJECT_NAME} -a ${BIN_NAME} -o ${OUTPUT_NAME} -m ${MAC_ADDRESS} -i ${IP_ADDRESS}
    )
endfunction()
